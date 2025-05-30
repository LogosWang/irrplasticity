[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
[]

[Mesh]
construct_side_list_from_node_list = false   
[cube]
  type = FileMeshGenerator
  file = poly20.msh

  []

  [top_boundary]
    type = BoundingBoxNodeSetGenerator
    input = cube
    new_boundary = 'top'
    top_right = '1.1 1.1 1.1'
    bottom_left = '-0.1 0.99 -0.1'
  []
  [create_sideset1]
    type = SideSetsFromNodeSetsGenerator
    input = top_boundary
  []
  [bottom_boundary]
    type = BoundingBoxNodeSetGenerator
    input = create_sideset1
    new_boundary = 'bottom'
    top_right = '1.1 0.1 1.1'
    bottom_left = '-0.1 -0.1 -0.1'
  []
  [create_sideset2]
    type = SideSetsFromNodeSetsGenerator
    input = bottom_boundary
  []
  [scale]
    type = TransformGenerator
    input = create_sideset2
    transform = SCALE
    vector_value = '3e-3 3e-3 3e-3'
  []

[]


[UserObjects]
  [reader_element]
    type = PropertyReadFile
    prop_file_name = 'poly_100.csv'
    read_type = 'voronoi'
    use_random_voronoi = false
    nvoronoi = 20 
    nprop = 3
  []
[]
[AuxVariables]
  [fp_yy]
    order = CONSTANT
    family = MONOMIAL
  []
  [stress_vm]
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
  [total_twin_volume_fraction]
    order = CONSTANT
    family = MONOMIAL
  []
  [sliprate]
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
  [slip_increment_0]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_1]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_2]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_3]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_4]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_5]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_6]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_7]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_8]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_9]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_10]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_11]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_12]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_13]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_14]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_15]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_16]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_17]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_18]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_19]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_20]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_21]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_22]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_23]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_24]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_25]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_26]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_27]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_28]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_29]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_30]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_31]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_32]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_33]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_34]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_35]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_36]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_37]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_38]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_39]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_40]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_41]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_42]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_43]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_44]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_45]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_46]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_increment_47]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_0]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_1]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_2]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_3]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_4]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_5]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_6]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_7]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_8]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_9]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_10]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_11]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_12]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_13]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_14]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_15]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_16]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_17]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_18]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_19]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_20]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_21]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_22]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_23]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_24]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_25]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_26]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_27]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_28]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_29]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_30]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_31]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_32]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_33]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_34]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_35]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_36]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_37]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_38]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_39]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_40]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_41]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_42]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_43]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_44]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_45]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_46]
    order = CONSTANT
    family = MONOMIAL
  []
  [slip_resistance_47]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_0]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_1]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_2]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_3]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_4]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_5]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_6]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_7]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_8]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_9]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_10]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_11]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_12]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_13]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_14]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_15]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_16]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_17]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_18]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_19]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_20]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_21]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_22]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_23]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_24]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_25]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_26]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_27]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_28]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_29]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_30]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_31]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_32]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_33]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_34]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_35]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_36]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_37]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_38]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_39]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_40]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_41]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_42]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_43]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_44]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_45]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_46]
    order = CONSTANT
    family = MONOMIAL
  []
  [gd_47]
    order = CONSTANT
    family = MONOMIAL
  []
  [disloc_density]
    order = CONSTANT
    family = MONOMIAL
  []
[]

[Physics/SolidMechanics/QuasiStatic/all]
  strain = FINITE
  add_variables = true
[]

