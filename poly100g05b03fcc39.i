[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
[]

[Mesh]
construct_side_list_from_node_list = false   
[cube]
  type = FileMeshGenerator
  file = poly100postg05b03.e
  []

[]
[MeshDivisions]
  [block_div]
    type = SubdomainsDivision
  []
[]


[UserObjects]
  [reader_element]
    type = PropertyReadFile
    prop_file_name = 'poly_100.csv'
    read_type = 'block'
    # use_random_voronoi = false
    nblock = 100
    nprop = 3
  []
[]
[AuxVariables]
  [mesh_quality]
    order = CONSTANT
    family = MONOMIAL
  []
  [mesh_quality_m]
    order = CONSTANT
    family = MONOMIAL
  []
  [fp_yy]
    order = CONSTANT
    family = MONOMIAL
  []
  [total_twin_volume]
    order = CONSTANT
    family = MONOMIAL
  []
  [stress_vm]
    order = CONSTANT
    family = MONOMIAL
  []
  [strain_eff]
    order = CONSTANT
    family = MONOMIAL
  []
  [strain_shear]
    order = CONSTANT
    family = MONOMIAL
  []
  [strain_shear_m]
    order = CONSTANT
    family = MONOMIAL
  []
  [H_1]
    order = CONSTANT
    family = MONOMIAL
  []
  [H_2]
    order = CONSTANT
    family = MONOMIAL
  []
  [H_3]
    order = CONSTANT
    family = MONOMIAL
  []
  [Hs_1]
    order = CONSTANT
    family = MONOMIAL
  []
  [Hs_2]
    order = CONSTANT
    family = MONOMIAL
  []
  [Hs_3]
    order = CONSTANT
    family = MONOMIAL
  []
  [cry_1]
    order = CONSTANT
    family = MONOMIAL
  []
  [cry_2]
    order = CONSTANT
    family = MONOMIAL
  []
  [cry_3]
    order = CONSTANT
    family = MONOMIAL
  []
  [strain_yy]
    order = CONSTANT
    family = MONOMIAL
  []
  [stress_zz]
    order = CONSTANT
    family = MONOMIAL
  []
  [stress_yy]
    order = CONSTANT
    family = MONOMIAL
  []
  [stress_xx]
    order = CONSTANT
    family = MONOMIAL
  []
  [stress_xy]
    order = CONSTANT
    family = MONOMIAL
  []
  [stress_xz]
    order = CONSTANT
    family = MONOMIAL
  []
  [stress_yz]
    order = CONSTANT
    family = MONOMIAL
  []
  [sliprate]
    order = CONSTANT
    family = MONOMIAL
  []
  [sliprate_m]
    order = CONSTANT
    family = MONOMIAL
  []
  [euler_ang_0]
    order = CONSTANT
    family = MONOMIAL
  []
  [euler_ang_1]
    order = CONSTANT
    family = MONOMIAL
  []
  [euler_ang_2]
    order = CONSTANT
    family = MONOMIAL
  []
#   [slip_increment_0]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_1]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_2]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_3]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_4]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_5]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_6]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_7]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_8]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_9]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_10]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_increment_11]
#     order = CONSTANT
#     family = MONOMIAL
#   []
  
#   [slip_resistance_0]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_1]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_2]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_3]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_4]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_5]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_6]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_7]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_8]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_9]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_10]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [slip_resistance_11]
#     order = CONSTANT
#     family = MONOMIAL
#   []
  
#   [gd_0]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_1]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_2]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_3]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_4]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_5]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_6]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_7]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_8]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_9]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_10]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [gd_11]
#     order = CONSTANT
#     family = MONOMIAL
#   []
  
  [disloc_density]
    order = CONSTANT
    family = MONOMIAL
  []
  [disloc_density_m]
    order = CONSTANT
    family = MONOMIAL
  []
#   [twin_slip_increment_0]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_1]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_2]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_3]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_4]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_5]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_6]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_7]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_8]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_9]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_10]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_slip_increment_11]
#     order = CONSTANT
#     family = MONOMIAL
#   []
  
#   [twin_twin_system_volume_fraction_0]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_1]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_2]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_3]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_4]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_5]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_6]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_7]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_8]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_9]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_10]
#     order = CONSTANT
#     family = MONOMIAL
#   []
#   [twin_twin_system_volume_fraction_11]
#     order = CONSTANT
#     family = MONOMIAL
#   []
[]

[Physics/SolidMechanics/QuasiStatic/all]
  strain = FINITE
  add_variables = true
[]

[AuxKernels]
[mesh_quality]
type = ElementQualityAux
metric = JACOBIAN
variable = mesh_quality
[]
[mesh_quality_m]
type = ElementQualityAux
metric = JACOBIAN
variable = mesh_quality_m
[]
[stress_vm]
type = RankTwoScalarAux
rank_two_tensor = stress
variable = stress_vm
scalar_type = VonMisesStress
execute_on = timestep_end
[]
[strain_eff]
type = RankTwoScalarAux
rank_two_tensor = total_strain
variable = strain_eff
scalar_type = L2norm
execute_on = timestep_end
[]
[strain_shear]
type = RankTwoScalarAux
rank_two_tensor = total_strain
variable = strain_shear
scalar_type = MaxShear
execute_on = timestep_end
[]
[strain_shear_m]
type = RankTwoScalarAux
rank_two_tensor = total_strain
variable = strain_shear_m
scalar_type = MaxShear
execute_on = timestep_end
[]
  [fp_yy]
    type = RankTwoAux
    variable = fp_yy
    rank_two_tensor = plastic_deformation_gradient
    index_j = 1
    index_i = 1
    execute_on = timestep_end
  []
  [strain_yy]
  type = RankTwoAux
  rank_two_tensor = total_strain
  variable = strain_yy
  index_j = 1
  index_i = 1
  execute_on = timestep_end
  []
  [stress_xx]
  type = RankTwoAux
  rank_two_tensor = stress
  variable = stress_xx
  index_j = 0
  index_i = 0
  execute_on = timestep_end
  []
  [stress_yy]
  type = RankTwoAux
  rank_two_tensor = stress
  variable = stress_yy
  index_j = 1
  index_i = 1
  execute_on = timestep_end
  []
  [stress_zz]
  type = RankTwoAux
  rank_two_tensor = stress
  variable = stress_zz
  index_j = 2
  index_i = 2
  execute_on = timestep_end
  []
  [stress_xy]
  type = RankTwoAux
  rank_two_tensor = stress
  variable = stress_xy
  index_j = 0
  index_i = 1
  execute_on = timestep_end
  []
  [stress_xz]
  type = RankTwoAux
  rank_two_tensor = stress
  variable = stress_xz
  index_j = 0
  index_i = 2
  execute_on = timestep_end
  []
  [stress_yz]
  type = RankTwoAux
  rank_two_tensor = stress
  variable = stress_yz
  index_j = 1
  index_i = 2
  execute_on = timestep_end
  []
  [euler_ang_0]
  type = MaterialRealVectorValueAux
  variable = euler_ang_0
  property = Euler_angles
  component = 0
  execute_on = timestep_end
 []
 [euler_ang_1]
  type = MaterialRealVectorValueAux
  variable = euler_ang_1
  property = Euler_angles
  component = 1
  execute_on = timestep_end
 []
 [euler_ang_2]
  type = MaterialRealVectorValueAux
  variable = euler_ang_2
  property = Euler_angles
  component = 2
  execute_on = timestep_end
 []
 [cry_1]
  type = RankTwoAux
  rank_two_tensor = crysrot
  variable = cry_1
  index_j = 0
  index_i = 0
  execute_on = timestep_end
  []
  [cry_2]
  type = RankTwoAux
  rank_two_tensor = crysrot
  variable = cry_2
  index_j = 1
  index_i = 1
  execute_on = timestep_end
  []
  [cry_3]
  type = RankTwoAux
  rank_two_tensor = crysrot
  variable = cry_3
  index_j = 2
  index_i = 2
  execute_on = timestep_end
  []
  [H_1]
  type = RankTwoAux
  rank_two_tensor = H
  variable = H_1
  index_j = 0
  index_i = 0
  execute_on = timestep_end
  []
  [H_2]
  type = RankTwoAux
  rank_two_tensor = H
  variable = H_2
  index_j = 1
  index_i = 1
  execute_on = timestep_end
  []
  [H_3]
  type = RankTwoAux
  rank_two_tensor = H
  variable = H_3
  index_j = 2
  index_i = 2
  execute_on = timestep_end
  []
  [Hs_1]
  type = RankTwoAux
  rank_two_tensor = H_shock
  variable = Hs_1
  index_j = 0
  index_i = 0
  execute_on = timestep_end
  []
  [Hs_2]
  type = RankTwoAux
  rank_two_tensor = H_shock
  variable = Hs_2
  index_j = 1
  index_i = 1
  execute_on = timestep_end
  []
  [Hs_3]
  type = RankTwoAux
  rank_two_tensor = H_shock
  variable = Hs_3
  index_j = 2
  index_i = 2
  execute_on = timestep_end
  []
#   [slip_increment_0]
#    type = MaterialStdVectorAux
#    variable = slip_increment_0
#    property = slip_increment
#    index = 0
#    execute_on = timestep_end
#   []
#   [slip_increment_1]
#    type = MaterialStdVectorAux
#    variable = slip_increment_1
#    property = slip_increment
#    index = 1
#    execute_on = timestep_end
#   []
#   [slip_increment_2]
#    type = MaterialStdVectorAux
#    variable = slip_increment_2
#    property = slip_increment
#    index = 2
#    execute_on = timestep_end
#   []
#   [slip_increment_3]
#    type = MaterialStdVectorAux
#    variable = slip_increment_3
#    property = slip_increment
#    index = 3
#    execute_on = timestep_end
#   []
#   [slip_increment_4]
#    type = MaterialStdVectorAux
#    variable = slip_increment_4
#    property = slip_increment
#    index = 4
#    execute_on = timestep_end
#   []
#   [slip_increment_5]
#    type = MaterialStdVectorAux
#    variable = slip_increment_5
#    property = slip_increment
#    index = 5
#    execute_on = timestep_end
#   []
#   [slip_increment_6]
#    type = MaterialStdVectorAux
#    variable = slip_increment_6
#    property = slip_increment
#    index = 6
#    execute_on = timestep_end
#   []
#   [slip_increment_7]
#    type = MaterialStdVectorAux
#    variable = slip_increment_7
#    property = slip_increment
#    index = 7
#    execute_on = timestep_end
#   []
#   [slip_increment_8]
#    type = MaterialStdVectorAux
#    variable = slip_increment_8
#    property = slip_increment
#    index = 8
#    execute_on = timestep_end
#   []
#   [slip_increment_9]
#    type = MaterialStdVectorAux
#    variable = slip_increment_9
#    property = slip_increment
#    index = 9
#    execute_on = timestep_end
#   []
#   [slip_increment_10]
#    type = MaterialStdVectorAux
#    variable = slip_increment_10
#    property = slip_increment
#    index = 10
#    execute_on = timestep_end
#   []
#   [slip_increment_11]
#    type = MaterialStdVectorAux
#    variable = slip_increment_11
#    property = slip_increment
#    index = 11
#    execute_on = timestep_end
#   []
  
#   [slip_resistance_0]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_0
#    property = slip_resistance
#    index = 0
#    execute_on = timestep_end
#   []
#   [slip_resistance_1]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_1
#    property = slip_resistance
#    index = 1
#    execute_on = timestep_end
#   []
#   [slip_resistance_2]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_2
#    property = slip_resistance
#    index = 2
#    execute_on = timestep_end
#   []
#   [slip_resistance_3]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_3
#    property = slip_resistance
#    index = 3
#    execute_on = timestep_end
#   []
#   [slip_resistance_4]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_4
#    property = slip_resistance
#    index = 4
#    execute_on = timestep_end
#   []
#   [slip_resistance_5]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_5
#    property = slip_resistance
#    index = 5
#    execute_on = timestep_end
#   []
#   [slip_resistance_6]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_6
#    property = slip_resistance
#    index = 6
#    execute_on = timestep_end
#   []
#   [slip_resistance_7]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_7
#    property = slip_resistance
#    index = 7
#    execute_on = timestep_end
#   []
#   [slip_resistance_8]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_8
#    property = slip_resistance
#    index = 8
#    execute_on = timestep_end
#   []
#   [slip_resistance_9]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_9
#    property = slip_resistance
#    index = 9
#    execute_on = timestep_end
#   []
#   [slip_resistance_10]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_10
#    property = slip_resistance
#    index = 10
#    execute_on = timestep_end
#   []
#   [slip_resistance_11]
#    type = MaterialStdVectorAux
#    variable = slip_resistance_11
#    property = slip_resistance
#    index = 11
#    execute_on = timestep_end
#   []
 
#  [gd_0]
#   type = MaterialStdVectorAux
#   variable = gd_0
#   property = gd
#   index = 0
#   execute_on = timestep_end
# []

# [gd_1]
#   type = MaterialStdVectorAux
#   variable = gd_1
#   property = gd
#   index = 1
#   execute_on = timestep_end
# []

# [gd_2]
#   type = MaterialStdVectorAux
#   variable = gd_2
#   property = gd
#   index = 2
#   execute_on = timestep_end
# []

# [gd_3]
#   type = MaterialStdVectorAux
#   variable = gd_3
#   property = gd
#   index = 3
#   execute_on = timestep_end
# []

# [gd_4]
#   type = MaterialStdVectorAux
#   variable = gd_4
#   property = gd
#   index = 4
#   execute_on = timestep_end
# []

# [gd_5]
#   type = MaterialStdVectorAux
#   variable = gd_5
#   property = gd
#   index = 5
#   execute_on = timestep_end
# []

# [gd_6]
#   type = MaterialStdVectorAux
#   variable = gd_6
#   property = gd
#   index = 6
#   execute_on = timestep_end
# []

# [gd_7]
#   type = MaterialStdVectorAux
#   variable = gd_7
#   property = gd
#   index = 7
#   execute_on = timestep_end
# []

# [gd_8]
#   type = MaterialStdVectorAux
#   variable = gd_8
#   property = gd
#   index = 8
#   execute_on = timestep_end
# []

# [gd_9]
#   type = MaterialStdVectorAux
#   variable = gd_9
#   property = gd
#   index = 9
#   execute_on = timestep_end
# []

# [gd_10]
#   type = MaterialStdVectorAux
#   variable = gd_10
#   property = gd
#   index = 10
#   execute_on = timestep_end
# []

# [gd_11]
#   type = MaterialStdVectorAux
#   variable = gd_11
#   property = gd
#   index = 11
#   execute_on = timestep_end
# []

 [disloc_density]
 type = MaterialRealAux
 variable = disloc_density
 property = disloc_density
 execute_on = timestep_end
[]
[disloc_density_m]
 type = MaterialRealAux
 variable = disloc_density_m
 property = disloc_density
 execute_on = timestep_end
[]
[sliprate]
type = MaterialRealAux
variable = sliprate
property = sliprate
execute_on = timestep_end
[]
[sliprate_m]
type = MaterialRealAux
variable = sliprate_m
property = sliprate
execute_on = timestep_end
[]
# [twin_slip_increment_0]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_0
#    property = twin_slip_increment
#    index = 0
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_1]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_1
#    property = twin_slip_increment
#    index = 1
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_2]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_2
#    property = twin_slip_increment
#    index = 2
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_3]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_3
#    property = twin_slip_increment
#    index = 3
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_4]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_4
#    property = twin_slip_increment
#    index = 4
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_5]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_5
#    property = twin_slip_increment
#    index = 5
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_6]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_6
#    property = twin_slip_increment
#    index = 6
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_7]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_7
#    property = twin_slip_increment
#    index = 7
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_8]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_8
#    property = twin_slip_increment
#    index = 8
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_9]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_9
#    property = twin_slip_increment
#    index = 9
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_10]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_10
#    property = twin_slip_increment
#    index = 10
#    execute_on = timestep_end
#   []
#   [twin_slip_increment_11]
#    type = MaterialStdVectorAux
#    variable = twin_slip_increment_11
#    property = twin_slip_increment
#    index = 11
#    execute_on = timestep_end
#   []
  
