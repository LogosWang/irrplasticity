//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "CrystalPlasticityStressUpdateBase.h"
#include "RankTwoTensor.h"
#include <random> 
#include "libmesh/vector_value.h"
#include "PropertyReadFile.h"
#include "ComputeElasticityTensorCP.h"

RankTwoTensor initH(Real _number_of_loop,Real _amp,FileName _plane_file_name,RankTwoTensor crysrot);
class CrystalPlasticityUpdate;

/**
 * CrystalPlasticityKalidindiUpdate uses the multiplicative decomposition of the
 * deformation gradient and solves the PK2 stress residual equation at the
 * intermediate configuration to evolve the material state. The internal
 * variables are updated using an interative predictor-corrector algorithm.
 * Backward Euler integration rule is used for the rate equations.
 */

class CrystalPlasticityUpdate : public CrystalPlasticityStressUpdateBase
{
public:
  static InputParameters validParams();

  CrystalPlasticityUpdate(const InputParameters & parameters);
  const PropertyReadFile * const _read_prop_user_object;
  FileName _plane_file_name;
protected:
  /**
   * initializes the stateful properties such as
   * stress, plastic deformation gradient, slip system resistances, etc.
   */
  void computeQpP();
  virtual void initQpStatefulProperties() override;

  /**
   * Sets the value of the current and previous substep iteration slip system
   * resistance to the old value at the start of the PK2 stress convergence
   * while loop.
   */
  virtual void setInitialConstitutiveVariableValues() override;

  /**
   * Sets the current slip system resistance value to the previous substep value.
   * In cases where only one substep is taken (or when the first) substep is taken,
   * this method just sets the current value to the old slip system resistance
   * value again.
   */
  virtual void setSubstepConstitutiveVariableValues() override;

  /**
   * Stores the current value of the slip system resistance into a separate
   * material property in case substepping is needed.
   */
  virtual void updateSubstepConstitutiveVariableValues() override;

  virtual bool calculateSlipRate() override;

  virtual void
  calculateEquivalentSlipIncrement(RankTwoTensor & /*equivalent_slip_increment*/) override;

  virtual void calculateConstitutiveSlipDerivative(std::vector<Real> & dslip_dtau) override;

  // Cache the slip system value before the update for the diff in the convergence check
  virtual void cacheStateVariablesBeforeUpdate() override;

  /**
   * Following the Constitutive model for slip system resistance as given in
   * Kalidindi, S.R., C.A. Bronkhorst, and L. Anand. Crystallographic texture
   * evolution in bulk deformation processing of FCC metals. Journal of the
   * Mechanics and Physics of Solids 40, no. 3 (1992): 537-569. Eqns 40 - 43.
   * The slip system resistant increment is calculated as
   * $\Delta g = \left| \Delta \gamma \cdot q^{\alpha \beta} \cdot h^{\beta} \right|$
   * and a convergence check is performed on the slip system resistance increment
   */
  virtual void calculateStateVariableEvolutionRateComponent() override;

  /*
   * Finalizes the values of the state variables and slip system resistance
   * for the current timestep after convergence has been reached.
   */
  virtual bool updateStateVariables() override;

  /*
   * Determines if the state variables, e.g. defect densities, have converged
   * by comparing the change in the values over the iteration period.
   */
  virtual bool areConstitutiveStateVariablesConverged() override;
  virtual void getSlipSystems() override;
  void updateCry();
  void locateH();
  std::vector<RealVectorValue> calplanenorm(const RankTwoTensor & crysrot);
  ///@{Varibles used in the Kalidindi 1992 slip system resistance constiutive model
  std::vector<RankTwoTensor> _H_list;
  std::vector<RealVectorValue> _angle_list;
  RankTwoTensor _I;
  Real _T;
  Real _T_critical;
  Real _theta;
  Real _loop_num;
  Real _amp;
  const Real _r;
  const Real _h;
  const Real _tau_sat;
  const Real _gss_a;
  const Real _ao;
  const Real _xm;
  const Real _gss_initial;
  const Real _disloc_density0;
  const Real _k1;
  const Real _k20;
  const Real _gamma0;
  // std::vector<RealVectorValue> local_plane_normal;
  std::vector<RealVectorValue> _slip_plane_normal;

  /**
   * Slip system interaction matrix used to calculate the hardening contributions
   * from the self and latent slip systems, from Kalidindi et al (1992).
   */
  std::vector<Real> _hb;

  /// Increment of increased resistance for each slip system
  std::vector<Real> _slip_resistance_increment;
  MaterialProperty<Real> & _disloc_h;
  MaterialProperty<RankTwoTensor> & _cry;
  const MaterialProperty<RealVectorValue> & _euler_ang;
  MaterialProperty<RealVectorValue> & _euler_angle;
  MaterialProperty<RankTwoTensor> & _H;
  Real _disloc_h_increment;
  RankTwoTensor _H_increment;
  MaterialProperty<Real> & _disloc_density;
  MaterialProperty<Real> & _srate;
  MaterialProperty<std::vector<Real>> & _gd;
  const MaterialProperty<std::vector<Real>> & _slip_increment_old;
  const MaterialProperty<Real> & _disloc_h_old;
  const MaterialProperty<RankTwoTensor> & _H_old;

  /**
   * Stores the values of the slip system resistance from the previous substep
   * In classes which use dislocation densities, analogous dislocation density
   * substep vectors will be required.
   */
  std::vector<Real> _previous_substep_slip_resistance;
  Real _previous_substep_disloc_h;
  RankTwoTensor _previous_substep_H;
  /**
   * Caches the value of the current slip system resistance immediately prior
   * to the update of the slip system resistance, and is used to calculate the
   * the slip system resistance increment for the current substep (or step if
   * only one substep is taken) for the convergence check tolerance comparison.
   * In classes which use dislocation densities, analogous dislocation density
   * caching vectors will also be required.
   */
  std::vector<Real> _slip_resistance_before_update;
  Real _disloc_h_before_update;
  RankTwoTensor _H_before_update;
  /**
   * Flag to include the total twin volume fraction in the plastic velocity
   * gradient calculation, per Kalidindi IJP (2001).
   */
  const bool _include_twinning_in_Lp;

  /**
   * User-defined material property name for the total volume fraction of twins
   * in a twinning propagation constitutive model, when this class is used in
   * conjunction with the twinning propagation model.
   * Note that this value is the OLD material property and thus lags the current
   * value by a single timestep.
   */
  const MaterialProperty<Real> * const _twin_volume_fraction_total;
  const MaterialProperty<RankTwoTensor> & _crysrot;
  // using CrystalPlasticityStressUpdateBase::_number_slip_systems;
  // using CrystalPlasticityStressUpdateBase::_slip_sys_file_name;
  // using CrystalPlasticityStressUpdateBase::_slip_direction;
  // using CrystalPlasticityStressUpdateBase::_slip_plane_normal;
  unsigned int _n_euler_angle_vars;
  const std::vector<const VariableValue *> _euler_angle_vars;
};
