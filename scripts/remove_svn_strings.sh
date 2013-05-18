#!/bin/sh
#
# remove SVN strings from source files
#

find . \( -path */EIFGENs/* -o -path '\.git/*' \) -prune -o -name *.[ely]  -print | while read fn
do
	if [ ! -f $fn.bak ]; then
		cp $fn $fn.bak
	fi
	echo "....DOING sed $fn.bak > $fn"
	sed -e '/\$URL\$/d' -e '/\$LastChangedRevision\$/d' -e '/\$LastChangedDate\$/d' $fn.bak > $fn

done