#   [twin_twin_system_volume_fraction_0]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_0
#    property = twin_twin_system_volume_fraction
#    index = 0
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_1]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_1
#    property = twin_twin_system_volume_fraction
#    index = 1
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_2]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_2
#    property = twin_twin_system_volume_fraction
#    index = 2
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_3]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_3
#    property = twin_twin_system_volume_fraction
#    index = 3
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_4]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_4
#    property = twin_twin_system_volume_fraction
#    index = 4
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_5]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_5
#    property = twin_twin_system_volume_fraction
#    index = 5
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_6]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_6
#    property = twin_twin_system_volume_fraction
#    index = 6
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_7]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_7
#    property = twin_twin_system_volume_fraction
#    index = 7
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_8]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_8
#    property = twin_twin_system_volume_fraction
#    index = 8
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_9]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_9
#    property = twin_twin_system_volume_fraction
#    index = 9
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_10]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_10
#    property = twin_twin_system_volume_fraction
#    index = 10
#    execute_on = timestep_end
#   []
#   [twin_twin_system_volume_fraction_11]
#    type = MaterialStdVectorAux
#    variable = twin_twin_system_volume_fraction_11
#    property = twin_twin_system_volume_fraction
#    index = 11
#    execute_on = timestep_end
#   []
[total_twin_volume]
type = MaterialRealAux
variable = total_twin_volume
property = twin_total_volume_fraction_twins
execute_on = timestep_end
[]
[]

