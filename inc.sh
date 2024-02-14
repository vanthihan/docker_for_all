#!/bin/bash

source ./exec-cmd-arr.sh

PROJECT_NAME="stplus"
#replace spaces with '-'
PROJECT_NAME_WITHOUT_SPACE=${PROJECT_NAME// /-}

export DOCKER_IMAGE_NAME="${PROJECT_NAME_WITHOUT_SPACE}-image/do-not-erase"
export DOCKER_CONTAINER_NAME="${PROJECT_NAME_WITHOUT_SPACE}-container--do-not-erase"

#Host and guest shared directories from you machine and docker
export HOST_SHARED_DIR="~/samba/views/stplus/docker_workspace/host_share_dir"
export GUEST_MOUNT_POINT="/home/guest_share_dir"
