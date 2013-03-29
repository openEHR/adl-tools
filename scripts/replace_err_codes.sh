#!/bin/sh
#
# replace string patterns of the form 'add_error ("some_code"' with 'add_error (ec_some_code'
#

find . -path */EIFGENs/* -prune  -o -name *.y  -print | xargs egrep -l "add_error|add_warning|add_info|get_text|get_msg" | while read fn
do
	if [ ! -f $fn.bak ]; then
		cp $fn $fn.bak
	fi
	echo "....DOING sed $fn.bak > $fn"
	sed -e 's/add_error \?("\([^"]\+\)"/add_error (ec_\1/' \
	    -e 's/add_warning \?("\([^"]\+\)"/add_warning (ec_\1/' \
	    -e 's/add_info \?("\([^"]\+\)"/add_info (ec_\1/' \
	    -e 's/get_text \?("\([^"]\+\)"/get_text (ec_\1/' \
	    -e 's/get_msg \?("\([^"]\+\)"/get_msg (ec_\1/' $fn.bak > $fn
done
