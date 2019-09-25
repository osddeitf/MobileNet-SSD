#!/bin/sh
if ! test -f models/MobileNetSSD_train.prototxt ;then
	echo "error: models/MobileNetSSD_train.prototxt does not exist."
	echo "please use the gen_model.sh to generate your own model."
        exit 1
fi

mkdir -p snapshot
latest=$(ls -t snapshot/*.solverstate | head -n1)

if test -z latest; then
    $CAFFE_HOME/build/tools/caffe train -solver="models/solver_train.prototxt" \
    -gpu 0
    #-weights="mobilenet_iter_73000.caffemodel" \
else
    $CAFFE_HOME/build/tools/caffe train -solver="models/solver_train.prototxt" \
    -snapshot=$latest \
    -gpu 0
fi
