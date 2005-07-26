indexing
	component:   "openEHR Support Reference Model"
	
	description: "[
			 Hierarhical object identifiers. The syntax of the value attribute is as follows:
					 [ context_id '.' ] local_id '(' version_id ')'
			 ]"
	keywords:    "object identifiers"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class HIER_OBJECT_ID

inherit
	OBJECT_ID

create
	make
	
feature -- Definitions
	
	Context_separator: STRING is "."
	
	Version_start_separator: STRING is "("
	
	Version_end_separator: STRING is ")"

feature -- Initialization

	make(a_context_id, a_local_id, a_version_id:STRING) is
			-- build an external ID
		require
			Context_id_valid: a_context_id /= Void implies not a_context_id.is_empty
			Local_id_exists: a_local_id /= Void and then not a_local_id.is_empty
			Version_id_exists: a_version_id /= Void implies not a_version_id.is_empty
		do
			create value.make(0)
			if a_context_id /= Void then
				value.append(a_context_id + Context_separator)
			end
			value.append(a_local_id)
			if a_version_id /= Void then
				value.append(Version_start_separator + a_version_id + Version_end_separator)
			end
		ensure
			Context_id_set: a_context_id /= Void implies context_id.is_equal(a_context_id)
			Local_id_set: local_id.is_equal(a_local_id)
			Version_id_set: version_id /= Void implies version_id.is_equal(a_version_id)
		end
		
	make_from_string(a_string:STRING) is
			-- make from a string of the same form as `id', i.e. "namespace::class_name:value"
		require
			String_exists: a_string /= Void and then valid_id(a_string)
		do
			
		end
		
feature -- Access

	context_id: STRING is
			-- extract the context id part of the id, if any
		require
			has_context_id
		local
			s: STRING
			ver_sep_pos, local_sep_pos, context_id_pos: INTEGER
		do
			create Result.make(0)
			
			s := value.twin
			s.mirror
			ver_sep_pos := s.substring_index(version_start_separator, 1) -- position in mirrored string if present
			local_sep_pos := s.substring_index_in_bounds(context_separator, ver_sep_pos.max(1), s.count)  -- position in mirrored string
			context_id_pos := s.count - local_sep_pos  -- last_char of context_id in non-mirrored string
			if context_id_pos > 0 then
				Result.append(value.substring(1, context_id_pos))			
			end
		ensure
			Result /= Void
		end

	local_id: STRING is
			-- extract the local id part of the id
		local
			s: STRING
			ver_sep_pos, ver_pos, end_pos, local_sep_pos, local_id_pos: INTEGER
		do
			s := value.twin
			s.mirror
			ver_sep_pos := s.substring_index(version_start_separator, 1) -- position in mirrored string
			local_sep_pos := s.substring_index_in_bounds(context_separator, ver_sep_pos.max(1), s.count)  -- position in mirrored string
			if local_sep_pos > 0 then
				local_id_pos := s.count - local_sep_pos + 2 -- start of local_id in non-mirrored string
			else
				local_id_pos := 1
			end
			ver_pos := value.substring_index(version_start_separator, 1)
			if ver_pos < 1 then
				end_pos := value.count
			else
				end_pos := ver_pos-1
			end
			Result := value.substring(local_id_pos, end_pos)
		ensure
			Result /= Void and then not Result.is_empty
		end
		
	version_id: STRING is
			-- extract the version id part of the id
		local
			ver_start_sep_pos: INTEGER
		do
			ver_start_sep_pos := value.substring_index(version_start_separator, 1)
			create Result.make(0)
			if ver_start_sep_pos > 0 then
				Result.append(value.substring(ver_start_sep_pos+1, value.count-1))
			end
		end
		
	has_context_id: BOOLEAN is
			-- True if there is a context_id part - at least one '.' in id before version part
		do
			Result := value.substring_index(context_separator, 1) > 0
		end

feature -- Modify

	set_version_id(a_str:STRING) is
			-- set version_id
		require
			a_str /= Void and then not a_str.is_empty
		do
			
		end
		
feature -- Status Report

	valid_id(a_str:STRING): BOOLEAN is
			-- 
		do
			-- Result := 
		end

feature -- Output

	as_string: STRING is
			-- string form displayable for humans - e.g. ICD9;1989::M17(en-au)
		do
			create Result.make(0)
			if has_context_id then
				Result.append(context_id)
				Result.append(Context_separator)
			end
			Result.append(local_id)
			if not version_id.is_empty then
				Result.append(version_start_separator)
				Result.append(version_id)
				Result.append(version_end_separator)	
			end
		end

	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			create Result.make(0)
			if has_context_id then
				Result.append("<context_id>" + context_id + "</context_id>")
			end
			Result.append("<local_id>" + local_id + "</local_id>")
			if not version_id.is_empty then
				Result.append("<version_id>" + version_id + "</version_id>")
			end
		end

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
--| The Original Code is hier_object_id.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
