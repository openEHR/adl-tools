note
	component:   "openEHR Archetype Project"
	description: "Node map control - Visualise an archetype structure as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class GUI_DEFINITION_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_edit, can_populate, can_repopulate, repopulate, disable_edit, enable_edit, on_selected
		end

create
	make, make_editable

feature -- Definitions

	Tree_control_panel_width: INTEGER = 100

feature -- Initialisation

	make_editable (an_undo_redo_update_agent: like undo_redo_update_agent)
		do
			undo_redo_update_agent := an_undo_redo_update_agent
			create undo_redo_chain.make (undo_redo_update_agent)
			make
		end

	make
		do
			create gui_controls.make (0)

			-- create widgets
			create ev_root_container

			-- ============ DEFINITION HBOX, with GRID & control panel =============
			create ev_definition_hbox
			ev_definition_hbox.set_padding (Default_padding_width)
			ev_definition_hbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_definition_hbox)

			-- EV_GRID
			create gui_definition_grid.make (True, False, True, True)
			gui_definition_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_definition_hbox.extend (gui_definition_grid.ev_grid)

			-- ========== view controls control panel ===========
			create gui_definition_control_panel.make
			ev_definition_hbox.extend (gui_definition_control_panel.ev_root_container)
			ev_definition_hbox.disable_item_expand (gui_definition_control_panel.ev_root_container)

			-- tree collapse/expand control
			create gui_definition_treeview_control.make (create {EVX_TREE_CONTROL_GRID}.make (gui_definition_grid),
				agent (a_row: EV_GRID_ROW): BOOLEAN do Result := not attached {BMM_MODEL_ELEMENT} a_row.data end)
			gui_definition_control_panel.add_frame (gui_definition_treeview_control.ev_root_container, False)

			-- ========= view detail level options  =========

			-- 'Detail level' frame
			create view_detail_frame_ctl.make (get_text (ec_view_detail_controls_text), 85, 100, False)
			gui_definition_control_panel.add_frame_control (view_detail_frame_ctl, False)

			-- view detail radio buttons
			create view_detail_radio_ctl.make (get_text (ec_domain_detail_button_text), get_text ("technical_detail_button_text"),
				get_text (ec_domain_detail_button_tooltip), get_text ("technical_detail_button_tooltip"),
				agent :BOOLEAN do Result := not show_technical_view end,
				agent update_show_technical_view, 0, 0)
			view_detail_frame_ctl.extend (view_detail_radio_ctl.ev_root_container, False)
			gui_controls.extend (view_detail_radio_ctl)

			-- include codes checkbox
			create add_codes_checkbox_ctl.make_linked (get_text (ec_domain_view_add_codes_text), Void,
				agent :BOOLEAN do Result := show_codes end, agent update_show_codes)
			view_detail_frame_ctl.extend (add_codes_checkbox_ctl.ev_data_control, False)
			gui_controls.extend (add_codes_checkbox_ctl)


			-- ========= RM view options =========

			-- 'RM visibility' frame
			create rm_property_visibility_frame_ctl.make (get_text (ec_rm_visibility_controls_text), 85, 0, False)
			gui_definition_control_panel.add_frame_control (rm_property_visibility_frame_ctl, False)

			-- add RM data properties check button
			create rm_attrs_visible_checkbox_ctl.make_linked (get_text (ec_show_rm_properties_button_text),
				get_text (ec_show_rm_properties_tooltip),
				agent :BOOLEAN do Result := show_rm_data_properties end, agent update_show_rm_data_properties)
			gui_controls.extend (rm_attrs_visible_checkbox_ctl)
			rm_property_visibility_frame_ctl.extend (rm_attrs_visible_checkbox_ctl.ev_data_control, False)

			-- add RM runtime properties option check button
			create rm_runtime_attrs_visible_checkbox_ctl.make_linked (get_text (ec_show_rm_runtime_properties_button_text),
				get_text (ec_show_rm_runtime_properties_tooltip),
				agent :BOOLEAN do Result := show_rm_runtime_properties end, agent update_show_rm_runtime_properties)
			gui_controls.extend (rm_runtime_attrs_visible_checkbox_ctl)
			rm_property_visibility_frame_ctl.extend (rm_runtime_attrs_visible_checkbox_ctl.ev_data_control, False)

			-- add RM infrastructure properties option check button
			create rm_if_attrs_visible_checkbox_ctl.make_linked (get_text (ec_show_rm_if_properties_button_text),
				get_text (ec_show_rm_if_properties_tooltip),
				agent :BOOLEAN do Result := show_rm_infrastructure_properties end, agent update_show_rm_infrastructure_properties)
			gui_controls.extend (rm_if_attrs_visible_checkbox_ctl)
			rm_property_visibility_frame_ctl.extend (rm_if_attrs_visible_checkbox_ctl.ev_data_control, False)

			-- 'RM rendering' frame
			create rm_rendering_frame_ctl.make (get_text (ec_rm_rendering_controls_text), 85, 0, False)
			gui_definition_control_panel.add_frame_control (rm_rendering_frame_ctl, False)

			-- use RM inheritance rendering check button
			create view_rm_display_inheritance_checkbox_ctl.make_linked (get_text (ec_show_rm_inh_button_text),
				get_text (ec_show_rm_inh_button_tooltip),
				agent :BOOLEAN do Result := show_rm_inheritance end, agent update_show_rm_inheritance)
			gui_controls.extend (view_rm_display_inheritance_checkbox_ctl)
			rm_rendering_frame_ctl.extend (view_rm_display_inheritance_checkbox_ctl.ev_data_control, False)

			-- ============ RULES HBOX, with GRID & control panel =============
			create ev_rules_hbox
			ev_rules_hbox.set_padding (Default_padding_width)
			ev_rules_hbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_rules_hbox)

			-- EV_GRID
			create gui_rules_grid.make (True, False, True, False)
			gui_rules_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_rules_hbox.extend (gui_rules_grid.ev_grid)

			-- ========== view controls control panel ===========
			create gui_rules_control_panel.make
			ev_rules_hbox.extend (gui_rules_control_panel.ev_root_container)
			ev_rules_hbox.disable_item_expand (gui_rules_control_panel.ev_root_container)

			-- tree collapse/expand control
			create gui_rules_treeview_control.make (create {EVX_TREE_CONTROL_GRID}.make (gui_rules_grid),
				agent (a_row: EV_GRID_ROW): BOOLEAN do Result := not attached {BMM_MODEL_ELEMENT} a_row.data end)
			gui_rules_control_panel.add_frame (gui_rules_treeview_control.ev_root_container, False)


			-- ==================== setup ============================
			-- initial state
			if not show_technical_view then
				rm_attrs_visible_checkbox_ctl.disable_editable
			end

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_SPLIT_AREA

