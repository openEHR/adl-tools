note
	component:   "openEHR ADL Tools"
	description: "Descriptor of a top-level BMM model in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

class ARCH_LIB_MODEL

inherit
	ARCH_LIB_MODEL_ITEM
		redefine
			parent
		end

create
	make

feature -- Initialisation

	make (a_bmm_model: BMM_MODEL)
			-- create to represent a top-level BMM model
		do
			bmm_model := a_bmm_model
			qualified_name := a_bmm_model.model_id
			name := a_bmm_model.model_id
			group_name := "model"
		ensure
			Semantic_name_set: qualified_name.is_equal (a_bmm_model.model_id)
			Display_name_set: name.is_equal (a_bmm_model.model_id)
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
