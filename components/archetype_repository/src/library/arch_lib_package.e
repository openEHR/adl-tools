note
	component:   "openEHR ADL Tools"
	description: "Descriptor of an RM closure node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

class ARCH_LIB_PACKAGE

inherit
	ARCH_LIB_MODEL_ITEM
		redefine
			parent
		end

create
	make

feature -- Initialisation

	make (a_bmm_model: BMM_MODEL)
			-- create to represent a model namespace, e.g. 'EHR', 'DEMOGRAPHIC' etc - classes in packages in
			-- the namespace can have archetypes in the namespace.
		do
			bmm_model := a_bmm_model
			qualified_name := publisher_qualified_model_name (a_bmm_model)
			name := a_bmm_model.model_name
			group_name := "model_group"
		ensure
			Semantic_name_set: qualified_name.is_equal (publisher_qualified_model_name (a_bmm_model))
			Display_name_set: name = a_bmm_model.model_name
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

	parent: detachable ARCH_LIB_MODEL
			-- parent node

end



