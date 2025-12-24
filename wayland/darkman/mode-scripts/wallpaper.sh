#!/bin/bash

# The wallpaper directories
WALLPAPERS_DIR=/usr/share/wallpapers

# Select based on which theme to use
case $1 in
	dark)
		IMG_1_DIR="${WALLPAPERS_DIR}/Bamboo at Night/contents/images"
		IMG_2_DIR="${WALLPAPERS_DIR}/Mountain/contents/images_dark"
		;;
	light)
		IMG_1_DIR="${WALLPAPERS_DIR}/Bamboo/contents/images"
		IMG_2_DIR="${WALLPAPERS_DIR}/Mountain/contents/images"
		;;
	default)
		exit 1
		;;
esac

# The specific images to use
LANDSCAPE_IMG="${IMG_1_DIR}/5120x2880.png"
PORTRAIT_IMG="${IMG_1_DIR}/5120x2880.png"
LANDSCAPE_2_IMG="${IMG_2_DIR}/5120x2880.png"

if pgrep niri; then
	echo "Setting wallpaper(s) to ${IMG_1_DIR} and ${IMG_2_DIR}"
	outputs=$(swww query)
	[[ "$outputs" == *"DP-1"* ]] && swww img -o DP-1 "${LANDSCAPE_IMG}" --transition-type wipe --transition-fps 165 --transition-step 10
	[[ "$outputs" == *"DP-3"* ]] && swww img -o DP-3 "${PORTRAIT_IMG}" --transition-type wipe --transition-fps 75 --transition-step 10
	[[ "$outputs" == *"HDMI-A-2"* ]] && swww img -o HDMI-A-2 "${LANDSCAPE_2_IMG}"
fi
