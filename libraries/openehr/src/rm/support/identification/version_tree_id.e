indexing
	component:   "openEHR Common Reference Model"
	
	description: "[
			 Identifier of versions within a tree of versions. Must be
			 combined with the identifier of a Version to be useful for
			 referencing.
			 ]"
	keywords:    "object identifiers"

	design:      "openEHR Common Reference Model 1.5"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class VERSION_TREE_ID

create
	make
	
feature -- Definitions

	Separator: CHARACTER is '.'
	
feature -- Initialisation

	make(s: STRING) is
			-- make from a single string
		require
			String_valid: s /= Void and then valid_version_tree_id(s)
		do
			
		end
		
feature -- Access

	value: STRING
			-- numeric decimal style identifier, must be in either the 
			-- form of a single integer, e.g "5", or else for a branch,
			-- in the form "1.2.3", i.e. with 2 decimal points and only
			-- integers in all slots
	
	trunk_version: STRING is
			-- Trunk version number.
		do
		end

	branch_number: STRING is
			-- Number of branch from the trunk point; empty if not a branch
		local
			decpoint1_pos, decpoint2_pos: INTEGER
		do
			decpoint1_pos := value.index_of (Separator, 1)
			if decpoint1_pos > 0 then
				decpoint2_pos := value.index_of (Separator, decpoint1_pos+1)
				Result := value.substring(decpoint1_pos+1, decpoint2_pos-1)
			end
		end

	branch_version: STRING is
			-- Version of the branch.
		local
			decpoint1_pos, decpoint2_pos: INTEGER
		do
			decpoint1_pos := value.index_of (Separator, 1)
			if decpoint1_pos > 0 then
				decpoint2_pos := value.index_of (Separator, decpoint1_pos+1)
				Result := value.substring(decpoint2_pos+1, value.count)
			end
		end

feature -- Status Report

	is_first: BOOLEAN is
			-- True if this version is a first version - i.e. trunk_version = 1 and
			-- not is_branch
		do
			Result := trunk_version.to_integer = 1 and not is_branch
		end
		
	is_branch: BOOLEAN is
			-- True if this version identifier represents a branch, 
			-- i.e. has branch_number and branch_version parts.
		do
			Result := value.index_of (Separator, 1) = 0
		end
	
	valid_version_tree_id(s: STRING): BOOLEAN is
			-- True if s is a valid id
		require
			String_valid: s /= Void and then not s.is_empty
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > s.count or not (s.item (i).is_digit or s.item(i) = Separator)
			loop
				i := i + 1
			end
			Result := i > s.count
		end

invariant
	Value_valid: value /= Void and then not value.is_empty
	Trunk_version_valid: trunk_version /= Void and then trunk_version.is_integer
	Branch_number_valid: branch_number /= Void implies branch_number.is_integer
	Branch_version_valid: branch_version /= Void implies branch_version.is_integer
	Branch_validity: (branch_number = Void and branch_version = Void ) xor (branch_number /= Void and branch_version /= Void )
	Is_branch_validity: is_branch xor branch_number = Void
	Is_first_validity: not is_first xor trunk_version.is_equal("1")

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
--| The Original Code is object_id.e.
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
