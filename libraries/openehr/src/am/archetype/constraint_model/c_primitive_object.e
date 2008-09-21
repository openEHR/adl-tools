indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Node of simple type in an ADL parse tree. Simple
				 types include: STRING, INTEGER, REAL, CHARACTER,
				 BOOLEAN. Occurrences set to the default of {1..1}
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_PRIMITIVE_OBJECT

inherit
	C_LEAF_OBJECT
		redefine
			representation, out, is_valid, enter_subtree, exit_subtree, node_conforms_to
		end

create
	make

feature -- Initialisation

	make(an_item: C_PRIMITIVE) is
		require
			an_item /= Void
		do
			default_create
			item := an_item
			rm_type_name := an_item.generating_type
			rm_type_name.remove_head (2)
			create representation.make_anonymous (Current)
		end

feature -- Access

	item: C_PRIMITIVE

	prototype_value: ANY is
			-- 	generate a default value from this constraint object
		do
			Result := item.prototype_value
		end

feature -- Status Report

	any_allowed: BOOLEAN is
			-- True if any value allowed ('*' received in parsed input)
			-- i.e. no item
		do
			Result := item = Void
		end

	is_valid: BOOLEAN is
			-- report on validity
		do
			if precursor then
				if item = Void then
					invalid_reason.append("simple type constraint not specified")
				elseif occurrences = Void then
					invalid_reason.append("occurrences must not be Void")
				else
					Result := True
				end
			end
		end

	valid_value (a_value: like prototype_value): BOOLEAN is
		do
			Result := item.valid_value (a_value)
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN is
			-- True if this node is a subset of, or the same as `other'
		do
			if precursor(other) then
				if other.any_allowed then
					Result := True
				elseif not any_allowed then
					Result := item.node_conforms_to(other.item)
				end
			end
		end

feature -- Output

	as_string: STRING is
		do
			Result := item.as_string
		ensure
			Result_exists: Result /= Void
		end

	out: STRING is
		do
			Result := as_string
		end

feature -- Representation

	representation: !OG_OBJECT_LEAF

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform action at start of block for this node
		do
			precursor(visitor, depth)
			visitor.start_c_primitive_object(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform action at end of block for this node
		do
			precursor(visitor, depth)
			visitor.end_c_primitive_object(Current, depth)
		end

invariant
	item_exists: any_allowed xor item /= Void

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
--| The Original Code is cadl_object_simple.e.
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
