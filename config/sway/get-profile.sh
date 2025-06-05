#!/usr/bin/env bash
set -euo pipefail

network_info=$(iwctl station wlan0 show | grep "Connected network")

if [[ "$network_info" == *"brgn"* ]]; then
    echo "home"
elif [[ "$network_info" == *"rium"* ]]; then
    echo "work"
else
    echo "unknown"
fi
