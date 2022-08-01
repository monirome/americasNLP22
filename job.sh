#!/bin/bash
##----------------------- Start job description -----------------------
#SBATCH --partition=standard
#SBATCH --job-name=prueba_job_monica.job
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=50gb
##SBATCH --mail-type=ALL
##SBATCH --mail-user=
##SBATCH --chdir=
##------------------------ End job description ------------------------
module load Python FFmpeg libsndfile 

srun fairseq-hydra-train --config-dir config --config-name finetune_quechua.yaml
