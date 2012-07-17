note
	component:   "openEHR Archetype Project"
	description: "Combined control for viewing archetype and template artefacts in 2 trees"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_RM_SCHEMA_EXPLORER

inherit
	STRING_UTILITIES
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	GUI_SEARCHABLE_TOOL

	GUI_TOOL
		redefine
			source, go_to_selected_item
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)

			-- EV_GRID
			create gui_grid.make (True, True, True, True)
			gui_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_root_container.extend (gui_grid.ev_grid)
  			gui_grid.ev_grid.set_minimum_width (100)
  			gui_grid.ev_grid.hide_header

			-- events
			enable_selection_history
		end

feature -- Access

	source: REFERENCE_MODEL_ACCESS

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		do
			Result := "RM schemas"
		end

	ev_root_container: EV_VERTICAL_BOX

	matching_ids (a_regex: attached STRING): attached ARRAYED_SET[STRING]
			-- generate list of schema elemtn ids (packages and classes)
		local
			regex_matcher: LX_DFA_REGULAR_EXPRESSION
		do
			create Result.make (0)
			create regex_matcher.compile_case_insensitive (a_regex)
			if regex_matcher.is_compiled then
				Result.compare_objects
				from ev_node_map.start until ev_node_map.off loop
					if regex_matcher.matches (ev_node_map.key_for_iteration) then
						Result.extend (ev_node_map.key_for_iteration)
					end
					ev_node_map.forth
				end
			else
				Result.extend (get_msg_line("regex_e1", <<a_regex>>))
			end
		end

feature -- Status Report

	item_selectable: BOOLEAN
		do
			Result := True
		end

	valid_item_id (a_key: attached STRING): BOOLEAN
			-- key is a valid identifier of an item managed in this tool
		do
			Result := ev_node_map.has (a_key)
		end

feature -- Commands

	select_item_by_id (id: attached STRING)
			-- show class in RM explorer and display it in a class tool
		do
			if ev_node_map.has (id) and gui_grid.ev_grid.is_displayed then
				ev_node_map.item (id).ensure_visible

				-- if a class tool already exists with this id, then cause it to be shown
				-- and then select corresponding tree node, but with events off. If no
				-- class tool available, treat as if it were a first tme request for this class
				-- and do a normal tree node select
				if gui_agents.show_tool_with_artefact_agent.item ([id]) then
					ev_node_map.item (id).select_actions.block
					ev_node_map.item (id).enable_select
					ev_node_map.item (id).select_actions.resume
				else
					ev_node_map.item (id).enable_select
				end
			end
		end

	show_item (id: attached STRING)
			-- show class in RM explorer
		do
			if ev_node_map.has (id) and gui_grid.ev_grid.is_displayed then
				ev_node_map.item (id).ensure_visible
			end
		end

	go_to_selected_item
			-- Select and display the node of `archetype_file_tree' corresponding to the selection in `archetype_catalogue'.
			-- No events will be processed because archetype selected in ARCHETYPE_CATALOGUE already matches selected tree node
		do
			if selection_history.has_selected_item then
				select_item_by_id (selection_history.selected_item.global_artefact_identifier)
				docking_pane.set_focus
			end
		end

feature -- Modification

	set_docking_pane (a_docking_pane: attached SD_CONTENT)
		do
			docking_pane := a_docking_pane
		end

