note
	component:   "openEHR ADL Tools"
	description: "Generalised notion of a coded term, with a code and any number of fields"
	keywords:    "archetype, coded term"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class GENERAL_ARCHETYPE_TERM

inherit
	ARCHETYPE_TERM_CODE_TOOLS
		redefine
			out, default_create
		end

create
	make_default, make --, make_from_string, make_from_data_tree

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
		ensure
			code_set: code.same_string (default_concept_code)
			items_not_empty: not items.is_empty
		end

	make (a_code: attached STRING)
		require
			Code_valid: not a_code.is_empty
		do
			default_create
			code := a_code
		ensure
			code_set: code.same_string (a_code)
			items_empty: items.is_empty
		end

--	make_from_string (a_str: attached STRING)
--			-- make from string in dADL form used in archetypes (same as .out form):
--			--  [code] = <key1 = <"value1">, key2 = <"value2">, key3 = <"value3">>
--		require
--			Code_valid: not a_str.is_empty
--		do
--			default_create
--			dadl_validator.reset
--			dadl_validator.execute(a_str, 1)
--			if not dadl_validator.syntax_error then
--				make_from_data_tree(dadl_validator.output)
--			else
--				-- FIXME: do something with dadl_validator.error_text
--			end
--		end

--	make_from_data_tree (a_dt: attached DT_COMPLEX_OBJECT_NODE)
--			-- make from a data tree
--		local
--			dt_property: DT_PRIMITIVE_OBJECT
--			items_path: STRING
--			dt_list_attr: DT_ATTRIBUTE_NODE
--			path_list_item: STRING
--			l_key, l_item: STRING
--		do
--			default_create
--			if a_dt.has_path("/code/") then
--				dt_property ?= a_dt.node_at_path ("/code/")
--				code ?= dt_property.value

--				create items_path.make(0)
--				items_path.append ("/items")
--				if a_dt.has_path(items_path) then
--					dt_list_attr ?= a_dt.node_at_path (items_path)
--					if dt_list_attr.is_multiple then
--						from dt_list_attr.start until dt_list_attr.off loop
--							create path_list_item.make(0)
--							l_key := dt_list_attr.item.node_id
--							path_list_item.append ("/items[" + l_key + "]/")
--							dt_property ?= a_dt.node_at_path(path_list_item)
--							l_item ?= dt_property.value
--							add_item(l_key, l_item)
--							dt_list_attr.forth
--						end
--					else
--						-- report error - "%"/items%" children must be a list (using [] keys)"
--					end
--				end
--			else
--				-- report error "path %"/code%" not found"
--			end
--		end

feature -- Access

	code: STRING

	keys: ARRAYED_LIST [STRING]
			-- return all attribute keys for this term
		do
			create Result.make_from_array (items.current_keys)
		end

	items: HASH_TABLE [STRING, STRING]
			-- data items

	item (a_key: STRING): STRING
			--
		require
			has_key(a_key)
		do
			Result := items.item(a_key)
		end

feature -- Status Report

	has_key (a_key: STRING): BOOLEAN
			--
		require
			not a_key.is_empty
		do
			Result := items.has(a_key)
		end

feature -- Modification

	add_item (a_key, value: STRING)
		require
			Key_valid: not has_key(a_key)
			Value_valid: not value.is_empty
		do
			items.force(value, a_key)
		end

	replace_item (a_key, value: STRING)
		require
			Key_valid: has_key(a_key)
			Value_valid: not value.is_empty
		do
			items.replace(value, a_key)
		end

feature -- Output

	out: STRING
			-- output term in standard ODIN form (not the archetype form):
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
			from keys_list.start until keys_list.off loop
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
			Lang_valid: not a_lang.is_empty
		do
			-- make a new term from the old term, with every item wrapped using "*xxx(lang)"
			create Result.make (code)

			from items.start until items.off loop
				Result.add_item (items.key_for_iteration, "*" + items.item_for_iteration + "(" + a_lang + ")")
				items.forth
			end
		ensure
			same_code: Result.code.same_string (code)
			same_keys: Result.keys.is_deep_equal (keys)
			different_items: keys.for_all (
								agent (key: STRING; original_items, new_items: like items): BOOLEAN
									local
										original, new: STRING
									do
										original := original_items.item (key)
										new := new_items.item (key)
										Result := new.has_substring (original) and not new.is_equal (original)
									end (?, items, Result.items))
		end

	create_derived_term (a_code: attached STRING): ARCHETYPE_TERM
			-- create a new ARCHETYPE_TERM whose members are the same as those in the current object,
			-- with an '!' appended to each term to indicate that it needs to be edited.
			-- The new term has the code `a_code'.
		require
			Code_valid: not a_code.is_empty
		do
			create Result.make (a_code)

			from items.start until items.off loop
				Result.add_item (items.key_for_iteration, items.item_for_iteration + "!")
				items.forth
			end
		ensure
			code_set: Result.code.same_string (a_code)
			same_keys: Result.keys.is_deep_equal (keys)
			different_items: keys.for_all (
								agent (key: STRING; original_items, new_items: like items): BOOLEAN
									local
										original, new: STRING
									do
										original := original_items.item (key)
										new := new_items.item (key)
										Result := new.has_substring (original) and not new.is_equal (original)
									end (?, items, Result.items))
		end

feature {NONE} -- Implementation

	odin_validator: ODIN_PARSER
			-- shared ODIN validator for all ARCHETYPE_TERM instances
		once
			create Result.make
		end

invariant
	Code_valid: not code.is_empty

end


