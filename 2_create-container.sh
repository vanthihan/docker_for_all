#!/bin/bash

source inc.sh

# usage()
# {
#     echo -e "Usage: $0 <HOST_SHARED_DIR> <GUEST_MOUNT_POINT>"
#     exit 10
# }

# if [ "$#" -ne 2 ]; then
#     usage
# fi

# HOST_SHARED_DIR=${1}
# GUEST_MOUNT_POINT=${2}

declare -a CMD_ARR

source upload-files-to-container.sh

#container creation
CMD_ARR[${#CMD_ARR[@]}]="docker create --network=host --name ${DOCKER_CONTAINER_NAME} --privileged=true -it -v ${HOST_SHARED_DIR}:${GUEST_MOUNT_POINT}:rw ${DOCKER_IMAGE_NAME}"
# CMD_ARR[${#CMD_ARR[@]}]="docker create --network=host --name ${DOCKER_CONTAINER_NAME} --privileged=true -it -v $(realpath ${1}):${2}:rw ${DOCKER_IMAGE_NAME}"

exec_cmd_arr "${CMD_ARR[@]}"
