#!/bin/bash

if [ -r ~/.bashrc ]; then
	source ~/.bashrc
fi

open -a Console

echo -----------------------------------------
echo Launching ADL Workbench

if [ `uname -r | sed 's/\..*//'` == 8 ]; then
	if [ -z "$DISPLAY" ]; then
		echo 'Setting DISPLAY environment variable to default value.'
		export DISPLAY=:0.0
	fi

	if [ -z "`ps -wx -ocommand | grep -e '[X]11'`" -a ! -f ~/.xinitrc ]; then
		echo 'Opening X11 directly, with modified copy of xinitrc to prevent redundant xterm window.'
        echo "rm -f ~/.xinitrc" > ~/.xinitrc
		sed 's/xterm/# xterm/' /usr/X11R6/lib/X11/xinit/xinitrc >> ~/.xinitrc
		open -a X11
	fi
fi

"`dirname \"\`dirname \"$0\"\`\"`"/Resources/adl_workbench &
