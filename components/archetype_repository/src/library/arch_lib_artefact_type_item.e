note
	component:   "openEHR ADL Tools"
	description: "Descriptor of a top-level category node in a directory of archetypes, e.g. 'archetype', 'template' etc"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_LIB_ARTEFACT_TYPE_ITEM

inherit
	ARCH_LIB_MODEL_ITEM

create
	make

feature -- Initialisation

	make (a_name: STRING)
			-- create with ontological name of artefact category, e.g. 'archetype', 'template' etc
		require
			a_name_valid: not a_name.is_empty
		do
			qualified_name := a_name
			name := a_name
			group_name := "archetype_category"
		ensure
			ontological_name_set: qualified_name.is_equal (a_name)
			display_name_set: name.is_equal (qualified_name)
		end

feature -- Access

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := qualified_key
		end

end



