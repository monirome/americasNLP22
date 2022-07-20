#!/bin/bash
##----------------------Load apps -------------------------------------
module load Python FFmpeg
##libsndfile wget DAN ERRORES 
##zlib1g liblzma-dev Libsox-fmt-mp3 Libboost-system-dev Libboost-thread-dev Libboost-program-options-dev Libboost-test-dev Libeigen3-dev sox  NO ESTAN EN CESVIMA
##--------------------Install python libraries-------------------------------------
## pip install editdistance NO SE HA PODIDO INSTALAR 
pip install sentencepiece
pip install tensorboardX
pip install tqdm
pip install jiwer
pip install hydra-ax-sweeper==1.2
##--------------------Install kenlm-------------------------------------------------
git clone --quiet https://github.com/kpu/kenlm && cd kenlm && mkdir -p build && cd build && cmake .. && make -j 4
pip install https://github.com/kpu/kenlm/archive/master.zip
##--------------------Install OpenBLAS---------------------------------------------
git clone --quiet https://github.com/xianyi/OpenBLAS.git && cd OpenBLAS && mkdir -p build && cd build && \
    cmake .. && make -j 4 && make install
##--------------------Install fftw-------------------------------------------------
wget http://www.fftw.org/fftw-3.3.10.tar.gz && tar -xvf fftw-3.3.10.tar.gz && cd fftw-3.3.10 && \
    mkdir build && cd build && cmake .. && make -j 4 && make install -q
cd..
##--------------------Install Faairseq--------------------------------------------
git clone https://github.com/pytorch/fairseq &&
cp configuration_SLURM/setup.py fairseq/. && 
cp configuration_SLURM/audio_pretraining.py fairseq/fairseq/tasks/. && 
cp configuration_SLURM/infer.py fairseq/examples/speech_recognition/. && 
cd fairseq && pip install --editable .
