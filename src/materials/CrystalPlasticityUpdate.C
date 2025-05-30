//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "CrystalPlasticityUpdate.h"
#include "CrystalPlasticityStressUpdateBase.h"
#include "libmesh/int_range.h"
#include <cmath>
#include <iostream>

registerMooseObject("irrplasticityApp", CrystalPlasticityUpdate);

InputParameters
CrystalPlasticityUpdate::validParams()
{
  InputParameters params = CrystalPlasticityStressUpdateBase::validParams();
  params.addClassDescription("Kalidindi version of homogeneous crystal plasticity.");
  // params.addParam<RankTwoTensor>("I",I.identity(), "identity");
  params.addParam<Real>("T", 295.0, "temperature");
  params.addParam<Real>("T_critical", 400.0, "critical temperature");
  params.addParam<Real>("loop_num", "damage");
  params.addParam<Real>("amp", "amplify");
  params.addParam<Real>("r", 1.0, "Latent hardening coefficient");
  params.addParam<Real>("h", 541.5, "hardening constants");
  params.addParam<Real>("t_sat", 2000.8, "saturated slip system strength");
  params.addParam<Real>("gss_a", 25000.0, "coefficient for hardening");
  params.addParam<Real>("ao", 30000.1, "slip rate coefficient");
  params.addParam<Real>("xm", 0.05, "exponent for slip rate");
  params.addParam<Real>("gss_initial", 90.8, "initial lattice friction strength of the material");
  params.addParam<Real>("disloc_density0",std::pow(10.0,6.0),"density 0");
  params.addParam<Real>("k1",450,"k1");
  params.addParam<Real>("k20",14.0,"k20");
  params.addParam<Real>("gamma0",2.0*std::pow(10.0,2.0),"gamma0");
  params.addParam<MaterialPropertyName>(
      "total_twin_volume_fraction",
      "Total twin volume fraction, if twinning is considered in the simulation");
  // params.addParam<MaterialProperty>("H_old","H");
  // params.addParam<MaterialProperty>("disloc_h_old","disloch");
  // params.addParam<MaterialProperty>("slip_increment_old","slip_incre");
  params.addRequiredParam<unsigned int>(
      "number_slip_systems",
      "The total number of possible active slip systems for the crystalline material");
  params.addRequiredParam<FileName>(
      "slip_sys_file_name",
      "Name of the file containing the slip systems, one slip system per row, with the slip plane "
      "normal given before the slip plane direction.");
  params.addRequiredParam<FileName>("plane_file_name","irradiation");
  params.addCoupledVar("euler_angle_variables",
      "Vector of coupled variables representing the Euler angles' components.");
  params.addParam<UserObjectName>("read_prop_user_object",
      "The ElementReadPropertyFile "
      "GeneralUserObject to read element "
      "specific property values from file");
  return params;
}

