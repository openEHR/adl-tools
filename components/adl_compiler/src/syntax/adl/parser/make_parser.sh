# 
#	component:   "openEHR ADL Tools"
#	description: "ADL Parser builder script"
#	keywords:    "ADL, parser"
#	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
#	support:     "http://www.openehr.org/issues/browse/AWB"
#	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
#

geyacc --new_typing -v parser_14_errs.txt -t ADL_14_TOKENS -o adl_14_parser.e adl_14_parser.y
geyacc --doc=html -v parser_14_errs.txt -t ADL_14_TOKENS -o adl_14_parser.html adl_14_parser.y

geyacc --new_typing -v parser_15_errs.txt -t ADL_15_TOKENS -o adl_15_parser.e adl_15_parser.y
geyacc --doc=html -v parser_15_errs.txt -t ADL_15_TOKENS -o adl_15_parser.html adl_15_parser.y
