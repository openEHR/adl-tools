#!/bin/sh 
#	component:   "openEHR common libraries"
#	description: "Units scanner builder script"
#	keywords:    "units, scanner"
#
#	author:      "Thomas Beale <support@OceanInformatics.biz>"
#	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
#	licence:     "Mozilla Tri-license"
#
#	file:        "% %M% %"
#	version:     "% %I% %"
#	last_change: "% %E% %U% %"
#

$GOBO/bin/gelex units_scanner.l
