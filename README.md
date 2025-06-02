# PEB and LOO Analyses for the precision study 

This repository contains MATLAB scripts for conducting second-level DCM analyses using Parametric Empirical Bayes (PEB) and Leave-One-Out (LOO) cross-validation. The analyses focus on the modulatory connectivity between the insula, pulvinar, and V1, elicited by a high-precision condition in the experiment.

---

## Contents

- `run_PEB.m`: Runs the PEB analysis and Bayesian model reduction (BMR/BMA), and saves model estimates and output figures.
- `run_LOO.m`: Performs leave-one-out cross-validation for selected connections and saves the results and output figures.
- `M.mat`: Design matrix used for the PEB analysis. Includes a behavioural measure (i.e., high-precision effect).
- `GCM.mat`: File containing estimated first-level DCMs for each participant, used in the PEB and LOO analyses. (not included due to size constraints).
  [Download the GCM.mat from OneDrive](https://1drv.ms/u/c/3c6c1c8cf97c7f38/EZo0gcKRhNBOosQTqJFh4-0BsSh54Lvm4sfHkPd9XvfYaw?e=MeaKLi)
- `expected_output/`: Example outputs for reference.  
  The estimated `PEB.mat` file is also not included due to size constraints. [Download the PEB.mat from OneDrive](https://1drv.ms/u/c/3c6c1c8cf97c7f38/ERji7LTPI4hBnMkaB_DPgksBITqjNG2xNyeKbg6myCmI8Q?e=LmbAB9)

---

## Getting Started

1. Clone the repository:
    ```bash
    git clone https://github.com/linzhi-tao/Precision_study.git
    ```

2. Make sure you have:
    - MATLAB (R2020a or later recommended)
    - SPM12 installed and added to your MATLAB path

3. Download the `GCM.mat` file from OneDrive and place it in the root directory of the repository:  
   [Download GCM.mat](https://1drv.ms/u/c/3c6c1c8cf97c7f38/EZo0gcKRhNBOosQTqJFh4-0BsSh54Lvm4sfHkPd9XvfYaw?e=MeaKLi)

4. (Optional) If you want to load the estimated PEB model directly, you can also download `PEB.mat`:  
   [Download PEB.mat](https://1drv.ms/u/c/3c6c1c8cf97c7f38/ERji7LTPI4hBnMkaB_DPgksBITqjNG2xNyeKbg6myCmI8Q?e=LmbAB9)

5. Run the scripts in MATLAB:
    ```matlab
    run_PEB
    run_LOO
    ```

---

## Analysis Notes

### Design Matrix (`M.mat`)
- `dm.X`: 29x2 matrix containing:
    1. A list of ones
    2. High-precision effect (i.e., response accuracy under high precision – mean accuracy)

- `dm.labels`: Contains label names for each regressor (e.g., `'mean'`, `'high-precision effect'`)

### PEB Parameters
- The PEB is estimated on the B-matrix only (`{'B'}`).

### LOO Analysis
- Targeted connections include:
    - V1 → Pulvinar
    - Pulvinar → V1
    - Pulvinar → Insula
    - Insula → Pulvinar

---

## Output

All output files and plots are saved in the subdirectories:

- `output_PEB/`: for the PEB model estimates and BMA plots
- `output_LOO/`: for cross-validation metrics and figures

Example results are shown in `expected_output/`.

---

## Acknowledgements

The scripts were adapted from [Peter Zeidman’s DCM PEB tutorial](https://github.com/pzeidman/dcm-peb-example).

