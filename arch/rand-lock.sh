#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
    key="$1"

    UPDATE=false
    LOCK=false

    case $key in
        -u|--update)
            UPDATE=true
            shift # past argument
            ;;
        -l|--lock)
            LOCK=true
            shift # past argument
            ;;
        *)    # unknown option
            POSITIONAL+=("$1") # save it in an array for later
            shift # past argument
            ;;
    esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

###############################################################################
# Wrapper around i3lock to choose a random lockscreen image every time the
# computer is locked
# -----------------------------------------------------------------------------
# Dependencies:
# - xrandr
# - i3lock
# - ffmpeg
# - more undocumented shit
###############################################################################


RAW_DIR=$HOME/bg/raw # The wallpapers to draw from
SCALED_DIR=$HOME/bg/scaled # The scaled wallpapers that this script outputs

# Uses xrandr to grab the screen resolution
get_screen_res() {
    xrandr | grep current | awk -F"current |, maximum" '{print $2}'
}

# Take a file, spit out a scaled/modified file
scale() {
    # $1 = input file, $2 = output filename $3 = resolution
    res=($(get_screen_res))
    ffmpeg -i $1 -vf "scale=${res[0]}:${res[2]},boxblur=5" $2 -y 
}

# Go through the files in the raw folder and scale/modify them
update_scaled() {
    for raw_filename in $RAW_DIR/*; do
        base_raw_filename=$(basename $raw_filename)
        IFS='.' read -ra file_arr <<< "$base_raw_filename"
        res=($(get_screen_res))
        out_filename="${file_arr[0]}"_scaled_"${res[0]}"_"${res[2]}"."${file_arr[1]}"
        scale "$raw_filename" "$SCALED_DIR/$out_filename"
    done
}

lock() {
    #$1 image path
    letterEnteredColor=d23c3dff
    letterRemovedColor=d23c3dff
    passwordCorrect=00000000
    passwordIncorrect=d23c3dff
    background=00000000
    foreground=ffffffff
    i3lock \
        -n -i "$1" \
        --timepos="x-90:h-ch+30" \
        --datepos="tx+24:ty+25" \
        --clock --datestr "Type password to unlock..." \
        --insidecolor=$background --ringcolor=$foreground --line-uses-inside \
        --keyhlcolor=$letterEnteredColor --bshlcolor=$letterRemovedColor --separatorcolor=$background \
        --insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
        --ringvercolor=$foreground --ringwrongcolor=$foreground --indpos="x+280:h-70" \
        --radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
        --textcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground"
}

if [ "$UPDATE" = true ]; then
    update_scaled
elif [ "$LOCK" = true ]; then
    # First check to see if the screen is already locked
    ps aux | grep i3lock | grep -v grep
    if [ "$?" == "1" ]; then
        lock $(find $SCALED_DIR -type f | shuf -n 1)
    fi
else
    echo "Specify --update or --lock. Nothing to do"
fi
