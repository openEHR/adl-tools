indexing
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

class C_ORDINAL

inherit
	C_DOMAIN_TYPE
		redefine
			default_create
		end
		
create
	make

feature -- Initialisation
		
	default_create is
			--
		do
			precursor
			create rm_type_name.make(0)
			rm_type_name.append("ORDINAL")
			create items.make
			create index.make(0)
		end
		
	make is
			-- make empty, add members with add_item
		do
			default_create
			create representation.make_anonymous(Current)
		end

feature -- Access

	items: LINKED_SET [ORDINAL]

	default_value: ORDINAL is
			-- 	generate a default value from this constraint object
		do
			if not items.is_empty then
				Result := items.first
			else
				create Result.make(0, create {CODE_PHRASE}.make ("UNKNOWN::unknown"))
			end
		end

	item_at_ordinal(i: INTEGER): ORDINAL is
			-- get the item in the list which has the ordinal value i
		require
			has_item(i)
		do
			Result := index.item(i)
		end
		
feature -- Status Report

	is_local: BOOLEAN is
			-- True if terminology id = "local"
		require
			not is_empty
		do
			Result := items.first.symbol.is_local
		end	

	has_item(a_value: INTEGER): BOOLEAN is
		do
			Result := index.has(a_value)
		end

	standard_equivalent: C_COMPLEX_OBJECT is
		do
		end
	
	is_empty: BOOLEAN is
			-- True if no ordinals added
		do
			Result := items.is_empty
		end

	valid_value (a_value: like default_value): BOOLEAN is 
		do
			Result := any_allowed or else has_item(a_value.value)
		end
		
feature -- Modification

	add_item(an_ordinal: ORDINAL) is
			-- add an ordinal to the list
		require
			An_ordinal_valid: not has_item(an_ordinal.value)
		do
			items.extend(an_ordinal)
			index.put(an_ordinal, an_ordinal.value)
		ensure
			Item_added: items.has(an_ordinal)
		end
	
	set_assumed_value_from_integer(a_value: INTEGER) is
			-- set `assumed_value' from an integer in the ordinal enumeration 
		require
			has_item(a_value)
		do
			assumed_value := item_at_ordinal(a_value)
		ensure
			assumed_value_set: assumed_value = item_at_ordinal(a_value)
		end
		
feature -- Conversion

	as_string: STRING is
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

feature -- Serialisation

	enter_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER) is
			-- perform serialisation at start of block for this node
		do
			serialiser.start_c_ordinal(Current, depth)
		end
		
	exit_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER) is
			-- perform serialisation at end of block for this node
		do
			serialiser.end_c_ordinal(Current, depth)
		end

feature {NONE} -- Implementation

	index: HASH_TABLE [ORDINAL, INTEGER]
			-- index of items keyed by ordinal value
	
feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING] is
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.extend("items")
			Result.compare_objects
		end

invariant
	Ordinals_valid: items /= Void
	
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
