note
	component:   "openEHR Archetype Project"
	description: "Object node type representing constraint on ordinal quantity"
	keywords:    "ordinal, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class C_DV_ORDINAL

inherit
	C_DOMAIN_TYPE
		redefine
			out, enter_subtree, exit_subtree, synchronise_to_tree, inferred_specialisation_status, node_conforms_to
		end

create
	make_dt, default_create

feature -- Access

	items: detachable LINKED_SET [ORDINAL]

	prototype_value: ORDINAL
			-- 	generate a default value from this constraint object
		do
			if any_allowed then
				create Result.make(0, create {CODE_PHRASE}.default_create)
			else
				Result := items.first
			end
		end

	item_at_ordinal (i: INTEGER): detachable ORDINAL
			-- get the item in the list which has the ordinal value i
		require
			Not_any_allowed: not any_allowed
			Valid_index: has_item(i)
		do
			if attached index as idx then
				Result := idx.item(i)
			end
		end

feature -- Statistics

	constrained_rm_attributes: ARRAYED_SET [STRING]
			-- report which attributes of the equivalent DV_ORDINAL are being constrained here
		do
			create Result.make (0)
			Result.compare_objects
			if attached items then
				Result.extend ("symbol")
				Result.extend ("value")
			end
		end

feature -- Source Control

	inferred_specialisation_status (spec_level: INTEGER): SPECIALISATION_STATUS
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Values are defined in SPECIALISATION_STATUSES
			-- FIXME: this code is only an attempt to work out the specialisation status,
			-- since it can only test if the codes are local to the archetype. If they come
			-- from an outside terminology, there is no way to know definitively.
		do
			create Result.make (ss_propagated)
			if attached items as att_items then
				across att_items as items_csr loop
					if items_csr.item.symbol.is_local then
						Result := Result.specialisation_dominant_status (specialisation_status_from_code (items_csr.item.symbol.code_string, spec_level))
					end
				end
			end
		end

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed i.e. no items
		do
			Result := items = Void
		end

	is_local: BOOLEAN
			-- True if terminology id = "local"
		require
			not any_allowed
		do
			Result := items.first.symbol.is_local
		end

	has_code_phrase (code_phrase: CODE_PHRASE): BOOLEAN
			-- Is `code_phrase' in one of the ordinals in `index'?
		do
			Result := attached index as att_index and then
				across att_index as idx_csr some idx_csr.item.symbol.is_equal (code_phrase) end
		end

	has_item (ordinal_value: INTEGER): BOOLEAN
			-- Is `ordinal_value' one of the keys in `index'?
		do
			Result := attached index as att_index and then att_index.has (ordinal_value)
		end

	valid_value (a_value: like prototype_value): BOOLEAN
		do
			Result := any_allowed or else has_item (a_value.value)
		end

feature -- Comparison

	node_conforms_to (other: like Current; an_rm_schema: BMM_SCHEMA): BOOLEAN
			-- True if this node is a subset, i.e. a redefinition of, `other' in the ADL constraint sense, i.e. that all
			-- aspects of the definition of this node and all child nodes define a narrower, wholly
			-- contained instance space of `other'.
			-- Returns False if they are the same, or if they do not correspond
		do
			if precursor (other, an_rm_schema) then
				if other.any_allowed then
					Result := True
				elseif attached items as att_items and attached other.items as att_other_items then
					if att_items.count <= att_other_items.count then
						Result := not across att_items as items_csr some other.has_item (items_csr.item.value) end
					end
				end
			end
		end

feature -- Modification

	add_item (an_ordinal: ORDINAL)
			-- add an ordinal to the list
		require
			An_ordinal_valid: not any_allowed implies not has_item(an_ordinal.value)
		local
			att_index: attached like index
			att_items: attached like items
		do
			if attached items as i and attached index as idx then
				att_items := i
				att_index := idx
			else
				create att_items.make
				create att_index.make(0)
				items := att_items
				index := att_index
			end
			att_items.extend (an_ordinal)
			att_index.put (an_ordinal, an_ordinal.value)
		ensure
			Item_added: items.has (an_ordinal)
		end

	set_items (an_items: ARRAYED_LIST [ORDINAL])
		local
			att_index: attached like index
			att_items: attached like items
		do
			create att_items.make
			items := att_items
			att_items.append (an_items)
			create att_index.make (0)
			index := att_index
			across att_items as items_csr loop
				att_index.put (items_csr.item, items_csr.item.value)
			end
		end

	set_assumed_value_from_integer (a_value: INTEGER)
			-- set `assumed_value' from an integer in the ordinal enumeration
		require
			Not_any_allowed: not any_allowed
			Valid_index: has_item (a_value)
		do
			assumed_value := item_at_ordinal (a_value)
		ensure
			assumed_value_set: assumed_value = item_at_ordinal (a_value)
		end

feature -- Output

	out: STRING
		do
			Result := as_string
		end

feature -- Conversion

	as_string: STRING
			--
		do
			create Result.make (0)
			across items as items_csr loop
				if items_csr.cursor_index > 1 then
					Result.append (", ")
				end
				Result.append (items_csr.item.as_string)
			end

			if attached assumed_value as av then
				Result.append ("; " + av.value.out)
			end
		end

	standard_equivalent: C_COMPLEX_OBJECT
		do
			create Result.make_anonymous (rm_type_name)
		end

feature -- Synchronisation

	synchronise_to_tree
			-- synchronise to parse tree representation
		do
            if any_allowed then -- only represent as an inline dADL if any_allowed, else use syntax
				precursor
			end
		end

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
            precursor (visitor, depth)
			visitor.start_c_ordinal (Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
            precursor (visitor, depth)
			visitor.end_c_ordinal (Current, depth)
		end

feature {NONE} -- Implementation

	index: detachable HASH_TABLE [ORDINAL, INTEGER]
			-- index of items keyed by ordinal value

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend("items")
			Result.extend("assumed_value")
		end

invariant
	Ordinals_valid: items /= Void xor any_allowed
	Items_valid: items /= Void implies not items.is_empty

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
--| The Original Code is cadl_object_ordinal.e.
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
