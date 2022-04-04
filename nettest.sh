#!/bin/bash

fg_color=""
img="^i(/home/sanctity/.config/conky/xbm/windelicato/wifi_02.xbm)"

# Check to see if wlan0 is up
ip link show wlan0 | grep UP &> /dev/null
if [[ $? == 0 ]]; then
    # Run nmcli to see if we're connected to the network
    if [[ $(nmcli g | awk '/^connected/ {print "y"}') == "y" ]]; then
        # Ping Google to see if we actually have an internet connection
        ping -c 1 google.com &> /dev/null
        if [[ $? == 0 ]]; then
            # We passed all the tests, show green.
            fg_color="^fg(\\#50fa7b)"
        else
            # We're connected to a network, but not the internet.
            fg_color="^fg(\\#f1fa8c)"
        fi
    else
        # We're not connected to a network.
        fg_color="^fg(\\#ffb86c)"
    fi
else
    # wlan0 isn't even up.
    fg_color="^fg(\\#ff5555)"
fi

echo "$fg_color$img^fg()"
