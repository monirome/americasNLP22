#--------VARIABLES---------------------------------------------------------------
TEST_NAME=${TEST_NAME:-"test_2020"}
RESULT_PATH=${RESULT_PATH:-"/data/IBERSPEECH2022/ACOUSTIC/TEST_2020/transcriptions"}
LEXICON=${LEXICON:-"/data/IBERSPEECH2022/LEXICON/google_ngram/lexicon_LOWERCASE.txt"}

#-------- MODEL-------------------------------------------------------------
MODEL="/home/ivan/AMERICAS/MODELS/checkpoint_best.pt"

#--------SCRIPT-------------------------------------------------------------
nvidia-docker run -it --network=host --name "fairseq_test2020" --shm-size=8g --ulimit memlock=-1 \
-v /home/:/home/ -v /data/:/data/ -w /workspace/fairseq fairseq python3 infer.py \
/data/IBERSPEECH2022/ACOUSTIC/TEST_2020/ \
--gen-subset ${TEST_NAME} \
--path ${MODEL} \
--results-path ${RESULT_PATH} \
--lexicon ${LEXICON} \
--w2l-decoder viterbi \
--beam 100 \
--beam-size-token 200 \
--beam-threshold 1 \
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
--max-len-size 400000


## ADJUST MAX-LEN-SIZE
#--memory-efficient-fp16 \
#--on-cpu-convert-precision
#--cpu