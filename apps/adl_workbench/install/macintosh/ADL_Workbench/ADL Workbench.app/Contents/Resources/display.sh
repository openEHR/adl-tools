#!/bin/sh

if [ "$DISPLAY"x == "x" ]; then
    echo :0 > "$ETC/display"
else
    echo $DISPLAY > "$ETC/display"
fi
