# 
#	component:   "openEHR Archetype Project"
#	description: "Object Graph Parser builder script"
#	keywords:    "ADL, object graph, parser"
#
#	author:      "Thomas Beale <thomas@deepthought.com.au>"
#	copyright:   "Copyright (c) 2003, 2004 Deep Thought Informatics Pty Ltd"
#	licence:     "Mozilla tri-license 1.1"
#
#	file:        "$URL$"
#	version:     "$LastChangedRevision$"
#	last_change: "$LastChangedDate$"
#

$GOBO/bin/geyacc --new_typing -v parser_errs.txt -t OG_PATH_TOKENS -o og_path_validator.e og_path_validator.y
