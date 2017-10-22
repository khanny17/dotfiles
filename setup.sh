#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#set -e -x

if [ "$1" != "--update" ] ; then
    # If run without --update, setup the cron job
    echo "You need to setup crontab manually. To do so, add the following entry:"
    echo
    echo "0 * * * * $SCRIPT_DIR/update.sh"
    echo
    echo "Which will check for updates every hour on the hour"
    echo "--- Press any key to continue ---"
    read
    crontab -e
fi

# Vim
$SCRIPT_DIR/vim/setup.sh

# Rust
$SCRIPT_DIR/rust/setup.sh

# tmux
$SCRIPT_DIR/tmux/setup.sh
