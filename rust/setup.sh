#!/bin/bash
set -x

rustup -V > /dev/null 2>&1
RUSTUP_INSTALLED=$?
if [ "$RUSTUP_INSTALLED" -ne "0" ] ; then
    echo "Going to install rust now. Bail out if you want to."
    read
    curl https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env
fi

# Setup Racer (code completion tool)
rustup component add rust-src

# Install RLS
rustup self update
rustup update nightly
rustup component add rls-preview --toolchain nightly
rustup component add rust-analysis --toolchain nightly
rustup component add rust-src --toolchain nightly

# Install Racer
cargo install racer
