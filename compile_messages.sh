#!/bin/sh
#
# generate classes from messages files.
#


messages_file_pattern='*_messages.txt'
msg_gen=$EOMF/tools/spec/windows/bin/msg_code_gen.exe

echo "Generating messages source code from messages/*messages.txt files"
root_dir=$PWD
find . -name messages -type d -print | while read msg_dir
do
	cd $msg_dir
	if ls $messages_file_pattern 1> /dev/null 2>&1; then
		echo "cd $msg_dir; $msg_gen"
		$msg_gen
	fi
	cd $root_dir
done
