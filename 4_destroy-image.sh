#!/bin/bash

source inc.sh

declare -a CMD_ARR

CMD_ARR[${#CMD_ARR[@]}]="./3_remove-container.sh"
CMD_ARR[${#CMD_ARR[@]}]="docker image rm ${DOCKER_IMAGE_NAME} 2>/dev/null"
CMD_ARR[${#CMD_ARR[@]}]="yes | docker image prune"

exec_cmd_arr "${CMD_ARR[@]}"
