#!/bin/bash
##----------------------- Start job description -----------------------
#SBATCH --partition=standard
#SBATCH --job-name=prueba_job_monica.job
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=22:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=romeroferronmonica@gmail.com
#SBATCH --chdir=
##------------------------ End job description ------------------------
##----------------------Load apps -------------------------------------
module load Python FFmpeg libsndfile wget zlib1g liblzma-dev
##Libsox-fmt-mp3 Libboost-system-dev Libboost-thread-dev Libboost-program-options-dev Libboost-test-dev Libeigen3-dev sox  NO ESTAN EN CESVIMA
##--------------------------------------------------------------------
srun python pyprueba.py
