#!/usr/bin/env bash

# Since Plasma 6.5(?) darkman no longer changes Qt application themes when
# toggling between dark/light
# Instead, set it ourselves
# Reference: https://invent.kde.org/plasma/powerdevil/-/merge_requests/576/diffs

if [[ $1 == dark ]] || [[ $0 == *"dark-mode"* ]]; then
	THEME=org.kde.breezedark.desktop
elif [[ $1 == light ]] || [[ $0 == *"light-mode"* ]]; then
	THEME=org.kde.breeze.desktop
else
	echo "Unable to detect mode"
	exit 1
fi

echo "Switching Plasma theme to ${THEME}"
# plasma-apply-lookandfeel -a "${THEME}"
lookandfeeltool -a "${THEME}"
lookandfeeltool -a "${THEME}"
lookandfeeltool -a "${THEME}"