feature {NONE} -- Implementation

	ev_pixmap: EV_PIXMAP

	ev_label: EV_LABEL

	gui_grid: GUI_EV_GRID

	ev_hbox: EV_HORIZONTAL_BOX

	docking_pane: SD_CONTENT

	do_clear
			-- Wipe out content from visual controls and reset controls to reasonable state
		do
			gui_grid.wipe_out
			create ev_node_map.make(0)
		end

	do_populate
		do
			across source.valid_top_level_schemas as rm_sch_csr loop
				populate_schema (rm_sch_csr.item)
			end
			gui_grid.resize_columns_to_content
		end

	populate_schema (a_schema: BMM_SCHEMA)
		do
			-- add row to grid
			gui_grid.add_row (a_schema)
			gui_grid.set_last_row_label_col (1, a_schema.schema_id, Void, VOid, get_icon_pixmap ("tool/rm_schema"))
			gui_grid.add_last_row_pointer_button_press_actions (1, agent schema_node_handler (gui_grid.last_row, ?, ?, ?))

			across a_schema.packages as pkgs_csr loop
 				populate_packages (gui_grid.last_row, pkgs_csr.item)
			end
		end

	populate_packages (ev_parent_node: EV_GRID_ROW; a_pkg: BMM_PACKAGE_DEFINITION)
		local
			pkg_row: EV_GRID_ROW
		do
			-- add subrow
			gui_grid.add_sub_row (ev_parent_node, a_pkg)
			gui_grid.set_last_row_label_col (1, a_pkg.name, "Package " + a_pkg.path, Void, get_icon_pixmap ("rm/generic/package"))
			pkg_row := gui_grid.last_row
			ev_node_map.put (pkg_row, a_pkg.globally_qualified_path)

			-- do the classes
			across a_pkg.classes as classes_csr loop
 				-- only do top classes in each package; if this class has an ancestor in the same package,
 				-- don't do this class, it will get taken care of via the parent
 				from classes_csr.item.ancestors.start until classes_csr.item.ancestors.off or classes_csr.item.ancestors.item_for_iteration.package = a_pkg loop
 					classes_csr.item.ancestors.forth
 				end
				if classes_csr.item.ancestors.off then
	 				populate_classes (pkg_row, classes_csr.item)
	 			end
			end

			-- do the child packages
			across a_pkg.packages as pkgs_csr loop
 				populate_packages (pkg_row, pkgs_csr.item)
			end
		end

	populate_classes (ev_parent_node: EV_GRID_ROW; a_class_def: BMM_CLASS_DEFINITION)
		local
			pixmap_name: STRING
			ev_class_row: EV_GRID_ROW
		do
			-- add subrow
			gui_grid.add_sub_row (ev_parent_node, a_class_def)
 			pixmap_name := "rm/generic/" + a_class_def.type_category
 			if a_class_def.is_override then
 				pixmap_name.append ("_override")
 			end
			gui_grid.set_last_row_label_col (1, a_class_def.as_type_string, a_class_def.description, Void, get_icon_pixmap (pixmap_name))
			ev_class_row := gui_grid.last_row
			ev_node_map.put (ev_class_row, a_class_def.global_artefact_identifier)

			-- context menu
			gui_grid.add_last_row_pointer_button_press_actions (1, agent class_node_handler (ev_class_row, ?, ?, ?))
			gui_grid.add_last_row_pointer_button_press_actions (1, agent do gui_agents.history_set_active_agent.call ([ultimate_parent_tool]) end)
			gui_grid.add_last_row_select_actions (1, agent select_class_with_delay (a_class_def))

			-- do any descendants in same package
			across a_class_def.immediate_descendants as imm_descs_csr loop
				if imm_descs_csr.item.package_path.same_string (a_class_def.package_path) then
					populate_classes (ev_class_row, imm_descs_csr.item)
				end
			end
		end

	ev_tree_expand (node: EV_GRID_ROW): BOOLEAN
			--
		do
	 		Result := attached {BMM_PACKAGE_DEFINITION} node.data as pkg_def and node.is_expandable
		end

	class_node_handler (ev_ti: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if attached {BMM_CLASS_DEFINITION} ev_ti.data as a_class_def then
				if button = {EV_POINTER_CONSTANTS}.left then
					select_class_with_delay (a_class_def)

				elseif button = {EV_POINTER_CONSTANTS}.right then
					create menu
					create an_mi.make_with_text_and_action (get_msg ("display_in_active_tab", Void), agent display_context_selected_class_in_active_tool (ev_ti))
					an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool"))
			    	menu.extend (an_mi)

					create an_mi.make_with_text_and_action (get_msg ("display_in_new_tab", Void), agent display_context_selected_class_in_new_tool (ev_ti))
					an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
					menu.extend (an_mi)

					create an_mi.make_with_text_and_action (get_msg ("edit_source_schema", Void), agent do_edit_schema (a_class_def.source_schema_id))
					an_mi.set_pixmap (get_icon_pixmap ("tool/edit"))
					menu.extend (an_mi)

					menu.show
				end
			end
		end

	schema_node_handler (ev_ti: EV_GRID_ROW; x,y, button: INTEGER)
			-- dynamically initializes the context menu for this tree
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_SCHEMA} ev_ti.data as bmm_sch then
				create menu

				create an_mi.make_with_text_and_action (get_msg ("display_in_active_tab", Void), agent display_context_selected_rm_in_active_tool (ev_ti))
		    	menu.extend (an_mi)
				an_mi.set_pixmap (get_icon_pixmap ("tool/rm_schema_tool"))

				create an_mi.make_with_text_and_action (get_msg ("display_in_new_tab", Void), agent display_context_selected_rm_in_new_tool (ev_ti))
		    	menu.extend (an_mi)
				an_mi.set_pixmap (get_icon_pixmap ("tool/rm_schema_tool_new"))

				create an_mi.make_with_text_and_action (get_msg ("expand_button_expand_text", Void), agent schema_expand_all (ev_ti))
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_msg ("expand_packages", Void), agent schema_expand_packages (ev_ti))
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_msg ("expand_button_collapse_text", Void), agent schema_collapse (ev_ti))
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_msg ("edit_source_schema", Void), agent do_edit_schema (bmm_sch.schema_id))
				an_mi.set_pixmap (get_icon_pixmap ("tool/edit"))
		    	menu.extend (an_mi)

				menu.show
		    end
		end

	schema_expand_all (a_schema_node: EV_GRID_ROW)
		do
			gui_grid.ev_grid.expand_tree (a_schema_node, Void)
		end

	schema_expand_packages (a_schema_node: EV_GRID_ROW)
		do
			gui_grid.ev_grid.expand_tree (a_schema_node,
				agent (a_row: attached EV_GRID_ROW): BOOLEAN
					do
						Result := attached {BMM_SCHEMA} a_row.data or
							attached {BMM_PACKAGE_DEFINITION} a_row.data and then
							not gui_grid.has_matching_sub_row (a_row, agent (a_tn: EV_GRID_ROW): BOOLEAN do Result := attached {BMM_CLASS_DEFINITION} a_tn.data end)
					end
			)
		end

	schema_collapse (a_schema_node: EV_GRID_ROW)
		do
			gui_grid.ev_grid.collapse_tree (a_schema_node)
		end

	display_context_selected_class_in_active_tool (a_row: EV_GRID_ROW)
		do
			a_row.enable_select
			if attached {BMM_CLASS_DEFINITION} a_row.data as a_class_def then
				gui_agents.select_class_agent.call ([a_class_def])
			end
		end

	display_context_selected_class_in_new_tool (a_row: EV_GRID_ROW)
		do
			a_row.enable_select
			if attached {BMM_CLASS_DEFINITION} a_row.data as a_class_def then
				gui_agents.select_class_in_new_tool_agent.call ([a_class_def])
			end
		end

	display_context_selected_rm_in_active_tool (a_row: EV_GRID_ROW)
		do
			a_row.enable_select
			if attached {BMM_SCHEMA} a_row.data as a_bmm then
				gui_agents.select_rm_agent.call ([a_bmm])
			end
		end

	display_context_selected_rm_in_new_tool (a_row: EV_GRID_ROW)
		do
			a_row.enable_select
			if attached {BMM_SCHEMA} a_row.data as a_bmm then
				gui_agents.select_rm_in_new_tool_agent.call ([a_bmm])
			end
		end

	do_edit_schema (a_schema_id: STRING)
			-- launch external editor with schema, or info box if none defined
		do
			execution_environment.launch (text_editor_command + " %"" + source.all_schemas.item (a_schema_id).meta_data.item (metadata_schema_path) + "%"")
		end

	selected_class_def: BMM_CLASS_DEFINITION

	select_class_with_delay (a_class_def: BMM_CLASS_DEFINITION)
		do
			selected_class_def := a_class_def
			delayed_select_class_agent.set_interval (300)
		end

	delayed_select_class_agent: EV_TIMEOUT
			-- Timer to delay a moment before calling `select_class_agent'.
		once
			create Result
			Result.actions.extend (
				agent
					do
						delayed_select_class_agent.set_interval (0)
						selection_history.set_selected_item (selected_class_def)
						gui_agents.select_class_agent.call ([selected_class_def])
					end
			)
		end

	ev_node_map: HASH_TABLE [EV_GRID_ROW, STRING]
			-- list of GUI explorer nodes, keyed by artefact id

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
--| The Original Code is gui_rm_schema_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