[AuxKernels]
[stress_vm]
type = RankTwoScalarAux
rank_two_tensor = stress
variable = stress_vm
scalar_type = VonMisesStress
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
  [slip_increment_0]
   type = MaterialStdVectorAux
   variable = slip_increment_0
   property = slip_increment
   index = 0
   execute_on = timestep_end
  []
  [slip_increment_1]
   type = MaterialStdVectorAux
   variable = slip_increment_1
   property = slip_increment
   index = 1
   execute_on = timestep_end
  []
  [slip_increment_2]
   type = MaterialStdVectorAux
   variable = slip_increment_2
   property = slip_increment
   index = 2
   execute_on = timestep_end
  []
  [slip_increment_3]
   type = MaterialStdVectorAux
   variable = slip_increment_3
   property = slip_increment
   index = 3
   execute_on = timestep_end
  []
  [slip_increment_4]
   type = MaterialStdVectorAux
   variable = slip_increment_4
   property = slip_increment
   index = 4
   execute_on = timestep_end
  []
  [slip_increment_5]
   type = MaterialStdVectorAux
   variable = slip_increment_5
   property = slip_increment
   index = 5
   execute_on = timestep_end
  []
  [slip_increment_6]
   type = MaterialStdVectorAux
   variable = slip_increment_6
   property = slip_increment
   index = 6
   execute_on = timestep_end
  []
  [slip_increment_7]
   type = MaterialStdVectorAux
   variable = slip_increment_7
   property = slip_increment
   index = 7
   execute_on = timestep_end
  []
  [slip_increment_8]
   type = MaterialStdVectorAux
   variable = slip_increment_8
   property = slip_increment
   index = 8
   execute_on = timestep_end
  []
  [slip_increment_9]
   type = MaterialStdVectorAux
   variable = slip_increment_9
   property = slip_increment
   index = 9
   execute_on = timestep_end
  []
  [slip_increment_10]
   type = MaterialStdVectorAux
   variable = slip_increment_10
   property = slip_increment
   index = 10
   execute_on = timestep_end
  []
  [slip_increment_11]
   type = MaterialStdVectorAux
   variable = slip_increment_11
   property = slip_increment
   index = 11
   execute_on = timestep_end
  []
  [slip_increment_12]
   type = MaterialStdVectorAux
   variable = slip_increment_12
   property = slip_increment
   index = 12
   execute_on = timestep_end
  []
  [slip_increment_13]
   type = MaterialStdVectorAux
   variable = slip_increment_13
   property = slip_increment
   index = 13
   execute_on = timestep_end
  []
  [slip_increment_14]
   type = MaterialStdVectorAux
   variable = slip_increment_14
   property = slip_increment
   index = 14
   execute_on = timestep_end
  []
  [slip_increment_15]
   type = MaterialStdVectorAux
   variable = slip_increment_15
   property = slip_increment
   index = 15
   execute_on = timestep_end
  []
  [slip_increment_16]
   type = MaterialStdVectorAux
   variable = slip_increment_16
   property = slip_increment
   index = 16
   execute_on = timestep_end
  []
  [slip_increment_17]
   type = MaterialStdVectorAux
   variable = slip_increment_17
   property = slip_increment
   index = 17
   execute_on = timestep_end
  []
  [slip_increment_18]
   type = MaterialStdVectorAux
   variable = slip_increment_18
   property = slip_increment
   index = 18
   execute_on = timestep_end
  []
  [slip_increment_19]
   type = MaterialStdVectorAux
   variable = slip_increment_19
   property = slip_increment
   index = 19
   execute_on = timestep_end
  []
  [slip_increment_20]
   type = MaterialStdVectorAux
   variable = slip_increment_20
   property = slip_increment
   index = 20
   execute_on = timestep_end
  []
  [slip_increment_21]
   type = MaterialStdVectorAux
   variable = slip_increment_21
   property = slip_increment
   index = 21
   execute_on = timestep_end
  []
  [slip_increment_22]
   type = MaterialStdVectorAux
   variable = slip_increment_22
   property = slip_increment
   index = 22
   execute_on = timestep_end
  []
  [slip_increment_23]
   type = MaterialStdVectorAux
   variable = slip_increment_23
   property = slip_increment
   index = 23
   execute_on = timestep_end
  []
  [slip_increment_24]
   type = MaterialStdVectorAux
   variable = slip_increment_24
   property = slip_increment
   index = 24
   execute_on = timestep_end
  []
  [slip_increment_25]
   type = MaterialStdVectorAux
   variable = slip_increment_25
   property = slip_increment
   index = 25
   execute_on = timestep_end
  []
  [slip_increment_26]
   type = MaterialStdVectorAux
   variable = slip_increment_26
   property = slip_increment
   index = 26
   execute_on = timestep_end
  []
  [slip_increment_27]
   type = MaterialStdVectorAux
   variable = slip_increment_27
   property = slip_increment
   index = 27
   execute_on = timestep_end
  []
  [slip_increment_28]
   type = MaterialStdVectorAux
   variable = slip_increment_28
   property = slip_increment
   index = 28
   execute_on = timestep_end
  []
  [slip_increment_29]
   type = MaterialStdVectorAux
   variable = slip_increment_29
   property = slip_increment
   index = 29
   execute_on = timestep_end
  []
  [slip_increment_30]
   type = MaterialStdVectorAux
   variable = slip_increment_30
   property = slip_increment
   index = 30
   execute_on = timestep_end
  []
  [slip_increment_31]
   type = MaterialStdVectorAux
   variable = slip_increment_31
   property = slip_increment
   index = 31
   execute_on = timestep_end
  []
  [slip_increment_32]
   type = MaterialStdVectorAux
   variable = slip_increment_32
   property = slip_increment
   index = 32
   execute_on = timestep_end
  []
  [slip_increment_33]
   type = MaterialStdVectorAux
   variable = slip_increment_33
   property = slip_increment
   index = 33
   execute_on = timestep_end
  []
  [slip_increment_34]
   type = MaterialStdVectorAux
   variable = slip_increment_34
   property = slip_increment
   index = 34
   execute_on = timestep_end
  []
  [slip_increment_35]
   type = MaterialStdVectorAux
   variable = slip_increment_35
   property = slip_increment
   index = 35
   execute_on = timestep_end
  []
  [slip_increment_36]
   type = MaterialStdVectorAux
   variable = slip_increment_36
   property = slip_increment
   index = 36
   execute_on = timestep_end
  []
  [slip_increment_37]
   type = MaterialStdVectorAux
   variable = slip_increment_37
   property = slip_increment
   index = 37
   execute_on = timestep_end
  []
  [slip_increment_38]
   type = MaterialStdVectorAux
   variable = slip_increment_38
   property = slip_increment
   index = 38
   execute_on = timestep_end
  []
  [slip_increment_39]
   type = MaterialStdVectorAux
   variable = slip_increment_39
   property = slip_increment
   index = 39
   execute_on = timestep_end
  []
  [slip_increment_40]
   type = MaterialStdVectorAux
   variable = slip_increment_40
   property = slip_increment
   index = 40
   execute_on = timestep_end
  []
  [slip_increment_41]
   type = MaterialStdVectorAux
   variable = slip_increment_41
   property = slip_increment
   index = 41
   execute_on = timestep_end
  []
  [slip_increment_42]
   type = MaterialStdVectorAux
   variable = slip_increment_42
   property = slip_increment
   index = 42
   execute_on = timestep_end
  []
  [slip_increment_43]
   type = MaterialStdVectorAux
   variable = slip_increment_43
   property = slip_increment
   index = 43
   execute_on = timestep_end
  []
  [slip_increment_44]
   type = MaterialStdVectorAux
   variable = slip_increment_44
   property = slip_increment
   index = 44
   execute_on = timestep_end
  []
  [slip_increment_45]
   type = MaterialStdVectorAux
   variable = slip_increment_45
   property = slip_increment
   index = 45
   execute_on = timestep_end
  []
  [slip_increment_46]
   type = MaterialStdVectorAux
   variable = slip_increment_46
   property = slip_increment
   index = 46
   execute_on = timestep_end
  []
  [slip_increment_47]
   type = MaterialStdVectorAux
   variable = slip_increment_47
   property = slip_increment
   index = 47
   execute_on = timestep_end
  []
  [slip_resistance_0]
   type = MaterialStdVectorAux
   variable = slip_resistance_0
   property = slip_resistance
   index = 0
   execute_on = timestep_end
  []
  [slip_resistance_1]
   type = MaterialStdVectorAux
   variable = slip_resistance_1
   property = slip_resistance
   index = 1
   execute_on = timestep_end
  []
  [slip_resistance_2]
   type = MaterialStdVectorAux
   variable = slip_resistance_2
   property = slip_resistance
   index = 2
   execute_on = timestep_end
  []
  [slip_resistance_3]
   type = MaterialStdVectorAux
   variable = slip_resistance_3
   property = slip_resistance
   index = 3
   execute_on = timestep_end
  []
  [slip_resistance_4]
   type = MaterialStdVectorAux
   variable = slip_resistance_4
   property = slip_resistance
   index = 4
   execute_on = timestep_end
  []
  [slip_resistance_5]
   type = MaterialStdVectorAux
   variable = slip_resistance_5
   property = slip_resistance
   index = 5
   execute_on = timestep_end
  []
  [slip_resistance_6]
   type = MaterialStdVectorAux
   variable = slip_resistance_6
   property = slip_resistance
   index = 6
   execute_on = timestep_end
  []
  [slip_resistance_7]
   type = MaterialStdVectorAux
   variable = slip_resistance_7
   property = slip_resistance
   index = 7
   execute_on = timestep_end
  []
  [slip_resistance_8]
   type = MaterialStdVectorAux
   variable = slip_resistance_8
   property = slip_resistance
   index = 8
   execute_on = timestep_end
  []
  [slip_resistance_9]
   type = MaterialStdVectorAux
   variable = slip_resistance_9
   property = slip_resistance
   index = 9
   execute_on = timestep_end
  []
  [slip_resistance_10]
   type = MaterialStdVectorAux
   variable = slip_resistance_10
   property = slip_resistance
   index = 10
   execute_on = timestep_end
  []
  [slip_resistance_11]
   type = MaterialStdVectorAux
   variable = slip_resistance_11
   property = slip_resistance
   index = 11
   execute_on = timestep_end
  []
  [slip_resistance_12]
   type = MaterialStdVectorAux
   variable = slip_resistance_12
   property = slip_resistance
   index = 12
   execute_on = timestep_end
  []
  [slip_resistance_13]
   type = MaterialStdVectorAux
   variable = slip_resistance_13
   property = slip_resistance
   index = 13
   execute_on = timestep_end
  []
  [slip_resistance_14]
   type = MaterialStdVectorAux
   variable = slip_resistance_14
   property = slip_resistance
   index = 14
   execute_on = timestep_end
  []
  [slip_resistance_15]
   type = MaterialStdVectorAux
   variable = slip_resistance_15
   property = slip_resistance
   index = 15
   execute_on = timestep_end
  []
  [slip_resistance_16]
   type = MaterialStdVectorAux
   variable = slip_resistance_16
   property = slip_resistance
   index = 16
   execute_on = timestep_end
  []
  [slip_resistance_17]
   type = MaterialStdVectorAux
   variable = slip_resistance_17
   property = slip_resistance
   index = 17
   execute_on = timestep_end
  []
  [slip_resistance_18]
   type = MaterialStdVectorAux
   variable = slip_resistance_18
   property = slip_resistance
   index = 18
   execute_on = timestep_end
  []
  [slip_resistance_19]
   type = MaterialStdVectorAux
   variable = slip_resistance_19
   property = slip_resistance
   index = 19
   execute_on = timestep_end
  []
  [slip_resistance_20]
   type = MaterialStdVectorAux
   variable = slip_resistance_20
   property = slip_resistance
   index = 20
   execute_on = timestep_end
  []
  [slip_resistance_21]
   type = MaterialStdVectorAux
   variable = slip_resistance_21
   property = slip_resistance
   index = 21
   execute_on = timestep_end
  []
  [slip_resistance_22]
   type = MaterialStdVectorAux
   variable = slip_resistance_22
   property = slip_resistance
   index = 22
   execute_on = timestep_end
  []
  [slip_resistance_23]
   type = MaterialStdVectorAux
   variable = slip_resistance_23
   property = slip_resistance
   index = 23
   execute_on = timestep_end
  []
  [slip_resistance_24]
  type = MaterialStdVectorAux
  variable = slip_resistance_24
  property = slip_resistance
  index = 24
  execute_on = timestep_end
 []
 [slip_resistance_25]
  type = MaterialStdVectorAux
  variable = slip_resistance_25
  property = slip_resistance
  index = 25
  execute_on = timestep_end
 []
 [slip_resistance_26]
  type = MaterialStdVectorAux
  variable = slip_resistance_26
  property = slip_resistance
  index = 26
  execute_on = timestep_end
 []
 [slip_resistance_27]
  type = MaterialStdVectorAux
  variable = slip_resistance_27
  property = slip_resistance
  index = 27
  execute_on = timestep_end
 []
 [slip_resistance_28]
  type = MaterialStdVectorAux
  variable = slip_resistance_28
  property = slip_resistance
  index = 28
  execute_on = timestep_end
 []
 [slip_resistance_29]
  type = MaterialStdVectorAux
  variable = slip_resistance_29
  property = slip_resistance
  index = 29
  execute_on = timestep_end
 []
 [slip_resistance_30]
  type = MaterialStdVectorAux
  variable = slip_resistance_30
  property = slip_resistance
  index = 30
  execute_on = timestep_end
 []
 [slip_resistance_31]
  type = MaterialStdVectorAux
  variable = slip_resistance_31
  property = slip_resistance
  index = 31
  execute_on = timestep_end
 []
 [slip_resistance_32]
  type = MaterialStdVectorAux
  variable = slip_resistance_32
  property = slip_resistance
  index = 32
  execute_on = timestep_end
 []
 [slip_resistance_33]
  type = MaterialStdVectorAux
  variable = slip_resistance_33
  property = slip_resistance
  index = 33
  execute_on = timestep_end
 []
 [slip_resistance_34]
  type = MaterialStdVectorAux
  variable = slip_resistance_34
  property = slip_resistance
  index = 34
  execute_on = timestep_end
 []
 [slip_resistance_35]
  type = MaterialStdVectorAux
  variable = slip_resistance_35
  property = slip_resistance
  index = 35
  execute_on = timestep_end
 []
 [slip_resistance_36]
  type = MaterialStdVectorAux
  variable = slip_resistance_36
  property = slip_resistance
  index = 36
  execute_on = timestep_end
 []
 [slip_resistance_37]
  type = MaterialStdVectorAux
  variable = slip_resistance_37
  property = slip_resistance
  index = 37
  execute_on = timestep_end
 []
 [slip_resistance_38]
  type = MaterialStdVectorAux
  variable = slip_resistance_38
  property = slip_resistance
  index = 38
  execute_on = timestep_end
 []
 [slip_resistance_39]
  type = MaterialStdVectorAux
  variable = slip_resistance_39
  property = slip_resistance
  index = 39
  execute_on = timestep_end
 []
 [slip_resistance_40]
  type = MaterialStdVectorAux
  variable = slip_resistance_40
  property = slip_resistance
  index = 40
  execute_on = timestep_end
 []
 [slip_resistance_41]
  type = MaterialStdVectorAux
  variable = slip_resistance_41
  property = slip_resistance
  index = 41
  execute_on = timestep_end
 []
 [slip_resistance_42]
  type = MaterialStdVectorAux
  variable = slip_resistance_42
  property = slip_resistance
  index = 42
  execute_on = timestep_end
 []
 [slip_resistance_43]
  type = MaterialStdVectorAux
  variable = slip_resistance_43
  property = slip_resistance
  index = 43
  execute_on = timestep_end
 []
 [slip_resistance_44]
  type = MaterialStdVectorAux
  variable = slip_resistance_44
  property = slip_resistance
  index = 44
  execute_on = timestep_end
 []
 [slip_resistance_45]
  type = MaterialStdVectorAux
  variable = slip_resistance_45
  property = slip_resistance
  index = 45
  execute_on = timestep_end
 []
 [slip_resistance_46]
  type = MaterialStdVectorAux
  variable = slip_resistance_46
  property = slip_resistance
  index = 46
  execute_on = timestep_end
 []
 [slip_resistance_47]
  type = MaterialStdVectorAux
  variable = slip_resistance_47
  property = slip_resistance
  index = 47
  execute_on = timestep_end
 []
 [gd_0]
  type = MaterialStdVectorAux
  variable = gd_0
  property = gd
  index = 0
  execute_on = timestep_end
