#!/bin/bash

. ~/.config/conky/env.sh

popup_width="650"

let "popup_x = MON_WIDTH - popup_width - 1"
let "popup_y = DZEN_Y + DZEN_HEIGHT + 1"

output=$(nmcli | sed 's/\t/        /g')
lines=$(echo "$output" | wc -l)

(
    echo "Network Info"

    echo "$output"
) | dzen2 -p -x $popup_x -y $popup_y -w $popup_width -l $lines -ta "l" -sa "l" \
    -e "onstart=uncollapse;button1=exit;button3=exit"
