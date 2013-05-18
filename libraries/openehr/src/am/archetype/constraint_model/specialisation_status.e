note
	component:   "openEHR ADL Tools"
	description: "[
				 Status of node definition in source text, i.e. what is define in this archetype, what is inherited, 
				 what is redefined here, what is added here. Specialisation status dominance if given by the ordering:
	                     ss_added > ss_redefined > ss_inherited > ss_propagated
				 ]"
	keywords:    "ADL"

	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2102 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SPECIALISATION_STATUS

inherit
	SPECIALISATION_STATUSES

create
	make

feature -- Initialisation

	make (a_value: INTEGER)
			-- make with an ss_xxx value
		require
			Valid_valid: valid_specialisation_status (a_value)
		do
			value := a_value
		end

feature -- Access

	value: INTEGER
			-- the specialisation status value	

feature -- Comparison

	specialisation_dominant_status (other_status: SPECIALISATION_STATUS): SPECIALISATION_STATUS
			-- determine which of Current and other_status is dominant at a given node, due
			-- to sub-node values; order is:
			-- added, redefined, inherited, propagated
		do
			create Result.make (value.min (other_status.value))
		end

invariant
	Valid_value: valid_specialisation_status (value)

end


