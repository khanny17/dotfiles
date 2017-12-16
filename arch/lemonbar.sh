#!/bin/bash
set -e

__cleanup() {
    pkill lemonbar
}

trap __cleanup PIPE

clock() {
    date '+%b %d %l:%M:%S %p'
}

wifi() {
    ssid=$(iw wlp58s0 link | grep SSID)
    if [ -z "$ssid" ] ; then
        echo "\uf00d %{O2} rip"
    else
        echo "\uf1eb %{O2}"
        echo "$ssid" | sed -e "s/.*SSID://"
    fi
}

while :; do
    o=""
    o="%{l} \uf017 $(clock) %{O50} %{r} $(wifi)"
    echo -e $o
    sleep 1
done
