#!/bin/bash

clock() {
    date '+%b %d %l:%M:%S %p'
}

while :; do
    o=""
    o="${o} %{r} \uf017 $(clock) %{O5}"
    echo -e $o
    sleep 1
done
