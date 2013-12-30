note
	component:   "openEHR ADL Tools"
	description: "Serialiser Manager for archetype definition"
	keywords:    "archetype constraint definition"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_SERIALISER_MGR

inherit
	SHARED_C_SERIALISERS

	C_ITERATOR
		rename
			make as iterator_make
		end

create
	make

feature -- Initialisation

	make(a_target: C_COMPLEX_OBJECT; format: STRING; a_terminology: ARCHETYPE_TERMINOLOGY)
			-- create a new manager targetted to the parse tree `a_target'
		require
			Format_valid: has_c_serialiser_format(format)
		do
			set_target(a_target)
			visitor := c_serialiser_for_format(format)
			visitor.initialise(a_terminology)
		end

feature -- Command

	serialise
			-- start the serialisation process; the result will be in `serialiser_output'
		do
			do_all
			visitor.finalise
		end

feature -- Access

	last_result: STRING
		do
			Result := visitor.last_result
		end

feature {NONE} -- Implementation

	visitor: C_SERIALISER

end


