#!/bin/bash

if [ -r ~/.bashrc ]; then
	source ~/.bashrc
fi

echo -----------------------------------------
echo Launching ADL Workbench

"`dirname \"\`dirname \"$0\"\`\"`"/Resources/adl_workbench &
