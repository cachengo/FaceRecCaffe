IMAGE_TAG=$(cat VERSION)
AARCH=`uname -m`

CAFFE_TAG=cpu
if [ "$AARCH" = "aarch64" ]; then
    CAFFE_TAG=acl;
fi

docker build -t cachengo/facerec-$AARCH:$IMAGE_TAG --build-arg caffe_tag=$CAFFE_TAG .

docker push cachengo/facerec-$AARCH:$IMAGE_TAG