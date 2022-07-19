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

srun python pyprueba.py
