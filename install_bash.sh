#!/bin/bash
## ---------------------Known errors ---------------------------------
# The following message is shown at the beginning of the installation but it does not affect:
# "Lmod has detected the following error: These module(s) ... -11.2.0 GCCcore/10.2.0 to see how to load the module(s)."

##----------------------Load apps -------------------------------------
module load Python FFmpeg libsndfile wget binutils CMake
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
cd ~
git clone https://github.com/kpu/kenlm && cd kenlm && mkdir -p build && cd build && cmake .. && make -j 4
pip install https://github.com/kpu/kenlm/archive/master.zip

##--------------------Install OpenBLAS---------------------------------------------
cd ~
git clone https://github.com/xianyi/OpenBLAS.git && cd OpenBLAS && mkdir -p build && cd build && cmake .. && make -j 4 && make install

##--------------------Install fftw-------------------------------------------------
cd ~
wget http://www.fftw.org/fftw-3.3.10.tar.gz && tar -xvf fftw-3.3.10.tar.gz && cd fftw-3.3.10 && \
    mkdir build && cd build && cmake .. && make -j 4 && make install -q


##--------------------Install Fairseq--------------------------------------------
cd ~
cd americasNLP
git clone https://github.com/pytorch/fairseq && \
cp configuration_SLURM/setup.py fairseq/. && \
cp configuration_SLURM/audio_pretraining.py fairseq/fairseq/tasks/. && \
cp configuration_SLURM/infer.py fairseq/examples/speech_recognition/. \
