##--------------------Install kenlm---------------------------------
git clone --quiet https://github.com/kpu/kenlm && cd kenlm && mkdir -p build && cd build && cmake .. && make -j 4
pip install https://github.com/kpu/kenlm/archive/master.zip

##--------------------Install OpenBLAS---------------------------------
git clone --quiet https://github.com/xianyi/OpenBLAS.git && cd OpenBLAS && mkdir -p build && cd build && \
    cmake .. && make -j 4 && make install

##--------------------Install fftw---------------------------------
wget http://www.fftw.org/fftw-3.3.10.tar.gz && tar -xvf fftw-3.3.10.tar.gz && cd fftw-3.3.10 && \
    mkdir build && cd build && cmake .. && make -j 4 && make install -q

##--------------------Install Faairseq---------------------------------
git clone https://github.com/pytorch/fairseq &&
cp docker/setup.py fairseq/. && \
cp docker/audio_pretraining.py fairseq/fairseq/tasks/. && \
cp docker/infer.py fairseq/examples/speech_recognition/. && \
cd fairseq && pip install --editable .