[]

[gd_1]
  type = MaterialStdVectorAux
  variable = gd_1
  property = gd
  index = 1
  execute_on = timestep_end
[]

[gd_2]
  type = MaterialStdVectorAux
  variable = gd_2
  property = gd
  index = 2
  execute_on = timestep_end
[]

[gd_3]
  type = MaterialStdVectorAux
  variable = gd_3
  property = gd
  index = 3
  execute_on = timestep_end
[]

[gd_4]
  type = MaterialStdVectorAux
  variable = gd_4
  property = gd
  index = 4
  execute_on = timestep_end
[]

[gd_5]
  type = MaterialStdVectorAux
  variable = gd_5
  property = gd
  index = 5
  execute_on = timestep_end
[]

[gd_6]
  type = MaterialStdVectorAux
  variable = gd_6
  property = gd
  index = 6
  execute_on = timestep_end
[]

[gd_7]
  type = MaterialStdVectorAux
  variable = gd_7
  property = gd
  index = 7
  execute_on = timestep_end
[]

[gd_8]
  type = MaterialStdVectorAux
  variable = gd_8
  property = gd
  index = 8
  execute_on = timestep_end
[]

[gd_9]
  type = MaterialStdVectorAux
  variable = gd_9
  property = gd
  index = 9
  execute_on = timestep_end
