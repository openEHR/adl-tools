note
	component:   "openEHR ADL Tools"
	description: "[
			     Converter for fragments of ADL syntax that need to be upgraded in archetypes 
				 that have been created with earlier versions of the parser.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

	VERSION_STATUSES
		export
			{NONE} all
		end

feature -- Definitions

	Adl14_revision_regex: STRING = "[0-9]+(\.[0-9]+){2}((-rc|-alpha)(\.[0-9]+)?)?"
			-- Regex for 3-part version string string of form N.M.P with optional -rc or -alpha and optional further build number
			-- Will match:
			--	1.2.3-alpha.29
			--	1.2.3-alpha
			--	1.2.3-rc.29
			--	1.2.3-rc
			--	1.2.3

	Adl14_revision_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		once ("PROCESS")
			create Result.make
			Result.compile (Adl14_revision_regex)
		end

feature -- Access

	perform_syntax_upgrade (odin_text: STRING)
			-- perform any upgrades likely to be required on older archetypes
			-- odin_text will be of form "C_SOME_TYPE <xxxxx>"
		do
		end

feature -- ADL 1.4 conversions

	convert_odin_language (odin_text: STRING)
			-- converted language = <"xxx"> to language = <[ISO-639::xxx]>
		local
			pos, lpos, rpos: INTEGER
			rep_str, lang: STRING
		do
			converter_status.wipe_out
			-- get type name
			from pos := odin_text.substring_index("language = <%"", 1) until pos = 0 loop
				lpos := odin_text.index_of('"', pos)
				rpos := odin_text.index_of('"', lpos+1)
				lang := odin_text.substring (lpos+1, rpos-1)
				rep_str := "[" + Terminology_ISO_639_1 + "::" + lang + "]"
				odin_text.replace_substring (rep_str, lpos, rpos)
				converter_status.add_info ({ADL_MESSAGES_IDS}.ec_syntax_upgraded_i1,
					<<"language = <%"" + lang + "%">", "language = <[" + Terminology_ISO_639_1 + "::" + lang + "]>">>, "")
				pos := odin_text.substring_index("language = <%"", rpos)
			end
		end

	convert_c_dv_names (odin_text: STRING)
			-- convert C_QUANTITY and C_ORDINAL in embedded ODIN sections of cADL to
			-- C_DV_QUANTITY and C_DV_ORDINAL
		local
			pos: INTEGER
		do
			-- get type name
			pos := odin_text.substring_index("C_QUANTITY", 1)
			if pos > 0 then
				odin_text.replace_substring ("C_DV_QUANTITY", pos, pos+("C_QUANTITY").count-1)
				convert_c_quantity_property (odin_text)
				converter_status.add_info ({ADL_MESSAGES_IDS}.ec_syntax_upgraded_i1, <<"C_QUANTITY", "C_DV_QUANTITY">>, "")
			else
				pos := odin_text.substring_index("C_ORDINAL", 1)
				if pos > 0 then
					odin_text.replace_substring ("C_DV_ORDINAL", pos, pos+("C_ORDINAL").count-1)
					converter_status.add_info ({ADL_MESSAGES_IDS}.ec_syntax_upgraded_i1, <<"C_ORDINAL", "C_DV_ORDINAL">>, "")
				end
			end
		end

	convert_c_quantity_property (odin_text: STRING)
			-- convert an old style C_QUANTITY property ODIN fragment from ADL 1.x
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
			lpos := odin_text.substring_index(old_str, 1)
			if lpos > 0 then
				rpos := odin_text.index_of('>', lpos)
				prop_name := odin_text.substring (lpos + old_str.count, rpos-2)
				prop_name.replace_substring_all (" ", "_")
				if not prop_name.has_substring("openehr::") then
					new_str := "property = <[openehr::" + prop_name + "]>"
				else
					new_str := "property = <[" + prop_name + "]>"
				end

				odin_text.replace_substring (new_str, lpos, rpos)
				converter_status.add_info ({ADL_MESSAGES_IDS}.ec_syntax_upgraded_i1, <<"property = <%"xxx%">", "language = <[openehr::xxx]>">>, "")
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
				converter_status.add_info ({ADL_MESSAGES_IDS}.ec_syntax_upgraded_i1, <<"ISO 8601 duration", "(missing 'T' added)">>, "")
			end
		end

feature -- ADL 2 conversions

	convert_odin_type_name (a_type_name: STRING): STRING
			-- convert type name preceding <> ODIN block to (typename), i.e. add parentheses
			-- spec change is part of ADL 1.4.1, Release 1.0.2 of openEHR
		require
			type_name_valid: not a_type_name.is_empty
		do
			Result := "("
			Result.append (a_type_name)
			Result.append_character (')')
		end

	convert_terminology_to_nested (dt: DT_COMPLEX_OBJECT)
			-- convert 'items' nodes in ontology to nested form, corresponding to declaration like
			-- HASH_TABLE [HASH_TABLE [ARCHETPE_TERM, STRING]]; the ADL way of expression ontology
			-- has nested structures in the AOM, but non-nested structures in the ODIN, due to
			-- intervening 'items' attributes. This routine converts the parsed structure so that
			-- these attributes are marked in the correct way to indicate nesting of container structures
			-- which then enables the DT_OBJECT_CONVERTER to correctly generate such structures.
			-- A reverse routine below does the opposite, so that serialisation back out to ADL 1.4 archetypes
			-- looks the way it always has. One day, we will change the ADL standard on this...
		do
			convert_terminology_items_to_nested (dt, "term_definitions")
			convert_terminology_items_to_nested (dt, "constraint_definitions")
			convert_terminology_items_to_nested (dt, "term_bindings")
			convert_terminology_items_to_nested (dt, "constraint_bindings")
		end

	convert_terminology_items_to_nested (dt: DT_COMPLEX_OBJECT; attr_name: STRING)
			-- mark 'items' attribute nodes in ontology section as being nested_container; this is
			-- to simulate having been parsed that way in the first place, so that these structures
			-- will be correctly converted by DT_OBJECT_CONVERTER into nested HASH_TABLEs
		do
			if dt.has_attribute (attr_name) and then attached dt.attribute_node (attr_name) as att_dt_attr then
				across att_dt_attr.children as dt_objs_csr loop
					if attached {DT_COMPLEX_OBJECT} dt_objs_csr.item as dt_co and then dt_co.has_attribute ("items") and then
						attached dt_co.attribute_node ("items") as dt_attr
					then
						dt_attr.set_nested_container
					end
				end
			end
		end

	convert_terminology_to_unnested (dt: DT_COMPLEX_OBJECT)
			-- routine to reverse effects of `convert_ontology_to_nested' for
			-- standard ADL1.4 style serialisation
		do
			convert_terminology_items_to_unnested (dt, "term_definitions")
			convert_terminology_items_to_unnested (dt, "constraint_definitions")
			convert_terminology_items_to_unnested (dt, "term_bindings")
			convert_terminology_items_to_unnested (dt, "constraint_bindings")
		end

	convert_terminology_items_to_unnested (dt: DT_COMPLEX_OBJECT; attr_name: STRING)
			-- mark 'items' attribute nodes in ontology section as being nested_container; this is
			-- to simulate having been parsed that way in the first place, so that these structures
			-- will be correctly converted by DT_OBJECT_CONVERTER into nested HASH_TABLEs
		do
			if dt.has_attribute (attr_name) and then attached dt.attribute_node (attr_name) as att_dt_attr then
				across att_dt_attr.children as dt_objs_csr loop
					if attached {DT_COMPLEX_OBJECT} dt_objs_csr.item as dt_co and then dt_co.has_attribute ("items") and then
						attached dt_co.attribute_node ("items") as dt_attr
					then
						dt_attr.unset_nested
					end
				end
			end
		end

	has_old_copyright (a_res_desc: DT_COMPLEX_OBJECT): BOOLEAN
			-- test if copyright is in ADL 1.4 location RESOURCE_DESCRIPTION.details.copyright
		do
			Result := a_res_desc.has_path ("details[en]/copyright")
		end

	move_copyright (a_res_desc: DT_COMPLEX_OBJECT)
			-- move copyright from RESOURCE_DESCRIPTION.details.copyright to RESOURCE_DESCRIPTION.copyright
			-- obtain copyright from English language RESOURCE_DESCRIPTION.details
		require
			has_old_copyright (a_res_desc)
		do
			if attached a_res_desc.attribute_node_at_path ("details[en]/copyright") as dt_attr_details_copyright then
				a_res_desc.put_attribute (dt_attr_details_copyright)
			end
		end

	convert_adl14_metadata_to_adl2 (a_res_desc: DT_COMPLEX_OBJECT)
			-- convert items that are in RESOURCE_DESCRIPTION.other_details to ADL 2 locations
			-- other_details = <
			--  ["references"] = <"String">					=>	/references (hash table structure)
			--  ["MD5-CAM-1.0.1"] = <"String">				=>	(no change)
			--  ["licence"] = <"String">					=>	/licence
			--  ["custodian_organisation"] = <"String">		=>	/custodian_organisation
			--  ["custodian_namespace"] = <"String">		=>	/custodian_namespace
			--  ["ip_acknowledgements"] = <"String">		=>	/ip_acknowledgements
			--  ["build_uid"] = <"String">					=>	(no change)
			--  ["original_namespace"] = <"String">			=>	/original_namespace
			--  ["original_publisher"] = <"String">			=>	/original_publisher
			--  ["revision"] = <"0.0.1-alpha">				=>	(no change here; converted elsewhere)
			-- >
		local
			dt_attr: DT_ATTRIBUTE
			dt_prim_obj: DT_PRIMITIVE_OBJECT
			orig_ref_strs: LIST [STRING]
		do
			if attached a_res_desc.attribute_node_at_path ("other_details") as dt_attr_od then
				if dt_attr_od.has_child_with_id ("licence") and then attached dt_attr_od.child_with_id ("licence") as dt_obj then
					dt_attr_od.remove_child (dt_obj)
					create dt_attr.make_single ("licence")
					dt_attr.put_child (dt_obj)
					a_res_desc.put_attribute (dt_attr)
				end
				if dt_attr_od.has_child_with_id ("custodian_organisation") and then attached dt_attr_od.child_with_id ("custodian_organisation") as dt_obj then
					dt_attr_od.remove_child (dt_obj)
					create dt_attr.make_single ("custodian_organisation")
					dt_attr.put_child (dt_obj)
					a_res_desc.put_attribute (dt_attr)
				end
				if dt_attr_od.has_child_with_id ("custodian_namespace") and then attached dt_attr_od.child_with_id ("custodian_namespace") as dt_obj then
					dt_attr_od.remove_child (dt_obj)
					create dt_attr.make_single ("custodian_namespace")
					dt_attr.put_child (dt_obj)
					a_res_desc.put_attribute (dt_attr)
				end
				if dt_attr_od.has_child_with_id ("original_namespace") and then attached dt_attr_od.child_with_id ("original_namespace") as dt_obj then
					dt_attr_od.remove_child (dt_obj)
					create dt_attr.make_single ("original_namespace")
					dt_attr.put_child (dt_obj)
					a_res_desc.put_attribute (dt_attr)
				end
				if dt_attr_od.has_child_with_id ("original_publisher") and then attached dt_attr_od.child_with_id ("original_publisher") as dt_obj then
					dt_attr_od.remove_child (dt_obj)
					create dt_attr.make_single ("original_publisher")
					dt_attr.put_child (dt_obj)
					a_res_desc.put_attribute (dt_attr)
				end
				if dt_attr_od.has_child_with_id ("ip_acknowledgements") and then attached dt_attr_od.child_with_id ("ip_acknowledgements") as dt_obj then
					dt_attr_od.remove_child (dt_obj)
					create dt_attr.make_single ("ip_acknowledgements")
					dt_attr.put_child (dt_obj)
					a_res_desc.put_attribute (dt_attr)
				end
				if dt_attr_od.has_child_with_id ("references") and then attached dt_attr_od.child_with_id ("references") as dt_obj then
					if attached {DT_PRIMITIVE_OBJECT} dt_obj as att_dt_po and then attached {STRING} att_dt_po.value as orig_refs_str then
						dt_attr_od.remove_child (dt_obj)
						create dt_attr.make_container ("references")
						orig_ref_strs := orig_refs_str.split ('%N')
						across orig_ref_strs as orig_ref_strs_csr loop
							orig_ref_strs_csr.item.adjust
							if not orig_ref_strs_csr.item.is_empty then
								create dt_prim_obj.make_identified (orig_ref_strs_csr.item, (dt_attr.child_count + 1).out)
								dt_attr.put_child (dt_prim_obj)
							end
						end
						if dt_attr.child_count > 0 then
							a_res_desc.put_attribute (dt_attr)
						end
					end
				end
				-- if there is nothing left inside the other_details DT_ATTR, remove from its parent
				if dt_attr_od.child_count = 0 then
					check attached dt_attr_od.parent as dt_parent_obj then
						dt_parent_obj.remove_attribute ("other_details")
					end
				end
			end
		end

	update_adl2_hrid_from_adl14_revision (arch_id: ARCHETYPE_HRID; a_res_desc: DT_COMPLEX_OBJECT)
			-- Extract revision information from other_details of ADL14 archetype and write it
			-- into `arch_id', the achetype identifier of an ADL2 archetype.
			-- Typical ADL1.4 revision information:
			--  ["revision"] = <"0.0.1-alpha">
		local
			ver_sts_str: STRING
			rpos: INTEGER
		do
			if attached a_res_desc.attribute_node_at_path ("other_details") as dt_attr_od then
				if dt_attr_od.has_child_with_id ("revision") and then attached dt_attr_od.child_with_id ("revision") as dt_obj then
					dt_attr_od.remove_child (dt_obj)

					if attached {DT_PRIMITIVE_OBJECT} dt_obj as dt_po and then attached {STRING} dt_po.value as rev_str then
						if Adl14_revision_regex_matcher.recognizes (rev_str) then
							rpos := rev_str.index_of ('-', 1) - 1
							if rpos > 0 then
								arch_id.set_release_version (rev_str.substring (1, rpos))
								ver_sts_str := rev_str.substring (rpos + 2, rev_str.count)
								if valid_adl14_version_status (ver_sts_str) then
									arch_id.set_version_status (ver_sts_str)
								end
							else
								arch_id.set_release_version (rev_str)
							end
						end
					end
				end
			end
		end

feature -- Error Reporting

	converter_status: ERROR_ACCUMULATOR
		once
			create Result.make
		end

feature {NONE} -- Implementation

	valid_adl14_version_status (a_str: STRING): BOOLEAN
		do
			Result := adl14_version_statuses.has (a_str)
		end

	adl14_version_statuses: HASH_TABLE [STRING, STRING]
		once
			create Result.make (0)
			Result.put (vs_alpha, vs_alpha)
			Result.put (vs_release_candidate, vs_release_candidate)
		end


end


