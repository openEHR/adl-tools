indexing
	component:   "openEHR Support Reference Model"

	description: "[
				 Abstract model of UID-based identifiers consisting of a root part and an optional extension; 
				 lexical form: root extension_separator extension;
				 default extension_separator is "::"
			     ]"
	keywords:    "object identifiers"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL: http://svn.openehr.org/ref_impl_eiffel/TRUNK/libraries/openehr/src/rm/support/identification/hier_object_id.e $"
	revision:    "$LastChangedRevision: 1874 $"
	last_change: "$LastChangedDate: 2006-02-08 17:57:50 +0000 (Wed, 08 Feb 2006) $"

deferred class UID_BASED_ID

inherit
	OBJECT_ID

feature -- Definitions

	Default_extension_separator: STRING = "::"

feature -- Access

	root: UID is
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
			Result := string_to_uid(value.substring (1, end_pos))
		end

	extension: STRING is
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
--		attribute
--			create Result.make_from_string (Default_extension_separator)
--		end
		do
			if extension_separator_impl = Void then
				create extension_separator_impl.make_from_string (Default_extension_separator)
			end

			Result := extension_separator_impl
		end

feature -- Status Report

	has_extension: BOOLEAN is
			-- True if the extension separator is found
		do
			Result := extension_separator_position (value) > 0
		end

feature -- Output

	as_string: STRING is
			-- string form displayable for humans - e.g. ICD9(1989)::M17
		do
			Result := value.twin
		end

feature {NONE} -- Implementation

	extension_separator_impl: STRING

	extension_separator_position (str: STRING): INTEGER
			-- Return the position of the extension separator, which is considered the last occurrence
			-- in the string where something comes after the separator, if there is more than
			-- one occurrence of it. Else return 0
		require
			string_attached: str /= Void
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

	string_to_uid(s: STRING): UID is
			-- Convert a string to one of the three types of valid UID in openEHR (UUID, ISO_OID,
			-- INTERNET_ID) or else return nothing
		require
			string_valid: s /= Void and then not s.is_empty
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
	Root_valid: root /= Void
	Extension_validity: extension /= Void
	Has_extension_validity: extension.is_empty xor has_extension

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is uid_based_id.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
