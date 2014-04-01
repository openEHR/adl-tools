#!/bin/sh 
#	component:   "openEHR ADL Tools"
#	description: "ADL Parser builder script"
#	keywords:    "ADL, parser"
#
#	author:      "Thomas Beale"
#	support:     "Ocean Informatics <support@OceanInformatics.biz>"
#	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
#	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
#

geyacc --new_typing --rescue-on-abort -v cadl_parser_14_errs.txt -t CADL_14_TOKENS -o cadl_14_parser.e cadl_14_parser.y
geyacc --doc=html -v cadl_parser_14_errs.txt -t CADL_14_TOKENS -o cadl_14_parser.html cadl_14_parser.y

geyacc --new_typing --rescue-on-abort -v cadl_parser_15_errs.txt -t CADL_15_TOKENS -o cadl_15_parser.e cadl_15_parser.y
geyacc --doc=html -v cadl_parser_15_errs.txt -t CADL_15_TOKENS -o cadl_15_parser.html cadl_15_parser.y
