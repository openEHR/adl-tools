note
	component:   "openEHR ADL Tools"
	description: "Descriptor of a class node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

class ARCH_LIB_CLASS

inherit
	ARCH_LIB_MODEL_ITEM

create
	make

feature -- Initialisation

	make (an_rm_model_name: STRING; a_class_desc: BMM_CLASS)
			-- create with RM model name and class def
		require
			Rm_model_valid: not an_rm_model_name.is_empty and not an_rm_model_name.has (Package_name_delimiter)
		do
			class_definition := a_class_desc
			bmm_model := class_definition.bmm_model
			qualified_name := bmm_model.rm_publisher + {ARCHETYPE_HRID}.section_separator.out + an_rm_model_name + {ARCHETYPE_HRID}.section_separator.out + class_definition.name
			name := class_definition.name
			group_name := class_definition.entity_category
		ensure
			qualified_name_set: qualified_name.is_equal (bmm_model.rm_publisher + {ARCHETYPE_HRID}.section_separator.out + an_rm_model_name + {ARCHETYPE_HRID}.section_separator.out +  class_definition.name)
			display_name_set: name = class_definition.name
		end

feature -- Access

	class_definition: BMM_CLASS

	bmm_model: BMM_MODEL

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := class_definition.global_artefact_identifier
		end

end