[BCs]
  [tdisp]
    type = FunctionDirichletBC
    variable = disp_y
    boundary = top
    function = '(1.5e-5)*t'
  []
  [tdisp2]
    type = FunctionDirichletBC
    variable = disp_y
    boundary = bottom
    function = '(-1.5e-5)*t'
  []

#   [fix_tx]
#     type = DirichletBC
#     variable = disp_x
#     preset = true
#     boundary = top
#     value = 0
#   []
#   [fix_bx]
#     type = DirichletBC
#     variable = disp_x
#     preset = true
#     boundary = bottom
#     value = 0
#   []
#   [fix_tz]
#     type = DirichletBC
#     variable = disp_z
#     preset = true
#     boundary = top
#     value = 0
#   []
#   [fix_bz]
#     type = DirichletBC
#     variable = disp_z
#     preset = true
#     boundary = bottom
#     value = 0
#   []
[]

[Materials]
  [elasticity_tensor]
    type = ComputeElasticityTensorCP
    C_ijkl = '2.36e5 1.34e5 1.34e5 2.36e5 1.34e5 2.36e5 1.19e5 1.19e5 1.19e5' 
    fill_method = symmetric9
    read_prop_user_object = reader_element
  []
  [stress]
    type = ComputeMultipleCrystalPlasticityStress
    crystal_plasticity_models = 'twin_xtalpl slip_xtalpl'
    tan_mod_type = exact
    use_line_search = true
    line_search_method = CUT_HALF # 最稳健，先用它
    min_line_search_step_size = 1e-3   # 比默认 0.01 更小，给足回旋
    line_search_maxiter = 10
    line_search_tol = 0.5             # 比 0.5 更严格一些
    maximum_substep_iteration = 10
  []
  [twin_xtalpl]
    type = CrystalPlasticityTwinningUpdate
    base_name = 'twin'
    twin_reference_strain_rate = 1.0
    number_slip_systems = 12
    slip_sys_file_name = 'fcc_input_twinning_systems.txt'
    non_coplanar_coefficient_twin_hardening = 2000
    initial_twin_lattice_friction = 700.0
    coplanar_coefficient_twin_hardening = 27000.0
  []
  [slip_xtalpl]
    type = CrystalPlasticityFccUpdate
    gss_initial =5.0
    ao = 3e4
    xm = 0.05
    eta = 7.0
    dl = 6e-6
    k1 = 400.0
    k20 = 25.0
    gamma0 = 200.0
    loop_num_shock = 260
    loop_num_frank = 130
    amp = 10000.0
    number_slip_systems = 12
    slip_sys_file_name = input_slip_sys_fcc.txt
    plane_file_name = fcc_plane.csv
    read_prop_user_object = reader_element
    slip_increment_tolerance = 1e-2
