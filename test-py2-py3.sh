#! /bin/bash

TASK_NAME='senta'
DATA_PATH=./senta_data/
CKPT_PATH=./save_models
MODEL_PATH=./senta_model/bilstm_model/

time (python -u run_classifier.py \
        --task_name ${TASK_NAME} \
        --use_cuda false \
        --do_train true \
        --do_val true \
        --do_infer false \
        --batch_size 16 \
        --data_dir ${DATA_PATH} \
        --vocab_path ${DATA_PATH}/word_dict.txt \
        --save_steps 50 \
        --validation_steps 50 \
        --epoch 3 \
        --senta_config_path ./senta_config.json \
        --skip_steps 10 >./python22.log) >>./python22.log 2>&1

if [ $? -ne 0 ];then
        echo -e "\033[33m training of test failed! \033[0m";
else
        echo -e "\033[33m training of test successfully! \033[0m"
fi

time (python3 -u run_classifier.py \
        --task_name ${TASK_NAME} \
        --use_cuda false \
        --do_train true \
        --do_val true \
        --do_infer false \
        --batch_size 16 \
        --data_dir ${DATA_PATH} \
        --vocab_path ${DATA_PATH}/word_dict.txt \
        --save_steps 50 \
        --validation_steps 50 \
        --epoch 3 \
        --senta_config_path ./senta_config.json \
        --skip_steps 10 >./python33.log) >>./python33.log 2>&1

if [ $? -ne 0 ];then
        echo -e "\033[33m training of test failed! \033[0m";
else
        echo -e "\033[33m training of test successfully! \033[0m"
fi