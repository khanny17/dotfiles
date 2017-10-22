#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e -x

git pull
./$SCRIPT_DIR/setup.sh
