#!/bin/sh
#
# replace string patterns in files matching a fileglob pattern
#
file_patterns='\*.e
\*.ace
\*.h
\*.c
\*.y
\*.l
\*.sh'

echo "$file_patterns" | while read fp
do
	echo "DOING find . -name $fp -print"
	find . -name "$fp" -print | while read fn
	do
		if [ ! -f $fn.bak ]; then
			cp $fn $fn.bak
		fi
		echo "....DOING sed $fn.bak > $fn"
		sed -e 's/\$Source\$/$URL$/' -e 's/\$Revision\$/$LastChangedRevision$/' -e 's/\$Date\$/$LastChangedDate$/' $fn.bak > $fn
	done
done
