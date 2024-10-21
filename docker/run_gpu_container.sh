# How to use:
# ./run_gpu_container.sh CONTAINER_NAME IMAGE_NAME

docker run -it \
  --net=host \
  --ipc=host \
  --gpus all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
  --privileged \
  --name $1 $2
