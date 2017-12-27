#!/bin/bash

while :; do
    wal -i $(find ~/bg/raw -type f | shuf -n 1)
    sleep $((15 * 60))
done
