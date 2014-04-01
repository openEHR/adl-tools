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
			create binding_code_map.make (0)
		end

feature -- Access

    value_sets: HASH_TABLE [VALUE_SET, STRING]
    		-- table of value sets keyed by ac-code (value set id)

	term_bindings: HASH_TABLE [HASH_TABLE [URI, STRING], STRING]
			-- table of term-bindings to external resources, keyed by external terminology
			-- namespace. Each inner Hash is keyed by at-code.

	binding_code_map: HASH_TABLE [STRING, STRING]
			-- internal at-codes keyed by external codes that have bindings

end


