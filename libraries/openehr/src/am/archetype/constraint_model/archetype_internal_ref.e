indexing
	component:   "openEHR Archetype Project"
	description: "Item representing a 'use' reference in an ADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_INTERNAL_REF

inherit
	C_REFERENCE_OBJECT
		redefine
			representation, is_valid, set_occurrences, enter_subtree, exit_subtree
		end

create
	make

feature -- Initialisation

	make(a_rm_type_name:STRING; a_path: STRING) is
			-- set reference model type name
		require
			a_rm_type_name_valid: a_rm_type_name /= Void and then not a_rm_type_name.is_empty
			a_path_exists: a_path /= Void and then not a_path.is_empty
		do
			default_create
			create representation.make_anonymous(Current)
			rm_type_name := a_rm_type_name
			set_target_path(a_path)
			use_target_occurrences := True
		ensure
			Use_target_occurrences: use_target_occurrences
		end

feature -- Access

	target_path: STRING
			-- path to the referenced node

feature -- Status Report

	use_target_occurrences: BOOLEAN
			-- True if target occurrences are to be used as the value of occurrences in this object;
			-- by the time of runtime use, the target occurrences value has to be set into this object

	is_valid: BOOLEAN is
			-- report on validity
		do
			if precursor then
				if target_path = Void or else target_path.is_empty then
					invalid_reason.append("'use' reference path not specified")
				else
					Result := True
				end
			end
		end

feature -- Modification

	set_target_path(a_path: STRING) is
			-- set reference path with a valid ADL path string
		require
			a_path /= Void
		do
			target_path := a_path
		end

	set_occurrences(ivl: INTERVAL[INTEGER]) is
			--
		do
			precursor(ivl)
			use_target_occurrences := False
		ensure then
			Dont_use_target_occurrences: not use_target_occurrences
		end

feature -- Representation

	representation: OG_OBJECT_LEAF

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform action at start of block for this node
		do
			precursor(visitor, depth)
			visitor.start_archetype_internal_ref(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform action at end of block for this node
		do
			precursor(visitor, depth)
			visitor.end_archetype_internal_ref(Current, depth)
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
