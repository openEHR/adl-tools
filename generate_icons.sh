#!/bin/sh
#
# generate classes from messages files.
#


messages_file_pattern='*.txt'

echo "Generating icon files"
root_dir=$PWD
cd apps/resources/icons
icon_code_gen -f -s source -o compiled 
