#!/bin/bash

# The wallpaper directories
WALLPAPERS_DIR=/usr/share/wallpapers
IMG_1_DIR="${WALLPAPERS_DIR}/Bamboo/contents/images"
IMG_2_DIR="${WALLPAPERS_DIR}/Mountain/contents/images"

# The specific images to use
LANDSCAPE_IMG="${IMG_1_DIR}/5120x2880.png"
PORTRAIT_IMG="${IMG_1_DIR}/5120x2880.png"
LANDSCAPE_2_IMG="${IMG_2_DIR}/5120x2880.png"

if pgrep niri; then
	swaybg --output DP-1 --image "${LANDSCAPE_IMG}" &
	swaybg --output DP-3 --image "${PORTRAIT_IMG}" --mode center &
	swaybg --output HDMI-A-2 --image "${LANDSCAPE_2_IMG}" &
fi
