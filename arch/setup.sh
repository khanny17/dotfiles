#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -x

# FIRST: packages
sudo pacman -S compton feh imagemagick rxvt-unicode sxhkd bspwm vim git python3 python-pip openssh unzip gdb mpd ncmpcpp xorg-xinit xorg screen alsa-utils

# NEXT: display stuff

mkdir -p ~/.config/bspwm
mv ~/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc.old
mv ~/.config/bspwm/set-bg.sh ~/.config/bspwm/set-bg.sh.old
ln -s $SCRIPT_DIR/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s $SCRIPT_DIR/set-bg.sh ~/.config/bspwm/set-bg.sh

mkdir -p ~/.config/sxhkd
mv ~/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc.old
ln -s $SCRIPT_DIR/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

mkdir -p ~/.config/alacritty
mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.old
ln -s $SCRIPT_DIR/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

mv ~/.xinitrc .xinitrc.old
ln -s $SCRIPT_DIR/xinitrc ~/.xinitrc

mv ~/.Xdefaults .Xdefaults.old
ln -s $SCRIPT_DIR/Xdefaults ~/.Xdefaults

# NEXT: audio stuff
mkdir -p ~/.config/mpd
cp /usr/share/doc/mpd/mpdconf.example ~/.config/mpd/mpd.conf
mkdir ~/music
mkdir ~/.mpd
touch ~/.mpd/database
mkdir ~/.mpd/playlists

# NEXT: lockscreen

git clone https://github.com/pavanjadhaw/betterlockscreen
sudo mv betterlockscreen/lock.sh /usr/bin/betterlock

# NEXT: wal - wallpaper and colorscheme setter
sudo pip3 install pywal
