# How to use:
# ./build_image.sh IMG_NAME BASE_IMAGE

docker build -t $1 --build-arg from=$2 .
