#!/bin/sh
#	component:   "openEHR ADL Tools"
#	description: "ADL scanner builder script"
#	keywords:    "ADL, scanner"
#
#	author:      "Thomas Beale <thomas.beale@openEHR.org>"
#	support:     "http://www.openehr.org/issues/browse/AWB"
#	copyright:   "Copyright (c) 2003- openEHR Foundation <http://www.openEHR.org>"
#	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
#

gelex cadl_14_scanner.l
gelex cadl_2_scanner.l
