note
	component:   "openEHR Archetype Project"
	description: "Object node type representing constraint on scale quantity"
	keywords:    "scale, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	C_DV_SCALE

inherit
	C_DOMAIN_TYPE
		redefine
			default_create
		end

create
	make, make_dt

feature -- Initialisation

	default_create
			--
		do
			precursor
			rm_type_name := generator
			rm_type_name.remove_head(2) -- remove "C_"
		ensure then
			any_allowed
		end

	make
			-- make empty, add members with add_item
		do
			default_create
			create representation.make_anonymous(Current)
		ensure
			any_allowed
		end

	make_dt
			-- make used by DT_OBJECT_CONVERTER
		do
			make
		ensure then
			any_allowed
		end

feature -- Access

	items: LINKED_SET [SCALE]

	default_value: SCALE
			-- 	generate a default value from this constraint object
		do
			if any_allowed then
				create Result.make(0, create {CODE_PHRASE}.default_create, "0")
			else
				Result := items.first
			end
		end

	item_at_scale(i: REAL): SCALE
			-- get the item in the list which has the scale value i
		require
			Not_any_allowed: not any_allowed
			Valid_index: has_item(i)
		do
			Result := index.item(i)
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
			-- Is `code_phrase' in one of the scales in `index'?
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

	has_item (scale_value: REAL): BOOLEAN
			-- Is `scale_value' one of the keys in `index'?
		do
			Result := index /= Void and then index.has (scale_value)
		end

	valid_value (a_value: like default_value): BOOLEAN
		do
			Result := any_allowed or else has_item (a_value.value)
		end

feature -- Modification

	add_item(a_scale: SCALE)
			-- add a scale to the list
		require
			A_scale_valid: not any_allowed implies not has_item(a_scale.value)
		do
			if items = Void then
				create items.make
				create index.make(0)
			end
			items.extend(a_scale)
			index.put(a_scale, a_scale.value)
		ensure
			Item_added: items.has(a_scale)
		end

	set_assumed_value_from_real(a_value: REAL)
			-- set `assumed_value' from a real in the scale enumeration
		require
			Not_any_allowed: not any_allowed
			Valid_index: has_item(a_value)
		do
			assumed_value := item_at_scale(a_value)
		ensure
			assumed_value_set: assumed_value = item_at_scale(a_value)
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
				Result.append("; " + assumed_value.value_text)
			end
		end

	standard_equivalent: C_COMPLEX_OBJECT
		do
		end

feature -- Serialisation

	enter_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			if any_allowed then
				synchronise_to_tree
			end
			serialiser.start_c_scale(Current, depth)
		end

	exit_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_c_scale(Current, depth)
		end

feature {NONE} -- Implementation

	index: HASH_TABLE [SCALE, REAL]
			-- index of items keyed by scale value

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
	Scales_valid: items /= Void xor any_allowed
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
--| The Original Code is c_dv_scale.e.
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
