note
	component:   "openEHR Archetype Project"
	description: "Visitor to generate GUI tree from C_XX structure"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_DEFINITION_RENDERER

inherit
	C_VISITOR
		redefine
			end_c_archetype_root,
			end_c_complex_object,
			end_c_attribute,
			end_archetype_slot,
			end_archetype_internal_ref,
			end_constraint_ref,
			end_c_code_phrase, end_c_ordinal, end_c_quantity,
			end_c_primitive_object,
			do_rm_property
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	SHARED_GUI_AGENTS
		export
			{NONE} all
		end

	SPECIALISATION_STATUSES
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_rm_schema: BMM_SCHEMA; aca: ARCH_CAT_ARCHETYPE; differential_flag: BOOLEAN; a_lang: STRING; a_gui_tree: EVX_GRID;
				update_flag, show_codes_flag, show_rm_inheritance_flag,
				in_technical_view_flag, rm_data_properties_flag, rm_runtime_properties_flag, rm_infrastructure_properties_flag: BOOLEAN;
				a_gui_node_map: HASH_TABLE [EV_GRID_ROW, ARCHETYPE_CONSTRAINT];
				a_code_select_agent, a_path_select_agent: PROCEDURE [ANY, TUPLE [STRING]])
		do
			target_descriptor := aca
			if aca.is_specialised then
				flat_parent := aca.flat_archetype
			end
			differential_view := differential_flag
			if differential_view then
				initialise (aca.differential_archetype)
			else
				initialise (aca.flat_archetype)
			end

			rm_schema := a_rm_schema
			gui_grid := a_gui_tree
			node_grid_row_map := a_gui_node_map
			show_codes := show_codes_flag
			show_rm_inheritance := show_rm_inheritance_flag
			updating := update_flag
			language := a_lang
			rm_publisher := archetype.archetype_id.rm_originator.as_lower
			code_select_agent := a_code_select_agent
			path_select_agent := a_path_select_agent

			in_technical_view := in_technical_view_flag
			include_rm_data_properties := rm_data_properties_flag
			include_rm_runtime_properties := rm_runtime_properties_flag
			include_rm_infrastructure_properties := rm_infrastructure_properties_flag

			create ev_grid_row_stack.make (0)
			create ev_grid_rm_row_stack.make (0)
			create ev_grid_rm_row_removals_stack.make (0)
		end

feature -- Access

	target_descriptor: detachable ARCH_CAT_ARCHETYPE
			-- differential archetype being processed

	flat_parent: detachable FLAT_ARCHETYPE
			-- flat parent if the target archetype is specialised

