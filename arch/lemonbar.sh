#!/bin/bash
set -e

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

__cleanup() {
    pkill lemonbar
}

trap __cleanup PIPE

clock() {
    out=$(date '+%b %d %l:%M%P')
    echo "\uf017" # clock icon
    echo "$out"
}

wifi() {
    ssid=$(iw wlp58s0 link | grep SSID)
    if [ -z "$ssid" ] ; then
        echo "\uf00d %{O1}"
        echo "rip"
    else
        echo "\uf1eb %{O1}"
        echo "$ssid" | sed -e "s/.*SSID://"
    fi
}

battery() {
#TODO make battery red when low
    cap=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ "$?" -eq "0" ] ; then
        # Cool, we got a value
        if [ "$cap" -gt "75" ] ; then
            echo "\uf240"
        elif [ "$cap" -gt "50" ] ; then
            echo "\uf241"
        elif [ "$cap" -gt "25" ] ; then
            echo "\uf242"
        elif [ "$cap" -gt "10" ] ; then
            echo "\uf243"
        else
            echo "\uf244"
        fi
    fi

    #Show icon if charging
#    cat /sys/class/power_supply/BAT0/status |\
#        grep -q Discharging && charging=false || charging=true
#    if [ "$?" -eq "0" ] ; then
#        # Cool, we got a value
#        if $charging; then
#            echo "%{O2} \uf1e6"
#        fi
#    fi
}

music_title() {
    STATUS=$(playerctl status 2>/dev/null)
    if (( $? != 0 )) ; then
        # Not working, probs just nothing open
        return 1
    fi

    # First arg is counter
    if [ "$1" -eq "0" ] ; then
        playerctl metadata title
    elif [ "$1" -eq "1" ] ; then
        playerctl metadata artist
    fi
}

music_status() {
    STATUS=$(playerctl status 2>/dev/null)
    if (( $? != 0 )) ; then
        # Not working, probs just nothing open
        return 1
    fi

    # determine if playing
    echo $STATUS|\
        grep -q Playing && playing=true || playing=false

    # determine if paused
    echo $STATUS|\
        grep -q Paused && paused=true || paused=false

    if $playing; then
        echo "\uf04b"
        echo "%{O2}"
    elif $paused; then
        echo "\uf04c"
        echo "%{O2}"
    fi

}

volume() {
    level=$(\
        pactl list sinks |\
        grep '^[[:space:]]Volume:' |\
        head -n $(( $SINK + 1 )) |\
        tail -n 1 |\
        sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

    using_headphones=$(amixer sget Headphone |
        tail -n 1 |
        sed -n 's/.*\[\(.*\)\].*\[.*\].*\]/\1/p')
    if [ -z "$using_headphones" ] ; then
        echo
    else
        if [ "$using_headphones" != "0%" ] ; then
            echo "\uf025"
        fi
    fi

    using_speaker=$(amixer sget Speaker |
        tail -n 1 |
        sed -n 's/.*\[\(.*\)\].*\[.*\].*\]/\1/p')
    if [ -z "$using_speaker" ] ; then
        echo
    elif [ "$using_speaker" == "0%" ] ; then
        echo
    else
        # Cool, we got a value
        if [ "$level" -gt "50" ] ; then
            echo "\uf028"
        elif [ "$level" -gt "1" ] ; then
            echo "\uf027"
        else
            echo "\uf026"
        fi
    fi

    # echo "$level"%
}

msgs() {
    # Do a nonblocking read of the fifo. If there is something new, show stuff!
    read -t 0.5 DAMMIT < /tmp/lemonbar-msgs-fifo #TODO
}

brightness() {
    level=$(xbacklight -get)
    echo "\uf185" %{O1} ${level:0:2}
}

music_title_cycle=0
cycle_fraction=0
while :; do
    o=""
    o="%{l} $(wifi) %{O4} 
       $(music_status) $(music_title $music_title_cycle)
       %{r} $(clock) %{O2} $(volume) %{O2}
       $(battery)"
    echo -e $o
    sleep 1

    if (( $cycle_fraction == 10 )) ; then
        music_title_cycle=$(((music_title_cycle+1) % 2))
        cycle_fraction=0
    fi
    cycle_fraction=$((cycle_fraction+1))

done
