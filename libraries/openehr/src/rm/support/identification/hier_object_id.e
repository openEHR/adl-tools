note
	component:   "openEHR ADL Tools"

	description: "[
			 Hierarhical object identifiers. The syntax of the value attribute is as follows:
					 [ root '.' ] extension
			 ]"
	keywords:    "object identifiers"
	design:      "openEHR Common Reference Model 1.4.1"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class HIER_OBJECT_ID

inherit
	UID_BASED_ID

create
	make, make_from_string

feature {NONE} -- Initialization

	make (a_root: UID; an_extension: STRING)
			-- build from a UID and optional extension (no extension is indicated by an empty string)
			-- if there is no extension then `value' will be just the UID.value;
			-- if there is an extension, then `value' will have the form "root::extension"
		do
			create value.make (0)
			value.append (a_root.value)
			if not extension.is_empty then
				value.append (extension_separator + an_extension)
			end
		ensure
			Root_set: root.value.is_equal (a_root.value)
			Extension_set: extension.is_equal (an_extension)
		end

feature -- Status Report

	valid_id (a_str: STRING): BOOLEAN
			-- is `a_str' a valid id of the form UID or UID::extension?
		local
			p: INTEGER
			root_str: STRING
		do
			p := extension_separator_position (a_str)
			if p > 1 then
				root_str := a_str.substring (1, p-1)
			else
				root_str := a_str
			end
			Result := attached string_to_uid (root_str)
		end

end



