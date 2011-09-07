#!/bin/bash

if [ -r ~/.bashrc ]; then
	source ~/.bashrc
fi

open -a Console

echo -----------------------------------------
echo Launching ADL Workbench

"`dirname \"\`dirname \"$0\"\`\"`"/Resources/adl_workbench &
