#!/bin/bash
##----------------------- Start job description -----------------------
#SBATCH --partition=standard
#SBATCH --job-name=prueba_job_monica.job
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=50gb
#SBATCH --partition=standard-gpu
#SBATCH --gres=gpu:v100
##SBATCH --mail-type=ALL
#SBATCH --mail-user=romeroferronmonica@gmail.com
##SBATCH --chdir=
##------------------------ End job description ------------------------
module load FFmpeg libsndfile Python 
module load binutils

srun fairseq-hydra-train --config-dir config --config-name finetune_koritia.yaml
