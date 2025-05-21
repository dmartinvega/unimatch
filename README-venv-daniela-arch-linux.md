# README Daniela’s Arch Linux setup

> As of May 21, 2025: Worked for RTX 3080. Did not work in RTX 5090 (as sm_120 was not supported in CUDA 11.1).

These are the installation instructions for Daniela’s Arch Linux devices.

Previous requirements:
- conda

Run all this process in a terminal:
1. Create `conda` virtual environment from `conda_environment.yml`. Note: This yml file should not contain `pytorch` nor `cuda`, because for any unknown reason it fails.
```
conda env create -f conda_environment.yml
```
2. Activate virtual environment
```
conda activate unimatch_2
```
3. Additional conda forge for pytorch and cuda installation
```
pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 torchaudio==0.9.1 --extra-index-url https://download.pytorch.org/whl/cu111
```
4. If you want to run something that may take long time, always use screen.
5. Now you’re done. Any time you want to run this project, you must activate this virtual environment.