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
			make
		end

create
	make

feature {NONE} -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			precursor
			create language_text.make_empty
			create adl_version.make_empty
			create rm_release.make_empty
		end

feature -- Parse Output

	other_metadata: detachable HASH_TABLE [STRING, STRING]

	adl_version: STRING

	rm_release: STRING

	uid: detachable HIER_OBJECT_ID

	is_controlled: BOOLEAN

	language_text: STRING

	description_text: detachable STRING

	annotations_text: detachable STRING

	component_terminologies_text: detachable STRING

	language_text_start_line: INTEGER

	description_text_start_line: INTEGER

	annotations_text_start_line: INTEGER

	component_terminologies_text_start_line: INTEGER

feature -- Modification

	put_other_metadata_item (a_key, a_value: STRING)
		local
			omd: HASH_TABLE [STRING, STRING]
		do
			if attached other_metadata as att_omd then
				omd := att_omd
			else
				create omd.make (0)
				other_metadata := omd
			end
			omd.put (a_value, a_key)
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

	set_language_text_start_line (a_line: INTEGER)
		do
			language_text_start_line := a_line
		end

	set_description_text_start_line (a_line: INTEGER)
		do
			description_text_start_line := a_line
		end

	set_annotations_text_start_line (a_line: INTEGER)
		do
			annotations_text_start_line := a_line
		end

	set_component_terminologies_text_start_line (a_line: INTEGER)
		do
			component_terminologies_text_start_line := a_line
		end

end
