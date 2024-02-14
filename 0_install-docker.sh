#!/bin/bash

source ./inc.sh

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 20
fi

#steps below are from https://yeasy.gitbook.io/docker_practice/install/debian

declare -a CMD_ARR

CMD_ARR[${#CMD_ARR[@]}]="apt-get update"
CMD_ARR[${#CMD_ARR[@]}]="apt-get install curl"
CMD_ARR[${#CMD_ARR[@]}]="curl -fsSL get.docker.com -o get-docker.sh"
CMD_ARR[${#CMD_ARR[@]}]="chmod +x get-docker.sh"
CMD_ARR[${#CMD_ARR[@]}]="sh get-docker.sh"
CMD_ARR[${#CMD_ARR[@]}]="usermod -aG docker $(logname)"
CMD_ARR[${#CMD_ARR[@]}]="systemctl enable docker"
CMD_ARR[${#CMD_ARR[@]}]="systemctl start docker"
CMD_ARR[${#CMD_ARR[@]}]="read -n1 -p \"Press ANY key to reboot\" user_key"
CMD_ARR[${#CMD_ARR[@]}]="reboot now"

exec_cmd_arr "${CMD_ARR[@]}"
