#!/bin/bash

source ./exec-cmd-arr.sh

usage()
{
    echo -e "Usage: $0 <ssh-private-key>"
    exit 10
}

if [[ $EUID == 0 ]]; then
    echo "This script should NOT run as root"
    exit 1
fi

if [ "$#" -ne 1 ]; then
    usage
fi

declare -a CMD_ARR

CMD_ARR[${#CMD_ARR[@]}]="cp -fv ${1} ~/.ssh/"
CMD_ARR[${#CMD_ARR[@]}]="chmod 600 ~/.ssh/id_rsa"
CMD_ARR[${#CMD_ARR[@]}]="chown $(logname): ~/.ssh/id_rsa"

# CMD_ARR[${#CMD_ARR[@]}]="chmod 644 ~/.ssh/id_rsa.pub"
# CMD_ARR[${#CMD_ARR[@]}]="chown $(logname): ~/.ssh/id_rsa.pub"

CMD_ARR[${#CMD_ARR[@]}]="ssh-add ~/.ssh/id_rsa"

exec_cmd_arr "${CMD_ARR[@]}"
