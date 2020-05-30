#!/bin/sh 
#	component:   "openEHR ADL Tools"
#	description: "ADL Parser builder script"
#	keywords:    "ADL, parser"
#
#	author:      "Thomas Beale <thomas.beale@openEHR.org>"
#	support:     "http://www.openehr.org/issues/browse/AWB"
#	copyright:   "Copyright (c) 2003- openEHR Foundation <http://www.openEHR.org>"
#	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
#

geyacc --rescue-on-abort -v cadl_parser_14_errs.txt -t CADL_14_TOKENS -o cadl_14_parser.e cadl_14_parser.y
geyacc --doc=html -v cadl_parser_14_errs.txt -t CADL_14_TOKENS -o cadl_14_parser.html cadl_14_parser.y

geyacc --rescue-on-abort -v cadl_parser_2_errs.txt -t CADL_2_TOKENS -o cadl_2_parser.e cadl_2_parser.y
geyacc --doc=html -v cadl_parser_2_errs.txt -t CADL_2_TOKENS -o cadl_2_parser.html cadl_2_parser.y