feature -- Status Report

	show_codes: BOOLEAN
			-- True if codes should be shown in the definition rendering

	show_rm_inheritance: BOOLEAN
			-- True if inheritance status should be shown in definition rendering of specialised archetypes

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

	can_populate (a_source: like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated and source.is_valid
		end

	can_edit: BOOLEAN
			-- True if this tool has editing capability
		do
			Result := True
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

	disable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.disable_editable end)
		end

	repopulate
			-- repopulate and/or refresh visual appearance if diff/flat view has changed or RM icons setting changed
		local
			ui_settings: GUI_DEFINITION_SETTINGS
		do
			-- populate peripheral controls
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

			-- repopulate from definition; visiting nodes doesn't change them, only updates their visual presentation
			gui_definition_grid.ev_grid.lock_update

			create ui_settings.make (selected_language, show_codes, show_rm_inheritance, show_technical_view,
				show_rm_data_properties, show_rm_runtime_properties, show_rm_infrastructure_properties)

			-- repopulate main definition
			source_context.definition_context.display_in_grid (ui_settings)

			gui_definition_grid.resize_columns_to_content
			gui_definition_grid.ev_grid.unlock_update

			-- repopulate rules grid, where applicable
			if source_archetype.has_invariants then
				gui_rules_grid.ev_grid.lock_update
				across source_context.assertion_contexts as assn_ed_contexts_csr loop
					assn_ed_contexts_csr.item.display_in_grid (ui_settings)
				end
				gui_rules_grid.resize_columns_to_content
				gui_rules_grid.ev_grid.unlock_update
			end
		end

	on_selected
			-- perform when this tool made visible, e.g. by selection of parent notebook tab
		do
			if editing_enabled then
				undo_redo_update_agent.call ([undo_redo_chain])
			end
		end