[]

[gd_10]
  type = MaterialStdVectorAux
  variable = gd_10
  property = gd
  index = 10
  execute_on = timestep_end
[]

[gd_11]
  type = MaterialStdVectorAux
  variable = gd_11
  property = gd
  index = 11
  execute_on = timestep_end
[]

[gd_12]
  type = MaterialStdVectorAux
  variable = gd_12
  property = gd
  index = 12
  execute_on = timestep_end
[]

[gd_13]
  type = MaterialStdVectorAux
  variable = gd_13
  property = gd
  index = 13
  execute_on = timestep_end
[]

[gd_14]
  type = MaterialStdVectorAux
  variable = gd_14
  property = gd
  index = 14
  execute_on = timestep_end
[]

[gd_15]
  type = MaterialStdVectorAux
  variable = gd_15
  property = gd
  index = 15
  execute_on = timestep_end
[]

[gd_16]
  type = MaterialStdVectorAux
  variable = gd_16
  property = gd
  index = 16
  execute_on = timestep_end
[]

[gd_17]
  type = MaterialStdVectorAux
  variable = gd_17
  property = gd
  index = 17
  execute_on = timestep_end
[]

[gd_18]
  type = MaterialStdVectorAux
  variable = gd_18
  property = gd
  index = 18
  execute_on = timestep_end
