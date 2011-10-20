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
	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	GUI_SEARCHABLE_TOOL
		redefine
			ev_root_container
		end

create
	make

feature {NONE} -- Initialisation

	make (a_select_class_agent, a_select_class_in_new_tool_agent: like select_class_agent)
		do
			select_class_agent := a_select_class_agent
			select_class_in_new_tool_agent := a_select_class_in_new_tool_agent

			-- create widgets
			create ev_root_container
			create ev_tree

			-- connect widgets
			ev_root_container.extend (ev_tree)

			-- visual characteristics
--			ev_tree.set_background_color (editable_colour)
  			ev_tree.set_minimum_width (180)

			-- events
--			ev_tree.focus_in_actions.extend (agent tree_item_select)
		end

feature -- Access

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
				Result.extend (create_message_line("regex_e1", <<a_regex>>))
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

	populate
			-- Populate content from visual controls.
		do
			ev_tree.wipe_out
			create ev_node_map.make(0)
			populate_tree
		end

	repopulate
			-- repopulate current tree items if needed
		do
		end

	select_item (id: attached STRING)
			-- show class in RM explorer and display it in a class tool
		do
			if ev_node_map.has (id) and ev_tree.is_displayed then
				ev_tree.ensure_item_visible (ev_node_map.item (id))
				ev_node_map.item (id).enable_select
			end
		end

	show_item (id: attached STRING)
			-- show class in RM explorer
		do
			if ev_node_map.has (id) and ev_tree.is_displayed then
				ev_tree.ensure_item_visible (ev_node_map.item (id))
			end
		end

	clear
			-- Wipe out content from visual controls and reset controls to reasonable state
		do
		end