CrystalPlasticityUpdate::CrystalPlasticityUpdate(
    const InputParameters & parameters)
  : CrystalPlasticityStressUpdateBase(parameters),
    // Constitutive values
    _read_prop_user_object(isParamValid("read_prop_user_object")
                               ? &getUserObject<PropertyReadFile>("read_prop_user_object")
                               : nullptr),
    _plane_file_name(getParam<FileName>("plane_file_name")),
    _H_list(),
    _angle_list(),
    _T(getParam<Real>("T")),
    _T_critical(getParam<Real>("T_critical")),
    _loop_num(getParam<Real>("loop_num")),
    _amp(getParam<Real>("amp")),
    _r(getParam<Real>("r")),
    _h(getParam<Real>("h")),
    _tau_sat(getParam<Real>("t_sat")),
    _gss_a(getParam<Real>("gss_a")),
    _ao(getParam<Real>("ao")),
    _xm(getParam<Real>("xm")),
    _gss_initial(getParam<Real>("gss_initial")),
    _disloc_density0(getParam<Real>("disloc_density0")),
    _k1(getParam<Real>("k1")),
    _k20(getParam<Real>("k20")),
    _gamma0(getParam<Real>("gamma0")),
    // resize vectors used in the consititutive slip hardening
    _slip_plane_normal(_number_slip_systems, RealVectorValue()),
    _hb(_number_slip_systems, 0.0),
    _slip_resistance_increment(_number_slip_systems, 0.0),
    _disloc_h(declareProperty<Real>("disloc_h")),
    _cry(declareProperty<RankTwoTensor>("cry")),
    _euler_ang(getMaterialProperty<RealVectorValue>("Euler_angles")),
    _euler_angle(declareProperty<RealVectorValue>("euler_angle")),
    _H(declareProperty<RankTwoTensor>("H")),
    _disloc_h_increment(0.0),
    _H_increment(RankTwoTensor::Identity()),
    // _H_increment(declareProperty<std::vector<RankTwoTensor>>("H_increment")),
    _disloc_density(declareProperty<Real>("disloc_density")),
    _srate(declareProperty<Real>("sliprate")),
    _gd(declareProperty<std::vector<Real>>("gd")),
    _slip_increment_old(getMaterialPropertyOld<std::vector<Real>>("slip_increment")),
    _disloc_h_old(getMaterialPropertyOld<Real>("disloc_h")),
    _H_old(getMaterialPropertyOld<RankTwoTensor>("H")),
    // resize local caching vectors used for substepping
    _previous_substep_slip_resistance(_number_slip_systems, 0.0),
    _previous_substep_disloc_h(0.0),
    _previous_substep_H(RankTwoTensor::Identity()),
    _slip_resistance_before_update(_number_slip_systems, 0.0),
    _disloc_h_before_update(0.0),
    _H_before_update(RankTwoTensor::Identity()),
    // Twinning contributions, if used
    _include_twinning_in_Lp(parameters.isParamValid("total_twin_volume_fraction")),
    _twin_volume_fraction_total(_include_twinning_in_Lp
                                    ? &getMaterialPropertyOld<Real>("total_twin_volume_fraction")
                                    : nullptr),
    _crysrot(getMaterialProperty<RankTwoTensor>("crysrot")),
    _n_euler_angle_vars(coupledComponents("euler_angle_variables")),
    _euler_angle_vars(coupledValues("euler_angle_variables"))
    // _slip_direction(_number_slip_systems),
    // _slip_plane_normal(_number_slip_systems)

