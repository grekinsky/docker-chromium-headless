#!/bin/bash
export DISPLAY=:1
Xvfb $DISPLAY -ac -screen 0 1280x1024x8 & \
    yarn run test
if [ "$RESULTFILE" != "" ]; then
    chmod 666 $RESULTFILE;
    echo "Changed permissions to result file $RESULTFILE";
    exit 0;
fi
