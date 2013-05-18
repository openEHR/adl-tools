#!/bin/sh
#
# replace code meta-data fields in EOMF library
#

find . \( -path */EIFGENs/* -o -path '\.git/*' \) -prune -o -name *.e  -print | while read fn
do
	if [ ! -f $fn.bak ]; then
		cp $fn $fn.bak
	fi
	echo "....DOING sed $fn.bak > $fn"
	sed -e 's/\(component:[ 	]*\)"[^"]*"$/\1"openEHR ADL Tools"/' \
	    -e 's/\(license:[ 	]*\)"[^"]*"$/\1"Apache 2.0 License <http:\/\/www.apache.org\/licenses\/LICENSE-2.0.html>"/' \
	    -e '/^--|.*$/d' $fn.bak > $fn

done
