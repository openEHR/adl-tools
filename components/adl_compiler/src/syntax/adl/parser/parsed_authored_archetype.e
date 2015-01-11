note
	component:   "openEHR ADL Tools"
	description: "Parsed structure for AUTHORED_ARCHETYPE"
	keywords:    "ADL, parsing"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class PARSED_AUTHORED_ARCHETYPE

inherit 
	PARSED_ARCHETYPE
		redefine
			make, reset
		end

create
	make

feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			precursor
			create other_metadata.make (0)
			create language_text.make_empty
			create adl_version.make_empty
			create rm_release.make_empty
		end

	reset
		do
			precursor
			adl_version.wipe_out
			rm_release.wipe_out
			other_metadata.wipe_out
			uid := Void
			is_controlled := False

			language_text.wipe_out
			description_text := Void
			annotations_text := Void
			component_terminologies_text := Void
		end

feature -- Parse Output

	other_metadata: HASH_TABLE [STRING, STRING]

	adl_version: STRING

	rm_release: STRING

	uid: detachable HIER_OBJECT_ID

	is_controlled: BOOLEAN

	language_text: STRING

	description_text: detachable STRING

	annotations_text: detachable STRING

	component_terminologies_text: detachable STRING

feature -- Modification 

	put_other_metadata_item (a_key, a_value: STRING)
		do
			other_metadata.put (a_value, a_key)
		end

	set_is_controlled
		do
			is_controlled := True
		end

	set_uid (a_str: STRING)
		do
			create uid.make_from_string (a_str)
		end

	set_adl_version (a_str: STRING)
		do
			adl_version := a_str
		end

	set_rm_release (a_str: STRING)
		do
			rm_release := a_str
		end

	set_language_text (a_str: STRING)
		do
			language_text := a_str
		end

	set_description_text (a_str: STRING)
		do
			description_text := a_str
		end

	set_annotations_text (a_str: STRING)
		do
			annotations_text := a_str
		end

	set_component_terminologies_text (a_str: STRING)
		do
			component_terminologies_text := a_str
		end

end
