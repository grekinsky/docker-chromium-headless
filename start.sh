#!/bin/bash
export DISPLAY=:1
Xvfb $DISPLAY -ac -screen 0 1280x1024x8 & yarn run test
