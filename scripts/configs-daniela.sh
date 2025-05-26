#!/usr/bin/env bash

# test a pretrained model with some sintel images
CUDA_VISIBLE_DEVICES=0 python main_flow.py \
--inference_dir demo/sintel/i_aaalley_1-original-image-only \
--resume pretrained/gmflow-scale2-regrefine6-mixdata-train320x576-4e7b215d.pth \
--output_path output/sintel-i_aaalley_1_seg \
--padding_factor 32 \
--upsample_factor 4 \
--num_scales 2 \
--attn_splits_list 2 8 \
--corr_radius_list -1 4 \
--prop_radius_list -1 1 \
--reg_refine \
--num_reg_refine 6 \
--eval \
--val_dataset sintel

# test a pretrained model with some sintel images - Only difference from previous: input and output dirs
CUDA_VISIBLE_DEVICES=0 python main_flow.py \
--inference_dir data/04-dino-gmflow/00-raw \
--resume pretrained/gmflow-scale2-regrefine6-mixdata-train320x576-4e7b215d.pth \
--output_path data/04-dino-gmflow/output/03-gmflow \
--padding_factor 32 \
--upsample_factor 4 \
--num_scales 2 \
--attn_splits_list 2 8 \
--corr_radius_list -1 4 \
--prop_radius_list -1 1 \
--reg_refine \
--num_reg_refine 6 \
--val_dataset sintel

# train scale1. I created the checkpoint_dir in advance. Adapted for non distributed processing
# chairs
python main_flow.py \
--checkpoint_dir checkpoints_flow/chairs-gmflow-scale1 \
--resume checkpoints_flow/chairs-gmflow-scale1/checkpoint_latest.pth \
--stage chairs \
--batch_size 6 \
--val_dataset chairs sintel kitti \
--lr 4e-4 \
--image_size 384 512 \
--padding_factor 16 \
--upsample_factor 8 \
--with_speed_metric \
--val_freq 10000 \
--save_ckpt_freq 10000 \
--num_steps 100000

--checkpoint_dir checkpoints_flow/chairs-gmflow-scale1  --stage chairs  --batch_size 4  --val_dataset chairs sintel kitti  --lr 4e-4  --image_size 384 512  --padding_factor 16  --upsample_factor 8  --with_speed_metric  --val_freq 10000  --save_ckpt_freq 10000  --num_steps 100000


# things
/opt/miniconda3/envs/unimatch_2/bin/python main_flow.py --checkpoint_dir checkpoints_flow/things-gmflow-scale1 \
--resume checkpoints_flow/chairs-gmflow-scale1/step_100000.pth \
--stage things \
--batch_size 4 \
--val_dataset things sintel kitti \
--lr 2e-4 \
--image_size 384 768 \
--padding_factor 16 \
--upsample_factor 8 \
--with_speed_metric \
--val_freq 40000 \
--save_ckpt_freq 50000 \
--num_steps 800000

python main_flow.py --checkpoint_dir checkpoints_flow/things-gmflow-scale1 --resume checkpoints_flow/chairs-gmflow-scale1/step_100000.pth --stage things --batch_size 8 --val_dataset things sintel kitti --lr 2e-4 --image_size 384 768 --padding_factor 16 --upsample_factor 8 --with_speed_metric --val_freq 40000 --save_ckpt_freq 50000 --num_steps 800000