{
  _theta=0.5*(1.0+std::tanh(_T/_T_critical));
  std::cout<<_theta<<std::endl;
  // computeQpProperties();
}
void CrystalPlasticityUpdate::computeQpP()
{
  std::cout<<_qp<<std::endl;
  // _euler_angle.resize(n_qp);
  std::cout<<_euler_angle.size()<<std::endl;
  if (_read_prop_user_object)
  {
    _euler_angle[_qp](0) = _read_prop_user_object->getData(_current_elem, 0);
    _euler_angle[_qp](1) = _read_prop_user_object->getData(_current_elem, 1);
    _euler_angle[_qp](2) = _read_prop_user_object->getData(_current_elem, 2);
  }
  else if (_n_euler_angle_vars)
  {
    _euler_angle[_qp](0) = (*_euler_angle_vars[0])[_qp];
    _euler_angle[_qp](1) = (*_euler_angle_vars[1])[_qp];
    _euler_angle[_qp](2) = (*_euler_angle_vars[2])[_qp];
  }
  else{
    _euler_angle[_qp](0) = 0.0;
    _euler_angle[_qp](1) = 0.0;
    _euler_angle[_qp](2) = 0.0;
  }
  std::cout<<_euler_angle[_qp]<<std::endl;
  auto it = std::find(_angle_list.begin(), _angle_list.end(), _euler_angle[_qp]);
  if (it == _angle_list.end())
  {
    _angle_list.push_back(_euler_angle[_qp]);
    updateCry();
    _H[_qp] = initH(_loop_num,_amp,_plane_file_name,_cry[_qp]);
    _H_list.push_back(_H[_qp]);
  }
  std::cout<<_angle_list.size()<<_H_list.size()<<std::endl;
}
void CrystalPlasticityUpdate::updateCry()
{
  if (_read_prop_user_object)
  {
    _euler_angle[_qp](0) = _read_prop_user_object->getData(_current_elem, 0);
    _euler_angle[_qp](1) = _read_prop_user_object->getData(_current_elem, 1);
    _euler_angle[_qp](2) = _read_prop_user_object->getData(_current_elem, 2);
  }
  else if (_n_euler_angle_vars)
  {
    _euler_angle[_qp](0) = (*_euler_angle_vars[0])[_qp];
    _euler_angle[_qp](1) = (*_euler_angle_vars[1])[_qp];
    _euler_angle[_qp](2) = (*_euler_angle_vars[2])[_qp];
  }
  else{
    _euler_angle[_qp](0) = 0.0;
    _euler_angle[_qp](1) = 0.0;
    _euler_angle[_qp](2) = 0.0;
  }
  RankTwoTensor _R;
  _R==RankTwoTensor::Identity();
  Real phi1 = _euler_angle[_qp](0) * 3.14 / 180.0;
  Real Phi = _euler_angle[_qp](1) * 3.14 / 180.0;
  Real phi2 = _euler_angle[_qp](2) * 3.14 / 180.0;
  RankTwoTensor Rz1, Rx, Rz2;
  Rz1(0,0) =  std::cos(phi1); Rz1(0,1) = -std::sin(phi1); Rz1(0,2) = 0.0;
  Rz1(1,0) =  std::sin(phi1); Rz1(1,1) =  std::cos(phi1); Rz1(1,2) = 0.0;
  Rz1(2,0) = 0.0; Rz1(2,1) = 0.0; Rz1(2,2) = 1.0;

  Rx(0,0) = 1.0;  Rx(0,1) =    0.0;            Rx(0,2) =    0.0;
  Rx(1,0) = 0.0;  Rx(1,1) =  std::cos(Phi);     Rx(1,2) = -std::sin(Phi);
  Rx(2,0) = 0.0;  Rx(2,1) =  std::sin(Phi);     Rx(2,2) =  std::cos(Phi);

    // ——— Z 轴再转 phi2 ———
  Rz2(0,0) =  std::cos(phi2); Rz2(0,1) = -std::sin(phi2); Rz2(0,2) = 0.0;
  Rz2(1,0) =  std::sin(phi2); Rz2(1,1) =  std::cos(phi2); Rz2(1,2) = 0.0;
  Rz2(2,0) = 0.0; Rz2(2,1) = 0.0; Rz2(2,2) = 1.0;

  _R = Rz1 * Rx * Rz2;
  _cry[_qp]= _R.transpose();
}
void CrystalPlasticityUpdate::locateH()
{
  auto it = std::find(_angle_list.begin(), _angle_list.end(), _euler_angle[_qp]);
  if (it == _angle_list.end())
  {
    std::cout<<"erro euler angle"<<std::endl;
  
  }
  else{
    unsigned idx = std::distance(_angle_list.begin(), it);
    _H[_qp]=_H_list[idx];
  }
}
void CrystalPlasticityUpdate::getSlipSystems()
{
  bool orthonormal_error = false;

  // read in the slip system data from auxiliary text file
  MooseUtils::DelimitedFileReader _reader(_slip_sys_file_name);
  _reader.setFormatFlag(MooseUtils::DelimitedFileReader::FormatFlag::ROWS);
  _reader.read();

  // check the size of the input
  if (_reader.getData().size() != _number_slip_systems)
    paramError(
        "number_slip_systems",
        "The number of rows in the slip system file should match the number of slip system.");

  for (const auto i : make_range(_number_slip_systems))
  {
    // initialize to zero
    _slip_direction[i].zero();
    _slip_plane_normal[i].zero();
  }

  if (_crystal_lattice_type == CrystalLatticeType::HCP)
    transformHexagonalMillerBravaisSlipSystems(_reader);
  else if (_crystal_lattice_type == CrystalLatticeType::BCC ||
           _crystal_lattice_type == CrystalLatticeType::FCC)
  {
    for (const auto i : make_range(_number_slip_systems))
    {
      // directly grab the raw data and scale it by the unit cell dimension
      for (const auto j : index_range(_reader.getData(i)))
      {
        if (j < LIBMESH_DIM)
          _slip_plane_normal[i](j) = _reader.getData(i)[j] / _unit_cell_dimension[j];
        else
          _slip_direction[i](j - LIBMESH_DIM) =
              _reader.getData(i)[j] * _unit_cell_dimension[j - LIBMESH_DIM];
      }
    }
  }

  for (const auto i : make_range(_number_slip_systems))
  {
    // normalize
    _slip_plane_normal[i] /= _slip_plane_normal[i].norm();
    _slip_direction[i] /= _slip_direction[i].norm();

    if (_crystal_lattice_type != CrystalLatticeType::HCP)
    {
      const auto magnitude = _slip_plane_normal[i] * _slip_direction[i];
      if (std::abs(magnitude) > libMesh::TOLERANCE)
      {
        orthonormal_error = true;
        break;
      }
    }
  }

  if (orthonormal_error)
    mooseError("CrystalPlasticityStressUpdateBase Error: The slip system file contains a slip "
               "direction and plane normal pair that are not orthonormal in the Cartesian "
               "coordinate system.");
}
std::vector<RealVectorValue> CrystalPlasticityUpdate::calplanenorm(const RankTwoTensor & crysrot)
{
  CrystalPlasticityUpdate::getSlipSystems();


  std::vector<RealVectorValue> local_plane_normal;
  // local_direction_vector.resize(number_slip_systems);
  local_plane_normal.resize(_number_slip_systems);

  // Update slip direction and normal with crystal orientation
  for (const auto i : make_range(_number_slip_systems))
  {
    // local_direction_vector[i].zero();
    local_plane_normal[i].zero();

    for (const auto j : make_range(LIBMESH_DIM))
      for (const auto k : make_range(LIBMESH_DIM))
      {
        // local_direction_vector[i](j) =
        //     local_direction_vector[i](j) + crysrot(j, k) * direction_vector[i](k);

        local_plane_normal[i](j) =
            local_plane_normal[i](j) + crysrot(j, k) * _slip_plane_normal[i](k);
      }

    // Calculate Schmid tensor
  //   for (const auto j : make_range(LIBMESH_DIM))
  //     for (const auto k : make_range(LIBMESH_DIM))
  //     {
  //       schmid_tensor[i](j, k) = local_direction_vector[i](j) * local_plane_normal[i](k);
  //     }
  }
  return local_plane_normal;
}
RankTwoTensor initH(Real _number_of_loop,Real _amp,FileName _plane_file_name,RankTwoTensor crysrot)
{
  RankTwoTensor a;
  std::vector<RankTwoTensor> b;
  b.resize(_number_of_loop);
  RankTwoTensor H;
  for (const auto i : make_range(_number_of_loop))
  {
    std::random_device rd;
    std::mt19937 gen(rd());  // Mersenne Twister engine
    MooseUtils::DelimitedFileReader _reader(_plane_file_name);
    _reader.setFormatFlag(MooseUtils::DelimitedFileReader::FormatFlag::ROWS);
    _reader.read();
    Real _irrplane_num=_reader.getData().size();
    std::uniform_int_distribution<> dis(0, _irrplane_num - 1);
    std::vector<RealVectorValue> _plane_normal;
    _plane_normal.resize(_irrplane_num);
    for (const auto j : make_range(_irrplane_num))
    {
      _plane_normal[j].zero();
    }
  
    
      for (const auto j : make_range(_irrplane_num))
      {
        // directly grab the raw data and scale it by the unit cell dimension
        for (const auto k : index_range(_reader.getData(j)))
        {
          _plane_normal[j](k) = _reader.getData(j)[k];
        }
      }
      for (const auto j : make_range(_irrplane_num))
      {
        std::cout <<_plane_normal[j]<< std::endl;
        _plane_normal[j] /= _plane_normal[j].norm();
        std::cout <<_plane_normal[j]<< std::endl;
        std::cout <<_plane_normal[j].norm()<< std::endl;
      }
      std::vector<RealVectorValue> loc_plane_normal;
      loc_plane_normal.resize(_irrplane_num);
      for (const auto j : make_range(_irrplane_num))
      {
        loc_plane_normal[j].zero();
        std::cout <<crysrot<< std::endl;
        for (const auto k : make_range(LIBMESH_DIM))
        {  
        for (const auto l : make_range(LIBMESH_DIM))
          {
            loc_plane_normal[j](k) =
            loc_plane_normal[j](k) + crysrot(k,l) * _plane_normal[j](l);
          }
        }
        std::cout <<loc_plane_normal[j]<< std::endl;
      }
    
    // Real x = dist(gen);
    // Real y = dist(gen);
    // Real z = dist(gen);
    // Real magnitude = std::sqrt(x * x + y * y + z * z);
    // RealVectorValue n_l(x / magnitude, y / magnitude, z / magnitude);
    int x=dis(gen);
    RealVectorValue n_l=loc_plane_normal[x];
    RankTwoTensor I;
    std::cout <<n_l<< std::endl;
    I=RankTwoTensor::Identity();
    b[i] = (I-outer_product(n_l,n_l))*3.0*2.48*std::pow(10.0,-5.0);
    a += _amp*b[i];
  }
  H=a/(27*std::pow(10.0,-9.0));
  return H;
}

