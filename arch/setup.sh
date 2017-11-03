#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -x

# FIRST: packages
sudo pacman -S vim git python3 openssh unzip

# NEXT: display stuff

mkdir -p ~/.config/bspwm
mv ~/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc.old
ln -s $SCRIPT_DIR/bspwm/bspwmrc ~/.config/bspwm/bspwmrc

mkdir -p ~/.config/sxhkd
mv ~/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc.old
ln -s $SCRIPT_DIR/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

mv ~/.xinitrc .xinitrc.old
ln -s $SCRIPT_DIR/xinitrc ~/.xinitrc

mv ~/.Xdefaults .Xdefaults.old
ln -s $SCRIPT_DIR/Xdefaults ~/.Xdefaults