[]

[gd_19]
  type = MaterialStdVectorAux
  variable = gd_19
  property = gd
  index = 19
  execute_on = timestep_end
[]

[gd_20]
  type = MaterialStdVectorAux
  variable = gd_20
  property = gd
  index = 20
  execute_on = timestep_end
[]

[gd_21]
  type = MaterialStdVectorAux
  variable = gd_21
  property = gd
  index = 21
  execute_on = timestep_end
[]

[gd_22]
  type = MaterialStdVectorAux
  variable = gd_22
  property = gd
  index = 22
  execute_on = timestep_end
[]

[gd_23]
  type = MaterialStdVectorAux
  variable = gd_23
  property = gd
  index = 23
  execute_on = timestep_end
[]

[gd_24]
  type = MaterialStdVectorAux
  variable = gd_24
  property = gd
  index = 24
  execute_on = timestep_end
[]

[gd_25]
  type = MaterialStdVectorAux
  variable = gd_25
  property = gd
  index = 25
  execute_on = timestep_end
[]

[gd_26]
  type = MaterialStdVectorAux
  variable = gd_26
  property = gd
  index = 26
  execute_on = timestep_end
[]

[gd_27]
  type = MaterialStdVectorAux
  variable = gd_27
  property = gd
  index = 27
  execute_on = timestep_end
[]

[gd_28]
  type = MaterialStdVectorAux
  variable = gd_28
  property = gd
  index = 28
  execute_on = timestep_end
[]

[gd_29]
  type = MaterialStdVectorAux
  variable = gd_29
  property = gd
  index = 29
  execute_on = timestep_end
[]

[gd_30]
  type = MaterialStdVectorAux
  variable = gd_30
  property = gd
  index = 30
  execute_on = timestep_end
[]

[gd_31]
  type = MaterialStdVectorAux
  variable = gd_31
  property = gd
  index = 31
  execute_on = timestep_end
[]

[gd_32]
  type = MaterialStdVectorAux
  variable = gd_32
  property = gd
  index = 32
  execute_on = timestep_end
[]

[gd_33]
  type = MaterialStdVectorAux
  variable = gd_33
  property = gd
  index = 33
  execute_on = timestep_end
[]

[gd_34]
  type = MaterialStdVectorAux
  variable = gd_34
  property = gd
  index = 34
  execute_on = timestep_end
[]

[gd_35]
  type = MaterialStdVectorAux
  variable = gd_35
  property = gd
  index = 35
  execute_on = timestep_end
[]

[gd_36]
  type = MaterialStdVectorAux
  variable = gd_36
  property = gd
  index = 36
  execute_on = timestep_end
[]

[gd_37]
  type = MaterialStdVectorAux
  variable = gd_37
  property = gd
  index = 37
  execute_on = timestep_end
[]

[gd_38]
  type = MaterialStdVectorAux
  variable = gd_38
  property = gd
  index = 38
  execute_on = timestep_end
[]

[gd_39]
  type = MaterialStdVectorAux
  variable = gd_39
  property = gd
  index = 39
  execute_on = timestep_end
[]

[gd_40]
  type = MaterialStdVectorAux
  variable = gd_40
  property = gd
  index = 40
  execute_on = timestep_end
[]

[gd_41]
  type = MaterialStdVectorAux
  variable = gd_41
  property = gd
  index = 41
  execute_on = timestep_end
[]

[gd_42]
  type = MaterialStdVectorAux
  variable = gd_42
  property = gd
  index = 42
  execute_on = timestep_end
[]

[gd_43]
  type = MaterialStdVectorAux
  variable = gd_43
  property = gd
  index = 43
  execute_on = timestep_end
[]

[gd_44]
  type = MaterialStdVectorAux
  variable = gd_44
  property = gd
  index = 44
  execute_on = timestep_end
