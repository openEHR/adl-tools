note
	component:   "openEHR ADL Tools"
	description: "Descriptor of an RM closure node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

class ARCH_LIB_CLOSURE_NODE

inherit
	ARCH_LIB_MODEL_NODE
		redefine
			parent
		end

create
	make

feature -- Initialisation

	make (an_rm_closure_name: STRING; a_bmm_schema: BMM_SCHEMA)
			-- create to represent a RM closure package, e.g. 'EHR', 'DEMOGRAPHIC' etc - these are
			-- packages whose reachability closure provide the classes for archetyping in that closure
		require
			Rm_closure_name_valid: not an_rm_closure_name.is_empty
		do
			bmm_schema := a_bmm_schema
			qualified_name := publisher_qualified_rm_closure_name (bmm_schema.rm_publisher, an_rm_closure_name)
			name := an_rm_closure_name
			group_name := "model_group"
		ensure
			ontological_name_set: qualified_name.is_equal (publisher_qualified_rm_closure_name (bmm_schema.rm_publisher, an_rm_closure_name))
			display_name_set: name = an_rm_closure_name
			Schema_set: bmm_schema = a_bmm_schema
		end

feature -- Access

	bmm_schema: detachable BMM_SCHEMA

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := qualified_key
		end

feature {ARCH_LIB_ITEM} -- Implementation

	parent: detachable ARCH_LIB_CATEGORY_NODE
			-- parent node

end



