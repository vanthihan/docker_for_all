#!/bin/bash

source ./exec-cmd-arr.sh

# usage()
# {
#     echo -e "Usage: $0 <git-email> <git-username> <ssh-private-key>"
#     exit 10
# }

# if [ "$#" -ne 3 ]; then
#     usage
# fi

GIT_EMAIL="vanthi.han@gmail.com"
GIT_USER="vanthi.han"
SSH_PUBLIC_KEY="ssh_key/id_rsa"

declare -a CMD_ARR

CMD_ARR[${#CMD_ARR[@]}]="./load-ssh-key.sh ${SSH_PUBLIC_KEY}"

#update cmake to 3.18
# CMD_ARR[${#CMD_ARR[@]}]="cd /tmp"
# CMD_ARR[${#CMD_ARR[@]}]="sudo apt-get -y remove cmake"
# CMD_ARR[${#CMD_ARR[@]}]="wget https://cmake.org/files/v3.18/cmake-3.18.4-Linux-x86_64.tar.gz"
# CMD_ARR[${#CMD_ARR[@]}]="tar -xvzf cmake-3.18.4-Linux-x86_64.tar.gz"
# CMD_ARR[${#CMD_ARR[@]}]="sudo mv cmake-3.18.4-Linux-x86_64 /usr/local/share"
# CMD_ARR[${#CMD_ARR[@]}]="sudo update-alternatives --install /usr/bin/cmake cmake /usr/local/share/cmake-3.18.4-Linux-x86_64/bin/cmake 1 --force"
# CMD_ARR[${#CMD_ARR[@]}]="sudo update-alternatives --install /usr/bin/ctest ctest /usr/local/share/cmake-3.18.4-Linux-x86_64/bin/ctest 1 --force"

CMD_ARR[${#CMD_ARR[@]}]="git config --global user.email \"${GIT_EMAIL}\""
CMD_ARR[${#CMD_ARR[@]}]="git config --global user.name \"${GIT_USER}\""

exec_cmd_arr "${CMD_ARR[@]}"
