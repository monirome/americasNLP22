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
##----------------------Python Libraries ------------------------------
## pip install editdistance
pip install sentencepiece
pip install tensorboardX
pip install tqdm
pip install jiwer
pip install hydra-ax-sweeper==1.2
##--------------------------------------------------------------------
##git clone --quiet https://github.com/kpu/kenlm && cd kenlm && mkdir -p build && cd build && cmake .. && make -j 4
##pip install https://github.com/kpu/kenlm/archive/master.zip
##git clone --quiet https://github.com/xianyi/OpenBLAS.git && cd OpenBLAS && mkdir -p build && cd build && \
##    cmake .. && make -j 4 && make install
##wget -q http://www.fftw.org/fftw-3.3.10.tar.gz && tar -xvf fftw-3.3.10.tar.gz && cd fftw-3.3.10 && \
##    mkdir build && cd build && cmake .. && make -j 4 && make install 1> NUL 2> NUL
git clone https://github.com/pytorch/fairseq && cp docker/setup.py fairseq/. && \
    cp docker/audio_pretraining.py fairseq/fairseq/tasks/. && \
    cp docker/infer.py fairseq/examples/speech_recognition/. && \
    cd fairseq && pip install --editable . && cp examples/speech_recognition/infer.py
##--------------------------------------------------------------------
python pyprueba.py


##git clone --quiet https://github.com/kpu/kenlm && cd kenlm && mkdir -p build && cd build && cmake .. && make -j 4
##pip install https://github.com/kpu/kenlm/archive/master.zip
##git clone --quiet https://github.com/xianyi/OpenBLAS.git && cd OpenBLAS && mkdir -p build && cd build && \
##    cmake .. && make -j 4 && make install
##wget http://www.fftw.org/fftw-3.3.10.tar.gz && tar -xvf fftw-3.3.10.tar.gz && cd fftw-3.3.10 && \
##    mkdir build && cd build && cmake .. && make -j 4 && make install -q
##cp docker/setup.py
##cp docker/infer.py
##cp docker/audio_pretraining.py
##rm -r fairseq
git clone https://github.com/pytorch/fairseq &&
cp docker/setup.py fairseq/. && \
cp docker/audio_pretraining.py fairseq/fairseq/tasks/. && \
cp docker/infer.py fairseq/examples/speech_recognition/. && \
cd fairseq && pip install --editable .
##&& cp examples/speech_recognition/infer.py .
##--------------------------------------------------------------------
ls> salida.txt
srun python pyprueba.py
