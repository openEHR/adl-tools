note
	component:   "openEHR Archetype Project"
	description: "Archetype notion of a coded term"
	keywords:    "archetype, coded term"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_TERM

inherit
	ARCHETYPE_TERM_CODE_TOOLS
		redefine
			out, default_create
		end

create
	make_default, make, make_from_string, make_from_data_tree

feature -- Initialisation

	default_create
			-- basic creation
		do
			create code.make(0)
			create items.make(0)
		end

	make_default
			-- create a default version with code at0000 and text and description
			-- both set to "unknown"
		do
			default_create
			code.append (Default_concept_code)
			add_item("text", "unknown")
			add_item("description", "unknown")
		end

	make (a_code: STRING)
		require
			Code_valid: a_code /= Void and then not a_code.is_empty
		do
			default_create
			code := a_code
		end

	make_from_string (a_str: STRING)
			-- make from string in dADL form used in archetypes (same as .out form):
			--  [code] = <key1 = <"value1">, key2 = <"value2">, key3 = <"value3">>
		require
			Code_valid: a_str /= Void and then not a_str.is_empty
		do
			default_create
			dadl_validator.reset_scanner
			dadl_validator.execute(a_str, 1)
			if not dadl_validator.syntax_error then
				make_from_data_tree(dadl_validator.output)
			else
				-- FIXME: do something with dadl_validator.error_text
			end
		end

	make_from_data_tree (a_dt: DT_COMPLEX_OBJECT_NODE)
			-- make from a data tree
		local
			dt_property: DT_PRIMITIVE_OBJECT
			items_path: STRING
			dt_list_attr: DT_ATTRIBUTE_NODE
			path_list_item: STRING
			l_key, l_item: STRING
		do
			default_create
			if a_dt.has_path("/code/") then
				dt_property ?= a_dt.node_at_path ("/code/")
				code ?= dt_property.value

				create items_path.make(0)
				items_path.append ("/items")
				if a_dt.has_path(items_path) then
					dt_list_attr ?= a_dt.node_at_path (items_path)
					if dt_list_attr.is_multiple then
						from dt_list_attr.start until dt_list_attr.off loop
							create path_list_item.make(0)
							l_key := dt_list_attr.item.node_id
							path_list_item.append ("/items[" + l_key + "]/")
							dt_property ?= a_dt.node_at_path(path_list_item)
							l_item ?= dt_property.value
							add_item(l_key, l_item)
							dt_list_attr.forth
						end
					else
						-- report error - "%"/items%" children must be a list (using [] keys)"
					end
				end
			else
				-- report error "path %"/code%" not found"
			end
		end

feature -- Access

	code: STRING

	keys: ARRAYED_LIST [STRING]
			-- return all attribute keys for this term
		do
			create Result.make(0)
			from items.start until items.off loop
				Result.extend (items.key_for_iteration)
				items.forth
			end
		end

	items: DS_HASH_TABLE [STRING, STRING]
			-- DS_HASH_TABLE maintains chronological order of insertion

	item (a_key: STRING): STRING
			--
		require
			a_key /= Void and then has_key(a_key)
		do
			Result := items.item(a_key)
		end

feature -- Status Report

	has_key (a_key: STRING): BOOLEAN
			--
		require
			a_key /= Void and then not a_key.is_empty
		do
			Result := items.has(a_key)
		end

feature -- Modification

	add_item (a_key, value: STRING)
		require
			Key_valid: a_key /= Void and then not has_key(a_key)
			Value_valid: value /= Void and then not value.is_empty
		do
			items.force(value, a_key)
		end

	replace_item (a_key, value: STRING)
		require
			Key_valid: a_key /= Void and then has_key(a_key)
			Value_valid: value /= Void and then not value.is_empty
		do
			items.replace(value, a_key)
		end

	set_items (ht: DS_HASH_TABLE [STRING, STRING])
		require
			ht /= Void
		do
			items := ht
		end

feature -- Output

	out: STRING
			-- output term in standard dADL form (not the archetype form):
			--  code = <"somecode">
			--  items = <
			--		["key1"] = <"value1">
			--		["key2"] = <"value2">
			--		etc
			--	>
		local
			keys_list: ARRAYED_LIST[STRING]
		do
			keys_list := keys
			create Result.make(0)
			Result.append ("code = <%"" + code + "%">%N")
			Result.append ("items = <%N")
			from
				keys_list.start
			until
				keys_list.off
			loop
				Result.append ("%T[%"" + keys_list.item + "%"] = <%"" + items.item(keys_list.item) + "%">%N")
				keys_list.forth
			end
			Result.append (">%N")
		end

feature -- Factory

	create_translated_term (a_lang: STRING): ARCHETYPE_TERM
			-- create a new ARCHETYPE_TERM whose members are the same as those in the current object,
			-- with '*' prepended and '(lang)' appended - this acts as an obvious
			-- placeholder for translation. The lang is the original lang of a_term.
		require
			Lang_valid: a_lang /= Void and then not a_lang.is_empty
		do
			-- make a new term from the old term, with every item wrapped using "*xxx(lang)"
			create Result.make (code)
			from
				items.start
			until
				items.off
			loop
				Result.add_item (items.key_for_iteration, "*" + items.item_for_iteration + "(" + a_lang + ")")
				items.forth
			end
		end

	create_derived_term (a_code: STRING): ARCHETYPE_TERM
			-- create a new ARCHETYPE_TERM whose members are the same as those in the current object,
			-- with an '!' appended to each term to indicate that it needs to be edited.
			-- The new term has the code `a_code'.
		require
			Code_valid: a_code /= Void and then not a_code.is_empty
		do
			create Result.make (a_code)
			from
				items.start
			until
				items.off
			loop
				Result.add_item (items.key_for_iteration, items.item_for_iteration + "!")
				items.forth
			end
		end

feature {NONE} -- Implementation

	dadl_validator: DADL2_VALIDATOR
			-- shared dADL2_validator for all ARCHETYPE_TERM instances
		once
			create Result.make
		end

invariant
	Code_valid: code /= Void and then not code.is_empty
	Items_exists: items /= Void

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
--| The Original Code is adl_term.e.
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
