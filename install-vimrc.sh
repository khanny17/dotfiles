SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f ~/.vimrc ] ; then
    echo Moving existing .vimrc file to .vimrc_old
    mv ~/.vimrc ~/.vimrc_old
fi

ln -s $SCRIPT_DIR/dotfiles/vimrc ~/.vimrc

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Vundle Plugins
vim +PluginInstall

# Install YouCompleteMe
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core
