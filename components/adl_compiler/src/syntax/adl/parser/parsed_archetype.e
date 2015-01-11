note
	component:   "openEHR ADL Tools"
	description: "Parsed structure for ARCHETYPE"
	keywords:    "ADL, parsing"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class PARSED_ARCHETYPE

inherit
	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
			{ANY} archetype_id_checker, deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			create artefact_type.default_create
			create archetype_id.default_create
			create definition_text.make_empty
			create terminology_text.make_empty
		end

	reset
		do
			create artefact_type.default_create
			create archetype_id.default_create
			parent_archetype_id := Void
			is_generated := False

			definition_text.wipe_out
			terminology_text.wipe_out
			rules_text := Void
		end

feature -- Parse Output

	artefact_type: ARTEFACT_TYPE

	archetype_id: ARCHETYPE_HRID

	is_generated: BOOLEAN

	parent_archetype_id: detachable STRING

	definition_text: STRING

	rules_text: detachable STRING

	terminology_text: STRING

feature -- Modification

	set_artefact_type (an_artefact_type: STRING)
		do
			an_artefact_type.right_adjust
			create artefact_type.make_from_type_name (an_artefact_type)
		end

	set_archetype_id (an_arch_id: STRING)
		require
			archetype_id_checker.valid_id (an_arch_id)
		do
			create archetype_id.make_from_string (an_arch_id)
		end

	set_parent_archetype_id (a_str: STRING)
		do
			parent_archetype_id := a_str
		end

	set_definition_text (a_str: STRING)
		do
			definition_text := a_str
		end

	set_rules_text (a_str: STRING)
		do
			rules_text := a_str
		end

	set_terminology_text (a_str: STRING)
		do
			terminology_text := a_str
		end

	set_is_generated
		do
			is_generated := True
		end

end