feature {NONE} -- Implementation

	ev_pixmap: EV_PIXMAP

	ev_label: EV_LABEL

	ev_tree: EV_TREE

	ev_hbox: EV_HORIZONTAL_BOX

	select_class_agent, select_class_in_new_tool_agent: PROCEDURE [ANY, TUPLE [BMM_CLASS_DEFINITION]]

	populate_tree
		do
			from rm_schemas_access.valid_top_level_schemas.start until rm_schemas_access.valid_top_level_schemas.off loop
				populate_schema (rm_schemas_access.valid_top_level_schemas.item_for_iteration)
				rm_schemas_access.valid_top_level_schemas.forth
			end
		end

	populate_schema (a_schema: BMM_SCHEMA)
		local
			ev_node: EV_TREE_ITEM
			str: STRING
		do
			-- put a root schema node on the tree
			create ev_node.make_with_text (a_schema.schema_id)
 			ev_node.set_data (a_schema)

 			str := "Schema id: " + a_schema.schema_id + "%N"
 			str.append (a_schema.schema_description)

 	 		ev_node.pointer_button_press_actions.force_extend (agent schema_node_handler (ev_node, ?, ?, ?))

 	 		ev_node.set_tooltip (str)
 	 		ev_node.set_pixmap (pixmaps ["rm_schema"])
			ev_tree.extend (ev_node)

 			from a_schema.packages.start until a_schema.packages.off loop
 				populate_packages (ev_node, a_schema.packages.item_for_iteration)
 				a_schema.packages.forth
 			end
		end

	populate_packages (ev_parent_node: EV_TREE_ITEM; a_pkg: BMM_PACKAGE_DEFINITION)
		local
			ev_pkg_node: EV_TREE_ITEM
			a_class_def: BMM_CLASS_DEFINITION
		do
			-- do the package
			create ev_pkg_node.make_with_text (a_pkg.name)
 			ev_pkg_node.set_data (a_pkg)
 	 		ev_pkg_node.set_tooltip ("Package " + a_pkg.path)
 	 		ev_pkg_node.set_pixmap (pixmaps ["file_folder_2"])
			ev_parent_node.extend (ev_pkg_node)

			ev_node_map.put (ev_pkg_node, a_pkg.globally_qualified_path)

			-- do the classes
 			from a_pkg.classes.start until a_pkg.classes.off loop
 				a_class_def := a_pkg.classes.item

 				-- only do top classes in each package; if this class has an ancestor in the same package,
 				-- don't do this class, it will get taken care of via the parent
 				from a_class_def.ancestors.start until a_class_def.ancestors.off or a_class_def.ancestors.item_for_iteration.package = a_pkg loop
 					a_class_def.ancestors.forth
 				end
				if a_class_def.ancestors.off then
	 				populate_classes (ev_pkg_node, a_class_def)
	 			end
 				a_pkg.classes.forth
 			end

			-- do the child packages
 			from a_pkg.packages.start until a_pkg.packages.off loop
 				populate_packages (ev_pkg_node, a_pkg.packages.item_for_iteration)
 				a_pkg.packages.forth
 			end
		end

	populate_classes (ev_package_node: EV_TREE_ITEM; a_class_def: BMM_CLASS_DEFINITION)
		local
			ev_class_node: EV_TREE_ITEM
			type_cat: STRING
		do
			create ev_class_node.make_with_text (a_class_def.name)
 			ev_class_node.set_data (a_class_def)
 			type_cat := a_class_def.type_category.twin
 			if a_class_def.is_override then
 				type_cat.append ("_override")
 			end
	 	 	ev_class_node.set_pixmap (pixmaps [type_cat])
 	 		ev_class_node.set_tooltip (a_class_def.description)
			ev_package_node.extend (ev_class_node)

 	 		ev_class_node.pointer_button_press_actions.force_extend (agent class_node_handler (ev_class_node, ?, ?, ?))
 	 		ev_class_node.select_actions.force_extend (agent select_class_with_delay (a_class_def))

			ev_node_map.put (ev_class_node, a_class_def.globally_qualified_path)

			-- do any descendants in same package
			from a_class_def.immediate_descendants.start until a_class_def.immediate_descendants.off loop
				if a_class_def.immediate_descendants.item.package_path.same_string (a_class_def.package_path) then
					populate_classes (ev_class_node, a_class_def.immediate_descendants.item)
				end
				a_class_def.immediate_descendants.forth
			end
		end

	ev_tree_expand (node: EV_TREE_NODE)
			--
		do
	 		if attached {BMM_PACKAGE_DEFINITION} node.data as pkg_def then
	 			if node.is_expandable then
					node.expand
	 			end
	 		end
		end

	class_node_handler (ev_ti: EV_TREE_ITEM; x,y, button: INTEGER)
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
					create an_mi.make_with_text_and_action ("Display", agent display_context_selected_class_in_active_tool (ev_ti))
					an_mi.set_pixmap (pixmaps ["class_tool"])
			    	menu.extend (an_mi)

					create an_mi.make_with_text_and_action ("Display in new tab", agent display_context_selected_class_in_new_tool (ev_ti))
					an_mi.set_pixmap (pixmaps ["class_tool_new"])
					menu.extend (an_mi)

					create an_mi.make_with_text_and_action ("Edit source schema", agent do_edit_schema (a_class_def.source_schema_id))
					an_mi.set_pixmap (pixmaps ["edit"])
					menu.extend (an_mi)

					menu.show
				end
			end
		end

	schema_node_handler (ev_ti: EV_TREE_ITEM; x,y, button: INTEGER)
			-- dynamically initializes the context menu for this tree
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_SCHEMA} ev_ti.data as bmm_sch then
				create menu

				create an_mi.make_with_text_and_action ("Edit source schema", agent do_edit_schema (bmm_sch.schema_id))
				an_mi.set_pixmap (pixmaps ["edit"])
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action ("Expand all", agent schema_expand_all (ev_ti))
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action ("Expand packages", agent schema_expand_packages (ev_ti))
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action ("Collapse all",agent schema_collapse (ev_ti))
		    	menu.extend (an_mi)

				menu.show
		    end
		end

	schema_expand_all (a_schema_node: EV_TREE_NODE)
		do
			a_schema_node.expand
			a_schema_node.recursive_do_all (
				agent (ev_tn: attached EV_TREE_NODE)
					do
						if ev_tn.is_expandable then
							ev_tn.expand
						end
					end
			)
		end

	schema_expand_packages (a_schema_node: EV_TREE_NODE)
		do
			a_schema_node.expand
			a_schema_node.recursive_do_all (
				agent (ev_tn: attached EV_TREE_NODE)
					do
						if ev_tn.is_expandable and
							attached {BMM_PACKAGE_DEFINITION} ev_tn.data and then
							not ev_tn.there_exists (agent (a_tn: EV_TREE_NODE):BOOLEAN do Result := attached {BMM_CLASS_DEFINITION} a_tn.data end)
						then
							ev_tn.expand
						end
					end
			)
		end

	schema_collapse (a_schema_node: EV_TREE_NODE)
		do
			a_schema_node.recursive_do_all (
				agent (an_ev_tree_node: attached EV_TREE_NODE)
					do
						if an_ev_tree_node.is_expandable then
							an_ev_tree_node.collapse
						end
					end
			)
			a_schema_node.collapse
		end

	display_context_selected_class_in_active_tool (ev_ti: EV_TREE_ITEM)
		do
			ev_ti.enable_select
			if attached {BMM_CLASS_DEFINITION} ev_ti.data as a_class_def then
				select_class_agent.call ([a_class_def])
			end
		end

	display_context_selected_class_in_new_tool (ev_ti: EV_TREE_ITEM)
		do
			ev_ti.enable_select
			if attached {BMM_CLASS_DEFINITION} ev_ti.data as a_class_def then
				select_class_in_new_tool_agent.call ([a_class_def])
			end
		end

	do_edit_schema (a_schema_id: STRING)
			-- launch external editor with schema, or info box if none defined
		do
			execution_environment.launch (text_editor_command + " %"" + rm_schemas_access.all_schemas.item (a_schema_id).meta_data.item (metadata_schema_path) + "%"")
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
						select_class_agent.call ([selected_class_def])
					end
			)
		end

	ev_node_map: HASH_TABLE [EV_TREE_ITEM, STRING]
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
