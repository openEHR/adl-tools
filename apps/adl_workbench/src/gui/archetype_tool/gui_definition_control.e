note
	component:   "openEHR ADL Tools"
	description: "Visualise an archetype definition as a tree-enabled grid"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_DEFINITION_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_edit, do_display, disable_edit, enable_edit
		end

create
	make, make_editable

feature -- Definitions

	Tree_control_panel_width: INTEGER = 100

feature -- Initialisation

	make_editable (an_undo_redo_chain: like undo_redo_chain)
		do
			undo_redo_chain := an_undo_redo_chain
			make
		end

	make
		do
			create definition_grid_row_map.make (0)
			create gui_controls.make (0)

			-- create widgets
			create ev_root_container

			-- ============ DEFINITION HBOX, with GRID & control panel =============
			create ev_definition_hbox
			ev_definition_hbox.set_padding (Default_padding_width)
			ev_definition_hbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_definition_hbox)

			-- EV_GRID
			create evx_definition_grid.make (True, False, True, True)
			evx_definition_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_definition_hbox.extend (evx_definition_grid.ev_grid)

			-- ========== view controls control panel ===========
			create evx_definition_control_panel.make
			ev_definition_hbox.extend (evx_definition_control_panel.ev_root_container)
			ev_definition_hbox.disable_item_expand (evx_definition_control_panel.ev_root_container)

			-- tree collapse/expand control
			create evx_definition_treeview_control.make (create {EVX_TREE_CONTROL_GRID}.make (evx_definition_grid),
				agent (a_row: EV_GRID_ROW): BOOLEAN do Result := not attached {BMM_MODEL_ELEMENT} a_row.data end,
				get_icon_pixmap ("tool/tree_collapse_all"), get_icon_pixmap ("tool/tree_collapse"),
				get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_expand_all"), Void)
			evx_definition_control_panel.add_frame (evx_definition_treeview_control.ev_root_container, False)

			-- ========= view detail level options  =========

			-- 'Detail level' frame
			create evx_view_detail_frame.make (get_text ({ADL_MESSAGES_IDS}.ec_view_detail_controls_text), False)
			evx_definition_control_panel.add_frame_control (evx_view_detail_frame, False)

			-- view detail radio buttons
			create evx_view_detail_radio.make (get_text ({ADL_MESSAGES_IDS}.ec_domain_detail_button_text), get_text ({ADL_MESSAGES_IDS}.ec_technical_detail_button_text),
				get_text ({ADL_MESSAGES_IDS}.ec_domain_detail_button_tooltip), get_text ({ADL_MESSAGES_IDS}.ec_technical_detail_button_tooltip),
				agent :BOOLEAN do Result := not show_technical_view end,
				agent update_show_technical_view, 0, 0, False)
			evx_view_detail_frame.extend (evx_view_detail_radio.ev_root_container, False)
			gui_controls.extend (evx_view_detail_radio)

			-- include codes checkbox
			create evx_show_codes_cb.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_domain_view_add_codes_text), Void,
				agent :BOOLEAN do Result := show_codes end, agent update_show_codes)
			evx_view_detail_frame.extend (evx_show_codes_cb.ev_data_control, False)
			gui_controls.extend (evx_show_codes_cb)


			-- ========= RM view options =========

			-- 'RM visibility' frame
			create evx_rm_property_visibility_frame.make (get_text ({ADL_MESSAGES_IDS}.ec_rm_visibility_controls_text), False)
			evx_definition_control_panel.add_frame_control (evx_rm_property_visibility_frame, False)

			-- add RM multiplicities check button
			create evx_rm_multiplicities_cb.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_show_rm_multiplicities_button_text),
				get_text ({ADL_MESSAGES_IDS}.ec_show_rm_multiplicities_tooltip),
				agent :BOOLEAN do Result := show_rm_multiplicities end, agent update_show_rm_multiplicities)
			gui_controls.extend (evx_rm_multiplicities_cb)
			evx_rm_property_visibility_frame.extend (evx_rm_multiplicities_cb.ev_data_control, False)

			-- add RM data properties check button
			create evx_rm_data_attrs_visible_cb.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_show_rm_properties_button_text),
				get_text ({ADL_MESSAGES_IDS}.ec_show_rm_properties_tooltip),
				agent :BOOLEAN do Result := show_rm_data_properties end, agent update_show_rm_data_properties)
			gui_controls.extend (evx_rm_data_attrs_visible_cb)
			evx_rm_property_visibility_frame.extend (evx_rm_data_attrs_visible_cb.ev_data_control, False)

			-- add RM runtime properties option check button
			create evx_rm_runtime_attrs_visible_cb.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_show_rm_runtime_properties_button_text),
				get_text ({ADL_MESSAGES_IDS}.ec_show_rm_runtime_properties_tooltip),
				agent :BOOLEAN do Result := show_rm_runtime_properties end, agent update_show_rm_runtime_properties)
			gui_controls.extend (evx_rm_runtime_attrs_visible_cb)
			evx_rm_property_visibility_frame.extend (evx_rm_runtime_attrs_visible_cb.ev_data_control, False)

			-- add RM infrastructure properties option check button
			create evx_rm_if_attrs_visible_cb.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_show_rm_if_properties_button_text),
				get_text ({ADL_MESSAGES_IDS}.ec_show_rm_if_properties_tooltip),
				agent :BOOLEAN do Result := show_rm_infrastructure_properties end, agent update_show_rm_infrastructure_properties)
			gui_controls.extend (evx_rm_if_attrs_visible_cb)
			evx_rm_property_visibility_frame.extend (evx_rm_if_attrs_visible_cb.ev_data_control, False)

			-- 'RM rendering' frame
			create evx_rendering_frame.make (get_text ({ADL_MESSAGES_IDS}.ec_rendering_controls_text), False)
			evx_definition_control_panel.add_frame_control (evx_rendering_frame, False)

			-- use RM inheritance rendering check button
			create evx_view_rm_display_inheritance_cb.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_show_rm_inh_button_text),
				get_text ({ADL_MESSAGES_IDS}.ec_show_rm_inh_button_tooltip),
				agent :BOOLEAN do Result := show_rm_inheritance or editing_enabled end, agent update_show_rm_inheritance)
			gui_controls.extend (evx_view_rm_display_inheritance_cb)
			evx_rendering_frame.extend (evx_view_rm_display_inheritance_cb.ev_data_control, False)

			-- hide excluded attributes check button
			create evx_hide_excl_attrs_cb.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_hide_excl_attrs_button_text),
				get_text ({ADL_MESSAGES_IDS}.ec_hide_excl_attrs_button_tooltip),
				agent :BOOLEAN do Result := hide_excluded_attributes end, agent update_hide_excluded_attributes)
			gui_controls.extend (evx_hide_excl_attrs_cb)
			evx_rendering_frame.extend (evx_hide_excl_attrs_cb.ev_data_control, False)

			-- ============ RULES HBOX, with GRID & control panel =============
			create ev_rules_hbox
			ev_rules_hbox.set_padding (Default_padding_width)
			ev_rules_hbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_rules_hbox)

			-- EV_GRID
			create evx_rules_grid.make (True, False, True, False)
			evx_rules_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_rules_hbox.extend (evx_rules_grid.ev_grid)

			-- ========== view controls control panel ===========
			create evx_gui_rules_control_panel.make
			ev_rules_hbox.extend (evx_gui_rules_control_panel.ev_root_container)
			ev_rules_hbox.disable_item_expand (evx_gui_rules_control_panel.ev_root_container)

			-- tree collapse/expand control
			create evx_gui_rules_treeview_control.make (create {EVX_TREE_CONTROL_GRID}.make (evx_rules_grid),
				agent (a_row: EV_GRID_ROW): BOOLEAN do Result := not attached {BMM_MODEL_ELEMENT} a_row.data end,
				get_icon_pixmap ("tool/tree_collapse_all"), get_icon_pixmap ("tool/tree_collapse"),
				get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_expand_all"), Void)
			evx_gui_rules_control_panel.add_frame (evx_gui_rules_treeview_control.ev_root_container, False)


			-- ==================== setup ============================
			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_SPLIT_AREA

feature -- Status Report

	local_show_codes: BOOLEAN
			-- True if codes should be shown in the definition rendering

	local_show_rm_inheritance: BOOLEAN
			-- True if inheritance status should be shown in definition rendering of specialised archetypes

	local_show_technical_view: BOOLEAN
			-- local version of global flag, used only for editing

	local_show_rm_multiplicities: BOOLEAN
			-- local version of global flag, used only for editing

	local_show_rm_data_properties: BOOLEAN
			-- local version of global flag, used only for editing

	local_show_rm_runtime_properties: BOOLEAN
			-- local version of global flag, used only for editing

	local_show_rm_infrastructure_properties: BOOLEAN
			-- local version of global flag, used only for editing

	show_codes: BOOLEAN
		do
			if editing_enabled then
				Result := local_show_codes
			else
				Result := global_show_codes
			end
		end

	show_rm_inheritance: BOOLEAN
		do
			if editing_enabled then
				Result := local_show_rm_inheritance
			else
				Result := global_show_rm_inheritance
			end
		end

	effective_show_rm_inheritance: BOOLEAN
			-- compute effective setting for showing RM inheritance
		do
			Result := show_rm_inheritance and safe_source.is_specialised or editing_enabled
		end

	show_technical_view: BOOLEAN
		do
			if editing_enabled then
				Result := local_show_technical_view
			else
				Result := global_show_technical_view
			end
		end

	show_rm_multiplicities: BOOLEAN
		do
			if editing_enabled then
				Result := local_show_rm_multiplicities
			else
				Result := global_show_rm_multiplicities
			end
		end

	show_rm_data_properties: BOOLEAN
		do
			if editing_enabled then
				Result := local_show_rm_data_properties
			else
				Result := global_show_rm_data_properties
			end
		end

	show_rm_runtime_properties: BOOLEAN
		do
			if editing_enabled then
				Result := local_show_rm_runtime_properties
			else
				Result := global_show_rm_runtime_properties
			end
		end

	show_rm_infrastructure_properties: BOOLEAN
		do
			if editing_enabled then
				Result := local_show_rm_infrastructure_properties
			else
				Result := global_show_rm_infrastructure_properties
			end
		end

	hide_excluded_attributes: BOOLEAN
		do
			Result := global_hide_excluded_attributes
		end

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

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
			local_show_technical_view := True
			local_show_rm_data_properties := True
			local_show_rm_multiplicities := True
			local_show_codes := True
		end

	disable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.disable_editable end)
		end

