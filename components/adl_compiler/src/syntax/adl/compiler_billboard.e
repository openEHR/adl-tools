note
	component:   "openEHR ADL Tools"
	description: "COMPILER_BILLBOARD for sharing ad hoc context across compiler stages"
	keywords:    "ADL, parser, serialiser"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class COMPILER_BILLBOARD

create
	initialise

feature -- Initialisation

	initialise
		do
			create value_sets.make (0)
			create term_bindings.make (0)
		end

feature -- Access

    value_sets: HASH_TABLE [VALUE_SET_RELATION, STRING]

	term_bindings: HASH_TABLE [HASH_TABLE [URI, STRING], STRING]

end