#     print_state_variable_convergence_error_messages = true
    total_twin_volume_fraction = 'twin_total_volume_fraction_twins'
  []
[]

[Postprocessors]
[stress_vm]
   type = ElementAverageValue
   variable = stress_vm
[]
  [fp_yy]
    type = ElementAverageValue
    variable = fp_yy
  []
  [stress_xx]
    type = ElementAverageValue
    variable = stress_xx
  []
  [stress_yy]
    type = ElementAverageValue
    variable = stress_yy
  []
  [stress_zz]
    type = ElementAverageValue
    variable = stress_zz
  []
   [stress_xy]
    type = ElementAverageValue
    variable = stress_xy
  []
   [stress_xz]
    type = ElementAverageValue
    variable = stress_xz
  []
   [stress_yz]
    type = ElementAverageValue
    variable = stress_yz
  []

#   [slip_increment_0]
#     type = ElementAverageValue
#     variable = slip_increment_0
#   []
#   [slip_increment_1]
#     type = ElementAverageValue
#     variable = slip_increment_1
#   []
#   [slip_increment_2]
#     type = ElementAverageValue
#     variable = slip_increment_2
#   []
#   [slip_increment_3]
#     type = ElementAverageValue
#     variable = slip_increment_3
#   []
#   [slip_increment_4]
#     type = ElementAverageValue
#     variable = slip_increment_4
#   []
#   [slip_increment_5]
#     type = ElementAverageValue
#     variable = slip_increment_5
#   []
#   [slip_increment_6]
#     type = ElementAverageValue
#     variable = slip_increment_6
#   []
#   [slip_increment_7]
#     type = ElementAverageValue
#     variable = slip_increment_7
#   []
#   [slip_increment_8]
#     type = ElementAverageValue
#     variable = slip_increment_8
#   []
#   [slip_increment_9]
#     type = ElementAverageValue
#     variable = slip_increment_9
#   []
#   [slip_increment_10]
#     type = ElementAverageValue
#     variable = slip_increment_10
#   []
#   [slip_increment_11]
#     type = ElementAverageValue
#     variable = slip_increment_11
#   []
  
