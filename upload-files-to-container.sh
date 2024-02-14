#!/bin/bash

source inc.sh

declare -a CMD_ARR

HOST_SHARED_SCRIPT_DIR="${HOST_SHARED_DIR}/incontainer"

CMD_ARR[${#CMD_ARR[@]}]="[ -d ${HOST_SHARED_SCRIPT_DIR} ] || mkdir ${HOST_SHARED_SCRIPT_DIR}"

CMD_ARR[${#CMD_ARR[@]}]="mkdir -p $HOST_SHARED_SCRIPT_DIR/ssh_key"

CMD_ARR[${#CMD_ARR[@]}]="cp -fv exec-cmd-arr.sh $HOST_SHARED_SCRIPT_DIR"
CMD_ARR[${#CMD_ARR[@]}]="chmod 555 $HOST_SHARED_SCRIPT_DIR/exec-cmd-arr.sh"

#Util script for ssh key loading from host machine to docker
CMD_ARR[${#CMD_ARR[@]}]="cp -fv ./run-in-docker-container/load-ssh-key.sh ${HOST_SHARED_SCRIPT_DIR}"
CMD_ARR[${#CMD_ARR[@]}]="chmod 555 ${HOST_SHARED_SCRIPT_DIR}/load-ssh-key.sh"

#Env script
CMD_ARR[${#CMD_ARR[@]}]="cp -fv ./run-in-docker-container/0_env.sh ${HOST_SHARED_SCRIPT_DIR}"
CMD_ARR[${#CMD_ARR[@]}]="chmod 555 ${HOST_SHARED_SCRIPT_DIR}/0_env.sh"

#Project clone script
CMD_ARR[${#CMD_ARR[@]}]="cp -fv ./run-in-docker-container/clone-stplus.sh ${HOST_SHARED_SCRIPT_DIR}"
CMD_ARR[${#CMD_ARR[@]}]="chmod 555 ${HOST_SHARED_SCRIPT_DIR}/clone-stplus.sh"

#Project clone script
CMD_ARR[${#CMD_ARR[@]}]="mkdir -p ${HOST_SHARED_SCRIPT_DIR}/ssh_key"
CMD_ARR[${#CMD_ARR[@]}]="cp -fv ~/.ssh/id_rsa* ${HOST_SHARED_SCRIPT_DIR}/ssh_key"

exec_cmd_arr "${CMD_ARR[@]}"
