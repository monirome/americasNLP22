#!/bin/bash
## ---------------------Known errors ---------------------------------
# None

##----------------------Load apps -------------------------------------
module load Python FFmpeg libsndfile wget binutils CMake OpenBLAS FFTW Eigen Boost
##zlib1g liblzma-dev Libsox-fmt-mp3 Libboost-system-dev Libboost-thread-dev Libboost-program-options$

##--------------------Install python libraries-------------------------------------
#pip install libsndfile1-dev
#pip install libsndfile1
pip install SoundFile
#pip install editdistance==0.1
pip install editdistance 
pip install sentencepiece
pip install tensorboardX
pip install tqdm
pip install jiwer
pip install hydra-ax-sweeper==1.2

##--------------------Install kenlm-------------------------------------------------
git clone https://github.com/kpu/kenlm && cd kenlm && mkdir -p build && cd build && cmake .. && make -j 4
cd ..
cd ..
pip install https://github.com/kpu/kenlm/archive/master.zip

##--------------------Install OpenBLAS---------------------------------------------
## LOADED
#cd ~
#git clone https://github.com/xianyi/OpenBLAS.git && cd OpenBLAS && mkdir -p build && cd build && cmake .. && make -j 4 && make install

##--------------------Install fftw-------------------------------------------------
# LOADED
#cd ~
#wget http://www.fftw.org/fftw-3.3.10.tar.gz && tar -xvf fftw-3.3.10.tar.gz && cd fftw-3.3.10 && \
#    mkdir build && cd build && cmake .. && make -j 4 && make install -q


##--------------------Install Fairseq--------------------------------------------
git clone https://github.com/pytorch/fairseq && \
cp configuration_SLURM/setup.py fairseq/. && \
cp configuration_SLURM/audio_pretraining.py fairseq/fairseq/tasks/. && \
cp configuration_SLURM/infer.py fairseq/examples/speech_recognition/. \
