#!/bin/bash
set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$SCRIPT_DIR/lemonbar.sh | lemonbar -o 0 -f "anonymous pro minus:size=16" -o -2 -f "Font Awesome:size=16"
