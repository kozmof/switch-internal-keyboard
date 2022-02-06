#!/bin/bash

id=$(xinput list \
   | grep 'AT Translated Set 2 keyboard' \
   | awk '{print $7}' \
   | grep -o [0-9].)

state=$(xinput --list-props 'AT Translated Set 2 keyboard' \
      | grep 'Device Enabled' \
      | awk '{print $NF}')

if [ $state == '0' ]; then
    $(xinput enable $id)
    echo 'enabled'
else
    $(xinput disable $id)
    echo 'disabled'
fi