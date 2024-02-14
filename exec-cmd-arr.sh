#!/bin/bash

# caller must call this function like exec_cmd_arr "${CMD_ARR[@]}"
exec_cmd_arr()
{
    local_array=("$@")

    for str in "${local_array[@]}"
    do
        echo "CMD--->: $str"
        eval "$str"
        if [ $? -ne 0 ] ; then
            echo -e "*****************\nERROR:\n${str}\n*****************"
            exit 10
        fi
    done
}
