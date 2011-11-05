note
	component:   "openEHR Archetype Project"
	description: "Node map control - Visualise an archetype structure as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWBPR"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_NODE_MAP_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate, repopulate
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

	tree_control_panel_width: INTEGER = 100

feature -- Initialisation

	make (a_code_select_action_agent: like code_select_action_agent)
		do
			code_select_action_agent := a_code_select_action_agent

			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)

			create ev_tree
			create ev_view_controls_vbox
			create ev_expand_button
			create ev_expand_one_button
			create ev_collapse_one_button
			create ev_cell
			create ev_rm_visibility_controls
			create ev_rm_visibility_vbox
			create ev_rm_off_rb
			create ev_rm_classes_on_rb
			create ev_rm_attrs_on_cb
			create ev_use_rm_icons_cb

			-- connect them together
			ev_root_container.extend (ev_tree)
			ev_root_container.extend (ev_view_controls_vbox)
			ev_view_controls_vbox.extend (ev_expand_button)
			ev_view_controls_vbox.extend (ev_expand_one_button)
			ev_view_controls_vbox.extend (ev_collapse_one_button)
			ev_view_controls_vbox.extend (ev_cell)
			ev_view_controls_vbox.extend (ev_rm_visibility_controls)
			ev_rm_visibility_controls.extend (ev_rm_visibility_vbox)
			ev_rm_visibility_vbox.extend (ev_rm_off_rb)
			ev_rm_visibility_vbox.extend (ev_rm_classes_on_rb)
			ev_view_controls_vbox.extend (ev_rm_attrs_on_cb)
			ev_view_controls_vbox.extend (ev_use_rm_icons_cb)

			-- set visual characteristics
