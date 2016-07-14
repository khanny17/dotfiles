SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f ~/.vimrc ] ; then
    echo Moving existing .vimrc file to .vimrc_old
    mv ~/.vimrc ~/.vimrc_old
fi

ln -s $SCRIPT_DIR/dotfiles/vimrc ~/.vimrc
