note
	component:   "openEHR ADL Tools"
	description: "[
				 Comparator of two archetypes.
		         ]"
	keywords:    "archetype, comparison, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ARCHETYPE_COMPARATOR

create
	make

feature -- Initialisation

	make(a_reference_archetype, an_other_archetype: ARCHETYPE)
			-- create with two archetypes for comparison
		require
			Valid_reference_archetype: valid_reference_archetype(a_reference_archetype)
			An_other_archetype_valid: an_other_archetype /= Void
		do
			reference_archetype := a_reference_archetype
			other_archetype := an_other_archetype
		end

feature -- Access

	reference_archetype: ARCHETYPE
			-- reference archetype

	other_archetype: ARCHETYPE
			-- archetype being compared

feature -- Comparison

	is_specialised: BOOLEAN
			-- True if other_archetype is a legal specialisation of reference_archetype
		do
		end

	diff: ARCHETYPE_DIFF
			-- Generate a diff object from the two archetypes
		do
		ensure
			Result_exists: Result /= Void
		end

feature {NONE} -- Implementation

end