void
CrystalPlasticityUpdate::initQpStatefulProperties()
{
  CrystalPlasticityStressUpdateBase::initQpStatefulProperties();
  _gd[_qp].resize(_number_slip_systems);
  for (const auto i : make_range(_number_slip_systems))
  {
    _slip_resistance[_qp][i] = _gss_initial;
    _gd[_qp][i] = 0.0;
    _slip_increment[_qp][i] = 0.0;
    // _disloc_density[_qp][i] = _disloc_density0;
  }
  _disloc_density[_qp] = _disloc_density0;
  _disloc_h[_qp] = 20.0;
  computeQpP();
  locateH();
  // updateCry();
  // _H[_qp] = initH(_loop_num,_amp,_plane_file_name,_cry[_qp]);
}

void
CrystalPlasticityUpdate::setInitialConstitutiveVariableValues()
{
  // Would also set old dislocation densities here if included in this model
  _slip_resistance[_qp] = _slip_resistance_old[_qp];
  _previous_substep_slip_resistance = _slip_resistance_old[_qp];
  _previous_substep_disloc_h = _disloc_h_old[_qp];
  _previous_substep_H = _H_old[_qp];
}

void
CrystalPlasticityUpdate::setSubstepConstitutiveVariableValues()
{
  // Would also set substepped dislocation densities here if included in this model
  _slip_resistance[_qp] = _previous_substep_slip_resistance;
  _disloc_h[_qp] = _previous_substep_disloc_h;
  _H[_qp] = _previous_substep_H;
}

