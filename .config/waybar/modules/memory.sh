#!/usr/bin/bash
memorypercentage=$(free -m | grep Mem | awk '{print($3/$2*100)}' |
awk '{print int($1+0.5)}')
echo -e "${memorypercentage}%"
