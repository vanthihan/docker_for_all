#!/bin/bash

source ./inc.sh

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 20
fi

#steps below are from https://cloud.tencent.com/developer/article/2157574

declare -a CMD_ARR

CMD_ARR[${#CMD_ARR[@]}]="apt-get autoremove docker docker-ce docker-engine docker.io containerd runc"
CMD_ARR[${#CMD_ARR[@]}]="dpkg -l | grep docker"
CMD_ARR[${#CMD_ARR[@]}]="dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P || true"
CMD_ARR[${#CMD_ARR[@]}]="apt-get autoremove docker-ce-*"
CMD_ARR[${#CMD_ARR[@]}]="rm -rf /etc/systemd/system/docker.service.d"
CMD_ARR[${#CMD_ARR[@]}]="rm -rf /var/lib/docker"

exec_cmd_arr "${CMD_ARR[@]}"
