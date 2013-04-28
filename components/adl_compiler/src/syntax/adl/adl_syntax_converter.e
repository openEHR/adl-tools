note
	component:   "openEHR Archetype Project"
	description: "[
			     Converter for fragments of ADL syntax that need to be upgraded in archetypes 
				 that have been created with earlier versions of the parser.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ADL_SYNTAX_CONVERTER

inherit
	OPENEHR_TERMINOLOGY_IDS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

feature -- Access

	perform_syntax_upgrade (dadl_text: STRING)
			-- perform any upgrades likely to be required on older archetypes
			-- dadl_text will be of form "C_SOME_TYPE <xxxxx>"
		do
		end

feature -- ADL 1.4 conversions

	convert_dadl_language (dadl_text: STRING)
			-- converted language = <"xxx"> to language = <[ISO-639::xxx]>
		local
			pos, lpos, rpos: INTEGER
			rep_str, lang: STRING
		do
			converter_status.wipe_out
			-- get type name
			from pos := dadl_text.substring_index("language = <%"", 1) until pos = 0 loop
				lpos := dadl_text.index_of('"', pos)
				rpos := dadl_text.index_of('"', lpos+1)
				lang := dadl_text.substring (lpos+1, rpos-1)
				rep_str := "[" + Terminology_ISO_639_1 + "::" + lang + "]"
				dadl_text.replace_substring (rep_str, lpos, rpos)
				converter_status.add_info (ec_syntax_upgraded_i1,
					<<"language = <%"" + lang + "%">", "language = <[" + Terminology_ISO_639_1 + "::" + lang + "]>">>, "")
				pos := dadl_text.substring_index("language = <%"", rpos)
			end
		end

	convert_c_dv_names (dadl_text: STRING)
			-- convert C_QUANTITY and C_ORDINAL in embedded dADL sections of cADL to
			-- C_DV_QUANTITY and C_DV_ORDINAL
		local
			pos: INTEGER
		do
			-- get type name
			pos := dadl_text.substring_index("C_QUANTITY", 1)
			if pos > 0 then
				dadl_text.replace_substring ("C_DV_QUANTITY", pos, pos+("C_QUANTITY").count-1)
				convert_c_quantity_property(dadl_text)
				converter_status.add_info (ec_syntax_upgraded_i1, <<"C_QUANTITY", "C_DV_QUANTITY">>, "")
			else
				pos := dadl_text.substring_index("C_ORDINAL", 1)
				if pos > 0 then
					dadl_text.replace_substring ("C_DV_ORDINAL", pos, pos+("C_ORDINAL").count-1)
					converter_status.add_info (ec_syntax_upgraded_i1, <<"C_ORDINAL", "C_DV_ORDINAL">>, "")
				end
			end
		end

	convert_c_quantity_property (dadl_text: STRING)
			-- convert an old style C_QUANTITY property dADL fragment from ADL 1.x
			-- to ADL 1.4
			-- The old fragment looks like this:
			--		property = <"xxxx">
			-- The new one looks like this:
			--		property = <[openehr:xxxx]>
			--
		local
			lpos, rpos: INTEGER
			old_str, prop_name, new_str: STRING
		do
			old_str := "property = <%""
			lpos := dadl_text.substring_index(old_str, 1)
			if lpos > 0 then
				rpos := dadl_text.index_of('>', lpos)
				prop_name := dadl_text.substring (lpos + old_str.count, rpos-2)
				prop_name.replace_substring_all (" ", "_")
				if not prop_name.has_substring("openehr::") then
					new_str := "property = <[openehr::" + prop_name + "]>"
				else
					new_str := "property = <[" + prop_name + "]>"
				end

				dadl_text.replace_substring (new_str, lpos, rpos)
				converter_status.add_info (ec_syntax_upgraded_i1, <<"property = <%"xxx%">", "language = <[openehr::xxx]>">>, "")
			end
		end

	convert_non_conforming_duration (a_str: STRING): STRING
			-- fix an ISO8601-like duration string which is missing a 'T' character
			-- called from cADL lexer, matched by pattern:
			-- P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[dD])?([0-9]+h)?([0-9]+m)?([0-9]+s)?
		require
			not a_str.is_empty
		local
			ind, i: INTEGER
		do
			Result := a_str.twin

			-- try lower case (can't use to_lower - not safe for some cultures/character sets)
			ind := Result.index_of ('h', 1)
			if ind = 0 then
				ind := Result.index_of ('m', 1)
				if ind = 0 then
					ind := Result.index_of ('s', 1)
				end
			end

			-- try upper case
			if ind = 0 then
				ind := Result.index_of ('H', 1)
				if ind = 0 then
					ind := Result.index_of ('M', 1)
					if ind = 0 then
						ind := Result.index_of ('S', 1)
					end
				end
			end

			if ind > 0 then
				from
					i := ind - 1
				until
					i <= 1 or not Result.item(i).is_digit
				loop
					i := i - 1
				end
				-- have to insert a 'T' to the right of the cursor
				Result.insert_character ('T', i+1)
				converter_status.add_info (ec_syntax_upgraded_i1, <<"ISO 8601 duration", "(missing 'T' added)">>, "")
			end
		end

feature -- ADL 1.5 conversions

	convert_dadl_type_name (a_type_name: STRING): STRING
			-- convert type name preceding <> dADL block to (typename), i.e. add parentheses
			-- spec change is part of ADL 1.4.1, Release 1.0.2 of openEHR
		require
			type_name_valid: not a_type_name.is_empty
		do
			if adl_version_for_flat_output_numeric >= 150 then
				Result := "("
				Result.append (a_type_name)
				Result.append_character (')')
			else
				Result := a_type_name
			end
		end

--	add_slot_node_identifiers (a_diff_arch: DIFFERENTIAL_ARCHETYPE) is
--			-- add synthesised node identifiers to archetype slot nodes under multiple attributes
--			-- ADL 1.5 only
--		local
--			a_term: ARCHETYPE_TERM
--			old_key: STRING
--		do
--			from
--				a_diff_arch.slot_index.start
--			until
--				a_diff_arch.slot_index.off
--			loop
--				if a_diff_arch.slot_index.item.parent.is_multiple then
--					old_key := a_diff_arch.slot_index.item.node_id

--					create a_term.make (a_diff_arch.ontology.new_non_specialised_term_code)
--					a_term.add_item ("term", "(new slot node code)")
--					a_term.add_item ("description", "(new slot node code description)")
--					a_diff_arch.ontology.add_term_definition (a_diff_arch.ontology.primary_language, a_term)

--					a_diff_arch.slot_index.item.set_object_id (a_term.code)
--					a_diff_arch.slot_index.item.parent.replace_child_by_id (a_diff_arch.slot_index.item, old_key)
--				end
--				a_diff_arch.slot_index.forth
--			end
--		end

	old_archetype_id_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for archetype ids with the 'draft' still in the version
		once
			create Result.make
			Result.compile ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+){2}\.[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*\.v[1-9][0-9a-z]*$")
		end

	convert_ontology_to_nested (dt: DT_COMPLEX_OBJECT_NODE)
			-- convert 'items' nodes in ontology to nested form, corresponding to declaration like
			-- HASH_TABLE [HASH_TABLE [ARCHETPE_TERM, STRING]]; the ADL way of expression ontology
			-- has nested structures in the AOM, but non-nested structures in the dADL, due to
			-- intervening 'items' attributes. This routine converts the parsed structure so that
			-- these attributes are marked in the correct way to indicate nesting of container structures
			-- which then enables the DT_OBJECT_CONVERTER to correctly generate such structures.
			-- A reverse routine below does the opposite, so that serialisation back out to ADL 1.4 archetypes
			-- looks the way it always has. One day, we will change the ADL standard on this...
		do
			-- convert top-level attribute names
--			if dt.has_attribute ("term_binding") then
--				dt.replace_attribute_name ("term_binding", "term_bindings")
--			end
--			if dt.has_attribute ("constraint_binding") then
--				dt.replace_attribute_name ("constraint_binding", "constraint_bindings")
--			end

			convert_ontology_items_to_nested (dt, "term_definitions")
			convert_ontology_items_to_nested (dt, "constraint_definitions")
			convert_ontology_items_to_nested (dt, "term_bindings")
			convert_ontology_items_to_nested (dt, "constraint_bindings")
		end

	convert_ontology_items_to_nested (dt: DT_COMPLEX_OBJECT_NODE; attr_name: STRING)
			-- mark 'items' attribute nodes in ontology section as being nested_container; this is
			-- to simulate having been parsed that way in the first place, so that these structures
			-- will be correctly converted by DT_OBJECT_CONVERTER into nested HASH_TABLEs
		do
			if dt.has_attribute (attr_name) then
				across dt.attribute_node (attr_name).children as dt_objs_csr loop
					if attached {DT_COMPLEX_OBJECT_NODE} dt_objs_csr.item as dt_co and then dt_co.has_attribute ("items") and then
						attached dt_co.attribute_node ("items") as dt_attr
					then
						dt_attr.set_nested_container
					end
				end
			end
		end

	convert_ontology_to_unnested (dt: DT_COMPLEX_OBJECT_NODE)
			-- routine to reverse effects of `convert_ontology_to_nested' for
			-- standard ADL1.4 style serialisation
		do
			convert_ontology_items_to_unnested (dt, "term_definitions")
			convert_ontology_items_to_unnested (dt, "constraint_definitions")
			convert_ontology_items_to_unnested (dt, "term_bindings")
			convert_ontology_items_to_unnested (dt, "constraint_bindings")
		end

	convert_ontology_items_to_unnested (dt: DT_COMPLEX_OBJECT_NODE; attr_name: STRING)
			-- mark 'items' attribute nodes in ontology section as being nested_container; this is
			-- to simulate having been parsed that way in the first place, so that these structures
			-- will be correctly converted by DT_OBJECT_CONVERTER into nested HASH_TABLEs
		do
			if dt.has_attribute (attr_name) then
				across dt.attribute_node (attr_name).children as dt_objs_csr loop
					if attached {DT_COMPLEX_OBJECT_NODE} dt_objs_csr.item as dt_co and then dt_co.has_attribute ("items") and then
						attached dt_co.attribute_node ("items") as dt_attr
					then
						dt_attr.unset_nested
					end
				end
			end
		end

feature -- Path conversions

	convert_use_ref_paths (ref_node_list: ARRAYED_LIST[ARCHETYPE_INTERNAL_REF]; index_path: STRING; referree: ARCHETYPE)
			-- FIXME: the following only needed while old use_ref paths containing redundant node_ids are in existence
			-- rewrite target path into standard Xpath format, removing [atnnn] predicates on objects below single attributes
		local
			xpath: STRING
		do
			xpath := referree.definition.c_object_at_path (index_path).path
			across ref_node_list as ref_node_list_csr loop
				ref_node_list_csr.item.set_target_path (xpath)
			end
		end

feature -- Error Reporting

	converter_status: ERROR_ACCUMULATOR
		once
			create Result.make
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
--| The Original Code is adl_syntax_converter.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2009
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
