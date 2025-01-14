note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_OBJECT"
	keywords:    "persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_C_OBJECT

inherit
	P_ARCHETYPE_CONSTRAINT

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all;
		end

feature -- Initialisation

	make (a_co: C_OBJECT)
		do
			rm_type_name := a_co.rm_type_name
			node_id := a_co.node_id
			occurrences := a_co.occurrences
			sibling_order := a_co.sibling_order
			is_deprecated := a_co.is_deprecated
		end

feature -- Access

	rm_type_name: STRING
			-- type name from reference model, of object to instantiate

	node_id: STRING
		attribute
			create Result.make_from_string (unknown_value)
		end

	occurrences: detachable MULTIPLICITY_INTERVAL

	sibling_order: detachable SIBLING_ORDER
			-- set if this node should be ordered with respect to an inherited sibling; only settable
			-- on specialised nodes

feature -- Status Report

	is_deprecated: BOOLEAN

feature -- Factory

	populate_c_instance (a_co: C_OBJECT)
			-- populate fields not already populated from creation of a C_XXX instance
		do
			a_co.set_root_node_id (node_id)
			if attached occurrences as occ then
				a_co.set_occurrences (occ)
			end
			if attached sibling_order as so then
				a_co.set_sibling_order (so)
			end
			a_co.set_is_deprecated (is_deprecated)
		end

end


