#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e -x

mv ~/.tmux.conf ~/.tmux.conf_old
ln -s $SCRIPT_DIR/tmux.conf ~/.tmux.conf
