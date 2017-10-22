#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e -x 

# First, check if vim 8 is installed
VIMVERSION=$(vim --version | head -1 | cut -d ' ' -f 5) # get installed version
echo "$VIMVERSION < 8.0" | bc # Compare version number
VIM8_NEEDED=$? # Save to variable

# Install vim 8
if [ "$VIM8_NEEDED" -ne "0" ] ; then
    sudo add-apt-repository ppa:jonathonf/vim -y
    sudo apt update
fi
sudo apt install vim -y

# Grab vim plug, put it in ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Create dir for vim plug
mkdir -p ~/.vim/plugged
# Create dir for persistent undo
mkdir -p ~/.vim/undodir

# Symlink the foo.vimrc files into ~/.vim/
rm ~/.vim/*.vimrc
ln -s $SCRIPT_DIR/*.vimrc ~/.vim/

# Symlink vimrc
mv ~/.vimrc ~/.vimrc_old
ln -s $SCRIPT_DIR/vimrc ~/.vimrc

# Install plugins
vim +PlugInstall
