# How to use:
# ./build_image.sh IMG_NAME BASE_IMAGE

if [ "$#" -ne 2 ]; then
  echo "Usage: ./build_image.sh IMG_NAME BASE_IMAGE"
  exit 1
fi

docker build -t $1 --build-arg from=$2 .