feature {NONE} -- Events

	update_show_technical_view (a_flag: BOOLEAN)
			-- change state from show_technical_view
		do
			set_show_technical_view (not a_flag)
			if attached source then
				repopulate
			end
		end

	update_show_codes (a_flag: BOOLEAN)
		do
			show_codes := a_flag
			if attached source then
				repopulate
			end
		end

	update_show_rm_data_properties (a_flag: BOOLEAN)
			-- turn on or off the display of reference model data properties details in `ev_grid'.
		do
			set_show_rm_data_properties (a_flag)
			if not a_flag then
				if show_rm_infrastructure_properties then
					set_show_rm_infrastructure_properties (False)
				end
				if show_rm_runtime_properties then
					set_show_rm_runtime_properties (False)
				end
			end
			if attached source then
				do_with_wait_cursor (gui_definition_grid.ev_grid, agent repopulate)
			end
		end

	update_show_rm_runtime_properties (a_flag: BOOLEAN)
			-- turn on or off the display of reference model runtime properties details in `ev_grid'.
		do
			set_show_rm_runtime_properties (a_flag)
			if a_flag and not show_rm_data_properties then
				rm_attrs_visible_checkbox_ctl.ev_data_control.enable_select
			else
				if not a_flag and show_rm_infrastructure_properties then
					set_show_rm_infrastructure_properties (False)
				end
				if attached source then
					do_with_wait_cursor (gui_definition_grid.ev_grid, agent repopulate)
				end
			end
		end

	update_show_rm_infrastructure_properties (a_flag: BOOLEAN)
			-- turn on or off the display of reference model infrastructure properties details in `ev_grid'.
		do
			set_show_rm_infrastructure_properties (a_flag)
			if a_flag and not show_rm_runtime_properties then
				rm_runtime_attrs_visible_checkbox_ctl.ev_data_control.enable_select
			elseif attached source then
				do_with_wait_cursor (gui_definition_grid.ev_grid, agent repopulate)
			end
		end

	update_show_rm_inheritance (a_flag: BOOLEAN)
		do
			show_rm_inheritance := a_flag
			if attached source then
				repopulate
			end
		end

feature {NONE} -- Implementation

	visualise_descendants_class: detachable STRING

	undo_redo_update_agent: detachable PROCEDURE [ANY, TUPLE [UNDO_REDO_CHAIN]]

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	ev_definition_hbox: EV_HORIZONTAL_BOX

	gui_definition_grid: EVX_GRID

	gui_definition_control_panel: EVX_CONTROL_PANEL

	gui_definition_treeview_control: EVX_TREEVIEW_CONTROL

	definition_grid_row_map: HASH_TABLE [EV_GRID_ROW, ARCHETYPE_CONSTRAINT]
			-- xref table from archetype definition nodes to GUI grid rows

	ev_rules_hbox: EV_HORIZONTAL_BOX

	gui_rules_grid: EVX_GRID

	gui_rules_control_panel: EVX_CONTROL_PANEL

	gui_rules_treeview_control: EVX_TREEVIEW_CONTROL

	view_detail_radio_ctl: EVX_BOOLEAN_RADIO_CONTROL

	view_rm_display_inheritance_checkbox_ctl, add_codes_checkbox_ctl: EVX_CHECK_BOX_CONTROL

	rm_attrs_visible_checkbox_ctl, rm_runtime_attrs_visible_checkbox_ctl, rm_if_attrs_visible_checkbox_ctl: EVX_CHECK_BOX_CONTROL

	view_detail_frame_ctl, rm_property_visibility_frame_ctl, rm_rendering_frame_ctl: EVX_FRAME_CONTROL

	rm_schema: detachable BMM_SCHEMA

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	do_clear
		do
			gui_definition_grid.wipe_out
			gui_rules_grid.wipe_out
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
			visualise_descendants_class := Void
		end

	do_populate
			-- build definition / ontology cross reference tables used for validation and other purposes
		local
			ui_settings: GUI_DEFINITION_SETTINGS
		do
			-- determine visualisation ancestor 'stopping' class (when C_OBJECT.rm_type_name = this class,
			-- tree expanding stops)
			rm_schema := source.rm_schema
			if attached rm_schema.archetype_parent_class then
				visualise_descendants_class := rm_schema.archetype_parent_class
			elseif attached rm_schema.archetype_visualise_descendants_of then
				visualise_descendants_class := rm_schema.archetype_visualise_descendants_of
			end

			-- populate peripheral controls
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

			create ui_settings.make (selected_language,
				show_codes, show_rm_inheritance, show_technical_view,
				show_rm_data_properties, show_rm_runtime_properties, show_rm_infrastructure_properties)

			-- populate the main definition grid
			gui_definition_grid.ev_grid.lock_update
			source_context.definition_context.prepare_display_in_grid (gui_definition_grid)
			source_context.definition_context.display_in_grid (ui_settings)

			-- make visualisation adjustments
			if attached visualise_descendants_class then
				-- collapse the tree except nodes inheriting from `visualise_descendants_class'
				gui_definition_treeview_control.on_collapse_except (
					agent (a_row: EV_GRID_ROW): BOOLEAN
						do
							if attached {C_OBJECT_ED_CONTEXT} a_row.data as co_ed_ctx then
								Result := not co_ed_ctx.is_rm and rm_schema.is_descendant_of (co_ed_ctx.rm_type.semantic_class.name, visualise_descendants_class)
							end
						end
				)
			else
				gui_definition_treeview_control.on_collapse_all
				gui_definition_treeview_control.on_expand_one_level
				gui_definition_treeview_control.on_expand_one_level
			end
			gui_definition_grid.set_column_titles (Definition_grid_col_names.linear_representation)
			gui_definition_grid.resize_columns_to_content
			gui_definition_grid.ev_grid.unlock_update

			-- populate rules grid, where applicable
			if source_archetype.has_invariants then
				gui_rules_grid.ev_grid.lock_update
				across source_context.assertion_contexts as assn_ed_contexts_csr loop
					assn_ed_contexts_csr.item.prepare_display_in_grid (gui_rules_grid)
					assn_ed_contexts_csr.item.display_in_grid (ui_settings)
				end

				gui_rules_grid.set_column_titles (Rules_grid_col_names.linear_representation)
				gui_rules_treeview_control.on_collapse_all

				gui_rules_grid.resize_columns_to_content
				gui_rules_grid.ev_grid.unlock_update
				ev_rules_hbox.show
			else
				ev_rules_hbox.hide
			end
			ev_root_container.set_split_position (ev_root_container.minimum_split_position.max (ev_root_container.maximum_split_position -
				gui_rules_grid.ev_grid.row_height * gui_rules_grid.ev_grid.visible_row_count))
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
--| The Original Code is adl_node_map_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2012
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
