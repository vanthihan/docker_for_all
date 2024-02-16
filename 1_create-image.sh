#!/bin/bash

source inc.sh

usage()
{
    echo -e "Usage: $0"
    exit 10
}

if [ "$#" -ne 0 ]; then
    usage
fi

declare -a CMD_ARR

CMD_ARR[${#CMD_ARR[@]}]="docker build -t ${DOCKER_IMAGE_NAME} --network=host ."

exec_cmd_arr "${CMD_ARR[@]}"
