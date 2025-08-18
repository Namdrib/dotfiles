#!/bin/bash

IMG_PATH=/usr/share/wallpapers/Bamboo\ at\ Night
LANDSCAPE_IMG="${IMG_PATH}/contents/images/5120x2880.png"
PORTRAIT_IMG="${IMG_PATH}/contents/images/5120x2880.png"

swaybg --output DP-1 --image "${LANDSCAPE_IMG}" &
swaybg --output DP-3 --image "${PORTRAIT_IMG}" --mode center &
