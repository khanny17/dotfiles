#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -x

# FIRST: packages
sudo pacman -S vim git python3 openssh unzip gdb mpd ncmpcpp

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

# NEXT: audio stuff
mkdir -p ~/.config/mpd
cp /usr/share/doc/mpd/mpdconf.example ~/.config/mpd/mpd.conf
mkdir ~/music
mkdir ~/.mpd
touch ~/.mpd/database
mkdir ~/.mpd/playlists

# NEXT: lockscreen

git clone https://github.com/pavanjadhaw/betterlockscreen
sudo mv betterlockscreen/lock.sh /usr/bin/betterlockscreen