#   [slip_resistance_0]
#     type = ElementAverageValue
#     variable = slip_resistance_0
#   []
#   [slip_resistance_1]
#     type = ElementAverageValue
#     variable = slip_resistance_1
#   []
#   [slip_resistance_2]
#     type = ElementAverageValue
#     variable = slip_resistance_2
#   []
#   [slip_resistance_3]
#     type = ElementAverageValue
#     variable = slip_resistance_3
#   []
#   [slip_resistance_4]
#     type = ElementAverageValue
#     variable = slip_resistance_4
#   []
#   [slip_resistance_5]
#     type = ElementAverageValue
#     variable = slip_resistance_5
#   []
#   [slip_resistance_6]
#     type = ElementAverageValue
#     variable = slip_resistance_6
#   []
#   [slip_resistance_7]
#     type = ElementAverageValue
#     variable = slip_resistance_7
#   []
#   [slip_resistance_8]
#     type = ElementAverageValue
#     variable = slip_resistance_8
#   []
#   [slip_resistance_9]
#     type = ElementAverageValue
#     variable = slip_resistance_9
#   []
#   [slip_resistance_10]
#     type = ElementAverageValue
#     variable = slip_resistance_10
#   []
#   [slip_resistance_11]
#     type = ElementAverageValue
#     variable = slip_resistance_11
#   []
 
