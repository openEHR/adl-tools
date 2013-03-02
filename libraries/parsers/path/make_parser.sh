# 
#	component:   "openEHR Archetype Project"
#	description: "Object Graph Parser builder script"
#	keywords:    "ADL, object graph, parser"
#	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
#	support:     "http://www.openehr.org/issues/browse/AWB"
#	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
#	license:     "Mozilla tri-licence"
#

geyacc --new_typing -v parser_errs.txt -t OG_PATH_TOKENS -o og_path_validator.e og_path_validator.y

geyacc --doc=html -v parser_errs.txt -t OG_PATH_TOKENS -o og_path_validator.html og_path_validator.y