bool
CrystalPlasticityUpdate::calculateSlipRate()
{
  for (const auto i : make_range(_number_slip_systems))
  {
    _slip_increment[_qp][i] =
        _ao * std::pow(std::abs(_tau[_qp][i] / _slip_resistance[_qp][i]), 1.0 / _xm);
    if (_tau[_qp][i] < 0.0)
      _slip_increment[_qp][i] *= -1.0;

    if (std::abs(_slip_increment[_qp][i]) * _substep_dt > _slip_incr_tol)
    {
      if (_print_convergence_message)
        mooseWarning("Maximum allowable slip increment exceeded ",
                     std::abs(_slip_increment[_qp][i]) * _substep_dt);

      return false;
    }
  }
  return true;
}

void
CrystalPlasticityUpdate::calculateEquivalentSlipIncrement(
    RankTwoTensor & equivalent_slip_increment)
{
  // if (_include_twinning_in_Lp)
  // {
  //   for (const auto i : make_range(_number_slip_systems))
  //     equivalent_slip_increment += (1.0 - (*_twin_volume_fraction_total)[_qp]) *
  //                                  _flow_direction[_qp][i] * _slip_increment[_qp][i] * _substep_dt;
  // }
  // else // if no twinning volume fraction material property supplied, use base class
  //   CrystalPlasticityStressUpdateBase::calculateEquivalentSlipIncrement(equivalent_slip_increment);
  CrystalPlasticityStressUpdateBase::calculateEquivalentSlipIncrement(equivalent_slip_increment);
}

void
CrystalPlasticityUpdate::calculateConstitutiveSlipDerivative(
    std::vector<Real> & dslip_dtau)
{
  for (const auto i : make_range(_number_slip_systems))
  {
    if (MooseUtils::absoluteFuzzyEqual(_tau[_qp][i], 0.0))
      dslip_dtau[i] = 0.0;
    else
      dslip_dtau[i] = _ao / _xm *
                      std::pow(std::abs(_tau[_qp][i] / _slip_resistance[_qp][i]), 1.0 / _xm - 1.0) /
                      _slip_resistance[_qp][i];
  }
}

bool
CrystalPlasticityUpdate::areConstitutiveStateVariablesConverged()
{
  return isConstitutiveStateVariableConverged(_slip_resistance[_qp],
                                              _slip_resistance_before_update,
                                              _previous_substep_slip_resistance,
                                              _resistance_tol);
}

void
CrystalPlasticityUpdate::updateSubstepConstitutiveVariableValues()
{
  // Would also set substepped dislocation densities here if included in this model
  _previous_substep_slip_resistance = _slip_resistance[_qp];
  _previous_substep_disloc_h = _disloc_h_old[_qp];
  _previous_substep_H = _H_old[_qp];
}

void
CrystalPlasticityUpdate::cacheStateVariablesBeforeUpdate()
{
  _slip_resistance_before_update = _slip_resistance[_qp];
  _disloc_h_before_update = _disloc_h[_qp];
  _H_before_update = _H[_qp];
}

