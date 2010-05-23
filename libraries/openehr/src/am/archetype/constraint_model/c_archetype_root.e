note
	component:   "openEHR Archetype Project"
	description: "[
			     Object node representing a root point of an archetype included within another archetype, either as a 
				 direct reference or as a slot filler. The possible configurations of this object are:
				 	- ARCHETYPE_SLOT specialisation: archetype_id, node_id of slot object ==> node_id is from an ancestor level
				 	- ARCHETYPE_SLOT specialisation: archetype_id, no node_id (slot object with no node_id); path can be found in flat parent
				 	- New object in any level of archetype: archetype_id, node_id (if required by usual rules) ==> node_id is from current level
				 	- New object in any level of archetype: archetype_id, no node_id (if not required); path cannot be found in flat parent
			     ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ARCHETYPE_ROOT

inherit
	C_COMPLEX_OBJECT
		rename
			make_anonymous as cco_make_anonymous,
			make_identified as cco_make_identified
		redefine
			out, enter_subtree, exit_subtree
		end

create
	make, make_with_slot_id

feature -- Initialisation

	make (a_rm_type_name, an_archetype_id: STRING)
			-- make as an archetype external reference
		require
			Rm_type_name_valid: a_rm_type_name /= Void and then not a_rm_type_name.is_empty
			Archetype_id_valid: an_archetype_id /= Void and then (create {ARCHETYPE_ID}).valid_id(an_archetype_id)
		do
			cco_make_identified(a_rm_type_name, an_archetype_id)
		end

	make_with_slot_id (a_rm_type_name, a_slot_node_id, an_archetype_id: STRING)
			-- make as a slot filler, specialising a slot
		require
			Rm_type_name_valid: a_rm_type_name /= Void and then not a_rm_type_name.is_empty
			Archetype_id_valid: an_archetype_id /= Void and then (create {ARCHETYPE_ID}).valid_id(an_archetype_id)
			Slot_id_valid: a_slot_node_id /= Void and then not a_slot_node_id.is_empty
		do
			cco_make_identified (a_rm_type_name, an_archetype_id)
			slot_node_id := a_slot_node_id
		end

feature -- Access

	slot_node_id: STRING
			-- record node id of slot in parent archetype that this object fills, in the case a slot exists;
			-- only set in flat form of archetype

	archetype_id: STRING
			-- id of filler archetype
		do
			Result := node_id
		end

	slot_path: STRING
			-- generate path of slot that this node would replace, by using slot_node_id
		local
			og_path: OG_PATH
		do
			if slot_node_id /= Void then
				og_path := representation.path
				og_path.last.set_object_id (slot_node_id)
				Result := og_path.as_string
			else
				Result := path
			end
		end

feature -- Output

	out: STRING
			-- stringify for GUI use
		do
			create Result.make(0)
			Result.append(rm_type_name + "[")
			if is_addressable then
				Result.append(node_id + ", ")
			end
			Result.append(archetype_id + "] ")
			if occurrences /= Void then
				Result.append(occurrences.as_string)
			end
		end

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_c_archetype_root(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_c_archetype_root(Current, depth)
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
--| The Original Code is cadl_object_node.e.
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
