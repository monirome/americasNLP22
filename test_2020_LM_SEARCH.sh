#########################################################################################################
###
checkpoint="/home/u917/PROJECT/americasnlp/outputs/2022-07-06/checkpoints/checkpoint_best.pt"
data="/home/u917/PROJECT/Quechua/train"
# lm_model="/data/IBERSPEECH2022/TEXT_CORPUS/subtitles2018/3gram.binary"
lexicon="/home/u917/PROJECT/lexicon.txt"
test_name="test_quechua"
#
#
#
##############################################################################################
#nvidia-docker run -it \
#docker run -it --rm -e NVIDIA_VISIBLE_DEVICES=none \
--network=host --name "fairseq_test" --shm-size=4g --ulimit memlock=-1 \
-v /home/:/home/ -v /data/:/data/ -w /workspace/fairseq \
fairseq \
python3 examples/speech_recognition/new/infer.py --multirun \
--config-path=/home/u917/PROJECT/americasnlp/hydra_search_lm/config1 \
hydra/sweeper=ax \
task=audio_finetuning \
common_eval.path=$checkpoint \
decoding.type=kenlm \
decoding.lexicon=$lexicon \
# decoding.lmpath=$lm_model \
dataset.gen_subset=$test_name
common.cpu=True





