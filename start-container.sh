#!/bin/bash

source inc.sh

declare -a CMD_ARR

CMD_ARR[${#CMD_ARR[@]}]="docker start -i ${DOCKER_CONTAINER_NAME}"

exec_cmd_arr "${CMD_ARR[@]}"
