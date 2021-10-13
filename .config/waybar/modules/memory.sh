#!/usr/bin/bash
memorystring=$(free -m | grep Mem | awk '{print($3"/"$2)}')
echo -e "${memorystring}"
