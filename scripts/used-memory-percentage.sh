#!/usr/bin/env bash

USED_MEMORY=$(free -m | awk 'NR==2{printf "%.0f%\n", $3*100/$2 }')

echo "🧠 $USED_MEMORY"
