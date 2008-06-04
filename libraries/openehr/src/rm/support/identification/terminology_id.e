indexing
	component:   "openEHR Common Reference Model"

	description: "[
			 Terminology identifier subtype of OBJECT_ID. The syntax of the value 
			 attribute is as follows:
					name '(' version ')'
			 The meanings of the inherited features is as follows:
				local_id: same as name
				context_id: (empty)
				version_id: revision of terminology. Note that 'version' numbers or ids
				  appear in some terminology 'names' - but each successive such 'version'
				  is in fact not compatible with the previous one, and therefore should be
				  considered a 'new' terminology (from the point of view of knowledge 
				  management.
			 ]"
	keywords:    "Terminology identifier"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TERMINOLOGY_ID

inherit
	CANONICAL_FRAGMENT
		undefine
			default_create, is_equal
		end

	OBJECT_ID
		redefine
			default_create
		end

create
	make, default_create, make_from_canonical_string

feature -- Definitions

	default_value:STRING is "openEHR"

	Local_terminology_id: STRING is "local"
			-- predefined id of terminology to indicate it is local to
			-- the knowledge resource in which it occurs, e.g. an archetype

	Version_id_left_delimiter: STRING is "("

	Version_id_right_delimiter: STRING is ")"

feature -- Initialization

	default_create is
			-- create a default terminology identifier
		do
			value := default_value.twin
		ensure then
			value.is_equal(default_value)
		end

	make(a_terminology_id:STRING) is
		require
			Id_exists: a_terminology_id /= Void and then not a_terminology_id.is_empty
		do
			create value.make(0)
			value.append(a_terminology_id)
		ensure
			value.is_equal(a_terminology_id)
		end

	make_from_canonical_string(str:STRING) is
			-- make from string of form:
			-- <name>string</name>
			-- [<version_id>string</version_id>]
		do
			value := xml_extract_from_tags(str, "name", 1)
			if xml_has_tag(str, "version_id", 1) then
				value.append(Version_id_left_delimiter + xml_extract_from_tags(str, "version_id", 1) +
						Version_id_right_delimiter)
			end
		end

	valid_canonical_string(str:STRING):BOOLEAN is
		do
			Result := xml_has_tag(str, "name", 1)
		end

feature -- Access

	name: STRING is
			-- Return the terminology id (which includes the "version" in some cases). Distinct names
			-- correspond to distinct (i.e. non-compatible) terminologies. Thus the names "ICD10AM" and "ICD10"
			-- refer to distinct terminologies.
		do
			if has_version_id then
				Result := value.substring(1, value.substring_index(Version_id_left_delimiter, 1)-1)
			else
				Result := value.twin
			end
		ensure
			Result /= Void
		end

	version_id: STRING is
			-- version id if there is a version or else Void
		require
			has_version_id
		local
			left_pos, right_pos: INTEGER
		do
			left_pos := value.substring_index(Version_id_left_delimiter, 1)
			right_pos := value.substring_index(Version_id_right_delimiter, 1)
			Result := value.substring(left_pos+1, right_pos-1)
		end

feature -- Status Report

	has_version_id: BOOLEAN is
			-- True if there is a version_id part of the identifier
		local
			left_pos, right_pos: INTEGER
		do
			left_pos := value.substring_index(Version_id_left_delimiter, 1)
			right_pos := value.substring_index(Version_id_right_delimiter, 1)
			Result := left_pos > 0 and right_pos > left_pos
		end

	valid_id(an_id:STRING): BOOLEAN is
			--
		do
		end

	is_local: BOOLEAN is
			-- True if this terminology id = "local"
		do
			Result := name.is_equal(Local_terminology_id)
		end

feature -- Output

	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			create Result.make(0)
			Result.append("<name>" + name + "</name>")
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
--| The Original Code is terminology_id.e.
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