feature -- Visitor

	start_c_object (a_node: attached C_OBJECT; depth: INTEGER)
			-- enter a C_OBJECT
		local
			s: STRING
			lpos: INTEGER
		do
			if not updating then
				-- create a new row
				if a_node.is_root then
					gui_grid.add_row (a_node)
				else
					gui_grid.add_sub_row (ev_grid_row_stack.item, a_node)
				end
				node_grid_row_map.put (gui_grid.last_row, a_node)

				-- remember on stack
				ev_grid_row_stack.extend (gui_grid.last_row)
			else
				gui_grid.set_last_row (node_grid_row_map.item (a_node))
			end

			-- RM name & meaning columns
			if a_node.is_addressable then
				if in_technical_view then
					gui_grid.set_last_row_label_col (Node_grid_col_rm_name, a_node.rm_type_name, node_tooltip_str (a_node), c_object_colour (a_node), c_object_pixmap (a_node))
					gui_grid.set_last_row_label_col (Node_grid_col_meaning, local_term_string (a_node.node_id), node_tooltip_str (a_node), c_meaning_colour (a_node), Void)
		 		else
					gui_grid.set_last_row_label_col (Node_grid_col_rm_name, local_term_string (a_node.node_id), node_tooltip_str (a_node), c_meaning_colour (a_node), c_object_pixmap (a_node))
					gui_grid.set_last_row_label_col (Node_grid_col_meaning, "", Void, Void, Void)
				end
			else
				if in_technical_view then
					gui_grid.set_last_row_label_col (Node_grid_col_rm_name, a_node.rm_type_name, node_tooltip_str (a_node), c_object_colour (a_node), c_object_pixmap (a_node))
					gui_grid.set_last_row_label_col (Node_grid_col_meaning, "", Void, Void, Void)
				else
					create s.make_empty
					s.append_character ('[')
					if a_node.rm_type_name.substring (1, 3).same_string ("DV_") then
						lpos := 4
					else
						lpos := 1
					end
					s.append_character (a_node.rm_type_name.item (lpos))
					s.append (a_node.rm_type_name.substring (lpos+1, a_node.rm_type_name.count).as_lower)
					s.append_character (']')
					s.to_lower
					gui_grid.set_last_row_label_col (Node_grid_col_rm_name, s, node_tooltip_str (a_node), c_object_colour (a_node), c_object_pixmap (a_node))
				end
			end

			-- add a context menu to rm_name col
			gui_grid.add_last_row_pointer_button_press_actions (Node_grid_col_rm_name, agent arch_class_node_handler (gui_grid.last_row, ?, ?, ?))

			-- card/occ column
			create s.make_empty
			if attached a_node.occurrences then
				if not a_node.occurrences.is_prohibited then
					s.append (a_node.occurrences_as_string)
				else
					s.append (get_text ("occurrences_removed_text"))
				end
			end
			gui_grid.set_last_row_label_col (Node_grid_col_card_occ, s, Void, c_constraint_colour (a_node), Void)

			-- constraint column
			if attached {C_DEFINED_OBJECT} a_node as c_do and then c_do.any_allowed then
				gui_grid.set_last_row_label_col (Node_grid_col_constraint, Archetype_any_constraint, Void, c_constraint_colour (a_node), Void)
			end

			-- sibling order column
			if differential_view then
				if a_node.is_addressable and then attached a_node.sibling_order then
					create s.make_empty
					if a_node.sibling_order.is_after then
						s.append ("after")
					else
						s.append ("before")
					end
					s.append ("%N" + local_term_string (a_node.sibling_order.sibling_node_id))
					gui_grid.set_last_row_label_col_multi_line (Node_grid_col_sibling_order, s, Void, c_constraint_colour (a_node), Void)
				end
			end
		end

	start_c_complex_object (a_node: attached C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter a C_COMPLEX_OBJECT
		do
			start_c_object (a_node, depth)
		end

	end_c_complex_object (a_node: attached C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit a C_COMPLEX_OBJECT
		do
			if not a_node.is_root and not updating then
				ev_grid_row_stack.remove
			end
		end

	start_archetype_slot (a_node: attached ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		local
			constraint_str: STRING
			i: INTEGER
		do
			start_c_object (a_node, depth)
			gui_grid.set_last_row (node_grid_row_map.item (a_node))

			-- try to find a slot pixmap even if in RM icon mode
			if use_rm_pixmaps and attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (Node_grid_col_rm_name) as gli2 then
				gli2.set_pixmap (c_object_slot_pixmap (a_node))
			end

			if not updating then
				-- add closed indicator in constraint column
				if a_node.is_closed then
					gui_grid.set_last_row_label_col (Node_grid_col_constraint, Archetype_slot_closed, Void, c_constraint_colour (a_node), Void)
				else
					-- create child nodes for includes & excludes
					if a_node.has_includes then
						from a_node.includes.start until a_node.includes.off loop
							gui_grid.add_sub_row (ev_grid_row_stack.item, a_node.includes.item)

							-- put pixmap on RM col
							gui_grid.set_last_row_label_col (Node_grid_col_rm_name, get_text ("include_text"), Void,
								c_object_colour (a_node), get_icon_pixmap ("am/added/" + a_node.generating_type + "_include"))

							-- put assertions in constraint col
							constraint_str := object_invariant_string (a_node.includes.item)
							constraint_str.replace_substring_all (" ", "%N")
							gui_grid.set_last_row_label_col_multi_line (Node_grid_col_constraint, constraint_str, Void, c_constraint_colour (a_node), Void)
							a_node.includes.forth
						end
					end

					if a_node.has_excludes then
						from a_node.excludes.start until a_node.excludes.off loop
							gui_grid.add_sub_row (ev_grid_row_stack.item, a_node.excludes.item)

							-- put pixmap on RM col
							gui_grid.set_last_row_label_col (Node_grid_col_rm_name, get_text ("exclude_text"), Void,
								c_object_colour (a_node), get_icon_pixmap ("am/added/" + a_node.generating_type + "_exclude"))

							-- put assertions in constraint col
							constraint_str := object_invariant_string (a_node.excludes.item)
							constraint_str.replace_substring_all (" ", "%N")
							gui_grid.set_last_row_label_col_multi_line (Node_grid_col_constraint, constraint_str, Void, c_constraint_colour (a_node), Void)
							a_node.excludes.forth
						end
					end
				end
			else
				from i := 1 until i > gui_grid.last_row.subrow_count loop
					gui_grid.last_row.subrow (i).item (Node_grid_col_constraint).set_foreground_color (c_constraint_colour (a_node))
					i := i + 1
				end
			end
		end

	end_archetype_slot (a_node: attached ARCHETYPE_SLOT; depth: INTEGER)
			-- exit a ARCHETYPE_SLOT
		do
			if not updating then
				ev_grid_row_stack.remove
			end
		end

	start_c_attribute (a_node: attached C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		local
			attr_str: STRING
		do
			if not updating then
				gui_grid.add_sub_row (ev_grid_row_stack.item, a_node)
				node_grid_row_map.put (gui_grid.last_row, a_node)

				gui_grid.set_last_row_label_col (Node_grid_col_meaning, "", Void, Void, Void)

				ev_grid_row_stack.extend (gui_grid.last_row)
			else
				gui_grid.set_last_row (node_grid_row_map.item (a_node))
			end

			-- constraints
			if attached a_node.existence then
				gui_grid.set_last_row_label_col (Node_grid_col_existence, a_node.existence.as_string, Void, c_constraint_colour (a_node), Void)
			end
			if attached a_node.cardinality then
				gui_grid.set_last_row_label_col (Node_grid_col_card_occ, a_node.cardinality.as_string, Void, c_constraint_colour (a_node), Void)
			end
			if a_node.any_allowed then
				gui_grid.set_last_row_label_col (Node_grid_col_constraint, Archetype_any_constraint, Void, c_constraint_colour (a_node), Void)
			end

			-- RM attr name / path
			create attr_str.make_empty
			if a_node.has_differential_path then
				if in_technical_view then
					attr_str.append (a_node.rm_attribute_path)
				else
					attr_str.append (ontology.physical_to_logical_path (a_node.rm_attribute_path, language, True))
				end
				attr_str.replace_substring_all ({OG_PATH}.segment_separator_string, "%N" + {OG_PATH}.segment_separator_string)
				attr_str.remove_head (1)
				gui_grid.set_last_row_label_col_multi_line (Node_grid_col_rm_name, attr_str, node_tooltip_str (a_node), c_attribute_colour (a_node), c_attribute_pixmap (a_node))
			else
				attr_str.append (a_node.rm_attribute_name)
				gui_grid.set_last_row_label_col (Node_grid_col_rm_name, attr_str, node_tooltip_str (a_node), c_attribute_colour (a_node), c_attribute_pixmap (a_node))
			end
		end

	end_c_attribute (a_node: attached C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
			if not updating then
				ev_grid_row_stack.remove
			end
		end

	start_c_leaf_object (a_node: attached C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_c_reference_object (a_node: attached C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do
		end

	start_c_archetype_root (a_node: attached C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		local
--			s: STRING
			row: EV_GRID_ROW
--			gli: EV_GRID_LABEL_ITEM
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

--			if not a_node.any_allowed and in_technical_view then
--				-- add Archetype root reference info
--				create s.make_empty
--				if attached a_node.slot_node_id then
--					s.append ("[" + a_node.slot_node_id + ", " + a_node.node_id + "]")
--				else
--					s.append ("[" + a_node.node_id + "]")
--				end
--				create gli.make_with_text (s)
--				row.set_item (Node_grid_col_constraint, gli)
--				row.set_height (gli.text_height + Default_grid_row_expansion)
--			end

			-- have to obtain the ontology from the main archetype directory because the archetype being serialised
			-- here might be in differential form, and have no component_ontologies set up
			ontologies.extend (current_arch_cat.archetype_index.item (a_node.archetype_id).flat_archetype.ontology)
		end

	end_c_archetype_root (a_node: attached C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
			ontologies.remove
			if not updating then
				ev_grid_row_stack.remove
			end
		end

	start_archetype_internal_ref (a_node: attached ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		local
			p, s: STRING
			row: EV_GRID_ROW
			gli: EV_GRID_LABEL_ITEM
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			-- set constraint column to referenced path
			create s.make_empty
			s.append ("use ")
			if in_technical_view then
				p := a_node.target_path.twin
			else
				p := ontology.physical_to_logical_path (a_node.target_path, language, True)
			end
			p.replace_substring_all ({OG_PATH}.segment_separator_string, "%N" + {OG_PATH}.segment_separator_string)
			p.remove_head (1)
			s.append (p)
			create gli.make_with_text (utf8_to_utf32 (s))
			gli.set_foreground_color (c_object_attribute_colour (a_node))
			row.set_item (Node_grid_col_constraint, gli)
			row.set_height (gli.text_height + Default_grid_row_expansion)
		end

	end_archetype_internal_ref (a_node: attached ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- exit an ARCHETYPE_INTERNAL_REF
		do
			if not updating then
				ev_grid_row_stack.remove
			end
		end

	start_constraint_ref (a_node: attached CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		local
			s: STRING
			row: EV_GRID_ROW
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			-- set meaning column to referenced path
			create s.make_empty
			s.append (local_term_string (a_node.target))
			row.set_item (Node_grid_col_meaning, create {EV_GRID_LABEL_ITEM}.make_with_text (utf8_to_utf32 (s)))

			-- add select event
			if not updating then
	 			row.item (Node_grid_col_meaning).pointer_button_press_actions.force_extend (agent add_code_select_context_menu (a_node.target, ?, ?, ?))
			end
		end

	end_constraint_ref (a_node: attached CONSTRAINT_REF; depth: INTEGER)
			-- exit a CONSTRAINT_REF
		do
			if not updating then
				ev_grid_row_stack.remove
			end
		end

	start_c_primitive_object (a_node: attached C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		local
			row: EV_GRID_ROW
			gli: EV_GRID_LABEL_ITEM
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)
			if not a_node.any_allowed then
				create gli.make_with_text (a_node.item.as_string)
				gli.set_foreground_color (c_constraint_colour (a_node))
				row.set_item (Node_grid_col_constraint, gli)
			end
		end

	end_c_primitive_object (a_node: attached C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- exit an C_PRIMITIVE_OBJECT
		do
			if not updating then
				ev_grid_row_stack.remove
			end
		end

	start_c_domain_type (a_node: attached C_DOMAIN_TYPE; depth: INTEGER)
			-- enter an C_DOMAIN_TYPE
		do
		end

	start_c_code_phrase (a_node: attached C_CODE_PHRASE; depth: INTEGER)
			-- enter an C_CODE_PHRASE
		local
			row: EV_GRID_ROW
			constraint_str: STRING
			i: INTEGER
			bmm_prop: BMM_PROPERTY_DEFINITION
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			-- terminology_id field
			if attached a_node.terminology_id then
				-- build the grid row
				bmm_prop := rm_schema.property_definition ("CODE_PHRASE", "terminology_id")
				if not updating then
					gui_grid.add_sub_row (row, bmm_prop.name)
					gui_grid.set_last_row_label_col (Node_grid_col_rm_name, bmm_prop.name, Void, c_object_attribute_colour (a_node), get_icon_pixmap ("rm/generic/" + bmm_prop.multiplicity_key_string))
					gui_grid.set_last_row_label_col (Node_grid_col_constraint, a_node.terminology_id.value, Void, c_constraint_colour (a_node), Void)
				end
			end

			-- code_string field
			if attached a_node.code_list then
				create constraint_str.make_empty
				from a_node.code_list.start until a_node.code_list.off loop
					constraint_str.append_string (term_string (a_node.terminology_id.value, a_node.code_list.item))
					if a_node.has_assumed_value and then a_node.assumed_value.code_string.is_equal (a_node.code_list.item) then
						constraint_str.append (" (" + get_text ("assumed_text") + ")")
					end
					if not a_node.code_list.islast then
						constraint_str.append_string ("%N")
					end
					a_node.code_list.forth
				end

				-- build the grid row
				bmm_prop := rm_schema.property_definition ("CODE_PHRASE", "code_string")
				if not updating then
					gui_grid.add_sub_row (row, bmm_prop.name)
					gui_grid.set_last_row_label_col (Node_grid_col_rm_name, bmm_prop.name, Void, c_object_attribute_colour (a_node), get_icon_pixmap ("rm/generic/" + bmm_prop.multiplicity_key_string))
					gui_grid.set_last_row_label_col_multi_line (Node_grid_col_constraint, constraint_str, Void, c_constraint_colour (a_node), Void)
				else
					from i := 1 until i > row.subrow_count loop
						if attached {STRING} row.subrow (i).data as str and then str.is_equal (bmm_prop.name) then
							gui_grid.set_last_row (row.subrow (i))
							gui_grid.update_last_row_label_col (Node_grid_col_constraint, constraint_str, Void, Void, Void)
							i := row.subrow_count + 1
						end
						i := i + 1
					end
				end
			end
		end

	end_c_code_phrase (a_node: attached C_CODE_PHRASE; depth: INTEGER)
			-- exit an C_CODE_PHRASE
		do
			if not updating then
				ev_grid_row_stack.remove
			end
		end

	start_c_ordinal (a_node: attached C_DV_ORDINAL; depth: INTEGER)
			-- enter an C_DV_ORDINAL
		local
			assumed_flag: BOOLEAN
			row: EV_GRID_ROW
			constraint_str: STRING
			i: INTEGER
			bmm_prop_key: STRING
			bmm_prop_value, bmm_prop_symbol: BMM_PROPERTY_DEFINITION
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			if not a_node.any_allowed then
				-- build the constraint string
				create constraint_str.make_empty
				from a_node.items.start until a_node.items.off loop
					assumed_flag := a_node.has_assumed_value and then a_node.assumed_value.value = a_node.items.item.value
					constraint_str.append_string (object_ordinal_item_string (a_node.items.item, assumed_flag))
					if not a_node.items.islast then
						constraint_str.append_string ("%N")
					end
					a_node.items.forth
				end

				-- build the grid row
				bmm_prop_value := rm_schema.property_definition ("DV_ORDINAL", "value")
				bmm_prop_symbol := rm_schema.property_definition ("DV_ORDINAL", "symbol")
				bmm_prop_key := bmm_prop_value.name + " - " + bmm_prop_symbol.name
				if not updating then
					gui_grid.add_sub_row (row, bmm_prop_key)
					gui_grid.set_last_row_label_col (Node_grid_col_rm_name, bmm_prop_key, Void, c_object_attribute_colour (a_node),
						get_icon_pixmap ("rm/generic/" + bmm_prop_value.multiplicity_key_string))
					gui_grid.set_last_row_label_col_multi_line (Node_grid_col_constraint, constraint_str, Void, c_constraint_colour (a_node), Void)
				else
					from i := 1 until i > row.subrow_count loop
						if attached {STRING} row.subrow (i).data as str and then str.is_equal (bmm_prop_key) then
							gui_grid.set_last_row (row.subrow (i))
							gui_grid.update_last_row_label_col (Node_grid_col_constraint, constraint_str, Void, Void, Void)
							i := row.subrow_count + 1
						end
						i := i + 1
					end
				end
			end
		end

	end_c_ordinal (a_node: attached C_DV_ORDINAL; depth: INTEGER)
			-- exit an C_DV_ORDINAL
		do
			if not updating then
				ev_grid_row_stack.remove
			end
		end

	start_c_quantity (a_node: attached C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		local
			row: EV_GRID_ROW
			constraint_str: STRING
			bmm_prop_key: STRING
			bmm_prop_magnitude, bmm_prop_units, bmm_prop_precision: BMM_PROPERTY_DEFINITION
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			if not updating then
				-- property constraint
				if attached a_node.property then
					gui_grid.add_sub_row (row, Void)
					gui_grid.set_last_row_label_col (Node_grid_col_rm_name, "property", Void, c_constraint_colour (a_node), get_icon_pixmap ("rm/generic/c_meta_attribute"))
					gui_grid.set_last_row_label_col (Node_grid_col_constraint, term_string (a_node.property.terminology_id.value, a_node.property.code_string), Void, c_constraint_colour (a_node), Void)
				end

				-- magnitude / units / precision constraint
				if attached a_node.list then
					create constraint_str.make_empty
					from a_node.list.start until a_node.list.off loop
						constraint_str.append_string (c_quantity_item_string (a_node.list.item))
						if not a_node.list.islast then
							constraint_str.append_string ("%N")
						end
						a_node.list.forth
					end
					-- assumed value
					if a_node.has_assumed_value then
						constraint_str.append ("%N" + a_node.assumed_value.magnitude_as_string + " (" + get_text ("assumed_text") + ")")
					end

					-- build the grid row
					bmm_prop_magnitude := rm_schema.property_definition ("DV_QUANTITY", "magnitude")
					bmm_prop_units := rm_schema.property_definition ("DV_QUANTITY", "units")
					bmm_prop_precision := rm_schema.property_definition ("DV_QUANTITY", "precision")
					bmm_prop_key := bmm_prop_magnitude.name + " | " + bmm_prop_units.name + " | " + bmm_prop_precision.name

					gui_grid.add_sub_row (row, Void)
					gui_grid.set_last_row_label_col (Node_grid_col_rm_name, bmm_prop_key, Void, c_object_attribute_colour (a_node),
						get_icon_pixmap ("rm/generic/" + bmm_prop_magnitude.multiplicity_key_string))
					gui_grid.set_last_row_label_col_multi_line (Node_grid_col_constraint, constraint_str, Void, c_constraint_colour (a_node), Void)
				end
			end
		end

	end_c_quantity (a_node: attached C_DV_QUANTITY; depth: INTEGER)
			-- exit a C_DV_QUANTITY
		do
			if not updating then
				ev_grid_row_stack.remove
			end
		end

	do_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION; co: C_OBJECT; depth: INTEGER)
			-- enter a BMM_PROPERTY_DEFINITION
		local
			bmm_class_def: BMM_CLASS_DEFINITION
		do
			-- first of all work out whether we want this property
			if not (attached {C_COMPLEX_OBJECT} co as cco and then cco.has_attribute (a_bmm_prop.name))
				and not attached {C_REFERENCE_OBJECT} co
				and not (attached {C_DOMAIN_TYPE} co as cdt and then cdt.constrained_rm_attributes.has (a_bmm_prop.name))
			then
				ev_grid_rm_row_stack.extend (node_grid_row_map.item (co))
				ev_grid_rm_row_removals_stack.extend (False)
				create rm_node_path.make_from_string (co.path)

				-- do this property
				enter_rm_property (a_bmm_prop, depth)

				-- if it wasn't removed, do its children, to a certain depth
				if not ev_grid_rm_row_removals_stack.item then
					bmm_class_def := rm_schema.class_definition (a_bmm_prop.type.root_class)
					bmm_class_def.do_supplier_closure (not differential_view, agent continue_rm_property, agent enter_rm_property, agent exit_rm_property)
				end

				exit_rm_property (a_bmm_prop)

				ev_grid_rm_row_stack.remove
				ev_grid_rm_row_removals_stack.remove
			end
		end

	continue_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION; depth: INTEGER): BOOLEAN
			-- detrmine whether to continue a BMM_PROPERTY_DEFINITION
		do
			if attached last_property_grid_row then
				if last_property_grid_row.subrow (1).subrow_count > 0 then
					Result := True
				else
					Result := depth < 2
				end
			end
		end

	last_property_grid_row: EV_GRID_ROW

	enter_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION; depth: INTEGER)
			-- enter a BMM_PROPERTY_DEFINITION
		local
			parent_class_row: EV_GRID_ROW
			prop_str, type_str: STRING
			has_type_subs: BOOLEAN
			type_spec: BMM_TYPE_SPECIFIER
			col: EV_COLOR
			show_prop: BOOLEAN
			ignore: BOOLEAN
		do
			if not ev_grid_rm_row_removals_stack.item then -- don't do anything if descending into a removed subtree
				-- first of all work out whether we want this property
				show_prop := include_rm_data_properties
					and (not a_bmm_prop.is_im_runtime or else include_rm_runtime_properties)
					and (not a_bmm_prop.is_im_infrastructure or else include_rm_infrastructure_properties)

				-- if the row already exists then refresh it or remove it depending on settings; otherwise create it or do nothing
				parent_class_row := ev_grid_rm_row_stack.item
				last_property_grid_row := Void
				if attached gui_grid.matching_sub_row (parent_class_row,
					agent (a_row: EV_GRID_ROW; match_bmm_prop: BMM_PROPERTY_DEFINITION): BOOLEAN
						do
							Result := attached {BMM_PROPERTY_DEFINITION} a_row.data as bmm_prop and then bmm_prop = match_bmm_prop
						end (?, a_bmm_prop)) as a_prop_row
				then
					-- put something on the stack to match stack removal in exit routine
					if show_prop then
						last_property_grid_row := a_prop_row
						-- refresh its object rows
						refresh_row (a_prop_row.subrow (1))
						rm_node_path.append_segment (create {OG_PATH_ITEM}.make (a_bmm_prop.name))
						ev_grid_rm_row_stack.extend (a_prop_row.subrow (1))
					else
						gui_grid.ev_grid.remove_row (a_prop_row.index)
						ignore := True
					end

				else
					if show_prop then
						-- determine data for property and one or more (in the case of generics with > 1 param) class nodes
						prop_str := a_bmm_prop.name.twin
						if attached {BMM_CLASS_DEFINITION} a_bmm_prop.type as bmm_class_def then
							type_str := bmm_class_def.name
							has_type_subs := bmm_class_def.has_type_substitutions
							type_spec := bmm_class_def

						elseif attached {BMM_CONTAINER_TYPE_REFERENCE} a_bmm_prop.type as bmm_cont_type_ref then
							prop_str.append (": " + bmm_cont_type_ref.container_type.name + Generic_left_delim.out + Generic_right_delim.out)
							type_str := bmm_cont_type_ref.type.name
							has_type_subs := bmm_cont_type_ref.type.has_type_substitutions
							type_spec := bmm_cont_type_ref.type

						elseif attached {BMM_GENERIC_TYPE_REFERENCE} a_bmm_prop.type as bmm_gen_type_ref then
							type_str := bmm_gen_type_ref.as_type_string
							has_type_subs := bmm_gen_type_ref.has_type_substitutions
							type_spec := bmm_gen_type_ref.root_type

						elseif attached {BMM_GENERIC_PARAMETER_DEFINITION} a_bmm_prop.type as bmm_gen_parm_def then -- type is T, U etc
							type_str := bmm_gen_parm_def.as_type_string
							has_type_subs := bmm_gen_parm_def.has_type_substitutions
							type_spec := a_bmm_prop.type
						end

						-- ======== property node =========
						gui_grid.add_sub_row (parent_class_row, a_bmm_prop)
						last_property_grid_row := gui_grid.last_row

						if a_bmm_prop.is_im_infrastructure then
							col := rm_infrastructure_attribute_colour
						elseif a_bmm_prop.is_im_runtime then
							col := rm_runtime_attribute_colour
						else
							col := rm_attribute_color
						end
						rm_node_path.append_segment (create {OG_PATH_ITEM}.make (a_bmm_prop.name))
						gui_grid.set_last_row_label_col (Node_grid_col_rm_name, prop_str, rm_node_path.as_string,
							col, get_icon_pixmap ("rm/generic/" + a_bmm_prop.multiplicity_key_string))

						-- existence
						gui_grid.set_last_row_label_col (Node_grid_col_existence, a_bmm_prop.existence.as_string, Void, col, Void)

						-- cardinality
						if attached {BMM_CONTAINER_PROPERTY} a_bmm_prop as bmm_cont_prop then
							gui_grid.set_last_row_label_col (Node_grid_col_card_occ, bmm_cont_prop.cardinality.as_string, Void, col, Void)
						end

						-- add tree expand handler to this node
						gui_grid.last_row.expand_actions.force_extend (agent property_node_expand_handler (gui_grid.last_row))

						-- add right-click menu to property node for removal etc
			--			if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (Node_grid_col_rm_name) as gli then
			--		 		gli.pointer_button_press_actions.force_extend (agent property_node_handler (a_ti, ?, ?, ?))
			--			end

						-- ======== type node =========
						gui_grid.add_sub_row (gui_grid.last_row, type_spec)
						ev_grid_rm_row_stack.extend (gui_grid.last_row)
						gui_grid.set_last_row_label_col (Node_grid_col_rm_name, type_str, rm_node_path.as_string, archetype_rm_type_color, rm_type_pixmap (type_spec, rm_publisher))
						gui_grid.add_last_row_pointer_button_press_actions (Node_grid_col_rm_name, agent class_node_handler (gui_grid.last_row, ?, ?, ?))
				 	else
						ignore := True
				 	end
			 	end
			else
				ignore := True
			end
		 	ev_grid_rm_row_removals_stack.extend (ignore)
		end

	exit_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION)
			-- exit a BMM_PROPERTY_DEFINITION
		do
			if not ev_grid_rm_row_removals_stack.item then
				rm_node_path.remove_last
				ev_grid_rm_row_stack.remove
			end
		 	ev_grid_rm_row_removals_stack.remove
		end

feature {NONE} -- Implementation

	node_tooltip_str (a_node: attached ARCHETYPE_CONSTRAINT): STRING
			-- generate a tooltip for this node as UTF-32 String
		local
			p: STRING
			bindings: HASH_TABLE [CODE_PHRASE, STRING]
		do
			p := a_node.path
			Result := ontology.physical_to_logical_path (p, language, True)
			if show_rm_inheritance then
				Result.append ("%N%N" + get_text ("inheritance_status_text") +  specialisation_status_names.item (a_node.specialisation_status))
			end
			if ontology.has_any_term_binding (p) then
				Result.append ("%N%N" + get_text ("term_bindings_tooltip_text") + "%N")
				bindings := ontology.term_bindings_for_key (p)
				across bindings as bindings_csr loop
					Result.append ("%T" + bindings_csr.key + ": " + bindings_csr.item.as_string + "%N")
				end
			end
			if archetype.has_annotation_at_path (language, a_node.path) then
				Result.append ("%N%N" + get_text ("annotations_text") + ":%N")
				Result.append (archetype.annotations.annotations_at_path (language, a_node.path).as_string)
			end
		end

	ev_grid_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- stack for building the tree

	ev_grid_rm_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- stack for building the RM node tree

	ev_grid_rm_row_removals_stack: detachable ARRAYED_STACK [BOOLEAN]
			-- stack for tracking removals

	node_grid_row_map: HASH_TABLE [EV_GRID_ROW, ARCHETYPE_CONSTRAINT]
			-- xref table from archetype definition nodes to GUI grid rows

	rm_node_path: detachable OG_PATH

	gui_grid: EVX_GRID

	rm_schema: BMM_SCHEMA

	show_codes: BOOLEAN
			-- True if codes should be shown

	show_rm_inheritance: BOOLEAN
			-- True if inheritance colourisation should be used

	in_technical_view, include_rm_data_properties, include_rm_runtime_properties, include_rm_infrastructure_properties: BOOLEAN

	rm_publisher: STRING
			-- name of reference model of this archetype, for the purpose of finding pixmaps for RM-specific visualisation

	updating: BOOLEAN
			-- True indicates that the visitor is just updating the text value of the nodes

	language: attached STRING
			-- IETF RFC 5646 language tag; wll be an exact text match
			-- for one of the 'languages' in the archetype

	c_quantity_item_string (a_node: attached C_QUANTITY_ITEM): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			if a_node.magnitude /= Void then
				Result.append (a_node.magnitude.as_string)
			end
			Result.append (" | ")
			if a_node.units /= Void then
				Result.append (a_node.units)
			end
			Result.append (" | ")
			if a_node.precision /= Void then
				Result.append (a_node.precision.as_string)
			end
		end

	object_ordinal_item_string (an_ordinal: attached ORDINAL; assumed_flag: BOOLEAN): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			Result.append (an_ordinal.value.out)
			Result.append (" - ")
			Result.append (term_string (an_ordinal.symbol.terminology_id.value, an_ordinal.symbol.code_string))
			if assumed_flag then
				Result.append (" (" + get_text ("assumed_text") + ")")
			end
		end

	local_term_string (a_code: STRING): attached STRING
			-- generate a string of the form "[code|rubric|]" if in technical mode,
			-- or else "rubric"
		local
			rubric: STRING
		do
			create Result.make_empty
			if is_valid_code (a_code) then
				if is_term_code (a_code) then
					if ontology.has_term_code (a_code) then
						rubric := ontology.term_definition (language, a_code).text
					else
						rubric := flat_parent.ontology.term_definition (language, a_code).text
					end
				else
					if ontology.has_constraint_code (a_code) then
						rubric := ontology.constraint_definition (language, a_code).text
					else
						rubric := flat_parent.ontology.constraint_definition (language, a_code).text
					end
				end
				if show_codes then
					Result.append (a_code + "|" + rubric + "|")
				else
					Result.append (rubric)
				end
			else
				Result.append (a_code)
			end
		end

	term_string (a_terminology_id, a_code: STRING): attached STRING
			-- generate a string of the form "[code|rubric|]" if in technical mode,
			-- or else "rubric"
		local
			a_term: DV_CODED_TEXT
		do
			create Result.make_empty
			if a_terminology_id.is_equal (Local_terminology_id) then
				Result := local_term_string (a_code)
			elseif ts.has_terminology (a_terminology_id) then
				if ts.terminology (a_terminology_id).has_concept_id (a_code, language) then
					a_term := ts.terminology (a_terminology_id).term (a_code, language)
				else
					a_term := ts.terminology (a_terminology_id).term (a_code, Default_language)
				end
				if show_codes then
					Result.append (a_term.as_string)
				else
					Result.append (a_term.value)
				end
			else
				Result.append (a_code)
			end
		end

	object_invariant_string (an_inv: attached ASSERTION): attached STRING
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string
			if not show_codes then
				Result := ontology.substitute_codes (Result, language)
			end
		end

	add_code_select_context_menu (a_code: STRING; x,y, button: INTEGER)
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right then
				create menu
				create an_mi.make_with_text_and_action (get_text ("menu_option_display_code"), agent code_select_agent.call ([a_code]))
				menu.extend (an_mi)
				menu.show
			end
		end

	code_select_agent: PROCEDURE [ANY, TUPLE [STRING]]
			-- action to perform when node is selected in tree

	path_select_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- action to perform when path is selected in tree

	c_object_colour (a_node: C_OBJECT): EV_COLOR
			-- generate a foreground colour for RM type representing inheritance status
		do
			if show_rm_inheritance then
				inspect a_node.specialisation_status
				when ss_added then
					Result := archetype_rm_type_color

				when ss_redefined then
					Result := archetype_rm_type_redefined_color

				when ss_id_redefined then
					Result := archetype_rm_type_redefined_color

				when ss_inherited then
					Result := archetype_rm_type_inherited_color

				else
					Result := archetype_rm_type_color
				end
			else
				Result := archetype_rm_type_color
			end
		end

	c_attribute_colour (a_node: C_ATTRIBUTE): EV_COLOR
			-- generate a foreground colour for RM attribute representing inheritance status
		do
			if show_rm_inheritance then
				inspect a_node.specialisation_status
				when ss_added then
					Result := archetyped_attribute_color

				when ss_redefined then
					Result := archetype_rm_type_redefined_color

				when ss_inherited then
					Result := archetype_rm_type_inherited_color

				else
					Result := archetyped_attribute_color
				end
			else
				Result := archetyped_attribute_color
			end
		end

	c_object_attribute_colour (a_node: C_OBJECT): EV_COLOR
			-- generate a foreground colour for an equivalent RM attribute representing inheritance status
		do
			if show_rm_inheritance then
				inspect a_node.specialisation_status
				when ss_added then
					Result := archetyped_attribute_color

				when ss_redefined then
					Result := archetype_rm_type_redefined_color

				when ss_id_redefined then
					Result := archetype_rm_type_redefined_color

				when ss_inherited then
					Result := archetype_rm_type_inherited_color

				else
					Result := archetyped_attribute_color
				end
			else
				Result := archetyped_attribute_color
			end
		end

	c_constraint_colour (a_node: ARCHETYPE_CONSTRAINT): EV_COLOR
			-- generate a foreground colour for RM attribute representing inheritance status
		do
			if show_rm_inheritance then
				inspect a_node.specialisation_status
				when ss_inherited then
					Result := archetype_rm_type_inherited_color
				else
					Result := archetype_constraint_color
				end
			else
				Result := archetype_constraint_color
			end
		end

	c_meaning_colour (a_node: ARCHETYPE_CONSTRAINT): EV_COLOR
			-- generate a foreground colour for RM attribute representing inheritance status
		do
			if show_rm_inheritance then
				inspect a_node.specialisation_status
				when ss_inherited then
					Result := archetype_rm_type_inherited_color
				when ss_redefined then
					Result := archetype_rm_type_redefined_color
				else

				end
			end
		end

	c_object_pixmap (a_node: C_OBJECT): EV_PIXMAP
			-- find a pixmap for any C_OBJECT node
		local
			pixmap_name: STRING
		do
			pixmap_name := rm_icon_dir + resource_path_separator + rm_publisher + resource_path_separator + a_node.rm_type_name
			if use_rm_pixmaps and then has_icon_pixmap (pixmap_name) then
				Result := get_icon_pixmap (pixmap_name)
			elseif has_icon_pixmap (a_node.generating_type + a_node.occurrences_key_string) then
				Result := get_icon_pixmap ("am" + resource_path_separator + "added" + resource_path_separator + a_node.generating_type + a_node.occurrences_key_string)
			else
				Result := get_icon_pixmap ("am" + resource_path_separator + "added" + resource_path_separator + a_node.generating_type)
			end
		end

	c_object_slot_pixmap (a_node: C_OBJECT): EV_PIXMAP
			-- find a pixmap for an ARCHETYPE_SLOT node if using RM pixmaps
		require
			use_rm_pixmaps
		local
			base_pixmap_name, slot_pixmap_name: STRING
		do
			base_pixmap_name := rm_icon_dir + resource_path_separator + rm_publisher + resource_path_separator + a_node.rm_type_name
			create slot_pixmap_name.make_empty
			slot_pixmap_name.append (base_pixmap_name)
			slot_pixmap_name.append ("_slot")
			if has_icon_pixmap (slot_pixmap_name) then
				Result := get_icon_pixmap (slot_pixmap_name)
			else
				Result := get_icon_pixmap (base_pixmap_name)
			end
		end

	c_attribute_pixmap (a_node: C_ATTRIBUTE): EV_PIXMAP
		local
			pixmap_name: STRING
		do
			if a_node.has_differential_path then
				pixmap_name := rm_schema.property_definition_at_path (a_node.parent.rm_type_name, a_node.rm_attribute_path).multiplicity_key_string
			else
				pixmap_name := rm_schema.property_definition (a_node.parent.rm_type_name, a_node.rm_attribute_name).multiplicity_key_string
			end
			Result := get_icon_pixmap ("am" + resource_path_separator + "added" + resource_path_separator + pixmap_name)
		end

	arch_class_node_handler (a_class_grid_row: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {C_OBJECT} a_class_grid_row.data as co then
				a_class_grid_row.item (1).enable_select
				create menu
				add_class_context_menu (menu, rm_schema.class_definition (co.rm_type_name))

				-- if this node is addressable, add menu item to show node_id in ontology
				if co.is_addressable then
					create an_mi.make_with_text_and_action (get_text ("view_node_id_in_ontology"), agent code_select_agent.call ([co.node_id]))
					menu.extend (an_mi)
				end

				-- add menu item for displaying path in path map
				if attached path_select_agent then
					create an_mi.make_with_text_and_action (get_text ("menu_option_display_path"), agent path_select_agent.call ([co.path]))
					menu.extend (an_mi)
				end

				if attached {ARCHETYPE_SLOT} co as arch_slot and then not arch_slot.is_closed then
					add_slot_submenu (menu, arch_slot)
				end
				menu.show
			end
		end

	add_slot_submenu (menu: EV_MENU; a_slot: ARCHETYPE_SLOT)
			-- create a sub-menu with preferred slot-filler archetypes for a given slot
		local
			an_mi: EV_MENU_ITEM
			sub_menu: EV_MENU
			slot_match_ids: ARRAYED_SET [STRING]
			ara: ARCH_CAT_ARCHETYPE
		do
			create sub_menu.make_with_text (get_text ("archetype_slot_node_submenu_text"))
			create slot_match_ids.make (0)
			slot_match_ids.compare_objects
			if not a_slot.includes.is_empty and not a_slot.includes.first.matches_any then
				from a_slot.includes.start until a_slot.includes.off loop
					if attached {STRING} a_slot.includes.item.extract_regex as a_regex then
						slot_match_ids.merge (current_arch_cat.matching_ids (a_regex, a_slot.rm_type_name, Void))
					end
					a_slot.includes.forth
				end
			end

			-- ensure we have only a unique set
			from slot_match_ids.start until slot_match_ids.off loop
				ara := current_arch_cat.archetype_index.item (slot_match_ids.item)
				create an_mi.make_with_text_and_action (slot_match_ids.item, agent (gui_agents.select_archetype_in_new_tool_agent).call ([ara]))
				an_mi.set_pixmap (get_icon_pixmap ("archetype/" + ara.group_name))
				sub_menu.extend (an_mi)
				slot_match_ids.forth
			end

			if not sub_menu.is_empty then
				menu.extend (sub_menu)
			end
		end

	class_node_handler (a_class_grid_row: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			subs: ARRAYED_SET[STRING]
			menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_TYPE_SPECIFIER} a_class_grid_row.data as bmm_type_spec then
				a_class_grid_row.item (1).enable_select
				create menu
				-- add menu item for retarget tool to current node / display in new tool
				if attached {BMM_CLASS_DEFINITION} a_class_grid_row.data as a_class_def then
					add_class_context_menu (menu, a_class_def)
				end

				-- if there are type substitutions available, add sub-menu for that
				if attached {BMM_CLASS_DEFINITION} bmm_type_spec as bmm_class_def then
					subs := bmm_class_def.type_substitutions
				elseif attached {BMM_CONTAINER_TYPE_REFERENCE} bmm_type_spec as bmm_cont_type_ref then
					subs := bmm_cont_type_ref.type.type_substitutions
				elseif attached {BMM_GENERIC_TYPE_REFERENCE} bmm_type_spec as bmm_gen_type_ref then
					subs := bmm_gen_type_ref.type_substitutions
				elseif attached {BMM_GENERIC_PARAMETER_DEFINITION} bmm_type_spec as bmm_gen_parm_def then -- type is T, U etc
					subs := bmm_gen_parm_def.type_substitutions
				end
				if not subs.is_empty then
					add_subtype_context_menu (menu, subs, a_class_grid_row)
				end
				menu.show
			end
		end

	add_class_context_menu (menu: EV_MENU; a_bmm_class_def: BMM_CLASS_DEFINITION)
			-- dynamically initializes the context menu for this tree
		local
			an_mi: EV_MENU_ITEM
		do
			create an_mi.make_with_text_and_action (get_msg ("display_class", Void), agent display_context_selected_class_in_new_tool (a_bmm_class_def))
			an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
			menu.extend (an_mi)
		end

	display_context_selected_class_in_new_tool (a_class_def: BMM_CLASS_DEFINITION)
		do
			gui_agents.select_class_in_new_tool_agent.call ([a_class_def])
		end

	add_subtype_context_menu (menu: EV_MENU; a_substitutions: ARRAYED_SET[STRING]; a_class_grid_row: EV_GRID_ROW)
			-- dynamically initializes the context menu for this tree
		local
			an_mi: EV_MENU_ITEM
			chg_sub_menu: EV_MENU
		do
			-- create sub menu listing subtypes to change current node into
			create chg_sub_menu.make_with_text (get_text ("context_menu_convert_node_to_subtype"))
			from a_substitutions.start until a_substitutions.off loop
				create an_mi.make_with_text_and_action (a_substitutions.item, agent convert_node_to_subtype (a_substitutions.item, a_class_grid_row, True))
				if rm_schema.class_definition (a_substitutions.item).is_abstract then
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
				else
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
				end
	    		chg_sub_menu.extend (an_mi)
				a_substitutions.forth
			end
			menu.extend (chg_sub_menu)

			-- if owning attribute is multiple, allow adding of sibling nodes
--			if attached a_class_grid_row.parent_row and then
--				attached {BMM_PROPERTY_DEFINITION} a_class_grid_row.parent_row.data as a_prop_def and then a_prop_def.is_container
--			then
--				-- create sub menu listing subtypes to add to parent node
--				create chg_sub_menu.make_with_text (get_text ("context_menu_add_subtype_mode"))
--				from a_substitutions.start until a_substitutions.off loop
--					create an_mi.make_with_text_and_action (a_substitutions.item, agent convert_node_to_subtype (a_substitutions.item, a_class_grid_row, False))
--					if rm_schema.class_definition (a_substitutions.item).is_abstract then
--						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
--					else
--						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
--					end
--		    		chg_sub_menu.extend (an_mi)
--					a_substitutions.forth
--				end
--				menu.extend (chg_sub_menu)
--			end
		end

	property_node_expand_handler (a_prop_grid_row: EV_GRID_ROW)
		local
			i: INTEGER
		do
			-- there can be more than one class subrow below a property because of additions done by user choosing
			-- 'add_subtype' menu option
			from i := 1 until i > a_prop_grid_row.subrow_count loop
				if a_prop_grid_row.subrow (i).subrow_count = 0 and attached {BMM_TYPE_SPECIFIER} a_prop_grid_row.subrow (i).data as bmm_type_spec then
					convert_node_to_subtype (bmm_type_spec.root_class, a_prop_grid_row.subrow (i), True)
				end
				i := i + 1
			end
		end

	convert_node_to_subtype (a_subtype: attached STRING; a_class_grid_row: EV_GRID_ROW; replace_mode: BOOLEAN)
			-- rebuild EV tree from interior node of class with a new tree of selected subtype
		local
			bmm_subtype_def: BMM_CLASS_DEFINITION
		do
			bmm_subtype_def := rm_schema.class_definition (a_subtype)
			-- set the RM path from the sibling node; it is the regardless of whether we are replacing or adding nodes
			if attached {EV_GRID_LABEL_ITEM} a_class_grid_row.item (Node_grid_col_rm_name) as gli then
				create rm_node_path.make_from_string (utf32_to_utf8 (gli.tooltip))
			end
			if replace_mode then
				gui_grid.remove_sub_rows (a_class_grid_row)
				gui_grid.set_last_row (a_class_grid_row)
				gui_grid.update_last_row_label_col (Node_grid_col_rm_name, a_subtype, Void, archetype_rm_type_color,
					rm_type_pixmap (bmm_subtype_def, rm_publisher))
				gui_grid.last_row.set_data (bmm_subtype_def)
				ev_grid_rm_row_stack.extend (a_class_grid_row)
			else
				gui_grid.add_sub_row (a_class_grid_row.parent_row, bmm_subtype_def)
				gui_grid.set_last_row_label_col (Node_grid_col_rm_name, a_subtype, rm_node_path.as_string, archetype_rm_type_color,
					rm_type_pixmap (bmm_subtype_def, rm_publisher))
				if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (Node_grid_col_rm_name) as gli then
	 	 			gli.pointer_button_press_actions.force_extend (agent class_node_handler (gui_grid.last_row, ?, ?, ?))
					gui_grid.last_row.expand_actions.force_extend (agent property_node_expand_handler (gui_grid.last_row))
				end
				ev_grid_rm_row_stack.extend (gui_grid.last_row)
			end

			ev_grid_rm_row_removals_stack.extend (False)

			bmm_subtype_def.do_supplier_closure (not differential_view, agent continue_rm_property, agent enter_rm_property, agent exit_rm_property)

			ev_grid_rm_row_stack.remove
			ev_grid_rm_row_removals_stack.remove

			if a_class_grid_row.is_expandable then
				a_class_grid_row.expand
			end
		end

	refresh_row (a_row: EV_GRID_ROW)
		do
			if attached {BMM_TYPE_SPECIFIER} a_row.data as a_type_spec then
				if attached {EV_GRID_LABEL_ITEM} a_row.item (Node_grid_col_rm_name) as gli then
					gli.set_pixmap (rm_type_pixmap (a_type_spec, rm_publisher))
				end
			end
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
--| The Original Code is constraint_model_visitor.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
