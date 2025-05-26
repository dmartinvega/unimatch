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
2. Activate virtual environment. Do not use screen for this process.
```
conda activate unimatch_2
```
3. Additional for pytorch and cuda installation
```
pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 torchaudio==0.9.1 --extra-index-url https://download.pytorch.org/whl/cu111
```
4. If you want to run something that may take long time (like training), always use screen. But if you use screen, keep in mind that in that case there is a problem and conda environments are not activated as they should. So, if you want to run something using bash, instead of `python` at the beginning, you have to paste the absolute path of your venv bin python. In this case you do not need to activate the environment with `conda environment`. Example:

Instead of this:
```
python main_flow.py --checkpoint_dir checkpoints_flow/things-gmflow-scale1 \
--resume checkpoints_flow/chairs-gmflow-scale1/step_100000.pth \
--stage things \
--batch_size 8 \
--val_dataset things sintel kitti \
--lr 2e-4 \
--image_size 384 768 \
--padding_factor 16 \
--upsample_factor 8 \
--with_speed_metric \
--val_freq 40000 \
--save_ckpt_freq 50000 \
--num_steps 800000
```

Try something like this:
```
/opt/miniconda3/envs/unimatch_2/bin/python main_flow.py --checkpoint_dir checkpoints_flow/things-gmflow-scale1 \
--resume checkpoints_flow/chairs-gmflow-scale1/step_100000.pth \
--stage things \
--batch_size 8 \
--val_dataset things sintel kitti \
--lr 2e-4 \
--image_size 384 768 \
--padding_factor 16 \
--upsample_factor 8 \
--with_speed_metric \
--val_freq 40000 \
--save_ckpt_freq 50000 \
--num_steps 800000
```
5. If you want to run something outside screen because it will not take long (e.g some tests or inference), any time you want to run this project, you must activate the virtual environment.