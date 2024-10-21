# How to use:
# ./run_container.sh CONTAINER_NAME IMAGE_NAME

if [ "$#" -lt 2 ]; then
  echo "Usage: ./run_container.sh CONTAINER_NAME IMAGE_NAME [MOUNT]"
  exit 1
fi

if [ "$#" -eq 2]; then
  docker run -it \
    --net=host \
    --ipc=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    --privileged \
    --name $1 $2
elif [ "$#" -eq 3]; then
  docker run -it \
    --net=host \
    --ipc=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v ~/mnt/:/home/jin/mnt \
    -v ~/mnt/Data:/home/jin/mnt/Data \
    -v ~/.ssh/id_ed25519:/home/jin/.ssh/id_ed25519 \
    --privileged \
    --name $1 $2
fi
