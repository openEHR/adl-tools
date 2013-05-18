note
	component:   "openEHR ADL Tools"

	description: "[
				 Abstract model of UID-based identifiers consisting of a root part and an optional extension; 
				 lexical form: root extension_separator extension;
				 default extension_separator is "::"
			     ]"
	keywords:    "object identifiers"
	design:      "openEHR Common Reference Model 1.4.1"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class UID_BASED_ID

inherit
	OBJECT_ID

feature -- Definitions

	Default_extension_separator: STRING = "::"

feature -- Access

	root: UID
			-- The identifier of the conceptual namespace in which the object exists,
			-- within the identification scheme.  Returns the part to the left of the
			-- last extension separator, if any, or else the whole string.
		local
			end_pos: INTEGER
		do
			end_pos := extension_separator_position (value) - 1
			if extension_separator_position (value) <= 0 then
				end_pos := value.count
			end
			check attached string_to_uid (value.substring (1, end_pos)) as uid then
				Result := uid
			end
		end

	extension: STRING
			-- Optional local identifier of the object within the context of the root identifier.
			-- Returns the part to the right of the first extension separator if any, or else any empty String.
		local
			p: INTEGER
		do
			create Result.make_empty
			p := extension_separator_position (value)
			if p > 0 then
				Result.append (value.substring (p + Extension_separator.count, value.count))
			end
		end

	extension_separator: STRING
			-- extension separator used for this Id instance; typically defaults to
			-- `Default_extension_separator' but may be set to something else
		attribute
			create Result.make_from_string (Default_extension_separator)
		end

feature -- Status Report

	has_extension: BOOLEAN
			-- True if the extension separator is found
		do
			Result := extension_separator_position (value) > 0
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans - e.g. ICD9(1989)::M17
		do
			Result := value.twin
		end

feature {NONE} -- Implementation

	extension_separator_position (str: STRING): INTEGER
			-- Return the position of the extension separator, which is considered the last occurrence
			-- in the string where something comes after the separator, if there is more than
			-- one occurrence of it. Else return 0
		local
			i, sep_pos: INTEGER
		do
			-- search for final position of extension separator (since there could be
			-- earlier ones, e.g. '.' in Oids. Also note we don't use mirror and search
			-- from back, since the extension separator itself would be mirrored
			-- and is not guaranteed to be symmetric... so do it the old school way
			sep_pos := 1
			from i := 1 until sep_pos = 0 or i > str.count loop
				sep_pos := str.substring_index (extension_separator, i)
				if sep_pos > 0 and sep_pos + extension_separator.count <= str.count then
					Result := sep_pos
				end
				i := sep_pos + extension_separator.count
			end
		end

	string_to_uid (s: STRING): detachable UID
			-- Convert a string to one of the three types of valid UID in openEHR (UUID, ISO_OID,
			-- INERNET_ID) or else return nohting
		require
			string_valid: not s.is_empty
		local
			test_id: UID
		do
			create {UUID} test_id.default_create
			if test_id.valid_id (s) then
				create {UUID} Result.make(s)
			else
				create {ISO_OID} test_id.default_create
				if test_id.valid_id (s) then
					create {ISO_OID} Result.make(s)
				else
					create {INTERNET_ID} test_id.default_create
					if test_id.valid_id (s) then
						create {INTERNET_ID} Result.make(s)
					else
						-- error
					end
				end
			end
		end

invariant
	Has_extension_validity: extension.is_empty xor has_extension

end