feature {NONE} -- Events

	update_show_technical_view (a_flag: BOOLEAN)
			-- change state from show_technical_view
		do
			if editing_enabled then
				local_show_technical_view := not a_flag
			else
				set_global_show_technical_view (not a_flag)
			end

			if attached source then
				redisplay
			end
		end

	update_show_codes (a_flag: BOOLEAN)
		do
			if editing_enabled then
				local_show_codes := a_flag
			else
				set_global_show_codes (a_flag)
			end
			if attached source then
				redisplay
			end
		end

	update_show_rm_multiplicities (a_flag: BOOLEAN)
			-- turn on or off the display of reference model multiplicities in `ev_grid'.
		do
			if editing_enabled then
				local_show_rm_multiplicities := a_flag
			else
				set_global_show_rm_multiplicities (a_flag)
			end

			if attached source then
				do_with_wait_cursor (evx_definition_grid.ev_grid, agent redisplay)
			end
		end

	update_show_rm_data_properties (a_flag: BOOLEAN)
			-- turn on or off the display of reference model data properties details in `ev_grid'.
		do
			if editing_enabled then
				local_show_rm_data_properties := a_flag
				-- if turning off, turn off higher level RM properties
				if not a_flag then
					local_show_rm_infrastructure_properties := False
					local_show_rm_runtime_properties := False
				end
			else
				set_global_show_rm_data_properties (a_flag)
				-- if turning off, turn off higher level RM properties
				if not a_flag then
					if global_show_rm_infrastructure_properties then
						set_global_show_rm_infrastructure_properties (False)
					end
					if global_show_rm_runtime_properties then
						set_global_show_rm_runtime_properties (False)
					end
				end
			end

			if attached source then
				do_with_wait_cursor (evx_definition_grid.ev_grid, agent redisplay)
			end
		end

	update_show_rm_runtime_properties (a_flag: BOOLEAN)
			-- turn on or off the display of reference model runtime properties details in `ev_grid'.
		do
			if editing_enabled then
				local_show_rm_runtime_properties := a_flag
				if a_flag and not local_show_rm_data_properties then
					evx_rm_data_attrs_visible_cb.ev_data_control.enable_select
				else
					if not a_flag then
						local_show_rm_infrastructure_properties := False
					end
					if attached source then
						do_with_wait_cursor (evx_definition_grid.ev_grid, agent redisplay)
					end
				end
			else
				set_global_show_rm_runtime_properties (a_flag)
				if a_flag and not global_show_rm_data_properties then
					evx_rm_data_attrs_visible_cb.ev_data_control.enable_select
				else
					if not a_flag and global_show_rm_infrastructure_properties then
						set_global_show_rm_infrastructure_properties (False)
					end
					if attached source then
						do_with_wait_cursor (evx_definition_grid.ev_grid, agent redisplay)
					end
				end
			end
		end

	update_show_rm_infrastructure_properties (a_flag: BOOLEAN)
			-- turn on or off the display of reference model infrastructure properties details in `ev_grid'.
		do
			if editing_enabled then
				local_show_rm_infrastructure_properties := a_flag
				if a_flag and not local_show_rm_runtime_properties then
					evx_rm_runtime_attrs_visible_cb.ev_data_control.enable_select
				elseif attached source then
					do_with_wait_cursor (evx_definition_grid.ev_grid, agent redisplay)
				end
			else
				set_global_show_rm_infrastructure_properties (a_flag)
				if a_flag and not global_show_rm_runtime_properties then
					evx_rm_runtime_attrs_visible_cb.ev_data_control.enable_select
				elseif attached source then
					do_with_wait_cursor (evx_definition_grid.ev_grid, agent redisplay)
				end
			end
		end

	update_show_rm_inheritance (a_flag: BOOLEAN)
		do
			if editing_enabled then
				local_show_rm_inheritance := a_flag
			else
				set_global_show_rm_inheritance (a_flag)
			end
			if attached source then
				redisplay
			end
		end

	update_hide_excluded_attributes (a_flag: BOOLEAN)
		do
			set_global_hide_excluded_attributes (a_flag)
			if attached source then
				redisplay
			end
		end

