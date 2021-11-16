#!/bin/bash

ln -s /programs/lib/* /usr/local/lib
ln -s /programs/bin/* /usr/local/bin/

export DISPLAY=:0.0
Xvfb -ac &> /dev/null &
sleep 2
x11vnc -nopw -noxrecord -noxfixes -noxdamage -forever -display :0 &> /dev/null &
#fluxbox &> /dev/null &

/bin/bash
