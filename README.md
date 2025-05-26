# PEB and LOO Analyses for the precision study 

This repository contains MATLAB scripts for conducting second-level DCM analyses using Parametric Empirical Bayes (PEB) and Leave-One-Out (LOO) cross-validation. The analyses focus on the modulation of specific connections under a high-precision experimental condition.

---

## Contents

- `run_PEB.m`: Runs the second-level PEB analysis and Bayesian model reduction (BMR/BMA), and saves model estimates and figures.
- `run_LOO.m`: Performs leave-one-out cross-validation for selected connections and saves the results and output figures.
- `M.mat`: Design matrix used for second-level PEB analysis. Includes a behavioural measure (i.e., high-precision effect).
- `GCM.mat`: Group-level DCM model file (not included YET due to size constraints).
- `expected_output/`: Shows example outputs from the running scripts for reference.

---

## Getting Started

1. Clone the repository:
    ```bash
    git clone https://github.com/linzhi-tao/Precision_study.git
    ```

2. Make sure you have:
    - MATLAB (R2020a or later recommended)
    - SPM12 installed and added to your MATLAB path

3. Place `GCM.mat` in the root directory of the repository.

4. Run the scripts in MATLAB:
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
- Mean-centering is applied to the second column of the design matrix for interpretability.

### LOO Analysis
- Targeted connections include:
    - V1 → Pulvinar
    - Pulvinar → V1
    - Pulvinar → Insula
    - Insula → Pulvinar

---

## Output

All output files and plots are saved automatically in the subdirectories:

- `output_PEB/`: for the PEB model estimates and BMA plots
- `output_LOO/`: for cross-validation metrics and figures

Example results are shown in `expected_output/`.

---

## Acknowledgements

The scripts were adapted from [Peter Zeidman’s DCM PEB tutorial](https://github.com/pzeidman/dcm-peb-example).

