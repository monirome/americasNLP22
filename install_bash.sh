#!/bin/bash
##----------------------Load apps -------------------------------------
# See all available modules with: "module avail"
module load Python PyTorch FFmpeg libsndfile wget binutils CMake OpenBLAS FFTW Eigen Boost
##zlib1g liblzma-dev Libsox-fmt-mp3 Libboost-system-dev Libboost-thread-dev Libboost-program-options libsndfile1-dev

##--------------------Install python libraries-------------------------------------
pip install SoundFile
pip install editdistance
pip install sentencepiece
pip install tensorboardX
pip install tqdm
pip install jiwer
pip install hydra-ax-sweeper==1.2

unzip flashlight && cd flashlight/bindings/python && pip install -e .

##--------------------Install kenlm-------------------------------------------------
git clone https://github.com/kpu/kenlm && cd kenlm && mkdir -p build && cd build && cmake .. && make -j 4 && cd ../..
pip install https://github.com/kpu/kenlm/archive/master.zip

##--------------------Install Fairseq--------------------------------------------
git clone https://github.com/pytorch/fairseq && \
cp configuration_SLURM/setup.py fairseq/. && \
cp configuration_SLURM/audio_pretraining.py fairseq/fairseq/tasks/. && \
cp configuration_SLURM/infer.py fairseq/examples/speech_recognition/. && \
cd fairseq && pip install --editable . && cd ..
