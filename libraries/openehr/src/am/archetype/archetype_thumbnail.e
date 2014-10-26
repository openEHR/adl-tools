note
	component:   "openEHR ADL Tools"
	description: "[
				 A thumbnail version of an archetype, suitable for building from a simple parser like ARCHETYPE_MINI_PARSER,
				 designed to extract key data from the header of the archetype, sufficient to allow building of the archetpe
				 directory, and setting of flags in the GUI.
				 ]"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_THUMBNAIL

inherit
	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, valid_standard_version
		end

create
	make

feature -- Initialisation

	make (an_adl_version, an_id: STRING; id_is_old_style_flag: BOOLEAN; artefact_type_str: STRING; is_differential_flag, is_generated_flag: BOOLEAN)
		do
			adl_version := an_adl_version
			create archetype_id.make_from_string (an_id)
			archetype_id_is_old_style := id_is_old_style_flag
			artefact_type := (create {ARTEFACT_TYPE}).type_name_to_type (artefact_type_str)
			is_differential := is_differential_flag
			is_generated := is_generated_flag
		end

feature -- Access

	archetype_id: ARCHETYPE_HRID

	adl_version: STRING
			-- ADL version of this archetype

	artefact_type: INTEGER
			-- design type of artefact, archetype, template, template-component, etc

	parent_archetype_id: detachable STRING
			-- id of specialisation parent of this archetype

	other_details: detachable HASH_TABLE [STRING, STRING]

feature -- Status Report

	is_generated: BOOLEAN
			-- True if this archetype was generated from another one, rather than being an original authored archetype

	is_differential: BOOLEAN
			-- archetype is source form archetype

	is_template: BOOLEAN
			-- True if `artefact_type' is any type other than archetype
		do
			Result := artefact_type = (create {ARTEFACT_TYPE}).template
		end

	is_specialised: BOOLEAN
			-- True if a 'specialise' statement with a parent archetype id was found
		do
			Result := attached parent_archetype_id
		end

	is_legacy: BOOLEAN
		do
			Result := adl_version.is_equal (adl_14_version)
		end

	archetype_id_is_old_style: BOOLEAN
			-- True if the id has an old-style non-conformant form, e.g. with 'draft' in the version id part

	parent_archetype_id_is_old_style: BOOLEAN
			-- True if the parent_id has an old-style non-conformant form, e.g. with 'draft' in the version id part

	differential_generated: BOOLEAN
			-- True if the differential form was generated
		do
			Result := is_differential and is_generated
		end

feature -- Modification

	set_parent_archetype_id (an_id: STRING; id_is_old_style_flag: BOOLEAN)
		do
			parent_archetype_id := an_id
			parent_archetype_id_is_old_style := id_is_old_style_flag
		end

	set_other_details (an_other_details: HASH_TABLE [STRING, STRING])
		do
			other_details := an_other_details
		end

end


