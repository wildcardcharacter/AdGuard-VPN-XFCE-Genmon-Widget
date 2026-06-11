#!/bin/bash

VPN="/usr/local/bin/adguardvpn-cli"

CHOICE=$(zenity --list \
    --print-column=2 \
    --title="AdGuard VPN" \
    --width=500 \
    --height=420 \
    --text="VPN-Standort auswählen" \
    --column="Standort" \
    --column="Code" \
    "Frankfurt / Deutschland" "Frankfurt" \
    "Berlin / Deutschland" "Berlin" \
    "Amsterdam / Niederlande" "Amsterdam" \
    "Zürich / Schweiz" "Zurich" \
    "Wien / Österreich" "Vienna" \
    "Paris / Frankreich" "Paris" \
    "London / Großbritannien" "London" \
    "New York / USA" "New York" \
    "VPN trennen" "DISCONNECT" \
    2>/dev/null)

[ -z "$CHOICE" ] && exit 0

if [ "$CHOICE" = "DISCONNECT" ]; then
    "$VPN" disconnect >/dev/null 2>&1
else
    "$VPN" connect -l "$CHOICE" >/dev/null 2>&1
fi