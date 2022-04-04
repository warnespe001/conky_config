#!/bin/bash

. ~/.config/conky/env.sh

HOST=$(uname -n)
KERNEL=$(uname -r)
UPTIME=$( uptime | sed 's/.* up //' | sed 's/[0-9]* us.*//' | sed 's/ day, /d /'\
          | sed 's/ days, /d /' | sed 's/:/h /' | sed 's/ min//'\
            |  sed 's/,/m/' | sed 's/  / /')
PACKAGES=$(pacman -Q | wc -l)
UPDATED=$(awk '/upgraded/ {line=$0;} END { $0=line; gsub(/[\[\]]/,"",$0); \
          printf "%s %s",$1,$2;}' /var/log/pacman.log)

popup_width="400"

let "popup_x = MON_WIDTH - popup_width - 1"
let "popup_y = DZEN_Y + DZEN_HEIGHT + 1"

(
    echo "System Information"

    echo "^fg(\\#8be9fd)Host:^fg() $HOST"
    echo "^fg(\\#8be9fd)Kernel:^fg() $Kernel"
    echo "^fg(\\#8be9fd)Uptime:^fg() $UPTIME"
    echo "^fg(\\#8be9fd)Pacman:^fg() $PACKAGES packages"
    echo "^fg(\\#8be9fd)Last updated:^fg() $UPDATED"
) | dzen2 -p -x $popup_x -y $popup_y -w $popup_width -l "5" -ta "l" -sa "l" \
    -e "onstart=uncollapse;button1=exit;button3=exit"
