#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$SCRIPT_DIR/lemonbar.sh | lemonbar -o 0 -f "anonymous pro minus:size=10" -o -2 -f "Font Awesome:size=10"
