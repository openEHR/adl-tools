# 
#	component:   "Deep Thought Reusable Libraries"
#	description: "ADL Parser builder script"
#	keywords:    "ADL, parser"
#
#	author:      "Thomas Beale <thomas@deepthought.com.au>"
#	copyright:   "Copyright (c) 2003-2005 Deep Thought Informatics Pty Ltd"
#	licence:     "The Eiffel Forum License, version 1"
#
#	file:        "$URL$"
#	revision:    "$LastChangedRevision$"
#	last_change: "$LastChangedDate$"
#

$GOBO/bin/geyacc --new_typing -v parser_errs.txt -t ADL_TOKENS -o adl_validator.e adl_validator.y

$GOBO/bin/geyacc --doc=html -v parser_errs.txt -t ADL_TOKENS -o adl_validator.html adl_validator.y