[]

[gd_45]
  type = MaterialStdVectorAux
  variable = gd_45
  property = gd
  index = 45
  execute_on = timestep_end
[]

[gd_46]
  type = MaterialStdVectorAux
  variable = gd_46
  property = gd
  index = 46
  execute_on = timestep_end
[]

[gd_47]
  type = MaterialStdVectorAux
  variable = gd_47
  property = gd
  index = 47
  execute_on = timestep_end
[]
 [disloc_density]
 type = MaterialRealAux
 variable = disloc_density
 property = disloc_density
 execute_on = timestep_end
[]
[sliprate]
type = MaterialRealAux
variable = sliprate
property = sliprate
execute_on = timestep_end
[]
[]

[BCs]
  [tdisp]
    type = FunctionDirichletBC
    variable = disp_y
    boundary = 'top'
    function = '(3e-1)*t'
  []
  [fix_y]
    type = DirichletBC
    variable = disp_y
    preset = true
    boundary = 'bottom'
    value = 0
  []
  
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
    crystal_plasticity_models = 'slip_xtalpl'
    tan_mod_type = exact
  []
  [slip_xtalpl]
    type = CrystalPlasticityUpdate
    loop_num = 440
    amp = 1000.0
    number_slip_systems = 48
    slip_sys_file_name = input_slip_sys_bcc48.txt
    plane_file_name = bcc_plane.csv
    read_prop_user_object = reader_element
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
  [total_twin_volume_fraction]
    type = ElementAverageValue
    variable = total_twin_volume_fraction
  []
  [slip_increment_0]
    type = ElementAverageValue
    variable = slip_increment_0
  []
  [slip_increment_1]
    type = ElementAverageValue
    variable = slip_increment_1
  []
  [slip_increment_2]
    type = ElementAverageValue
    variable = slip_increment_2
  []
  [slip_increment_3]
    type = ElementAverageValue
    variable = slip_increment_3
  []
  [slip_increment_4]
    type = ElementAverageValue
    variable = slip_increment_4
  []
  [slip_increment_5]
    type = ElementAverageValue
    variable = slip_increment_5
  []
  [slip_increment_6]
    type = ElementAverageValue
    variable = slip_increment_6
  []
  [slip_increment_7]
    type = ElementAverageValue
    variable = slip_increment_7
  []
  [slip_increment_8]
    type = ElementAverageValue
    variable = slip_increment_8
  []
  [slip_increment_9]
    type = ElementAverageValue
    variable = slip_increment_9
  []
  [slip_increment_10]
    type = ElementAverageValue
    variable = slip_increment_10
  []
  [slip_increment_11]
    type = ElementAverageValue
    variable = slip_increment_11
  []
  [slip_increment_12]
    type = ElementAverageValue
    variable = slip_increment_12
  []
  [slip_increment_13]
    type = ElementAverageValue
    variable = slip_increment_13
  []
  [slip_increment_14]
    type = ElementAverageValue
    variable = slip_increment_14
  []
  [slip_increment_15]
    type = ElementAverageValue
    variable = slip_increment_15
  []
  [slip_increment_16]
    type = ElementAverageValue
    variable = slip_increment_16
  []
  [slip_increment_17]
    type = ElementAverageValue
    variable = slip_increment_17
  []
  [slip_increment_18]
    type = ElementAverageValue
    variable = slip_increment_18
  []
  [slip_increment_19]
    type = ElementAverageValue
    variable = slip_increment_19
  []
  [slip_increment_20]
    type = ElementAverageValue
    variable = slip_increment_20
  []
  [slip_increment_21]
    type = ElementAverageValue
    variable = slip_increment_21
  []
  [slip_increment_22]
    type = ElementAverageValue
    variable = slip_increment_22
  []
  [slip_increment_23]
    type = ElementAverageValue
    variable = slip_increment_23
  []
  [slip_increment_24]
    type = ElementAverageValue
    variable = slip_increment_24
  []
  [slip_increment_25]
    type = ElementAverageValue
    variable = slip_increment_25
  []
  [slip_increment_26]
    type = ElementAverageValue
    variable = slip_increment_26
  []
  [slip_increment_27]
    type = ElementAverageValue
    variable = slip_increment_27
  []
  [slip_increment_28]
    type = ElementAverageValue
    variable = slip_increment_28
  []
  [slip_increment_29]
    type = ElementAverageValue
    variable = slip_increment_29
  []
  [slip_increment_30]
    type = ElementAverageValue
    variable = slip_increment_30
  []
  [slip_increment_31]
    type = ElementAverageValue
    variable = slip_increment_31
  []
  [slip_increment_32]
    type = ElementAverageValue
    variable = slip_increment_32
  []
  [slip_increment_33]
    type = ElementAverageValue
    variable = slip_increment_33
  []
  [slip_increment_34]
    type = ElementAverageValue
    variable = slip_increment_34
  []
  [slip_increment_35]
    type = ElementAverageValue
    variable = slip_increment_35
  []
  [slip_increment_36]
    type = ElementAverageValue
    variable = slip_increment_36
  []
  [slip_increment_37]
    type = ElementAverageValue
    variable = slip_increment_37
  []
  [slip_increment_38]
    type = ElementAverageValue
    variable = slip_increment_38
  []
  [slip_increment_39]
    type = ElementAverageValue
    variable = slip_increment_39
  []
  [slip_increment_40]
    type = ElementAverageValue
    variable = slip_increment_40
  []
  [slip_increment_41]
    type = ElementAverageValue
    variable = slip_increment_41
  []
  [slip_increment_42]
    type = ElementAverageValue
    variable = slip_increment_42
  []
  [slip_increment_43]
    type = ElementAverageValue
    variable = slip_increment_43
  []
  [slip_increment_44]
    type = ElementAverageValue
    variable = slip_increment_44
  []
  [slip_increment_45]
    type = ElementAverageValue
    variable = slip_increment_45
  []
  [slip_increment_46]
    type = ElementAverageValue
    variable = slip_increment_46
  []
  [slip_increment_47]
    type = ElementAverageValue
    variable = slip_increment_47
  []
  [slip_resistance_0]
    type = ElementAverageValue
    variable = slip_resistance_0
  []
  [slip_resistance_1]
    type = ElementAverageValue
    variable = slip_resistance_1
  []
  [slip_resistance_2]
    type = ElementAverageValue
    variable = slip_resistance_2
  []
  [slip_resistance_3]
    type = ElementAverageValue
    variable = slip_resistance_3
  []
  [slip_resistance_4]
    type = ElementAverageValue
    variable = slip_resistance_4
  []
  [slip_resistance_5]
    type = ElementAverageValue
    variable = slip_resistance_5
  []
  [slip_resistance_6]
    type = ElementAverageValue
    variable = slip_resistance_6
  []
  [slip_resistance_7]
    type = ElementAverageValue
    variable = slip_resistance_7
  []
  [slip_resistance_8]
    type = ElementAverageValue
    variable = slip_resistance_8
  []
  [slip_resistance_9]
    type = ElementAverageValue
    variable = slip_resistance_9
  []
  [slip_resistance_10]
    type = ElementAverageValue
    variable = slip_resistance_10
  []
  [slip_resistance_11]
    type = ElementAverageValue
    variable = slip_resistance_11
  []
  [slip_resistance_12]
    type = ElementAverageValue
    variable = slip_resistance_12
  []
  [slip_resistance_13]
    type = ElementAverageValue
    variable = slip_resistance_13
  []
  [slip_resistance_14]
    type = ElementAverageValue
    variable = slip_resistance_14
  []
  [slip_resistance_15]
    type = ElementAverageValue
    variable = slip_resistance_15
  []
  [slip_resistance_16]
    type = ElementAverageValue
    variable = slip_resistance_16
  []
  [slip_resistance_17]
    type = ElementAverageValue
    variable = slip_resistance_17
  []
  [slip_resistance_18]
    type = ElementAverageValue
    variable = slip_resistance_18
  []
  [slip_resistance_19]
    type = ElementAverageValue
    variable = slip_resistance_19
  []
  [slip_resistance_20]
    type = ElementAverageValue
    variable = slip_resistance_20
  []
  [slip_resistance_21]
    type = ElementAverageValue
    variable = slip_resistance_21
  []
  [slip_resistance_22]
    type = ElementAverageValue
    variable = slip_resistance_22
  []
  [slip_resistance_23]
    type = ElementAverageValue
    variable = slip_resistance_23
  []
  [slip_resistance_24]
    type = ElementAverageValue
    variable = slip_resistance_24
  []
  [slip_resistance_25]
    type = ElementAverageValue
    variable = slip_resistance_25
  []
  [slip_resistance_26]
    type = ElementAverageValue
    variable = slip_resistance_26
  []
  [slip_resistance_27]
    type = ElementAverageValue
    variable = slip_resistance_27
  []
  [slip_resistance_28]
    type = ElementAverageValue
    variable = slip_resistance_28
  []
  [slip_resistance_29]
    type = ElementAverageValue
    variable = slip_resistance_29
  []
  [slip_resistance_30]
    type = ElementAverageValue
    variable = slip_resistance_30
  []
  [slip_resistance_31]
    type = ElementAverageValue
    variable = slip_resistance_31
  []
  [slip_resistance_32]
    type = ElementAverageValue
    variable = slip_resistance_32
  []
  [slip_resistance_33]
    type = ElementAverageValue
    variable = slip_resistance_33
  []
  [slip_resistance_34]
    type = ElementAverageValue
    variable = slip_resistance_34
  []
  [slip_resistance_35]
    type = ElementAverageValue
    variable = slip_resistance_35
  []
  [slip_resistance_36]
    type = ElementAverageValue
    variable = slip_resistance_36
  []
  [slip_resistance_37]
    type = ElementAverageValue
    variable = slip_resistance_37
  []
  [slip_resistance_38]
    type = ElementAverageValue
    variable = slip_resistance_38
  []
  [slip_resistance_39]
    type = ElementAverageValue
    variable = slip_resistance_39
  []
  [slip_resistance_40]
    type = ElementAverageValue
    variable = slip_resistance_40
  []
  [slip_resistance_41]
    type = ElementAverageValue
    variable = slip_resistance_41
  []
  [slip_resistance_42]
    type = ElementAverageValue
    variable = slip_resistance_42
  []
  [slip_resistance_43]
    type = ElementAverageValue
    variable = slip_resistance_43
  []
  [slip_resistance_44]
    type = ElementAverageValue
    variable = slip_resistance_44
  []
  [slip_resistance_45]
    type = ElementAverageValue
    variable = slip_resistance_45
  []
  [slip_resistance_46]
    type = ElementAverageValue
    variable = slip_resistance_46
  []
  [slip_resistance_47]
    type = ElementAverageValue
    variable = slip_resistance_47
  []
  [gd_0]
  type = ElementAverageValue
  variable = gd_0
