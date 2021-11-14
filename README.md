# dotfiles
My dotfiles, heavily inspired by [webpro/dotfiles](https://github.com/webpro/dotfiles) and [anishathalye/dotfiles](https://github.com/anishathalye/dotfiles)

## Installation
Install with `./install.sh`. Note that this does not make any backups of existing dotfiles!
The installation script currently expects that the dotfiles repo has been cloned in ~/.dotfiles
You can clone to any arbitrary location and create a symlink to it using `ln -sv $dotfiles_repo_location ~/.dotfiles`, where `$dotfiles_repo_location` is where you cloned the repo

The installer finds any file of the format `*.symlink` in the repo and makes symlinks for those files at `~`
e.g. the file `~/dotfiles/tmux/tmux.conf.symlink` will have a symlink at `~/.tmux.conf`

## Considerations
The installer will not make any backups!
It is not selective - i.e. it will install all of the appropriate symlinks
If you want to choose which files to install, you will need to create the symlinks manually, or delete those files in your copy of the repo before running the installer
There are some settings that are specific to my usage, and that may not make sense for your use
- e.g. loading the ssh agent in `dotfiles/bash/env.bash`, or specific vim plugins
- some things may also not work properly due assumptions I've made about what version of all the programs are being run
- my git credentials are stored in the gitconfig, so any commits you make with those will be done as me

## Extra things
Some of the dotfiles allow for local customisation
The corresponding paths can be found below:

configuration | customisation
`bash` | anything in `$HOME/.extra/*` will be sourced
`vim` | `~/.vimrc.local`
`git` | `~/.gitconfig.local`
