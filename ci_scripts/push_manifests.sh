export IMAGE_TAG=$(cat VERSION)

docker manifest create --amend cachengo/facerec:$IMAGE_TAG cachengo/facerec-x86_64:$IMAGE_TAG cachengo/facerec-aarch64:$IMAGE_TAG
docker manifest push cachengo/facerec:$IMAGE_TAG