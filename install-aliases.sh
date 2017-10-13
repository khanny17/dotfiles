SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f ~/.aliases ] ; then
    echo Moving existing .aliases file to .aliases_old
    mv ~/.aliases ~/.aliases_old
fi

ln -s $SCRIPT_DIR/dotfiles/aliases ~/.aliases
