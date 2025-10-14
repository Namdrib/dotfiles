#!/usr/bin/env bash

# GTK apps are not affected by the Plasma Global Theme, which only applies to Qt based programs.
# GTK themes can be installed here: Global Theme > Application Style > Configure GNOME/GTK Application Style.
# Reference: https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications

gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
