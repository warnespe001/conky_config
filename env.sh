#!/bin/bash

export MON_WIDTH="2256"
export MON_HEIGHT="1504"

let dzen_width=900
let dzen_height=20

let "dzen_x = $MON_WIDTH - $dzen_width"
let dzen_y=0

export DZEN_WIDTH=$dzen_width
export DZEN_HEIGHT=$dzen_height
export DZEN_X=$dzen_x
export DZEN_Y=$dzen_y
