# 
#	component:   "openEHR ADL Tools"
#	description: "ADL Parser builder script"
#	keywords:    "ADL, parser"
#	author:      "Thomas Beale <thomas.beale@openEHR.org>"
#	support:     "http://www.openehr.org/issues/browse/AWB"
#	copyright:   "Copyright (c) 2003- openEHR Foundation <http://www.openEHR.org>"
#	licence:     "Apache 2.0 license"
#

geyacc --rescue-on-abort -v parser_14_errs.txt -t ADL_14_TOKENS -o adl_14_parser.e adl_14_parser.y
geyacc --doc=html -v parser_14_errs.txt -t ADL_14_TOKENS -o adl_14_parser.html adl_14_parser.y

geyacc --rescue-on-abort -v parser_2_errs.txt -t ADL_2_TOKENS -o adl_2_parser.e adl_2_parser.y
geyacc --doc=html -v parser_2_errs.txt -t ADL_2_TOKENS -o adl_2_parser.html adl_2_parser.y