--			ev_root_container.set_minimum_width (1)
--			ev_root_container.set_minimum_height (160)
			ev_root_container.disable_item_expand (ev_view_controls_vbox)
			ev_tree.set_background_color (editable_colour)

			-- right hand side tree expand/collapse controls
			ev_view_controls_vbox.set_minimum_width (100)
			ev_view_controls_vbox.set_minimum_height (170)
			ev_view_controls_vbox.set_padding (padding_width)
			ev_view_controls_vbox.set_border_width (border_width)
			ev_view_controls_vbox.disable_item_expand (ev_expand_button)
			ev_view_controls_vbox.disable_item_expand (ev_expand_one_button)
			ev_view_controls_vbox.disable_item_expand (ev_collapse_one_button)
			ev_view_controls_vbox.disable_item_expand (ev_cell)
			ev_view_controls_vbox.disable_item_expand (ev_rm_visibility_controls)
			ev_view_controls_vbox.disable_item_expand (ev_rm_attrs_on_cb)
			ev_view_controls_vbox.disable_item_expand (ev_use_rm_icons_cb)
			ev_expand_button.set_text (create_message_content ("expand_collapse_complete_button_text", Void))
			ev_expand_button.set_tooltip (create_message_content ("expand_collapse_complete_tooltip", Void))
			ev_expand_button.set_minimum_width (tree_control_panel_width)
			ev_expand_one_button.set_text (create_message_content ("expand_one_level_button_text", Void))
			ev_expand_one_button.set_tooltip (create_message_content ("expand_one_level_tooltip", Void))
			ev_expand_one_button.set_minimum_width (tree_control_panel_width)
			ev_collapse_one_button.set_text (create_message_content ("collapse_one_level_button_text", Void))
			ev_collapse_one_button.set_tooltip (create_message_content ("collapse_one_level_tooltip", Void))
			ev_collapse_one_button.set_minimum_width (tree_control_panel_width)
			ev_cell.set_minimum_height (20)

			-- right hand side visibility controls
			ev_rm_visibility_controls.set_text (create_message_content ("rm_visibility_controls_text", Void))
			ev_rm_visibility_controls.set_minimum_width (100)
			ev_rm_visibility_controls.set_minimum_height (85)
			ev_rm_visibility_vbox.set_border_width (border_width)
			ev_rm_off_rb.set_text (create_message_content ("hide_rm_details_button_text", Void))
			ev_rm_off_rb.set_tooltip (create_message_content ("hide_rm_details_tooltip", Void))
			ev_rm_classes_on_rb.set_text (create_message_content ("display_rm_class_names_button_text", Void))
			ev_rm_classes_on_rb.set_tooltip (create_message_content ("display_rm_class_names_tooltip", Void))
			ev_rm_attrs_on_cb.set_text (create_message_content ("show_rm_properties_button_text", Void))
			ev_rm_attrs_on_cb.set_tooltip (create_message_content ("show_rm_properties_tooltip", Void))
			ev_use_rm_icons_cb.set_text (create_message_content ("use_rm_icons_button_text", Void))
			ev_use_rm_icons_cb.set_tooltip (create_message_content ("use_rm_icons_button_tooltip", Void))

			in_reference_model_mode := show_reference_model_view
			if in_reference_model_mode then
				ev_rm_attrs_on_cb.enable_select
			end
			in_technical_mode := show_technical_view
			if in_technical_mode then
				ev_rm_classes_on_rb.enable_select
			else
				ev_rm_off_rb.enable_select
			end
			if use_rm_pixmaps then
				ev_use_rm_icons_cb.enable_select
			end

			-- set events
			ev_expand_button.select_actions.extend (agent on_toggle_expand_tree)
			ev_expand_one_button.select_actions.extend (agent on_expand_tree_one_level)
			ev_collapse_one_button.select_actions.extend (agent on_shrink_tree_one_level)
			ev_rm_off_rb.select_actions.extend (agent on_domain_selected)
			ev_rm_classes_on_rb.select_actions.extend (agent on_technical_selected)
			ev_rm_attrs_on_cb.select_actions.extend (agent on_reference_model_selected)
			ev_use_rm_icons_cb.select_actions.extend (agent on_ev_use_rm_icons_cb_selected)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature -- Status Report

	in_technical_mode: BOOLEAN
			-- If True, show more technical detail on each node

	in_reference_model_mode: BOOLEAN
			-- True if reference model should be visible in tree

	in_reference_model_mode_changed: BOOLEAN
			-- True if last call to set/unset in_reference_model_mode changed the flag's value

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

	repopulate
			-- repopulate and/or refresh visual appearance if diff/flat view has changed or RM icons setting changed
		local
			a_c_iterator: C_VISITOR_ITERATOR
			c_node_map_builder: C_GUI_NODE_MAP_BUILDER
		do
			-- repopulate from definition; visiting nodes doesn't change them, only updates their visual presentation
			create c_node_map_builder
			c_node_map_builder.initialise (source_archetype, selected_language, ev_tree, in_technical_mode, True, gui_node_map, code_select_action_agent)
			create a_c_iterator.make (source_archetype.definition, c_node_map_builder)
			a_c_iterator.do_all

			-- update reference mode nodes
			if in_reference_model_mode_changed then
				if in_reference_model_mode then
					ev_tree.recursive_do_all (agent node_add_rm_attributes (?))
				else
					ev_tree.recursive_do_all (agent node_remove_rm_attributes (?))
				end
				in_reference_model_mode_changed := False
			end
		end

	update_rm_icons_cb
			-- update and repopulate if this setting was changed elsewhere in the tool
		do
			if attached source and use_rm_pixmaps /= ev_use_rm_icons_cb.is_selected then
				if use_rm_pixmaps then
					ev_use_rm_icons_cb.enable_select
				else
					ev_use_rm_icons_cb.disable_select
				end
				repopulate
			end
		end

