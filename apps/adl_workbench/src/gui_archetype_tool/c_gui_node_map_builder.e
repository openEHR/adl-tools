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

class C_GUI_NODE_MAP_BUILDER

inherit
	C_VISITOR
		rename
			initialise as initialise_visitor
		redefine
			end_c_archetype_root,
			end_c_complex_object,
			end_c_attribute,
			end_archetype_slot,
			end_archetype_internal_ref,
			end_constraint_ref,
			end_c_code_phrase, end_c_ordinal, end_c_quantity,
			end_c_primitive_object
		end

	SHARED_APP_UI_RESOURCES
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

	SPECIALISATION_STATUSES
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

feature -- Initialisation

	initialise (a_rm_schema: BMM_SCHEMA; an_archetype: attached ARCHETYPE; a_lang: attached STRING; a_gui_tree: EV_GRID;
				technical_mode_flag, update_flag: BOOLEAN;
				a_gui_node_map: HASH_TABLE [EV_GRID_ROW, ARCHETYPE_CONSTRAINT];
				a_code_select_agent: attached PROCEDURE [ANY, TUPLE [STRING]])
			-- set ontology required for serialising cADL, and perform basic initialisation
		do
			initialise_visitor (an_archetype)
			rm_schema := a_rm_schema
			create ontologies.make(0)
			ontologies.extend (archetype.ontology)
			ev_grid := a_gui_tree
			node_grid_row_map := a_gui_node_map
			in_technical_mode := technical_mode_flag
			updating := update_flag
			language := a_lang
			rm_publisher := an_archetype.archetype_id.rm_originator.as_lower
			create ev_grid_row_stack.make (0)
			code_select_agent := a_code_select_agent
		end

