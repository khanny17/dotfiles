SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f ~/.tmux.conf ] ; then
    echo Moving existing .tmux.conf file to .tmux.conf_old
    mv ~/.tmux.conf ~/.tmux.conf_old
fi

ln -s $SCRIPT_DIR/dotfiles/tmux.conf ~/.tmux.conf

