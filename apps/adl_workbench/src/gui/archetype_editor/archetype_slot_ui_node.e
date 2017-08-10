note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for an ARCHETYPE_SLOT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_SLOT_UI_NODE

inherit
	C_OBJECT_UI_NODE
		redefine
			make, arch_node, c_pixmap, prepare_display_in_grid, display_in_grid, build_context_menu
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_arch_node: attached like arch_node; an_ed_context: ARCHETYPE_UI_GRAPH_STATE)
		do
			precursor (an_arch_node, an_ed_context)
			create assertions_index.make (0)
			create ev_row_index.make (0)
		end

feature -- Access

	arch_node: detachable ARCHETYPE_SLOT
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)

			assertions_index.wipe_out
			ev_row_index.wipe_out

			-- add closed indicator in constraint column
			if attached arch_node as a_n and attached ev_grid_row as gr then
				if a_n.is_closed then
					a_gui_grid.set_last_row_label_col (Definition_grid_col_constraint, Archetype_slot_closed, Void, Void, c_constraint_colour, Void)
				else
					-- create child nodes for includes & excludes
					if a_n.has_substantive_includes then
						across a_n.includes as includes_csr loop
							a_gui_grid.add_sub_row (gr, includes_csr.item)

							-- put pixmap on RM col
							a_gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, get_text (ec_include_text), Void, c_node_font,
								c_object_colour, get_icon_pixmap ("am/added/" + a_n.generating_type.name + "_include"))

							-- put blank text in constraint col
							a_gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, "", Void, Void, c_constraint_colour, Void)

							-- remember the association
							assertions_index.extend (includes_csr.item)
							check attached evx_grid.last_row as lr then
								ev_row_index.extend (lr)
							end
						end
						is_required := a_n.has_open_excludes

					elseif a_n.has_substantive_excludes then
						across a_n.excludes as excludes_csr loop
							a_gui_grid.add_sub_row (gr, excludes_csr.item)

							-- put pixmap on RM col
							a_gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, get_text (ec_exclude_text), Void, Void,
								c_object_colour, get_icon_pixmap ("am/added/" + a_n.generating_type.name + "_exclude"))

							-- put blank text in constraint col
							a_gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, "", Void, Void, c_constraint_colour, Void)

							-- remember the association
							assertions_index.extend (excludes_csr.item)
							check attached evx_grid.last_row as lr then
								ev_row_index.extend (lr)
							end
						end
						is_required := a_n.has_open_includes
					end
				end
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)

			-- iterate through the assertions
			if attached evx_grid as att_evx_grid then
				across assertions_index as assn_csr loop
					att_evx_grid.set_last_row (ev_row_index.i_th (assn_csr.cursor_index))
					att_evx_grid.update_last_row_label_col (Definition_grid_col_rm_name, Void, Void, c_node_font, c_object_colour, Void)
					att_evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, assertion_string (assn_csr.item), Void, Void, c_constraint_colour, Void)
				end
			end
		end

feature {NONE} -- Implementation

	c_pixmap: EV_PIXMAP
			-- find a pixmap for an ARCHETYPE_SLOT node if using RM pixmaps
		local
			base_pixmap_name, slot_pixmap_name: STRING
		do
			if not display_settings.show_technical_view and attached arch_node as a_n then
				base_pixmap_name := Icon_rm_dir + resource_path_separator + ui_graph_state.ref_model.rm_publisher.as_lower + resource_path_separator + a_n.rm_type_name
				create slot_pixmap_name.make_empty
				slot_pixmap_name.append (base_pixmap_name)
				slot_pixmap_name.append ("_slot")
				if has_icon_pixmap (slot_pixmap_name) then
					Result := get_icon_pixmap (slot_pixmap_name)
				else
					Result := get_icon_pixmap (base_pixmap_name)
				end
			else
				Result := precursor
			end
		end

	assertion_string (an_inv: ASSERTION): STRING
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string
			if not display_settings.show_codes then
				Result := ui_graph_state.flat_terminology.substitute_id_codes (Result, display_settings.language)
			end
			Result.replace_substring_all (" ", "%N")
			Result.replace_substring_all ("|", "|%N")
			if is_required then
				Result.append ("%N(" + get_text (ec_slot_match_required_text) + ")")
			else
				Result.append ("%N(" + get_text (ec_slot_match_recommended_text) + ")")
			end
		end

	assertions_index: ARRAYED_LIST [ASSERTION]
			-- index of includes and excludes assertions

	ev_row_index: ARRAYED_LIST [EV_GRID_ROW]
			-- index of grid sub-row objects coresponding to items in `assertions_index'

	is_required: BOOLEAN

	context_slot_sub_menu: detachable EV_MENU

	build_context_menu
		local
			an_mi: EV_MENU_ITEM
			slot_match_ids: ARRAYED_SET [STRING]
		do
			precursor
			create slot_match_ids.make (0)
			slot_match_ids.compare_objects
			if attached arch_node as a_n and then a_n.has_substantive_includes then
				across a_n.includes as slot_includes_csr loop
					if attached slot_includes_csr.item.regex_constraint as att_regex and then attached {STRING} att_regex.constraint_regex as a_regex then
						slot_match_ids.merge (current_library.matching_ids (a_regex, a_n.rm_type_name, Void))
					end
				end
				if a_n.has_open_excludes then
					create context_slot_sub_menu.make_with_text (get_text (ec_archetype_slot_node_submenu_exact_text))
				else
					create context_slot_sub_menu.make_with_text (get_text (ec_archetype_slot_node_submenu_preferred_text))
				end

				-- ensure we have only a unique set
				across slot_match_ids as slot_match_ids_csr loop
					if attached {ARCH_LIB_ARCHETYPE} current_library.archetype_with_id (slot_match_ids_csr.item) as aca then
						create an_mi.make_with_text_and_action (slot_match_ids_csr.item, agent gui_agents.call_select_archetype_in_new_tool_agent (aca))
						an_mi.set_pixmap (get_icon_pixmap ("archetype/" + aca.group_name))
						context_slot_sub_menu.extend (an_mi)
					end
				end

				if attached context_slot_sub_menu as sm and then not sm.is_empty then
					context_menu.extend (sm)
				end
			end
		end

end