#   [gd_0]
#   type = ElementAverageValue
#   variable = gd_0
# []

# [gd_1]
#   type = ElementAverageValue
#   variable = gd_1
# []

# [gd_2]
#   type = ElementAverageValue
#   variable = gd_2
# []

# [gd_3]
#   type = ElementAverageValue
#   variable = gd_3
# []

# [gd_4]
#   type = ElementAverageValue
#   variable = gd_4
# []

# [gd_5]
#   type = ElementAverageValue
#   variable = gd_5
# []

# [gd_6]
#   type = ElementAverageValue
#   variable = gd_6
# []

# [gd_7]
#   type = ElementAverageValue
#   variable = gd_7
# []

# [gd_8]
#   type = ElementAverageValue
#   variable = gd_8
# []

# [gd_9]
#   type = ElementAverageValue
#   variable = gd_9
# []

# [gd_10]
#   type = ElementAverageValue
#   variable = gd_10
# []

# [gd_11]
#   type = ElementAverageValue
#   variable = gd_11



[disp_x]
type = ElementExtremeValue
variable = disp_x
value_type = max
[]
  [disp_y]
    type = ElementExtremeValue
    variable = disp_y
    value_type = max
  []
  [disp_z]
    type = ElementExtremeValue
    variable = disp_z
    value_type = max
  []
  [disloc_density_m]
    type = ElementExtremeValue
    variable = disloc_density_m
    value_type = max
  []
  [disloc_density]
    type = ElementAverageValue
    variable = disloc_density
  []
  [mesh_quality_m]
  type = ElementExtremeValue
    variable = mesh_quality_m
    value_type = min
  []
  [mesh_quality]
  type = ElementAverageValue
    variable = mesh_quality
  []
  [sliprate_m]
  type = ElementExtremeValue
    variable = sliprate_m
    value_type = max
  []
  [sliprate]
  type = ElementAverageValue
    variable = sliprate
  []
  [total_twin_volume]
  type = ElementExtremeValue
    variable = total_twin_volume
    value_type = max
  []
  [H_1]
  type = ElementAverageValue
  variable = H_1
