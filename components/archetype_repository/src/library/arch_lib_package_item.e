note
	component:   "openEHR ADL Tools"
	description: "Descriptor of an RM closure node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

class ARCH_LIB_PACKAGE_ITEM

inherit
	ARCH_LIB_MODEL_ITEM
		redefine
			parent
		end

create
	make

feature -- Initialisation

	make (an_rm_closure_name: STRING; a_bmm_model: BMM_MODEL)
			-- create to represent a RM closure package, e.g. 'EHR', 'DEMOGRAPHIC' etc - these are
			-- packages whose reachability closure provide the classes for archetyping in that closure
		require
			Rm_closure_name_valid: not an_rm_closure_name.is_empty
		do
			bmm_model := a_bmm_model
			qualified_name := publisher_qualified_rm_closure_name (a_bmm_model.rm_publisher, an_rm_closure_name)
			name := an_rm_closure_name
			group_name := "model_group"
		ensure
			Semantic_name_set: qualified_name.is_equal (publisher_qualified_rm_closure_name (a_bmm_model.rm_publisher, an_rm_closure_name))
			Display_name_set: name = an_rm_closure_name
			Model_set: bmm_model = a_bmm_model
		end

feature -- Access

	bmm_model: detachable BMM_MODEL

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := qualified_key
		end

feature {ARCH_LIB_ITEM} -- Implementation

	parent: detachable ARCH_LIB_ARTEFACT_TYPE_ITEM
			-- parent node

end



