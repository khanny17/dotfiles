#!/bin/bash
set -e

__cleanup() {
    pkill lemonbar
}

trap __cleanup PIPE

clock() {
    out=$(date '+%b %d %l:%M:%S %p')
    echo "\uf017 $out"
}

wifi() {
    ssid=$(iw wlp58s0 link | grep SSID)
    if [ -z "$ssid" ] ; then
        echo "\uf00d %{O1} rip"
    else
        echo "\uf1eb %{O1}"
        echo "$ssid" | sed -e "s/.*SSID://"
    fi
}

battery() {
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
}

while :; do
    o=""
    o="%{l} $(clock) %{O10} %{r} $(wifi) %{O5} $(battery)"
    echo -e $o
    sleep 1
done