[]
[H_2]
  type = ElementAverageValue
  variable = H_2
[]
[H_3]
  type = ElementAverageValue
  variable = H_3
[]
[Hs_1]
  type = ElementAverageValue
  variable = Hs_1
[]
[Hs_2]
  type = ElementAverageValue
  variable = Hs_2
[]
[Hs_3]
  type = ElementAverageValue
  variable = Hs_3
[]
[strain_yy]
  type = ElementAverageValue
  variable = strain_yy
[]
[strain_eff]
  type = ElementAverageValue
  variable = strain_eff
[]
[strain_shear_m]
  type = ElementExtremeValue
  variable = strain_shear_m
  value_type = max
[]
[strain_shear]
  type = ElementAverageValue
  variable = strain_shear
[]
[cry_1]
  type = ElementAverageValue
  variable = cry_1
[]
[cry_2]
  type = ElementAverageValue
  variable = cry_2
[]
[cry_3]
  type = ElementAverageValue
  variable = cry_3
[]
#  [twin_slip_increment_0]
#     type = ElementAverageValue
#     variable = twin_slip_increment_0
#   []
#   [twin_slip_increment_1]
#     type = ElementAverageValue
#     variable = twin_slip_increment_1
#   []
#   [twin_slip_increment_2]
#     type = ElementAverageValue
#     variable = twin_slip_increment_2
#   []
#   [twin_slip_increment_3]
#     type = ElementAverageValue
#     variable = twin_slip_increment_3
#   []
#   [twin_slip_increment_4]
#     type = ElementAverageValue
#     variable = twin_slip_increment_4
#   []
#   [twin_slip_increment_5]
#     type = ElementAverageValue
#     variable = twin_slip_increment_5
#   []
#   [twin_slip_increment_6]
#     type = ElementAverageValue
#     variable = twin_slip_increment_6
#   []
#   [twin_slip_increment_7]
#     type = ElementAverageValue
#     variable = twin_slip_increment_7
#   []
#   [twin_slip_increment_8]
#     type = ElementAverageValue
#     variable = twin_slip_increment_8
#   []
#   [twin_slip_increment_9]
#     type = ElementAverageValue
#     variable = twin_slip_increment_9
#   []
#   [twin_slip_increment_10]
#     type = ElementAverageValue
#     variable = twin_slip_increment_10
#   []
#   [twin_slip_increment_11]
#     type = ElementAverageValue
#     variable = twin_slip_increment_11
#   []
  
