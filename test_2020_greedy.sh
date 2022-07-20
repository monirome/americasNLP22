# ######### VARIABLES ############################
TEST_NAME=${TEST_NAME:-"test_2020"}
RESULT_PATH=${RESULT_PATH:-"/home/u917/PROJECT/TEST_2020/transcriptions"}
LEXICON=${LEXICON:-"/home/u917/PROJECT/lexicon.txt"}
##############################################
############# MODEL  #####################
#
#
MODEL=${MODEL:-"/home/u917/PROJECT/americasnlp/2022-07-06/checkpoints/checkpoint_best.pt"}
#
#
########################################
#
#docker run -it --rm -e NVIDIA_VISIBLE_DEVICES=none \
#nvidia-docker run -it \
#--network=host --name "fairseq_test2020" --shm-size=8g --ulimit memlock=-1 \
#-v /home/:/home/ -v /data/:/data/ -w /workspace/fairseq fairseq \
python3 examples/speech_recognition/infer.py \
/home/u917/PROJECT/Quechua/train/ \
--gen-subset ${TEST_NAME} \
--path ${MODEL} \
--results-path ${RESULT_PATH} \
--lexicon ${LEXICON} \
--w2l-decoder viterbi \
--scoring wer \
--batch-size 1 \
--num-workers 1 \
--task audio_finetuning \
--nbest 1 \
--post-process letter \
--criterion ctc \
--labels ltr \
--max-sample-size 300000000 \
--min-sample-size 16000 \
--eval-wer \
--fp16 \
--memory-efficient-fp16 \
--on-cpu-convert-precision
#--cpu



#--max-sample-size 10000000 \ # 10 minutos
#--max-sample-size 20000000 \ # 20 minutos
#--max-tokens-valid 40000000 \
#--fp16 \
#--memory-efficient-fp16 \
#--on-cpu-convert-precision \
