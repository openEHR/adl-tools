#!/bin/sh
#	component:   "openEHR ADL Tools"
#	description: "ADL scanner builder script"
#	keywords:    "ADL, scanner"
#
#	author:      "Thomas Beale"
#	support:     "Ocean Informatics <support@OceanInformatics.com>"
#	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
#	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
#

gelex cadl_14_scanner.l
gelex cadl_2_scanner.l