void
CrystalPlasticityUpdate::calculateStateVariableEvolutionRateComponent()
{
  std::vector<RealVectorValue> pnormal;
  pnormal=CrystalPlasticityUpdate::calplanenorm(_crysrot[_qp]);
  std::vector<Real> absslip;
  absslip.resize(_number_slip_systems);
  for (const auto i : make_range(_number_slip_systems))
  {
    absslip[i]=std::abs(_slip_increment_old[_qp][i]);
  }
  Real _k2;
  _k2=_k20*(_gamma0/std::max(0.00000000000001,std::abs(std::accumulate(absslip.begin(),absslip.end(),0.0))));
  _disloc_h_increment=std::abs(std::accumulate(absslip.begin(),absslip.end(),0.0))*(_k1*std::pow(_disloc_h_before_update,0.5)-_k2*_disloc_h_before_update);
  _srate[_qp]=std::abs(std::accumulate(absslip.begin(),absslip.end(),0.0));
  for (const auto i : make_range(_number_slip_systems))
  {
    if (_slip_increment_old[_qp][i]!=0.0){
    RankTwoTensor Pnormal;
    Pnormal=outer_product(pnormal[i],pnormal[i]);
    _H_increment+=-100.0*(Pnormal.doubleContraction(_H_before_update))*Pnormal*std::abs(_slip_increment_old[_qp][i]);
    }
  }
  for (const auto i : make_range(_number_slip_systems))
  {
    // Clear out increment from the previous iteration
    // _slip_resistance_increment[i] = 0.0;

    _hb[i] = _h * std::pow(std::abs(1.0 - _slip_resistance[_qp][i] / _tau_sat), _gss_a);
    const Real hsign = 1.0 - _slip_resistance[_qp][i] / _tau_sat;
    if (hsign < 0.0)
      _hb[i] *= -1.0;
  }

  // for (const auto i : make_range(_number_slip_systems))
  // {
  //   for (const auto j : make_range(_number_slip_systems))
  //   {
  //     unsigned int iplane, jplane;
  //     iplane = i / 3;
  //     jplane = j / 3;

  //     if (iplane == jplane) // self vs. latent hardening
  //       _slip_resistance_increment[i] +=
  //           std::abs(_slip_increment[_qp][j]) * _hb[j]; // q_{ab} = 1.0 for self hardening
  //     else
  //       _slip_resistance_increment[i] +=
  //           std::abs(_slip_increment[_qp][j]) * _r * _hb[j]; // latent hardenign
  //   }
  // }
}

bool
CrystalPlasticityUpdate::updateStateVariables()
{
  // Now perform the check to see if the slip system should be updated
  // std::vector<RealVectorValue> local_plane_normal;
  _H_increment*=_substep_dt;
  _H[_qp]+=_H_increment;
  std::vector<RealVectorValue> pnormal;
  pnormal=CrystalPlasticityUpdate::calplanenorm(_crysrot[_qp]);
  _disloc_h[_qp] += _disloc_h_increment*_substep_dt;
    // _disloc_density[_qp][i] = std::max(0.0,_disloc_h[_qp][i]*_disloc_density0);
  _disloc_h[_qp]=std::max(20.0,_disloc_h[_qp]);
  _disloc_density[_qp] = std::max(0.0,_disloc_h[_qp]*_disloc_density0);
  for (const auto i : make_range(_number_slip_systems))
  {
    RankTwoTensor Pnormal;
    Pnormal=outer_product(pnormal[i],pnormal[i]);
    // _H[_qp]+=_H_increment;
    _slip_resistance[_qp][i] = _gss_initial+2.48*std::pow(10.0,-7.0)*86.0*std::pow(10.0,3.0)*(std::pow(std::max(0.0,_disloc_density[_qp]*0.125),0.5)+std::pow(0.675*std::max(Pnormal.doubleContraction(_H[_qp]),0.0),0.5));
    _gd[_qp][i] = 2.48*std::pow(10.0,-7.0)*86.0*std::pow(10.0,3.0)*(std::pow(0.675*std::max(Pnormal.doubleContraction(_H[_qp]),0.0),0.5));
    // _slip_resistance[_qp][i] = _gss_initial;
    if (_slip_resistance[_qp][i]==0.0)
    {
      _slip_resistance[_qp][i]=0.000001;
    }
    // if (_previous_substep_slip_resistance[i] < _zero_tol && _slip_resistance_increment[i] < 0.0)
    //   _slip_resistance[_qp][i] = _previous_substep_slip_resistance[i];
    // else
    //   _slip_resistance[_qp][i] =
    //       _previous_substep_slip_resistance[i] + _slip_resistance_increment[i];

    if (_slip_resistance[_qp][i] < 0.0)
      return false;
  }
  return true;
}
