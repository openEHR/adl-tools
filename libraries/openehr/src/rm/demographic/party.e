indexing
	component:   "openEHR Demographic Reference Model"

	description: "[
			 Ancestor of all party types, including real world entities and their roles. 
			 A party is any entity which can participate in an activity. The meaning 
			 attribute inherited from ARCHETYPED is used to indicate the actual type of party.
			 ]"
	keywords:    "demographic, party"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/demographic/SCCS/s.party.e $"
	revision:    "$Revision$"
	last_change: "$Date: 04/07/15 12:09:39+10:00 $"

deferred class PARTY

inherit
	LOCATABLE

feature -- Access

	uid: OBJECT_ID
			-- unique identifier of this party
			
	identities: SET[PARTY_IDENTITY]
			-- Identities used by the party to identify itself, such as legal name, 
			-- stage names, aliases, nicknames and so on.

	contacts: SET[CONTACT]
			-- Contacts for this party.

	relationships: LINKED_SET[PARTY_RELATIONSHIP]
			-- Relationships in which this role takes part as source.

	reverse_relationships: SET[OBJECT_REF]
			-- Relationships in which this role takes part as target.

	details: ITEM_STRUCTURE	
			-- All other details for this party.

	type: DV_TEXT is
			-- Type of party, such as “PERSON”, “ORGANISATION”, etc, or 
			-- Role name, e.g. “general practitioner”, “nurse”, “private citizen”.
			-- Taken from inherited name attribute.
		do
			Result := name
		end

	path_of_item (a_loc: LOCATABLE): STRING is
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE is
			-- The item at a path (relative to this item).
		do
		end

feature -- Status Report

	valid_path (a_path: STRING): BOOLEAN is
			-- True if the path is valid with respect to the current item.
		do
		end
		
invariant
	Uid_exists: uid /= Void
	Type_valid: type = name
	Identities_valid: identities /= Void and then not identities.is_empty
	Contacts_valid: contacts /= Void implies not contacts.is_empty
--	Relationships_validity: relationships /= Void implies (not relationships.is_empty and then relationships.for_all((e:PARTY_RELATIONSHIP):BOOLEAN is e.source = Current end))
--	Relationships_validity: relationships /= Void implies (not relationships.is_empty and then relationships.for_all(agent {PARTY_RELATIONSHIP}.source = Current))
--	Reverse_relationships_validity: reverse_relationships /= Void implies (not reverse_relationship.empty and then reverse_relationships.for_all(agent {PARTY_RELATIONSHIP}.target = Current))
	Details_valid: details /= Void
	Is_archetype_root: is_archetype_root

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
--| The Original Code is party.e.
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
