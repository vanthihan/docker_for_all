#!/bin/bash

source inc.sh

declare -a CMD_ARR

#Remove container
CMD_ARR[${#CMD_ARR[@]}]="docker container rm -f ${DOCKER_CONTAINER_NAME} 2> /dev/null"
CMD_ARR[${#CMD_ARR[@]}]="yes | docker container prune"

#clean up host shared directory
CMD_ARR[${#CMD_ARR[@]}]="rm -rf $HOST_SHARED_DIR/*"

exec_cmd_arr "${CMD_ARR[@]}"
