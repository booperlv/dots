#!/usr/bin/bash

interval=2

while true; do
    memorystring=$(free -m | grep Mem | awk '{print($3"/"$2)}')
    echo "memory|string|$memorystring"
    echo ""
    sleep "${interval}"
done

