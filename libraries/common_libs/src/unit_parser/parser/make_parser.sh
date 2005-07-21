#!/bin/sh 
#	component:   "Deep Thought Reusable Libraries"
#	description: "Units Parser builder script"
#	keywords:    "units, parser"
#
#	author:      "Thomas Beale <thomas@deepthought.com.au>"
#	copyright:   "Copyright (c) 2000 Deep Thought Informatics Pty Ltd"
#	licence:     "The Eiffel Forum License, version 1"
#
#	file:        "% %M% %"
#	version:     "% %I% %"
#	last_change: "% %E% %U% %"
#

$GOBO/bin/geyacc --new_typing -v parser_errs.txt -t UNITS_TOKENS -o units_parser.e units_parser.y
