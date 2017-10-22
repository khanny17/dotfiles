#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e -x

# Check if there are changes
git fetch origin
reslog=$(git log HEAD..origin/master --oneline)
if [[ "${reslog}" == ""  ]] ; then
    echo "No changes"
    exit 0
fi

# Pull and run setup again
git pull
$SCRIPT_DIR/setup.sh
