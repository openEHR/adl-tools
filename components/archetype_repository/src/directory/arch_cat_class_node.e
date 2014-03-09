note
	component:   "openEHR ADL Tools"
	description: "Descriptor of a class node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

class ARCH_CAT_CLASS_NODE

inherit
	ARCH_CAT_MODEL_NODE

create
	make

feature -- Initialisation

	make (an_rm_closure_name: STRING; a_class_desc: BMM_CLASS_DEFINITION)
			-- create with RM closure package name and class def
		require
			Rm_closure_valid: not an_rm_closure_name.is_empty and not an_rm_closure_name.has (Package_name_delimiter)
		do
			class_definition := a_class_desc
			bmm_schema := class_definition.bmm_schema
			qualified_name := bmm_schema.rm_publisher + {ARCHETYPE_HRID}.section_separator.out + an_rm_closure_name + {ARCHETYPE_HRID}.section_separator.out + class_definition.name
			name := class_definition.name
			group_name := class_definition.type_category
		ensure
			qualified_name_set: qualified_name.is_equal (bmm_schema.rm_publisher + {ARCHETYPE_HRID}.section_separator.out + an_rm_closure_name + {ARCHETYPE_HRID}.section_separator.out +  class_definition.name)
			display_name_set: name = class_definition.name
		end

feature -- Access

	class_definition: BMM_CLASS_DEFINITION

	bmm_schema: detachable BMM_SCHEMA

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := class_definition.global_artefact_identifier
		end

end



