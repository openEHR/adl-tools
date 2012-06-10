note
	component:   "openEHR Archetype Project"
	description: "Node map control - Visualise an archetype structure as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWBPR"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"
	void_safe:	 "yes, dirty"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_NODE_MAP_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate, repopulate, disable_edit, enable_edit
		end

	SPECIALISATION_STATUSES
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Tree_control_panel_width: INTEGER = 100

feature -- Initialisation

	make (a_code_select_action_agent: like code_select_action_agent)
		do
			create gui_controls.make (0)

			code_select_action_agent := a_code_select_action_agent

			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- EV_GRID
			create ev_grid.make
			ev_grid.enable_tree
			ev_grid.disable_row_height_fixed
			ev_grid.row_expand_actions.extend (agent (a_row: EV_GRID_ROW) do ev_grid.resize_columns_to_content (Default_grid_expansion_factor) end)
			ev_grid.row_collapse_actions.extend (agent (a_row: EV_GRID_ROW) do ev_grid.resize_columns_to_content (Default_grid_expansion_factor) end)
			ev_root_container.extend (ev_grid)

			create ev_view_controls_vbox
			ev_root_container.extend (ev_view_controls_vbox)
			ev_root_container.disable_item_expand (ev_view_controls_vbox)
	--		ev_view_controls_vbox.set_minimum_width (115)
	--		ev_view_controls_vbox.set_minimum_height (170)
			ev_view_controls_vbox.set_padding (Default_padding_width)
			ev_view_controls_vbox.set_border_width (Default_border_width)

			-- tree collapse/expand control
			create gui_treeview_control.make (get_text ("view_label_text"), create {GUI_TREE_CONTROL_GRID}.make (ev_grid))
			ev_view_controls_vbox.extend (gui_treeview_control.ev_root_container)
			ev_view_controls_vbox.disable_item_expand (gui_treeview_control.ev_root_container)

			-- ========= view detail level options  =========
			create view_detail_frame_ctl.make (get_text ("view_detail_controls_text"), 85, 100, False)
			ev_view_controls_vbox.extend (view_detail_frame_ctl.ev_root_container)
			ev_view_controls_vbox.disable_item_expand (view_detail_frame_ctl.ev_root_container)

			-- view detail toggle button
			create toggle_button_ctl.make (get_text ("domain_detail_button_text"), get_text ("technical_detail_button_text"),
				get_text ("domain_detail_button_tooltip"),
				agent :BOOLEAN do Result := not show_technical_view end,
				agent update_show_technical_view, 0, 0)
			gui_controls.extend (toggle_button_ctl)
			view_detail_frame_ctl.extend (toggle_button_ctl.ev_data_control, False)

			-- include codes checkbox
			create add_codes_checkbox_ctl.make_active (get_text ("domain_view_add_codes_text"), Void,
				agent :BOOLEAN do Result := show_codes end, agent update_show_codes)
			gui_controls.extend (add_codes_checkbox_ctl)
			view_detail_frame_ctl.extend (add_codes_checkbox_ctl.ev_data_control, False)


			-- ========= RM view options =========

			-- frame
			create view_rm_frame_ctl.make (get_text ("view_rm_controls_text"), 85, 0, False)
			ev_view_controls_vbox.extend (view_rm_frame_ctl.ev_root_container)
			ev_view_controls_vbox.disable_item_expand (view_rm_frame_ctl.ev_root_container)

			-- add RM into tree check button
			create view_rm_attrs_on_checkbox_ctl.make_active (get_text ("show_rm_properties_button_text"),
				get_text ("show_rm_properties_tooltip"),
				agent :BOOLEAN do Result := show_reference_model_view end, agent update_show_reference_model_view)
			gui_controls.extend (view_rm_attrs_on_checkbox_ctl)
			view_rm_frame_ctl.extend (view_rm_attrs_on_checkbox_ctl.ev_data_control, False)

			-- use RM icons check button
			create view_rm_use_icons_checkbox_ctl.make_active (get_text ("use_rm_icons_button_text"),
				get_text ("use_rm_icons_button_tooltip"),
				agent :BOOLEAN do Result := use_rm_pixmaps end, agent update_use_rm_pixmaps)
			gui_controls.extend (view_rm_use_icons_checkbox_ctl)
			view_rm_frame_ctl.extend (view_rm_use_icons_checkbox_ctl.ev_data_control, False)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature -- Status Report

	show_codes: BOOLEAN
			-- True if codes should be shown in the definition rendering

	show_reference_model_view_changed: BOOLEAN
			-- True if last call to set/unset show_reference_model_view changed the flag's value

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated and source.is_valid
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.enable_active end)
		end

	disable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.disable_active end)
		end

	repopulate
			-- repopulate and/or refresh visual appearance if diff/flat view has changed or RM icons setting changed
		local
			a_c_iterator: OG_CONTENT_ITERATOR
			c_node_map_builder: C_GUI_NODE_MAP_BUILDER
		do
			-- populate peripheral controls
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.populate end)

			-- repopulate from definition; visiting nodes doesn't change them, only updates their visual presentation
			create c_node_map_builder
			c_node_map_builder.initialise (rm_schema, source_archetype, selected_language, ev_grid,
				show_technical_view, True, show_codes, gui_node_map, code_select_action_agent)
			create a_c_iterator.make (source_archetype.definition, c_node_map_builder)
			a_c_iterator.do_all

			-- update reference mode nodes
			if show_reference_model_view_changed then
				if show_reference_model_view then
					gui_treeview_control.ev_tree_do_all (agent grid_row_add_rm_attributes)
				else
					gui_treeview_control.ev_tree_do_all (agent grid_row_remove_rm_attributes)
				end
				show_reference_model_view_changed := False
			end

			ev_grid.resize_columns_to_content (Default_grid_expansion_factor)
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

	update_show_reference_model_view (a_flag: BOOLEAN)
			-- turn on or off the display of reference model details in `ev_grid'.
		do
			show_reference_model_view_changed := a_flag /= show_reference_model_view
			set_show_reference_model_view (a_flag)
			if attached source then
				repopulate
			end
		end

	code_select_action_agent: PROCEDURE [ANY, TUPLE [STRING]]
			-- action to perform when node is selected in tree

	update_use_rm_pixmaps (a_flag: BOOLEAN)
		do
			set_use_rm_pixmaps (a_flag)

			if attached source then
				repopulate

				-- reflect change to other editor tools
				gui_agents.update_all_tools_rm_icons_setting_agent.call ([])
			end
		end

feature {NONE} -- Implementation

	ev_grid: EV_GRID_KBD_MOUSE

	gui_controls: ARRAYED_LIST [GUI_DATA_CONTROL]

	gui_treeview_control: GUI_TREEVIEW_CONTROL

	toggle_button_ctl: GUI_TOGGLE_BUTTON_CONTROL

	add_codes_checkbox_ctl, view_rm_attrs_on_checkbox_ctl, view_rm_use_icons_checkbox_ctl: GUI_CHECK_BOX_CONTROL

	ev_view_controls_vbox: EV_VERTICAL_BOX

	view_detail_frame_ctl, view_rm_frame_ctl: GUI_FRAME_CONTROL

	rm_schema: detachable BMM_SCHEMA

	gui_node_map: HASH_TABLE [EV_GRID_ROW, ARCHETYPE_CONSTRAINT]
			-- xref table from archetype definition nodes to GUI nodes (note that some C_X
			-- nodes have child GUI nodes; the visitor takes care of the details)

	do_clear
		do
			ev_grid.wipe_out
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.clear end)
		end

	do_populate
			-- build definition / ontology cross reference tables used for validation and
			-- other purposes
		local
			a_c_iterator: OG_CONTENT_ITERATOR
			c_node_map_builder: C_GUI_NODE_MAP_BUILDER
			i: INTEGER
		do
			-- populate peripheral controls
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.populate end)

			-- populate grid control
			create gui_node_map.make (0)

			rm_schema := source.rm_schema

			create c_node_map_builder
			c_node_map_builder.initialise (rm_schema, source_archetype, selected_language, ev_grid,
				show_technical_view, False, show_codes, gui_node_map, code_select_action_agent)
			create a_c_iterator.make (source_archetype.definition, c_node_map_builder)
			a_c_iterator.do_all

			-- add RM attributes if in RM mode
			if show_reference_model_view then
				gui_treeview_control.ev_tree_do_all (agent grid_row_add_rm_attributes)
			end

			-- populate from invariants
			populate_invariants

			-- make visualisation adjustments
			if expand_node_tree then
				gui_treeview_control.on_expand_all
			else
				gui_treeview_control.on_collapse_all
				gui_treeview_control.on_expand_one_level
				gui_treeview_control.on_expand_one_level
				gui_treeview_control.on_expand_one_level
				gui_treeview_control.on_expand_one_level
			end

			if not differential_view then
				roll_up_to_specialisation_level
			end

			-- grid column titles
			if ev_grid.row_count > 0 then
				from i := 1 until i > ev_grid.column_count loop
					ev_grid.column (i).set_title (Node_grid_col_names.item (i))
					i := i + 1
				end
			end
			ev_grid.resize_columns_to_content (Default_grid_expansion_factor)

			-- Initial settings
			show_reference_model_view_changed := False
		end

	grid_row_add_rm_attributes (an_ev_grid_row: attached EV_GRID_ROW)
		local
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			rm_attr_sub_row: EV_GRID_ROW
			gli: EV_GRID_LABEL_ITEM
		do
			if attached {C_COMPLEX_OBJECT} an_ev_grid_row.data as c_c_o then
				if rm_schema.has_class_definition (c_c_o.rm_type_name) then
					if differential_view then
						props := rm_schema.class_definition (c_c_o.rm_type_name).properties
					else
						props := rm_schema.class_definition (c_c_o.rm_type_name).flat_properties
					end
					from props.start until props.off loop
						if not c_c_o.has_attribute (props.key_for_iteration) then
							an_ev_grid_row.insert_subrow (an_ev_grid_row.subrow_count + 1)
							rm_attr_sub_row := an_ev_grid_row.subrow (an_ev_grid_row.subrow_count)
							rm_attr_sub_row.set_data (props.item_for_iteration)

							-- RM col
							create gli.make_with_text (utf8_to_utf32 (props.key_for_iteration + ": " + props.item_for_iteration.type.as_type_string))
							gli.set_pixmap (get_icon_pixmap ("rm/generic/" + props.item_for_iteration.multiplicity_key_string))
							gli.set_foreground_color (rm_attribute_color)
							rm_attr_sub_row.set_item (Node_grid_col_rm_name, gli)

							-- existence col
							create gli.make_with_text (props.item_for_iteration.existence.as_string)
							gli.set_foreground_color (rm_attribute_color)
							rm_attr_sub_row.set_item (Node_grid_col_existence, gli)

							-- card/occ col
							if attached {BMM_CONTAINER_PROPERTY} props.item_for_iteration as bmm_cont_prop then
								create gli.make_with_text (bmm_cont_prop.cardinality.as_string)
								gli.set_foreground_color (rm_attribute_color)
								rm_attr_sub_row.set_item (Node_grid_col_card_occ, gli)
							end
						end
						props.forth
					end
				end
			end
		end

	grid_row_remove_rm_attributes (an_ev_grid_row: attached EV_GRID_ROW)
		local
			i: INTEGER
			sub_row: EV_GRID_ROW
			remove_list: SORTED_TWO_WAY_LIST [INTEGER]
		do
			if attached {C_COMPLEX_OBJECT} an_ev_grid_row.data as c_c_o then
				create remove_list.make
				from i := 1 until i > an_ev_grid_row.subrow_count loop
					sub_row := an_ev_grid_row.subrow (i)
					if attached {BMM_PROPERTY_DEFINITION} sub_row.data as a_bmm_prop then
						remove_list.extend (sub_row.index)
					end
					i := i + 1
				end
				from remove_list.finish	until remove_list.off loop
					ev_grid.remove_row (remove_list.item)
					remove_list.back
				end
			end
		end

	roll_up_to_specialisation_level
			-- roll the tree up so that nodes whose rolled_up_specialisation_status is
			-- ss_inherited are closed, but nodes with
		require
			archetype_selected: attached source
		do
			if source_archetype.is_specialised and not source_archetype.is_template then
				gui_treeview_control.ev_tree_do_all (agent ev_grid_row_roll_up)
			end
		end

	ev_grid_row_roll_up (an_ev_grid_row: attached EV_GRID_ROW)
			-- close rows that have rolled_up_specialisation_status = ss_inherited; open others
		do
			if an_ev_grid_row.is_expandable then
				if attached {ARCHETYPE_CONSTRAINT} an_ev_grid_row.data as ac then
					if ac.specialisation_status = ss_inherited and not ev_grid_node_has_non_inherited_child (an_ev_grid_row) then
						an_ev_grid_row.collapse
					else
						an_ev_grid_row.expand
					end
				end
			end
		end

	ev_grid_node_has_non_inherited_child (an_ev_grid_row: attached EV_GRID_ROW): BOOLEAN
			-- True if `an_ev_grid_row' is either already expanded, which implies it is not inherited,
			-- or else its specialisation status is not ss_inherited
		local
			i: INTEGER
			sub_row: EV_GRID_ROW
		do
			from i := 1 until i > an_ev_grid_row.subrow_count or Result loop
				sub_row := an_ev_grid_row.subrow (i)
				if sub_row.is_expandable then
					Result := sub_row.is_expanded
				elseif attached {ARCHETYPE_CONSTRAINT} sub_row.data as ac then
					Result := ac.specialisation_status /= ss_inherited
				end
				i := i + 1
			end
		end

	object_invariant_string (an_inv: attached ASSERTION): attached STRING
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string

			if not show_technical_view then
				Result := source_archetype.ontology.substitute_codes (Result, current_language)
			end
		end

	populate_invariants
			-- populate invariants of archetype into bottom nodes of tree
		local
			a_ti_sub, a_ti_sub2: EV_TREE_ITEM
			invariants: ARRAYED_LIST[ASSERTION]
			s: STRING
		do
--			if source_archetype.has_invariants then
--				invariants := source_archetype.invariants
--				create a_ti_sub.make_with_text ("rules:")
--				a_ti_sub.set_pixmap (get_icon_pixmap ("added/rules"))
--				ev_tree.extend (a_ti_sub)

--				from invariants.start until invariants.off loop
--					create s.make_empty

--					if invariants.item.tag /= Void then
--						s.append (invariants.item.tag + ": ")
--					end

--					s.append (object_invariant_string (invariants.item))
--					create a_ti_sub2.make_with_text (utf8_to_utf32 (s))
--					a_ti_sub2.set_pixmap (get_icon_pixmap ("added/" + invariants.item.generator))
--					a_ti_sub2.set_data (invariants.item)
--					a_ti_sub.extend (a_ti_sub2)
--					invariants.forth
--				end

--				-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
--			end
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
