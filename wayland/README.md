# Wayland Config Files

These are my config files for various Wayland applications, including:

- [Niri](https://github.com/YaLTeR/niri): The compositor / window manager
- [Waybar](https://github.com/Alexays/Waybar): The panel manager
- [fuzzel](https://codeberg.org/dnkl/fuzzel): The application launcher
- [mako](https://github.com/emersion/mako): The notification daemon
- [swaylock](https://github.com/swaywm/swaylock): The screen locker
- [swayidle](https://github.com/swaywm/swayidle): The idle state manager
- [swaybg](https://github.com/swaywm/swaybd): The wallpaper manager

## Setup
To avoid polluting the directory structure with many directories (as they all read their configurations from `~/.config/<application_name>/<configuration_file>`, these are all grouped into a single `wayland` directory, with a single configuration file for each application.

Each file is given an application identified, and an extension befitting the file type so it gets out-of-the-box syntax highlighting.

Each file is then symlinked into place.

See `install.sh` for lower-level implementation details.

The top-level install script will call this one if given the `-w/--wayland` switches
