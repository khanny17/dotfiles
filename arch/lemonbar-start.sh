#!/bin/bash
set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$SCRIPT_DIR/lemonbar.sh | lemonbar -B\#c0000000 -o 0 -f "anonymous pro minus:size=16" -o -1 -f "Font Awesome 5 Free:style=Regular:size=16" -f "Font Awesome 5 Free:style=Solid:size=16"