[]

[gd_1]
  type = ElementAverageValue
  variable = gd_1
[]

[gd_2]
  type = ElementAverageValue
  variable = gd_2
[]

[gd_3]
  type = ElementAverageValue
  variable = gd_3
[]

[gd_4]
  type = ElementAverageValue
  variable = gd_4
[]

[gd_5]
  type = ElementAverageValue
  variable = gd_5
[]

[gd_6]
  type = ElementAverageValue
  variable = gd_6
[]

[gd_7]
  type = ElementAverageValue
  variable = gd_7
[]

[gd_8]
  type = ElementAverageValue
  variable = gd_8
[]

[gd_9]
  type = ElementAverageValue
  variable = gd_9
[]

[gd_10]
  type = ElementAverageValue
  variable = gd_10
[]

[gd_11]
  type = ElementAverageValue
  variable = gd_11
[]

[gd_12]
  type = ElementAverageValue
  variable = gd_12
[]

[gd_13]
  type = ElementAverageValue
  variable = gd_13
[]

[gd_14]
  type = ElementAverageValue
  variable = gd_14
[]

[gd_15]
  type = ElementAverageValue
  variable = gd_15
[]

[gd_16]
  type = ElementAverageValue
  variable = gd_16
[]

[gd_17]
  type = ElementAverageValue
  variable = gd_17
