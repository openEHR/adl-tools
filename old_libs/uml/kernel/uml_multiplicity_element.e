note
	component:   "openEHR ADL Tools"
	description: "[
			 UML MultiplicityElement abstraction, as defined in OMG UML 2.0 Infrastructure 
			 Specification 2003-09-15.
			 ]"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class UML_MULTIPLICITY_ELEMENT

inherit
	UML_ELEMENT
	
feature -- Modification

	set_single_multiplicity(is_mandatory: BOOLEAN)
			-- make a single cardinality
		do
			if is_mandatory then
				lower := 1
			end
			upper := 1
		end

	set_multiple_multiplicity(min_cardinality, max_cardinality: INTEGER; 
				max_cardinality_infinite, ordered, unique_flag: BOOLEAN)
			-- make a multiple cardinality
		require
			Min_cardinality_valid: min_cardinality >= 0 
			Max_cardinality_valid:  not max_cardinality_infinite implies max_cardinality >= 1
		do
			upper_infinite := max_cardinality_infinite
			lower := min_cardinality
			upper := max_cardinality
			is_ordered := ordered
			is_unique := unique_flag
		end

feature -- Access

	is_ordered: BOOLEAN

	is_unique: BOOLEAN

	lower: INTEGER

	upper: INTEGER
	
	upper_infinite: BOOLEAN

feature -- Modification

invariant

end


