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


class GUI_CATALOGUE_TOOL

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	GUI_SEARCHABLE_TOOL

	GUI_CATALOGUE_TARGETTED_TOOL

create
	make

feature {NONE} -- Initialisation

	make (a_select_archetype_agent, an_edit_archetype_agent, a_select_archetype_in_new_tool_agent: like select_archetype_agent;
			a_select_class_agent, a_select_class_in_new_tool_agent: like select_class_agent;
			a_select_class_in_rm_schema_tool_agent: like select_class_in_rm_schema_tool_agent)
		do
			select_archetype_agent := a_select_archetype_agent
			edit_archetype_agent := an_edit_archetype_agent
			select_archetype_in_new_tool_agent := a_select_archetype_in_new_tool_agent
			select_class_agent := a_select_class_agent
			select_class_in_new_tool_agent := a_select_class_in_new_tool_agent
			select_class_in_rm_schema_tool_agent := a_select_class_in_rm_schema_tool_agent

			create archetype_explorer.make (select_archetype_agent, edit_archetype_agent, select_archetype_in_new_tool_agent,
				select_class_agent, select_class_in_new_tool_agent, select_class_in_rm_schema_tool_agent)
			create template_explorer.make (select_archetype_agent, edit_archetype_agent, select_archetype_in_new_tool_agent, agent archetype_explorer.ensure_item_visible)
			create metrics_viewer.make
			create stats_viewer.make (a_select_class_agent, a_select_class_in_new_tool_agent)

			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)

			-- connect widgets
			ev_root_container.extend (archetype_explorer.ev_root_container)
			ev_root_container.extend (template_explorer.ev_root_container)
			ev_root_container.extend (metrics_viewer.ev_root_container)
			ev_root_container.extend (stats_viewer.ev_root_container)

			-- visual characteristics
			ev_root_container.set_item_text (archetype_explorer.ev_root_container, create_message_content ("catalogue_archetype_tab_text", Void))
			ev_root_container.item_tab (archetype_explorer.ev_root_container).set_pixmap (pixmaps ["archetype_catalog"])

			ev_root_container.set_item_text (template_explorer.ev_root_container, create_message_content ("catalogue_template_tab_text", Void))
			ev_root_container.item_tab (template_explorer.ev_root_container).set_pixmap (pixmaps ["template_catalog"])

			ev_root_container.set_item_text (metrics_viewer.ev_root_container, create_message_content ("catalogue_metrics_tab_text", Void))
			ev_root_container.set_item_text (stats_viewer.ev_root_container, create_message_content ("catalogue_stats_tab_text", Void))
			set_stats_metric_tab_appearance

			-- set events: select a notebook tab
			ev_root_container.selection_actions.extend (agent on_select_notebook)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

	matching_ids (a_key: attached STRING): attached ARRAYED_SET [STRING]
		do
			if attached source then
				Result := source.matching_ids (a_key, Void, Void)
			else
				create Result.make(0)
			end
		end

feature -- Status Report

	item_selectable: BOOLEAN
		do
			Result := is_populated
		end

	valid_item_id (a_key: attached STRING): BOOLEAN
			-- key is a valid identifier of an item managed in this tool
		do
			Result := (create {ARCHETYPE_ID}.default_create).valid_id (a_key)
		end

feature -- Commands

	update (aca: attached ARCH_CAT_ARCHETYPE)
		do
			archetype_explorer.update_tree_node_for_archetype (aca)
			template_explorer.update_tree_node_for_archetype (aca)
		end

	go_to_selected_item
			-- Select and display the node of `archetype_file_tree' corresponding to the selection in `archetype_catalogue'.
			-- No events will be processed because archetype selected in ARCHETYPE_CATALOGUE already matches selected tree node
		do
			if source.has_selected_item then
				archetype_explorer.select_item (source.selected_item.qualified_name)
			end
		end

	select_item (id: attached STRING)
			-- Select `id' in the archetype catalogue and go to its node in explorer tree
		do
			if not source.has_selected_archetype or else not id.is_equal (source.selected_archetype.qualified_name) then
				if source.archetype_index.has (id) then
					archetype_explorer.select_item (id)
				end
			else
				-- discrete visual feedback for selecting same archetype as already selected?
			end
		end

	update_rm_icons_setting
		do
			archetype_explorer.update_rm_icons_setting
			template_explorer.update_rm_icons_setting
		end

	show
		do
			docking_pane.show
		end

feature -- Modification

	set_docking_pane (a_docking_pane: attached SD_CONTENT)
		do
			docking_pane := a_docking_pane
		end

feature -- Events

	on_select_notebook
		do
			if ev_root_container.selected_item.data = metrics_viewer then
				if source.can_build_statistics then
					source.build_detailed_statistics
					if not attached metrics_viewer.last_populate_timestamp or else metrics_viewer.last_populate_timestamp < source.last_stats_build_timestamp then
						metrics_viewer.populate (source)
					end
				end
			elseif ev_root_container.selected_item.data = stats_viewer then
				if source.can_build_statistics then
					source.build_detailed_statistics
					if not attached stats_viewer.last_populate_timestamp or else stats_viewer.last_populate_timestamp < source.last_stats_build_timestamp then
						from source.stats.start until source.stats.off loop
							stats_viewer.populate (source.stats.item_for_iteration, True)
							source.stats.forth
						end
					end
				end
			end
		end

	on_full_compile
			-- actions to execute when a complete compile has been done
		do
			set_stats_metric_tab_appearance
		end

feature {NONE} -- Implementation

	do_clear
		do
			metrics_viewer.clear
			stats_viewer.clear
			set_stats_metric_tab_appearance
			ev_root_container.select_item (archetype_explorer.ev_root_container)
		end

	do_populate
			-- Populate content from visual controls.
		do
			docking_pane.set_short_title (create_message_content ("catalogue_tool_title", Void))
			docking_pane.set_long_title (create_message_content ("catalogue_tool_title", Void) + " " + repository_profiles.current_profile_name)
			archetype_explorer.populate (source)
			template_explorer.populate (source)
			on_select_notebook
			go_to_selected_item
		end

	docking_pane: SD_CONTENT

	archetype_explorer: GUI_VIEW_ARCHETYPE_TREE_CONTROL

	template_explorer: GUI_VIEW_TEMPLATE_TREE_CONTROL

	metrics_viewer: GUI_STATISTICS_TOOL

	stats_viewer: GUI_ARCHETYPE_STATISTICAL_REPORT

	select_archetype_agent, edit_archetype_agent, select_archetype_in_new_tool_agent: PROCEDURE [ANY, TUPLE]

	select_class_agent, select_class_in_new_tool_agent: PROCEDURE [ANY, TUPLE [BMM_CLASS_DEFINITION]]

	select_class_in_rm_schema_tool_agent: PROCEDURE [ANY, TUPLE [STRING]]

	set_stats_metric_tab_appearance
			-- set visual appearance of stats & metric tab according to whether there are errors or not
		do
			if attached source and then source.can_build_statistics then
				ev_root_container.item_tab (metrics_viewer.ev_root_container).set_pixmap (pixmaps ["metrics"])
				ev_root_container.item_tab (stats_viewer.ev_root_container).set_pixmap (pixmaps ["statistics"])
			else
				ev_root_container.item_tab (metrics_viewer.ev_root_container).set_pixmap (pixmaps ["metrics_grey"])
				ev_root_container.item_tab (stats_viewer.ev_root_container).set_pixmap (pixmaps ["statistics_grey"])
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
--| The Original Code is adl_node_control.e.
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
