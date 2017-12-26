#!/bin/bash

while :; do
    wal -i $(find ~/bg -type f | shuf -n 1)
    sleep 5
done
