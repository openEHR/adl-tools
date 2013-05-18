#!/bin/sh
#
# replace code meta-data fields in EOMF library
#

find . \( -path */EIFGENs/* -o -path '\.git/*' \) -prune -o -name *.bak  -exec rm {} \;
