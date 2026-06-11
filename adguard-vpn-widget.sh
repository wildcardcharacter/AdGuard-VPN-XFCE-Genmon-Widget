#!/bin/bash

VPN="/usr/local/bin/adguardvpn-cli"

STATUS=$($VPN status 2>/dev/null | sed -r 's/\x1B\[[0-9;]*[mK]//g')

if echo "$STATUS" | grep -q "Connected to"; then
    LOCATION=$(echo "$STATUS" | grep "Connected to" | awk '{print $3}')

    echo "<txt><span foreground='lime'>VPN $LOCATION</span></txt>"
    echo "<tool>AdGuard VPN verbunden

Standort: $LOCATION

Klick zum Standort wechseln oder trennen</tool>"
else
    echo "<txt><span foreground='red'>VPN aus</span></txt>"
    echo "<tool>AdGuard VPN getrennt

Klick zum Verbinden</tool>"
fi

echo "<txtclick>/home/markus/.local/bin/adguard-vpn-select.sh</txtclick>"