#!/bin/bash
##----------------------- Start job description -----------------------
#SBATCH --partition=standard
#SBATCH --job-name=prueba_job_monica.job
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=100gb
#SBATCH --partition=standard-gpu
#SBATCH --gres=gpu:a100 
##SBATCH --mail-type=ALL
##SBATCH --mail-user=XXX@mail.com
##SBATCH --chdir=
##------------------------ End job description ------------------------
module load Python PyTorch FFmpeg libsndfile wget binutils CMake OpenBLAS FFTW Eigen Boost

srun fairseq-hydra-train --config-dir config --config-name finetune_quechua.yaml
