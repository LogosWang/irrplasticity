# irrplasticity

A MOOSE-based crystal plasticity finite element (CPFEM) application for simulating irradiation-induced deformation localization in 304 stainless steel (304 SS).

## Physics Background

Neutron or proton irradiation of austenitic stainless steel produces a high density of Frank and Shockley partial dislocation loops on specific planes. These loops act as obstacles to dislocation glide, causing significant hardening and yield stress elevation. However, once plastic deformation begins, gliding dislocations sweep across slip planes and dissolve ("clear") the loops they encounter. This localized loop clearing causes a local softening, which in turn attracts further deformation into the same channel — the positive feedback mechanism responsible for **irradiation-induced deformation channeling** and localization.

This model captures that mechanism through a second-order tensor descriptor **H**, which represents the collective state of the irradiation damage loop population.

---

## Model Description

The core constitutive model is implemented in `src/materials/CrystalPlasticityFccUpdate.C`, inheriting from MOOSE's `CrystalPlasticityStressUpdateBase`. It uses:

- Multiplicative decomposition of the deformation gradient: **F = Fe · Fp**
- PK2 stress residual solved at the intermediate configuration
- Backward Euler time integration
- Iterative predictor-corrector with optional substepping

### Damage Loop Descriptor Tensor H

**H** is a 3×3 second-order tensor that encodes the orientational distribution of irradiation loop planes still present at a material point. It is initialized at the start of the simulation and evolves as loops are cleared during deformation.

**Initialization** (function `initH`):

Each loop `i` contributes:

```
b_i = (I − n_l ⊗ n_l) · 3 · d_l
```

where `n_l` is a unit normal randomly selected from the FCC {111} plane set (`fcc_plane.csv`), rotated into the lab frame via the crystal orientation matrix. `(I − n ⊗ n)` is the in-plane projector, representing the planar character of the loop. All loops are summed and normalized:

```
H = amp · Σ b_i / (27 nm)
```

Two loop populations are distinguished and tracked separately:
- **H_shock**: Shockley partial loops (mobile, more numerous; `loop_num_shock`)
- **H_frank**: Frank loops (sessile, less numerous; `loop_num_frank`)
- **H = H_shock + H_frank**

**Evolution** (loop clearing by slip, `calculateStateVariableEvolutionRateComponent`):

```
ΔH = −η · Σ_α (P_α : H_shock) · P_α · |Δγ_α|
```

where `P_α = n_α ⊗ n_α` is the dyadic product of the slip plane normal of slip system α. The scalar `(P_α : H_shock)` measures the projection of the remaining loop density onto that slip plane. When slip occurs on system α (`|Δγ_α| > 0`), the Shockley loops on that plane are removed at a rate controlled by `η`.

This is the mathematical representation of dislocation channeling: slip on a given {111} plane clears the loops lying on that same plane.

### Slip Resistance

The slip resistance for system α (`updateStateVariables`) has two contributions:

```
g_α = g₀ + b·μ · [ √(ρ · 0.125) + √(0.1 · max(P_α : H, 0)) ]
```

| Term | Physical meaning |
|------|-----------------|
| `g₀` | Initial lattice friction (Peierls stress) |
| `b·μ·√(ρ·0.125)` | Taylor hardening from forest dislocation density ρ |
| `b·μ·√(0.1·(P_α:H))` | Obstacle hardening from irradiation loops on slip plane α |

As loops are cleared by slip, `P_α : H` decreases → `g_α` decreases → **irradiation softening**. This softening localizes further slip into already-active channels.

The irradiation loop contribution to slip resistance is also output separately as `gd` for analysis.

Material constants: `b = 2.48 × 10⁻⁷ m` (Burgers vector), `μ = 86 GPa` (shear modulus).

### Dislocation Density Evolution

Kocks-Mecking-Estrin (KME) equation:

```
Δρ = |Σ Δγ_α| · (k1·√ρ − k2·ρ)
```

with strain-rate-dependent dynamic recovery:

```
k2 = k20 · γ0 / |Σ Δγ_α|
```

### Slip Rate

Power-law (Kalidindi-type):

```
γ̇_α = a₀ · |τ_α / g_α|^(1/m) · sgn(τ_α)
```

where `a₀` is the reference slip rate and `m` is the rate sensitivity exponent.

### Twinning

Deformation twinning is included via `CrystalPlasticityTwinningUpdate` on the 12 FCC {111}<112> twinning systems. The twin volume fraction enters the plastic velocity gradient calculation and the slip model can optionally include its effect on the effective slip increment.

---

## Input Parameters (CrystalPlasticityFccUpdate)

| Parameter | Description | Typical value |
|-----------|-------------|---------------|
| `gss_initial` | Initial lattice friction strength g₀ (MPa) | 5–90 |
| `ao` | Reference slip rate a₀ | 3×10⁴ |
| `xm` | Slip rate exponent m | 0.05 |
| `eta` | Loop clearing rate η | 50–100 |
| `dl` | Average loop diameter d_l (m) | 6×10⁻⁶ |
| `loop_num_shock` | Number of Shockley loops per grain | 200–2700 |
| `loop_num_frank` | Number of Frank loops per grain | 100–1300 |
| `amp` | Amplitude scaling factor for H | 1000–10000 |
| `k1` | Dislocation multiplication coefficient | 50–900 |
| `k20` | Dynamic recovery coefficient | 5–50 |
| `gamma0` | Reference accumulated slip for k2 | 200–14000 |
| `plane_file_name` | File listing irradiation loop habit planes | `fcc_plane.csv` |
| `slip_sys_file_name` | FCC slip system definitions | `input_slip_sys_fcc.txt` |
| `number_slip_systems` | Number of slip systems | 12 |
| `read_prop_user_object` | Per-element Euler angle reader | (optional) |
| `euler_angle_variables` | Coupled Euler angle variables | (optional) |

