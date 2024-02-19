#!/bin/bash

source ./exec-cmd-arr.sh

declare -a CMD_ARR

CMD_ARR[${#CMD_ARR[@]}]="sudo sed --posix -i 's/\#\!\/usr\/bin\/env python *$/\#\!\/usr\/bin\/env python3/' /usr/bin/repo"
CMD_ARR[${#CMD_ARR[@]}]="mkdir ./rv1126-sdk || true"
CMD_ARR[${#CMD_ARR[@]}]="cd ./rv1126-sdk"
CMD_ARR[${#CMD_ARR[@]}]="repo init --repo-url ssh://git@www.rockchip.com.cn/repo/rk/tools/repo -u ssh://git@www.rockchip.com.cn/linux/rockchip/platform/manifests -b linux -m rv1126_rv1109_linux_release.xml"
CMD_ARR[${#CMD_ARR[@]}]=".repo/repo/repo sync -c -j4"
CMD_ARR[${#CMD_ARR[@]}]="./build.sh"

exec_cmd_arr "${CMD_ARR[@]}"