feature {NONE} -- Events

	on_shrink_tree_one_level
		do
			if attached source then
				create node_list.make (0)
				ev_tree.recursive_do_all (agent ev_tree_item_collapse_one_level)

				from node_list.start until node_list.off loop
					node_list.item.collapse
					node_list.forth
				end
			end
		end

	on_expand_tree_one_level
		do
			if attached source then
				create node_list.make (0)
				ev_tree.recursive_do_all (agent ev_tree_item_expand_one_level)

				from node_list.start until node_list.off loop
					node_list.item.expand
					node_list.forth
				end
			end
		end

	on_toggle_expand_tree
		do
			if attached source then
				toggle_expand_tree
			end
		end

	on_domain_selected
			-- Hide technical details in `gui_tree'.
		do
			if attached source then
				in_technical_mode := False
				set_show_technical_view (False)
				repopulate
			end
		end

	on_technical_selected
			-- Display technical details in `gui_tree'.
		do
			if attached source then
				in_technical_mode := True
				set_show_technical_view (True)
				repopulate
			end
		end

	on_reference_model_selected
			-- turn on or off the display of reference model details in `gui_tree'.
		do
			if attached source then
				if ev_rm_attrs_on_cb.is_selected then
					in_reference_model_mode_changed := not in_reference_model_mode
					in_reference_model_mode := True
					set_show_reference_model_view (True)
				else
					in_reference_model_mode_changed := in_reference_model_mode
					in_reference_model_mode := False
					set_show_reference_model_view (False)
				end
				repopulate
			end
		end

	code_select_action_agent: PROCEDURE [ANY, TUPLE [STRING]]
			-- action to perform when node is selected in tree

	on_ev_use_rm_icons_cb_selected
		do
			if attached source then
				set_use_rm_pixmaps (ev_use_rm_icons_cb.is_selected)
				repopulate

				-- reflect change to other editor tools
				gui_agents.update_all_tools_rm_icons_setting_agent.call ([])
			end
		end

feature {NONE} -- Implementation

	ev_tree: EV_TREE

	ev_expand_button, ev_expand_one_button, ev_collapse_one_button: EV_BUTTON

	ev_rm_off_rb, ev_rm_classes_on_rb: EV_RADIO_BUTTON

	ev_rm_attrs_on_cb, ev_use_rm_icons_cb: EV_CHECK_BUTTON

	ev_view_controls_vbox, ev_rm_visibility_vbox: EV_VERTICAL_BOX

	ev_rm_visibility_controls: EV_FRAME

	ev_cell: EV_CELL

	rm_schema: BMM_SCHEMA

	ontologies: ARRAYED_STACK [ARCHETYPE_ONTOLOGY]
			-- we use a stack here to handle ontologies inside operational templates

	ontology: attached ARCHETYPE_ONTOLOGY
			-- The ontology for `source_archetype'.
		require
			ontologies_attached: attached ontologies
			ontologies_has_item: not ontologies.off
		do
			Result := ontologies.item
		end

	gui_node_map: HASH_TABLE [EV_TREE_ITEM, ARCHETYPE_CONSTRAINT]
			-- xref table from archetype definition nodes to GUI nodes (note that some C_X
			-- nodes have child GUI nodes; the visitor takes care of the details)

	tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

	do_clear
		do
			ev_tree.wipe_out
		end

	do_populate
			-- build definition / ontology cross reference tables used for validation and
			-- other purposes
		local
			a_c_iterator: C_VISITOR_ITERATOR
			c_node_map_builder: C_GUI_NODE_MAP_BUILDER
		do
			create tree_item_stack.make (0)
			create gui_node_map.make(0)
			create ontologies.make (0)

			rm_schema := source.rm_schema

			-- populate from definition
			create c_node_map_builder
			c_node_map_builder.initialise (source_archetype, selected_language, ev_tree, in_technical_mode, False, gui_node_map, code_select_action_agent)
			create a_c_iterator.make (source_archetype.definition, c_node_map_builder)
			a_c_iterator.do_all

			-- add RM attributes if in RM mode
			if in_reference_model_mode then
				ev_tree.recursive_do_all (agent node_add_rm_attributes (?))
			end

			-- populate from invariants
			populate_invariants

			-- make visualisation adjustments
			is_expanded := not expand_node_tree
			toggle_expand_tree

			if not differential_view then
				roll_up_to_specialisation_level
			end
		end

	node_add_rm_attributes (a_tree_node: attached EV_TREE_NODE)
		local
			pixmap: EV_PIXMAP
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			attr_ti: EV_TREE_ITEM
		do
			if attached {EV_TREE_ITEM} a_tree_node as a_ti and then attached {C_COMPLEX_OBJECT} a_ti.data as c_c_o then
				if rm_schema.has_class_definition (c_c_o.rm_type_name) then
					if differential_view then
						props := rm_schema.class_definition (c_c_o.rm_type_name).properties
					else
						props := rm_schema.class_definition (c_c_o.rm_type_name).flat_properties
					end
					from props.start until props.off loop
						if not c_c_o.has_attribute (props.key_for_iteration) then
							pixmap := pixmaps.item (rm_attribute_pixmap_string (props.item_for_iteration))
							create attr_ti.make_with_text (utf8 (props.key_for_iteration + ": " + props.item_for_iteration.type.as_type_string))
							attr_ti.set_data (props.item_for_iteration)
							attr_ti.set_pixmap (pixmap)
							a_tree_node.extend (attr_ti)
						end
						props.forth
					end
				end
			end
		end

	node_remove_rm_attributes (a_tree_node: attached EV_TREE_NODE)
		do
			if attached {C_COMPLEX_OBJECT} a_tree_node.data as c_c_o then
				from a_tree_node.start until a_tree_node.off loop
					if attached {BMM_PROPERTY_DEFINITION} a_tree_node.item.data as a_bmm_prop then
						a_tree_node.remove
					else
						a_tree_node.forth
					end
				end
			end
		end

	toggle_expand_tree
			-- Expand or shrink the tree control.
		do
			is_expanded := not is_expanded

			if is_expanded then
				ev_tree.recursive_do_all (
					agent (an_ev_tree_node: attached EV_TREE_NODE)
						do
							if an_ev_tree_node.is_expandable then
								an_ev_tree_node.expand
							end
						end
				)
				ev_expand_button.set_text (create_message_content ("expand_button_collapse_text", Void))
			else
				ev_tree.recursive_do_all (
					agent (an_ev_tree_node: attached EV_TREE_NODE)
						do
							if an_ev_tree_node.is_expandable then
								an_ev_tree_node.collapse
							end
						end
				)
				ev_expand_button.set_text (create_message_content ("expand_button_expand_text", Void))
			end
		end

	shrink_to_level (a_type: STRING)
			-- Shrink the tree control up to items of type `a_type'.
		do
			ev_tree.recursive_do_all (agent ev_tree_item_shrink_to_level (a_type, ?))
		end

	roll_up_to_specialisation_level
			-- roll the tree up so that nodes whose rolled_up_specialisation_status is
			-- ss_inherited are closed, but nodes with
		require
			archetype_selected: attached source
		do
			if source_archetype.is_specialised and not source_archetype.is_template then
				create node_list.make(0)
				ev_tree.recursive_do_all(agent ev_tree_item_roll_up(?))

				from node_list.start until node_list.off loop
					node_list.item.collapse
					node_list.forth
				end
			end
		end

	ev_tree_item_shrink_to_level (a_level: attached STRING; an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if attached an_ev_tree_node.data then
				if attached {C_ATTRIBUTE} an_ev_tree_node.data and an_ev_tree_node.is_expandable then
					an_ev_tree_node.expand
				elseif an_ev_tree_node.is_expandable then
					if a_level.is_equal ("addressable") then
						if attached {C_COMPLEX_OBJECT} an_ev_tree_node as an_obj_node and then an_obj_node.is_addressable then
							an_ev_tree_node.expand
						else
							an_ev_tree_node.collapse
						end
					elseif a_level.is_equal ("anonymous") then
						if attached {C_COMPLEX_OBJECT} an_ev_tree_node then
							an_ev_tree_node.expand
						else
							an_ev_tree_node.collapse
						end
					elseif a_level.is_equal ("simple") then
						an_ev_tree_node.expand
					end
				end
			end
		end

	ev_tree_item_expand_one_level (an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expanded then
				from an_ev_tree_node.start until an_ev_tree_node.off loop
					if an_ev_tree_node.item.is_expandable and then not an_ev_tree_node.item.is_expanded then
						node_list.extend (an_ev_tree_node.item)
					end
					an_ev_tree_node.forth
				end
			elseif an_ev_tree_node = ev_tree.item then
				node_list.extend (an_ev_tree_node)
			end
		end

	ev_tree_item_collapse_one_level (an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expanded then
				from
					an_ev_tree_node.start
				until
					an_ev_tree_node.off or else (an_ev_tree_node.item.is_expandable and then an_ev_tree_node.item.is_expanded)
				loop
					an_ev_tree_node.forth
				end

				if an_ev_tree_node.off then -- didn't find any expanded children
					node_list.extend (an_ev_tree_node)
				end
			end
		end

	ev_tree_item_roll_up (an_ev_tree_node: attached EV_TREE_NODE)
			-- close nodes that have rolled_up_specialisation_status = ss_inherited; open others
		do
			if an_ev_tree_node.is_expandable then
				if attached {ARCHETYPE_CONSTRAINT} an_ev_tree_node.data as ac then
					if ac.rolled_up_specialisation_status.value = ss_inherited then
						an_ev_tree_node.collapse
					else
						an_ev_tree_node.expand
					end
				end
			end
		end

	node_list: ARRAYED_LIST [EV_TREE_NODE]

	rm_attribute_pixmap_string (rm_attr: attached BMM_PROPERTY_DEFINITION): attached STRING
			-- string name of pixmap for attribute rm_attr
		do
			create Result.make_empty
			Result.append ("c_attribute")
			if rm_attr.is_container then
				Result.append (".multiple")
			end
			if not rm_attr.is_mandatory then
				Result.append (".optional")
			end
		end

	object_invariant_string (an_inv: attached ASSERTION): attached STRING
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string

			if not in_technical_mode then
				Result := ontology.substitute_codes (Result, current_language)
			end
		end

	populate_invariants
			-- populate invariants of archetype into bottom nodes of tree
		local
			a_ti_sub, a_ti_sub2: EV_TREE_ITEM
			invariants: ARRAYED_LIST[ASSERTION]
			s: STRING
		do
			if source_archetype.has_invariants then
				invariants := source_archetype.invariants
				create a_ti_sub.make_with_text ("invariants:")
				a_ti_sub.set_pixmap(pixmaps.item ("CADL_INVARIANT"))
				ev_tree.extend (a_ti_sub)

				from invariants.start until invariants.off loop
					create s.make_empty

					if invariants.item.tag /= Void then
						s.append (invariants.item.tag + ": ")
					end

					s.append (object_invariant_string (invariants.item))
					create a_ti_sub2.make_with_text (utf8 (s))
					a_ti_sub2.set_pixmap (pixmaps.item ("CADL_INVARIANT_ITEM"))
					a_ti_sub2.set_data (invariants.item)
					a_ti_sub.extend (a_ti_sub2)
					invariants.forth
				end

				-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
			end
		end

	ev_tree_do_all(node_enter_action, node_exit_action: attached PROCEDURE[ANY, TUPLE [EV_TREE_NODE]])
			-- do enter_action and exit_action to all nodes in the structure
		do
			from ev_tree.start until ev_tree.off loop
				ev_tree_do_all_nodes (ev_tree.item, node_enter_action, node_exit_action)
				ev_tree.forth
			end
		end

	ev_tree_do_all_nodes(a_target: attached EV_TREE_NODE; node_enter_action, node_exit_action: PROCEDURE[ANY, TUPLE [EV_TREE_NODE]])
		do
			node_enter_action.call ([a_target])
			from a_target.start until a_target.off loop
				ev_tree_do_all_nodes (a_target.item, node_enter_action, node_exit_action)
				a_target.forth
			end
			node_exit_action.call ([a_target])
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
