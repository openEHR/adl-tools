#!/bin/sh
#
# generate classes from messages files.
#


messages_file_pattern='*.txt'
msg_gen="$EOMF/tools/spec/windows/bin/msg_code_gen.exe -c ADL_MESSAGES"

echo "Generating messages source code from messages/*.txt files"
root_dir=$PWD
find . -name messages -type d -print | while read msg_dir
do
	msg_src_dir=$msg_dir/source
	cd $msg_src_dir
	if ls $messages_file_pattern 1> /dev/null 2>&1; then
		echo "cd $msg_src_dir; $msg_gen"
		$msg_gen
		mv *.e ../compiled
	fi
	cd $root_dir
done
