note
	component:   "openEHR Archetype Project"
	description: "[
				 Node of simple type in an ADL parse tree. Simple
				 types include: STRING, INTEGER, REAL, CHARACTER,
				 BOOLEAN. Occurrences set to the default of {1..1}
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class C_PRIMITIVE_OBJECT

inherit
	C_LEAF_OBJECT
		redefine
			out, enter_subtree, exit_subtree, node_conforms_to
		end

create
	make, make_any

feature -- Initialisation

	make (an_item: C_PRIMITIVE)
		do
			item := an_item
			rm_type_name := an_item.rm_type_name
			create representation_cache.make_anonymous
			representation_cache.set_content (Current)
		end

	make_any (an_rm_type_name: STRING)
		do
			rm_type_name := an_rm_type_name
			create representation_cache.make_anonymous
			representation_cache.set_content (Current)
		end

feature -- Access

	item: detachable C_PRIMITIVE

	prototype_value: ANY
			-- 	generate a default value from this constraint object
		do
			if attached item as cp then
				Result := cp.prototype_value
			else
				create {STRING} Result.make_from_string ("any")
			end
		end

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed ('*' received in parsed input)
			-- i.e. no item
		do
			Result := not attached item
		end

	valid_value (a_value: like prototype_value): BOOLEAN
		do
			if attached item as cp then
				Result := cp.valid_value (a_value)
			else
				Result := True
			end
		end

feature -- Comparison

	node_conforms_to (other: like Current; an_rm_schema: BMM_SCHEMA): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			if precursor (other, an_rm_schema) then
				if other.any_allowed then
					Result := True
				elseif attached item as cp and attached other.item as other_cp then
					Result := cp.node_conforms_to (other_cp)
				end
			end
		end

feature -- Output

	as_string: STRING
		do
			create Result.make_empty
			if attached item as cp then
				Result.append (cp.as_string)
			end
		end

	out: STRING
		do
			Result := as_string
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_c_primitive_object (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_primitive_object (Current, depth)
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