feature {NONE} -- Implementation

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	visualise_descendants_class: detachable STRING

	ev_definition_hbox: EV_HORIZONTAL_BOX

	evx_definition_grid: EVX_GRID

	evx_definition_control_panel: EVX_CONTROL_PANEL

	evx_definition_treeview_control: EVX_TREEVIEW_CONTROL

	definition_grid_row_map: HASH_TABLE [EV_GRID_ROW, ARCHETYPE_CONSTRAINT]
			-- xref table from archetype definition nodes to GUI grid rows

	ev_rules_hbox: EV_HORIZONTAL_BOX

	evx_rules_grid: EVX_GRID

	evx_gui_rules_control_panel: EVX_CONTROL_PANEL

	evx_gui_rules_treeview_control: EVX_TREEVIEW_CONTROL

	evx_view_detail_radio: EVX_BOOLEAN_RADIO_CONTROL

	evx_view_rm_display_inheritance_cb, evx_show_codes_cb, evx_hide_excl_attrs_cb: EVX_CHECK_BOX_CONTROL

	evx_rm_data_attrs_visible_cb, evx_rm_runtime_attrs_visible_cb, evx_rm_if_attrs_visible_cb, evx_rm_multiplicities_cb: EVX_CHECK_BOX_CONTROL

	evx_view_detail_frame, evx_rm_property_visibility_frame, evx_rendering_frame: EVX_FRAME_CONTROL

	ref_model: BMM_MODEL
		attribute
			create Result.default_create
		end

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	do_clear
		do
			evx_definition_grid.wipe_out
			evx_rules_grid.wipe_out
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
			visualise_descendants_class := Void
		end

	do_populate
		local
			ui_settings: GUI_DEFINITION_SETTINGS
			aom_profile: AOM_PROFILE
		do
			evx_definition_grid.wipe_out
			evx_rules_grid.wipe_out

			-- determine visualisation ancestor 'stopping' class (when C_OBJECT.rm_type_name = this class,
			-- tree expanding stops)
			ref_model := safe_source.ref_model

			if aom_profiles_access.has_profile_for_rm_schema (ref_model.model_id) then
				aom_profile := aom_profiles_access.profile_for_rm_schema (ref_model.model_id)
				if not aom_profile.archetype_parent_class.is_empty then
					visualise_descendants_class := aom_profile.archetype_parent_class
				elseif not aom_profile.archetype_visualise_descendants_of.is_empty then
					visualise_descendants_class := aom_profile.archetype_visualise_descendants_of
				end
			end

			-- populate peripheral controls
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

			check attached selected_language end
			create ui_settings.make (selected_language,
				show_codes, effective_show_rm_inheritance, show_technical_view, show_rm_multiplicities,
				show_rm_data_properties, show_rm_runtime_properties, show_rm_infrastructure_properties,
				hide_excluded_attributes)

			-- populate the main definition grid
			evx_definition_grid.ev_grid.lock_update
			source_ui_graph.prepare_display_in_grid (evx_definition_grid)

			-- make visualisation adjustments
			if attached visualise_descendants_class as vis_desc_cl then
				-- collapse the tree except nodes inheriting from `visualise_descendants_class'
				evx_definition_treeview_control.on_collapse_except (
					agent (a_row: EV_GRID_ROW; vis_desc_class: STRING): BOOLEAN
						do
							if attached {C_OBJECT_UI_NODE} a_row.data as co_ed_ctx then
								Result := not co_ed_ctx.is_rm and ref_model.is_descendant_of (co_ed_ctx.rm_type.type_base_name, vis_desc_class)
							end
						end (?, vis_desc_cl)
				)
			else
				evx_definition_treeview_control.on_collapse_all
				evx_definition_treeview_control.on_expand_one_level
				evx_definition_treeview_control.on_expand_one_level
			end

			-- now do the display, so that colours get set properly according to what is open or closed in the tree
			source_ui_graph.definition_ui_graph.display_in_grid (ui_settings)

			-- if top level not expanded at least once, do so now
			if evx_definition_grid.ev_grid.row (1).is_expandable and then not evx_definition_grid.ev_grid.row (1).is_expanded then
				evx_definition_treeview_control.on_expand_one_level
			end

			-- set grid titles
			evx_definition_grid.set_column_titles (Definition_grid_col_names.linear_representation)
			evx_definition_grid.resize_columns_to_content
			evx_definition_grid.ev_grid.unlock_update

			-- populate rules grid, where applicable
			if source_archetype.has_rules then
				evx_rules_grid.ev_grid.lock_update
				across source_ui_graph.assertion_ui_graphs as assn_ed_contexts_csr loop
					assn_ed_contexts_csr.item.prepare_display_in_grid (evx_rules_grid)
					assn_ed_contexts_csr.item.display_in_grid (ui_settings)
				end

				evx_rules_grid.set_column_titles (Rules_grid_col_names.linear_representation)
				evx_gui_rules_treeview_control.on_collapse_all

				evx_rules_grid.resize_columns_to_content
				evx_rules_grid.ev_grid.unlock_update
				ev_rules_hbox.show
			else
				ev_rules_hbox.hide
			end
			ev_root_container.set_split_position (ev_root_container.minimum_split_position.max (ev_root_container.maximum_split_position -
				evx_rules_grid.ev_grid.row_height * evx_rules_grid.ev_grid.visible_row_count))
		end

	do_display
			-- refresh visual appearance if diff/flat view has changed or RM icons setting changed
		local
			ui_settings: GUI_DEFINITION_SETTINGS
		do
			-- populate peripheral controls
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

			-- repopulate from definition; visiting nodes doesn't change them, only updates their visual presentation
			evx_definition_grid.ev_grid.lock_update

			check attached selected_language end
			create ui_settings.make (selected_language, show_codes, effective_show_rm_inheritance, show_technical_view,
				show_rm_multiplicities, show_rm_data_properties, show_rm_runtime_properties, show_rm_infrastructure_properties, hide_excluded_attributes)

			-- repopulate main definition
			source_ui_graph.definition_ui_graph.display_in_grid (ui_settings)

			evx_definition_grid.resize_columns_to_content
			evx_definition_grid.ev_grid.unlock_update

			-- repopulate rules grid, where applicable
			if source_archetype.has_rules then
				evx_rules_grid.ev_grid.lock_update
				across source_ui_graph.assertion_ui_graphs as assn_ed_contexts_csr loop
					assn_ed_contexts_csr.item.display_in_grid (ui_settings)
				end
				evx_rules_grid.resize_columns_to_content
				evx_rules_grid.ev_grid.unlock_update
			end
		end

end


