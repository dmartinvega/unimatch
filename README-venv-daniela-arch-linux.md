# README Daniela’s Arch Linux setup
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
conda install pytorch==1.9.1 torchvision==0.10.1 torchaudio==0.9.1 cudatoolkit=11.3 -c pytorch -c conda-forge
```
4. Now you’re done. Any time you want to run this, you must activate this virtual environment.