---

## Slip and Plane System Files

**`input_slip_sys_fcc.txt`**: 12 FCC {111}<110> slip systems.  
Each row: `n₁ n₂ n₃  d₁ d₂ d₃` (plane normal then slip direction, cubic indices).

**`fcc_plane.csv`**: FCC {111} habit plane normals for irradiation loops.  
Contains the four {111} family members repeated (16 rows), used for random loop plane assignment during H initialization.

**`fcc_input_twinning_systems.txt`**: 12 FCC {111}<112> twinning systems for `CrystalPlasticityTwinningUpdate`.

---

## Elasticity

Anisotropic cubic elasticity for 304 SS (`ComputeElasticityTensorCP`):

```
C₁₁ = 236 GPa,  C₁₂ = 134 GPa,  C₄₄ = 119 GPa
```

Crystal orientation is applied per-grain via a `PropertyReadFile` user object reading Euler angles (Bunge ZXZ convention, degrees) from CSV files.

---

## Input Files

### Calibration (single crystal)

| File | Description |
|------|-------------|
| `fcc025calibrate.i` | Single crystal, no loops (`loop_num_shock=0`, `loop_num_frank=0`), used to calibrate `k1`, `k20`, `gamma0`, `ao`, `xm` against unirradiated 304 SS stress-strain data |
| `fcc011calibrate.i` – `fcc021calibrate.i` | Calibration runs sweeping different parameter combinations |

### Polycrystal with irradiation damage

| File | Description |
|------|-------------|
| `EBSD3d50.i` | 3D polycrystal on EBSD-derived mesh (`EBSD3dfine.e`), 4-grain orientation set (`poly_4.csv`), uniaxial tension to ~10% strain |
| `EBSD3d50cube.i` | Same physics on a structured cube mesh |
| `poly20g04b02fcc*.i` | 20-grain polycrystal, varying loop number density (fcc00–fcc90 series = varying irradiation dose) |
| `poly20fcc*loop13.i` | 20-grain runs varying loop count at different dose levels |
| `poly20sa*.i` | Sensitivity analysis variants |

### Orientation files

| File | Description |
|------|-------------|
| `poly_4.csv` | 4 grain Euler angles (φ₁, Φ, φ₂) in degrees |
| `poly_100.csv` | 100 randomly-oriented grains for polycrystal statistics |
| `euler_angle_file.csv` | Alternative Euler angle set |

---

## Output Variables

All output to Exodus (`.e`) and CSV formats. Key quantities:

| Variable | Description |
|----------|-------------|
| `H_1`, `H_2`, `H_3` | Diagonal components of **H** tensor (loop density state) |
| `Hs_1`, `Hs_2`, `Hs_3` | Diagonal components of **H_shock** (Shockley loop component) |
| `slip_resistance_0`–`11` | Per-system slip resistance g_α |
| `gd_0`–`11` | Irradiation loop contribution to g_α (b·μ·√(0.1·P:H)) |
| `disloc_density` | Forest dislocation density ρ |
| `sliprate` | Accumulated slip rate \|Σ Δγ_α\| |
| `stress_yy`, `strain_yy` | Axial stress and strain (loading direction) |
| `stress_vm` | Von Mises stress |
| `strain_shear` | Max shear strain (localization indicator) |
| `total_twin_volume` | Total twin volume fraction |
| `fp_yy` | Plastic deformation gradient component F^p_{yy} |

---

## Solver Settings

PJFNK with ASM preconditioning + LU subdomain solves:

```
petsc_options: -pc_type asm -sub_pc_type lu -ksp_type gmres
nl_abs_tol = 1e-4,  nl_rel_tol = 1e-4
line_search = bt (backtracking)
dt = 0.005,  end_time = 2.0
```

The stress update uses `ComputeMultipleCrystalPlasticityStress` with CUT_HALF line search and up to 10 substep iterations for robustness.

---

## Prerequisites

- [MOOSE framework](https://mooseframework.inl.gov/) with `tensor_mechanics` module
- C++17-capable compiler
- PETSc, libMesh (provided by MOOSE)

## Build

```bash
cd irrplasticity
make -j$(nproc)
```

## Run

```bash
# Single crystal calibration (no irradiation)
./irrplasticity-opt -i fcc025calibrate.i

# 3D polycrystal with irradiation damage
./irrplasticity-opt -i EBSD3d50.i
```

For parallel runs:
```bash
mpirun -n 8 ./irrplasticity-opt -i EBSD3d50.i
```

---

## Repository Structure

```
irrplasticity/
├── src/materials/
│   ├── CrystalPlasticityFccUpdate.C      # Core constitutive model
│   └── CrystalPlasticityTwinningUpdate.C # Twinning model
├── include/materials/
│   ├── CrystalPlasticityFccUpdate.h
│   └── CrystalPlasticityTwinningUpdate.h
├── input_slip_sys_fcc.txt                # FCC slip systems (12)
├── fcc_input_twinning_systems.txt        # FCC twin systems (12)
├── fcc_plane.csv                         # {111} loop habit planes
├── poly_4.csv                            # 4-grain Euler angles
├── poly_100.csv                          # 100-grain Euler angles
├── EBSD3d50.i                            # Main polycrystal input
├── fcc025calibrate.i                     # Unirradiated calibration input
└── CalculateSchimdFactor.ipynb           # Schmid factor analysis notebook
```
