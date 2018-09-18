export IMAGE_TAG=$(cat VERSION)
export AARCH=`uname -m`

if [ "$AARCH" = "aarch64" ]; then
    docker build -t cachengo/facerec-$AARCH:$IMAGE_TAG --build-arg base_image=cachengo/caffe-hrt:latest .;
else
    docker build -t cachengo/facerec-$AARCH:$IMAGE_TAG .;
fi;

docker push cachengo/facerec-$AARCH:$IMAGE_TAG