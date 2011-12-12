note
	component:   "openEHR Archetype Project"
	description: "Symbol definitions for YAML syntax"
	keywords:    "YAML, serialisation"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class YAML_SYMBOLS

feature -- Token codes

	Sym_yaml_sequence_start: INTEGER = 6001
	Sym_yaml_sequence_end: INTEGER = 6002
	Sym_yaml_sequence_entry: INTEGER = 6003
	Sym_yaml_item_delimiter: INTEGER = 6005
	Sym_yaml_eq: INTEGER = 6006

end