feature -- Visitor

	start_c_object (a_node: attached C_OBJECT; depth: INTEGER)
			-- enter a C_OBJECT
		local
			row: EV_GRID_ROW
			s: STRING
			gli: EV_GRID_LABEL_ITEM
		do
			if not updating then
				-- create a new row
				if a_node.is_root then
					ev_grid.insert_new_row (1)
					last_row := ev_grid.row (1)
				else
					ev_grid_row_stack.item.insert_subrow (ev_grid_row_stack.item.subrow_count + 1)
					last_row := ev_grid_row_stack.item.subrow (ev_grid_row_stack.item.subrow_count)
				end
				last_row.set_data (a_node)
				node_grid_row_map.put (last_row, a_node)

				-- rm_name column
				create gli.make_with_text (a_node.rm_type_name)
				gli.set_foreground_color (archetype_rm_type_color)
				last_row.set_item (Node_grid_col_rm_name, gli)

				-- meaning column - blank text + add select event
				last_row.set_item (Node_grid_col_meaning, create {EV_GRID_LABEL_ITEM}.make_with_text (""))
				if a_node.is_addressable then
		 			last_row.item (Node_grid_col_meaning).pointer_button_press_actions.force_extend (agent call_code_select_agent (a_node.node_id, ?, ?, ?))
				end

				-- card/occ column
				create s.make_empty
				if attached a_node.occurrences then
					if not a_node.occurrences.is_prohibited then
						s.append (a_node.occurrences_as_string)
					else
						s.append (get_text ("occurrences_removed_text"))
					end
				end
				create gli.make_with_text (s)
				gli.set_foreground_color (archetype_constraint_color)
				last_row.set_item (Node_grid_col_card_occ, gli)

				-- constraint column
				if attached {C_DEFINED_OBJECT} a_node as c_do and then c_do.any_allowed then
					create gli.make_with_text (Archetype_any_constraint)
					gli.set_foreground_color (archetype_constraint_color)
					last_row.set_item (Node_grid_col_constraint, gli)
				end

				-- remember on stack
				ev_grid_row_stack.extend (last_row)
			end
			row := node_grid_row_map.item (a_node)

			-- update the pixmap and tooltip of rm_name column
			if attached {EV_GRID_LABEL_ITEM} row.item (node_grid_col_rm_name) as gli2 then
				gli2.set_pixmap (c_object_pixmap (a_node))
				gli2.set_tooltip (node_tooltip_str (a_node))
			end

			-- update meaning column
			if a_node.is_addressable and then attached {EV_GRID_LABEL_ITEM} row.item (Node_grid_col_meaning) as gli_meaning then
				gli_meaning.set_text (utf8_to_utf32 (coded_text_string (a_node.node_id)))
			end

			-- sibling order column
			create s.make_empty
			if a_node.is_addressable and then attached a_node.sibling_order then
				if a_node.sibling_order.is_after then
					s.append ("after ")
				else
					s.append ("before ")
				end
				s.append (" " + coded_text_string (a_node.sibling_order.sibling_node_id))
			end
			row.set_item (Node_grid_col_sibling_order, create {EV_GRID_LABEL_ITEM}.make_with_text (utf8_to_utf32 (s)))
		end

	start_c_complex_object (a_node: attached C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter n C_COMPLEX_OBJECT
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
			row, sub_row: EV_GRID_ROW
--			i: INTEGER
			gli: EV_GRID_LABEL_ITEM
			s_32: STRING_32
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			if updating then
--				if a_node.has_includes or a_node.has_excludes then
--					from i := 1 until i > row.subrow_count loop
--						if attached {ASSERTION} row.subrow (i).data as assn then
--							row.subrow (i).set_item (Node_grid_col_constraint, create {EV_GRID_LABEL_ITEM}.make_with_text (object_invariant_string (assn)))
--						end
--						i := i + 1
--					end
--				end
			else
				-- add closed indicator in constraint column
				if a_node.is_closed then
					create gli.make_with_text (Archetype_slot_closed)
					gli.set_foreground_color (archetype_constraint_color)
					row.set_item (Node_grid_col_constraint, gli)
				else
					-- create child nodes for includes & excludes
					if a_node.has_includes then
						from a_node.includes.start until a_node.includes.off loop
							ev_grid_row_stack.item.insert_subrow (ev_grid_row_stack.item.subrow_count + 1)
							sub_row := ev_grid_row_stack.item.subrow (ev_grid_row_stack.item.subrow_count)

							-- put pixmap on RM col
							create gli.default_create
							gli.set_pixmap (get_icon_pixmap ("am/added/" + a_node.generating_type + "_include"))
							sub_row.set_item (Node_grid_col_rm_name, gli)

							-- put assertions in constraint col
							s_32 := object_invariant_string (a_node.includes.item)
							s_32.replace_substring_all (" ", "%N")
							create gli.make_with_text (s_32)
							gli.set_foreground_color (archetype_constraint_color)
							sub_row.set_item (Node_grid_col_constraint, gli)
							sub_row.set_height (gli.text_height)

							sub_row.set_data (a_node.includes.item)
							a_node.includes.forth
						end
					end

					if a_node.has_excludes then
						from a_node.excludes.start until a_node.excludes.off loop
							ev_grid_row_stack.item.insert_subrow (ev_grid_row_stack.item.subrow_count + 1)
							sub_row := ev_grid_row_stack.item.subrow (ev_grid_row_stack.item.subrow_count)

							-- put pixmap on RM col
							create gli.default_create
							gli.set_pixmap (get_icon_pixmap ("am/added/" + a_node.generating_type + "_exclude"))
							sub_row.set_item (Node_grid_col_rm_name, gli)

							-- put assertions in constraint col
							s_32 := object_invariant_string (a_node.excludes.item)
							s_32.replace_substring_all (" ", "%N")
							create gli.make_with_text (s_32)
							gli.set_foreground_color (archetype_constraint_color)
							sub_row.set_item (Node_grid_col_constraint, gli)
							sub_row.set_height (gli.text_height)

							sub_row.set_data (a_node.excludes.item)
							a_node.excludes.forth
						end
					end
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
			gli: EV_GRID_LABEL_ITEM
			s: STRING
		do
			if not updating then
				-- RM attr name / path
				ev_grid_row_stack.item.insert_subrow (ev_grid_row_stack.item.subrow_count + 1)
				last_row := ev_grid_row_stack.item.subrow (ev_grid_row_stack.item.subrow_count)
				create s.make_empty
				if a_node.has_differential_path then
					s.append (ontology.physical_to_logical_path (a_node.rm_attribute_path, language, True))
					s.replace_substring_all ({OG_PATH}.segment_separator_string, "%N" + {OG_PATH}.segment_separator_string)
					s.remove_head (1)
				else
					s.append (a_node.rm_attribute_name)
				end
				create gli.make_with_text (utf8_to_utf32 (s))
				gli.set_pixmap (c_attribute_pixmap (a_node))
				gli.set_tooltip (node_tooltip_str (a_node))
				gli.set_foreground_color (rm_attribute_color)
				last_row.set_item (Node_grid_col_rm_name, gli)
				last_row.set_height (gli.text_height)

				-- meaning field
				create gli.make_with_text ("")
				last_row.set_item (Node_grid_col_meaning, gli)

				-- existence
				if attached a_node.existence then
					create gli.make_with_text (a_node.existence.as_string)
					gli.set_foreground_color (archetype_constraint_color)
					last_row.set_item (Node_grid_col_existence, gli)
				end

				-- cardinality
				if attached a_node.cardinality then
					create gli.make_with_text (a_node.cardinality.as_string)
					gli.set_foreground_color (archetype_constraint_color)
					last_row.set_item (Node_grid_col_card_occ, gli)
				end

				if a_node.any_allowed then
					create gli.make_with_text (Archetype_any_constraint)
					gli.set_foreground_color (archetype_constraint_color)
					last_row.set_item (Node_grid_col_constraint, gli)
				end

				-- set the data
				last_row.set_data (a_node)

				ev_grid_row_stack.extend (last_row)
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
			s: STRING
			row: EV_GRID_ROW
			gli: EV_GRID_LABEL_ITEM
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			if not a_node.any_allowed and in_technical_mode then
				-- add Archetype root reference info
				create s.make_empty
				if attached a_node.slot_node_id then
					s.append ("[" + a_node.slot_node_id + ",%N" + a_node.node_id + "]")
				else
					s.append ("[" + a_node.node_id + "]")
				end
				s.replace_substring_all ({ARCHETYPE_ID}.axis_separator_string, {ARCHETYPE_ID}.axis_separator_string + "%N")
				create gli.make_with_text (s)
				row.set_item (Node_grid_col_constraint, gli)
				row.set_height (gli.text_height)
			end

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

			-- set constraint column to referenced path
			row := node_grid_row_map.item (a_node)
			create s.make_empty
			s.append ("use ")
			p := ontology.physical_to_logical_path (a_node.target_path, language, True)
			p.replace_substring_all ({OG_PATH}.segment_separator_string, "%N" + {OG_PATH}.segment_separator_string)
			p.remove_head (1)
			s.append (p)
			create gli.make_with_text (utf8_to_utf32 (s))
			gli.set_foreground_color (rm_attribute_color)
			row.set_item (Node_grid_col_constraint, gli)
			row.set_height (gli.text_height)
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

			-- set meaning column to referenced path
			row := node_grid_row_map.item (a_node)
			create s.make_empty
			s.append (coded_text_string (a_node.target))
			row.set_item (Node_grid_col_meaning, create {EV_GRID_LABEL_ITEM}.make_with_text (utf8_to_utf32 (s)))

			-- add select event
			if not updating then
	 			last_row.item (Node_grid_col_meaning).pointer_button_press_actions.force_extend (agent call_code_select_agent (a_node.target, ?, ?, ?))
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
				gli.set_foreground_color (Archetype_constraint_color)
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
			assumed_flag: BOOLEAN
			row, sub_row: EV_GRID_ROW
			gli: EV_GRID_LABEL_ITEM
			s_32: STRING_32
			i: INTEGER
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			-- add subrows for constraint codes
			if not a_node.any_allowed and then a_node.code_count > 0 then
				from
					a_node.code_list.start
					i := 1
				until
					a_node.code_list.off
				loop
					assumed_flag := a_node.has_assumed_value and then a_node.assumed_value.code_string.is_equal (a_node.code_list.item)
					s_32 := object_term_item_string (a_node.code_list.item, assumed_flag)
					if updating then
						if attached {EV_GRID_LABEL_ITEM} row.subrow (i).item (Node_grid_col_constraint) as gli2 then
							gli2.set_text (s_32)
						end
					else
						row.insert_subrow (row.subrow_count + 1)
						sub_row := row.subrow (row.subrow_count)

						-- RM code - empty text, pixmap only
						create gli.default_create
						gli.set_pixmap (spec_pixmap (a_node, "term"))
						gli.set_data (a_node.code_list.item) -- of type STRING
						sub_row.set_item (Node_grid_col_rm_name, gli)

						-- constraint col
						create gli.make_with_text (s_32)
						gli.set_foreground_color (Archetype_constraint_color)
						-- add select event
						if is_valid_code (a_node.code_list.item) and then ontology.has_term_code (a_node.code_list.item) then
	 						gli.pointer_button_press_actions.force_extend (agent call_code_select_agent (a_node.code_list.item, ?, ?, ?))
						end
						sub_row.set_item (Node_grid_col_constraint, gli)
					end
					a_node.code_list.forth
					i := i + 1
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
			gli: EV_GRID_LABEL_ITEM
			s_32: STRING_32
			i: INTEGER
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			if not a_node.any_allowed then
				from
					a_node.items.start
					i := 1
				until
					a_node.items.off
				loop
					assumed_flag := a_node.has_assumed_value and then a_node.assumed_value.value = a_node.items.item.value
					s_32 := object_ordinal_item_string (a_node.items.item, assumed_flag)
					if updating then
						if attached {EV_GRID_LABEL_ITEM} row.subrow (i).item (Node_grid_col_constraint) as gli2 then
							gli2.set_text (s_32)
						end
					else
						row.insert_subrow (row.subrow_count + 1)

						-- RM column
						create gli.default_create
						gli.set_pixmap (spec_pixmap (a_node, a_node.items.item.generating_type))
						gli.set_data (a_node.items.item) -- of type ORDINAL
						row.subrow (row.subrow_count).set_item (Node_grid_col_rm_name, gli)

						-- constraint col
						create gli.make_with_text (s_32)
						gli.set_foreground_color (archetype_constraint_color)
						-- add select event
						if a_node.items.item.symbol.terminology_id.is_local then
	 						gli.pointer_button_press_actions.force_extend (agent call_code_select_agent (a_node.items.item.symbol.code_string, ?, ?, ?))
						end
						row.subrow (row.subrow_count).set_item (Node_grid_col_constraint, gli)
					end
					a_node.items.forth
					i := i + 1
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
			gli: EV_GRID_LABEL_ITEM
		do
			start_c_object (a_node, depth)
			row := node_grid_row_map.item (a_node)

			-- property constraint
			if attached a_node.property then
				create gli.make_with_text (" (" + a_node.property.as_string + ")")
				row.set_item (Node_grid_col_constraint, gli)
			end

			if not updating then
				if attached a_node.list then
					from a_node.list.start until a_node.list.off loop
						row.insert_subrow (row.subrow_count + 1)

						-- RM column
						create gli.default_create
						gli.set_pixmap (spec_pixmap (a_node, a_node.list.item.generating_type))
						gli.set_data (a_node.list.item) -- of type QUANTITY
						row.subrow (row.subrow_count).set_item (Node_grid_col_rm_name, gli)

						-- constraint column
						create gli.make_with_text (c_quantity_item_string (a_node.list.item))
						gli.set_foreground_color (archetype_constraint_color)
						row.subrow (row.subrow_count).set_item (Node_grid_col_constraint, gli)

						a_node.list.forth
					end
				end

				-- assumed value child node
				if a_node.has_assumed_value then
					row.insert_subrow (row.subrow_count + 1)

					-- RM column
					create gli.default_create
					gli.set_pixmap (spec_pixmap (a_node, a_node.assumed_value.generating_type))
					gli.set_data (a_node.assumed_value)
					row.subrow (row.subrow_count).set_item (Node_grid_col_rm_name, gli)

					-- constraint column
					create gli.make_with_text (a_node.assumed_value.magnitude_as_string + " (" + get_text ("assumed_text") + ")")
					gli.set_foreground_color (archetype_constraint_color)
					row.subrow (row.subrow_count).set_item (Node_grid_col_constraint, gli)
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

feature {NONE} -- Implementation

	node_tooltip_str (a_node: attached ARCHETYPE_CONSTRAINT): STRING
			-- generate a tooltip for this node as UTF-32 String
		local
			s: STRING
		do
			s := ontology.physical_to_logical_path (a_node.path, language, True)
			if archetype.has_annotation_at_path (language, a_node.path) then
				s.append ("%N%N" + get_text ("annotations_text") + ":%N")
				s.append (archetype.annotations.annotations_at_path (language, a_node.path).as_string)
			end
			Result := utf8_to_utf32 (s)
		end

	last_row: EV_GRID_ROW
			-- node just created by `create_row'

	ev_grid_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- stack for building the tree

	ev_grid: EV_GRID

	node_grid_row_map: HASH_TABLE [EV_GRID_ROW, ARCHETYPE_CONSTRAINT]
			-- xref table from archetype definition nodes to GUI nodes (note that some C_X
			-- nodes have child GUI nodes; the visitor takes care of the details)
			-- reference copied from GUI_NODE_MAP_CONTROL

	rm_schema: BMM_SCHEMA

	in_technical_mode: BOOLEAN

	rm_publisher: STRING
			-- name of reference model of this archetype, for the purpose of finding pixmaps for RM-specific visualisation

	updating: BOOLEAN
			-- True indicates that the visitor is just updating the text value of the nodes

	language: attached STRING
			-- IETF RFC 5646 language tag; wll be an exact text match
			-- for one of the 'languages' in the archetype

	c_quantity_item_string (a_node: attached C_QUANTITY_ITEM): attached STRING_32
			-- generate string form of node or object for use in tree node
		local
			s: STRING
		do
			create s.make_empty
			if a_node.units /= Void then
				s.append (a_node.units)
			end
			if a_node.magnitude /= Void then
				s.append (": " + a_node.magnitude.as_string)
			end
			Result := utf8_to_utf32 (s)
		end

	object_term_item_string (a_code: attached STRING; assumed_flag: BOOLEAN): attached STRING_32
			-- generate string form of node or object for use in tree node;
			-- assumed_flag = True if this is an assumed value - will be marked visually
		local
			s: STRING
		do
			create s.make_empty
			s.append (coded_text_string (a_code))
			if assumed_flag then
				s.append (" (" + get_text ("assumed_text") + ")")
			end
			Result := utf8_to_utf32 (s)
		end

	object_ordinal_item_string (an_ordinal: attached ORDINAL; assumed_flag: BOOLEAN): attached STRING_32
			-- generate string form of node or object for use in tree node
		local
			s: STRING
		do
			create s.make_empty
			s.append (an_ordinal.value.out)
			s.append (" - ")
			s.append (coded_text_string (an_ordinal.symbol.code_string))
			if assumed_flag then
				s.append (" (" + get_text ("assumed_text") + ")")
			end
			Result := utf8_to_utf32 (s)
		end

	coded_text_string (a_code: STRING): attached STRING
			-- generate a string of the form "[code|rubric|]" if in technical mode,
			-- or else "rubric"
		local
			rubric: STRING
		do
			create Result.make_empty
			if is_valid_code (a_code) then
				if ontology.has_term_code (a_code) then
					rubric := ontology.term_definition (language, a_code).text
				elseif ontology.has_constraint_code (a_code) then
					rubric := ontology.constraint_definition (language, a_code).text
				end
				if in_technical_mode then
					Result.append (a_code + "|" + rubric + "|")
				else
					Result.append (rubric)
				end
			else
				Result.append (a_code)
			end
		end

	object_invariant_string (an_inv: attached ASSERTION): attached STRING_32
			-- generate string form of node or object for use in tree node
		local
			s: STRING
		do
			s := an_inv.as_string
			if not in_technical_mode then
				s := ontology.substitute_codes (s, language)
			end
			Result := utf8_to_utf32 (s)
		end

	call_code_select_agent (a_code: STRING; x,y, button: INTEGER)
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

	spec_pixmap (a_node: ARCHETYPE_CONSTRAINT; pixmap_path: STRING): EV_PIXMAP
			-- determine source status of node in archetype text, i.e. inherited, redefined, added etc
			-- and use it to set the kind of pixmap to use
			-- Always colourise inherited & overidden nodes. If we want a switch for this, implement a new flag.
		do
			Result := get_icon_pixmap ("am" + resource_path_separator + (specialisation_status_names.item (a_node.specialisation_status) + resource_path_separator + pixmap_path))
		end

	c_object_pixmap (a_node: C_OBJECT): EV_PIXMAP
			-- find a pixmap for any C_OBJECT node
		local
			pixmap_name: STRING
		do
			pixmap_name := rm_icon_dir +  resource_path_separator + rm_publisher + resource_path_separator + a_node.rm_type_name
			if use_rm_pixmaps and then has_icon_pixmap (pixmap_name) then
				Result := get_icon_pixmap (pixmap_name)
			elseif has_icon_pixmap (a_node.generating_type + a_node.occurrences_key_string) then
				Result := spec_pixmap (a_node, a_node.generating_type + a_node.occurrences_key_string)
			else
				Result := spec_pixmap (a_node, a_node.generating_type)
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

			-- if using RM pixmaps, nothing changes; if not, inheritance status is shown
			if use_rm_pixmaps then
				Result := get_icon_pixmap ("am" + resource_path_separator + "added" + resource_path_separator + pixmap_name)
			else
				Result := get_icon_pixmap ("am" + resource_path_separator + (specialisation_status_names.item (a_node.specialisation_status) + resource_path_separator + pixmap_name))
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
