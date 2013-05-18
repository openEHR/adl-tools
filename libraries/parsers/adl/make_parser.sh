# 
#	component:   "openEHR ADL Tools"
#	description: "ADL Parser builder script"
#	keywords:    "ADL, parser"
#	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
#	support:     "http://www.openehr.org/issues/browse/AWB"
#	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
#

geyacc --new_typing -v parser_errs.txt -t ADL_TOKENS -o adl_validator.e adl_validator.y

geyacc --doc=html -v parser_errs.txt -t ADL_TOKENS -o adl_validator.html adl_validator.y