[]

[gd_18]
  type = ElementAverageValue
  variable = gd_18
[]

[gd_19]
  type = ElementAverageValue
  variable = gd_19
[]

[gd_20]
  type = ElementAverageValue
  variable = gd_20
[]

[gd_21]
  type = ElementAverageValue
  variable = gd_21
[]

[gd_22]
  type = ElementAverageValue
  variable = gd_22
[]

[gd_23]
  type = ElementAverageValue
  variable = gd_23
[]

[gd_24]
  type = ElementAverageValue
  variable = gd_24
[]

[gd_25]
  type = ElementAverageValue
  variable = gd_25
[]

[gd_26]
  type = ElementAverageValue
  variable = gd_26
[]

[gd_27]
  type = ElementAverageValue
  variable = gd_27
[]

[gd_28]
  type = ElementAverageValue
  variable = gd_28
[]

[gd_29]
  type = ElementAverageValue
  variable = gd_29
[]

[gd_30]
  type = ElementAverageValue
  variable = gd_30
[]

[gd_31]
  type = ElementAverageValue
  variable = gd_31
[]

[gd_32]
  type = ElementAverageValue
  variable = gd_32
[]

[gd_33]
  type = ElementAverageValue
  variable = gd_33
[]

[gd_34]
  type = ElementAverageValue
  variable = gd_34
[]

[gd_35]
  type = ElementAverageValue
  variable = gd_35
[]

[gd_36]
  type = ElementAverageValue
  variable = gd_36
[]

[gd_37]
  type = ElementAverageValue
  variable = gd_37
[]

[gd_38]
  type = ElementAverageValue
  variable = gd_38
[]

[gd_39]
  type = ElementAverageValue
  variable = gd_39
[]

[gd_40]
  type = ElementAverageValue
  variable = gd_40
[]

[gd_41]
  type = ElementAverageValue
  variable = gd_41
[]

[gd_42]
  type = ElementAverageValue
  variable = gd_42
[]

[gd_43]
  type = ElementAverageValue
  variable = gd_43
[]

[gd_44]
  type = ElementAverageValue
  variable = gd_44
[]

[gd_45]
  type = ElementAverageValue
  variable = gd_45
[]

[gd_46]
  type = ElementAverageValue
  variable = gd_46
[]

[gd_47]
  type = ElementAverageValue
  variable = gd_47
[]

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
  [disloc_density]
    type = ElementExtremeValue
    variable = disloc_density
    value_type = max
  []
  [sliprate]
  type = ElementExtremeValue
    variable = sliprate
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
[]

[Preconditioning]
  [smp]
    type = SMP
    full = true
  []
[]
[Adaptivity]
  marker = marker
  [./Markers]
    [./marker]
      type = ValueThresholdMarker
      coarsen = 100
      variable = sliprate
      refine = 300
    [../]
    [./inverted_marker]
      type = ValueThresholdMarker
      invert = true
      coarsen = 300
      refine = 100
      variable = sliprate
      third_state = DO_NOTHING
    [../]
  [../]
[]

[Executioner]
  type = Transient
  solve_type = 'PJFNK'

  petsc_options_iname = '-pc_type -pc_asm_overlap -sub_pc_type -ksp_type -ksp_gmres_restart'
  petsc_options_value = ' asm      2              lu            gmres     200'
  nl_abs_tol = 1e-10
  nl_rel_tol = 1e-10
  nl_abs_step_tol = 1e-10

  dt = 1e-8
  dtmin = 1e-15
  end_time = 1e-8
  
[]

[Outputs]
  execute_on = 'timestep_end'
  exodus = true     
  perf_graph = true
  [out]
    type = Checkpoint
    time_step_interval = 10
    num_files = 5
    wall_time_interval = 3600 # seconds
  []
[]
