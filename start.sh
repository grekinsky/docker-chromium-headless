#!/bin/bash
export DISPLAY=:1;
Xvfb $DISPLAY -ac -screen 0 1280x1024x8 & \
    npm run test
RET1=$?;
RET2=0;
if [ "$RESULTFILE" != "" ]; then
    chmod 666 $RESULTFILE && \
        echo "Changed permissions to result file $RESULTFILE"
    RET2=$?:
fi
exit $RET1 && $RET2;
