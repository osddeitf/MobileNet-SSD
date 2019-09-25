#!/bin/bash
set -x

# train .prototxt
python gen.py \
    --stage=train \
    --lmdb=dataset/trainval_lmdb \
    --label-map=dataset/labelmap_voc.prototxt \
    --class-num=21 \
    --size=$1 \
    > models/MobileNetSSD_train.prototxt

# test .prototxt
python gen.py \
    --stage=test \
    --lmdb=dataset/test_lmdb \
    --label-map=dataset/labelmap_voc.prototxt \
    --class-num=21 \
    --size=$1 \
    > models/MobileNetSSD_test.prototxt

# deploy .prototxt
python gen.py \
    --stage=deploy \
    --class-num=21 \
    --size=$1 \
    > models/MobileNetSSD_deploy.prototxt
