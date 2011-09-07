note
	component:   "openEHR Archetype Project"
	description: "Item representing a reference to another archetype."
	keywords:    "reference, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision: 907 $"
	last_change: "$LastChangedDate$"

class ARCHETYPE_EXTERNAL_REF

inherit
	C_REFERENCE_OBJECT
		redefine
			representation, enter_subtree, exit_subtree
		end

create
	make_identified, make_anonymous

feature -- Initialisation

	make_identified (a_rm_type_name, an_object_id: STRING; an_archetype_id: ARCHETYPE_ID)
			-- set type name, object_id
		require
			Rm_type_name_valid: a_rm_type_name /= Void and then not a_rm_type_name.is_empty
			Object_id_valid: an_object_id /= Void and then not an_object_id.is_empty
			archetype_id_attached: an_archetype_id /= Void
		do
			create representation.make(an_object_id, Current)
			rm_type_name := a_rm_type_name
			set_target_ref(an_archetype_id)
		end

	make_anonymous (an_rm_type_name: STRING; an_archetype_id: ARCHETYPE_ID)
			-- set reference model type name and external reference
		require
			an_rm_type_name_valid: an_rm_type_name /= Void and then not an_rm_type_name.is_empty
			archetype_id_attached: an_archetype_id /= Void
		do
			create representation.make_anonymous(Current)
			rm_type_name := an_rm_type_name
			set_target_ref(an_archetype_id)
		end

feature -- Access

	target_ref: ARCHETYPE_ID
			-- id of referenced archetype

feature -- Modification

	set_target_ref(an_id: ARCHETYPE_ID)
			-- set `reference'
		require
			an_id /= Void
		do
			target_ref := an_id
		end

feature -- Representation

	representation: attached OG_OBJECT_LEAF

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor(visitor, depth)
			visitor.start_archetype_external_ref(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor(visitor, depth)
			visitor.end_archetype_external_ref(Current, depth)
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
--| The Original Code is cadl_object_node_ref.e.
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
