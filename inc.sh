#!/bin/bash

source ./exec-cmd-arr.sh

PROJECT_NAME="rk3399 and imx273"
#replace spaces with '-'
PROJECT_NAME_WITHOUT_SPACE=${PROJECT_NAME// /-}

export DOCKER_IMAGE_NAME="${PROJECT_NAME_WITHOUT_SPACE}-image"
export DOCKER_CONTAINER_NAME="${PROJECT_NAME_WITHOUT_SPACE}-container"

#Host and guest shared directories from you machine and docker
export HOST_SHARED_DIR="/home/jou/samba/views/rk3399_and_imx273/host_dir"
export GUEST_MOUNT_POINT="/home/work_dir"