#   [twin_twin_system_volume_fraction_0]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_0
#   []
#   [twin_twin_system_volume_fraction_1]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_1
#   []
#   [twin_twin_system_volume_fraction_2]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_2
#   []
#   [twin_twin_system_volume_fraction_3]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_3
#   []
#   [twin_twin_system_volume_fraction_4]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_4
#   []
#   [twin_twin_system_volume_fraction_5]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_5
#   []
#   [twin_twin_system_volume_fraction_6]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_6
#   []
#   [twin_twin_system_volume_fraction_7]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_7
#   []
#   [twin_twin_system_volume_fraction_8]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_8
#   []
#   [twin_twin_system_volume_fraction_9]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_9
#   []
#   [twin_twin_system_volume_fraction_10]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_10
#   []
#   [twin_twin_system_volume_fraction_11]
#     type = ElementAverageValue
#     variable = twin_twin_system_volume_fraction_11
#   []
#    [surface_react_y]
#     type = SidesetReaction
#     direction = '0 1 0'
#     stress_tensor = stress
#     boundary = bottom
#   []
[]

[Preconditioning]
  [smp]
    type = SMP
    full = true
  []

[]
# [Adaptivity]
#   marker = marker1
#   max_h_level = 2
#   cycles_per_step = 1
#   [Indicators]
#     [error]
#       type = ValueJumpIndicator
#       variable = strain_shear
#     []
#   []
#   [Markers]
#     [marker1]
#       type = ErrorFractionMarker
#       coarsen = 0.5
#       indicator = error
#       refine = 0.01
#     []
# #     [marker2]
# #       type = ValueThresholdMarker
# #       invert = true
# #       refine = 0.1
# #       variable = mesh_quality
# # #       third_state = DO_NOTHING
# #     []
# #     [combo]
# #       type = ComboMarker
# #       markers = 'marker1 marker2'
# #     []
#   []
# []

[Executioner]
  type = Transient
  solve_type = 'PJFNK'

  petsc_options_iname = '-pc_type -pc_asm_overlap -sub_pc_type -ksp_type -ksp_gmres_restart'
  petsc_options_value = ' asm      2              lu            gmres     200'
  nl_abs_tol = 1e-4
  nl_rel_tol = 1e-4
  nl_abs_step_tol = 5e-4
  nl_rel_step_tol = 5e-4
  l_tol=0.5
  line_search = bt
  dt = 5e-2
  dtmin = 1e-25
#   end_time = 2e-6
  end_time = 5e1
  
[]

[Outputs]
  execute_on = 'timestep_end'
  exodus = true
  csv = true     
  perf_graph = true
#   file_base = '/global/cfs/cdirs/m5076/wzhuo001/output'

[]
