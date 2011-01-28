note
	component:   "openEHR Archetype Project"
	description: "Object node type representing constraint on ordinal quantity"
	keywords:    "ordinal, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_DV_ORDINAL

inherit
	C_DOMAIN_TYPE
		redefine
			enter_subtree, exit_subtree, synchronise_to_tree, specialisation_status, node_conforms_to
		end

create
	make, make_dt

feature -- Access

	items: LINKED_SET [ORDINAL]

	prototype_value: ORDINAL
			-- 	generate a default value from this constraint object
		do
			if any_allowed then
				create Result.make(0, create {CODE_PHRASE}.default_create)
			else
				Result := items.first
			end
		end

	item_at_ordinal(i: INTEGER): ORDINAL
			-- get the item in the list which has the ordinal value i
		require
			Not_any_allowed: not any_allowed
			Valid_index: has_item(i)
		do
			Result := index.item(i)
		end

feature -- Source Control

	specialisation_status (spec_level: INTEGER): SPECIALISATION_STATUS
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Values are defined in SPECIALISATION_STATUSES
			-- FIXME: this code is only an attempt to work out the specialisation status,
			-- since it can only test if the codes are local to the archetype. If they come
			-- from an outside terminology, there is no way to know definitively.
		do
			create Result.make (ss_propagated)
			if items /= Void then
				from
					items.start
				until
					items.off
				loop
					if items.item.symbol.is_local then
						Result := Result.specialisation_dominant_status (specialisation_status_from_code (items.item.symbol.code_string, spec_level))
						items.forth
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
			if index /= Void then
				from
					index.start
				until
					Result or index.off
				loop
					Result := index.item_for_iteration.symbol.is_equal (code_phrase)
					index.forth
				end
			end
		end

	has_item (ordinal_value: INTEGER): BOOLEAN
			-- Is `ordinal_value' one of the keys in `index'?
		do
			Result := index /= Void and then index.has (ordinal_value)
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
			if precursor(other, an_rm_schema) then
				if other.any_allowed then
					Result := True
				elseif not any_allowed then
					if items.count <= other.items.count then
						from
							items.start
						until
							items.off or not other.has_item (items.item.value)
						loop
							items.forth
						end
					end
					Result := items.off
				end
			end
		end

feature -- Modification

	add_item(an_ordinal: ORDINAL)
			-- add an ordinal to the list
		require
			An_ordinal_valid: not any_allowed implies not has_item(an_ordinal.value)
		do
			if items = Void then
				create items.make
				create index.make(0)
			end
			items.extend(an_ordinal)
			index.put(an_ordinal, an_ordinal.value)
		ensure
			Item_added: items.has(an_ordinal)
		end

	set_assumed_value_from_integer(a_value: INTEGER)
			-- set `assumed_value' from an integer in the ordinal enumeration
		require
			Not_any_allowed: not any_allowed
			Valid_index: has_item(a_value)
		do
			assumed_value := item_at_ordinal(a_value)
		ensure
			assumed_value_set: assumed_value = item_at_ordinal(a_value)
		end

feature -- Conversion

	as_string: STRING
			--
		do
			create Result.make (0)
			from
				items.start
			until
				items.off
			loop
				if not items.isfirst then
					Result.append (", ")
				end
				Result.append (items.item.as_string)
				items.forth
			end

			if assumed_value /= Void then
				Result.append("; " + assumed_value.value.out)
			end
		end

	standard_equivalent: C_COMPLEX_OBJECT
		do
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
            precursor(visitor, depth)
			visitor.start_c_ordinal(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
            precursor(visitor, depth)
			visitor.end_c_ordinal(Current, depth)
		end

feature {NONE} -- Implementation

	index: HASH_TABLE [ORDINAL, INTEGER]
			-- index of items keyed by ordinal value

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.extend("items")
			Result.extend("assumed_value")
			Result.compare_objects
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
