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
	SHARED_SOURCE_REPOSITORIES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_archetype_serialiser_format, archetype_serialiser_formats
		end

	GUI_SEARCHABLE_TOOL

	GUI_CATALOGUE_TARGETTED_TOOL
		redefine
			go_to_selected_item
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create archetype_explorer.make (agent edit_archetype)
			create template_explorer.make (agent edit_archetype, agent archetype_explorer.ensure_item_visible)
			create metrics_viewer.make
			create stats_viewer.make

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

			ev_root_container.set_item_text (metrics_viewer.ev_root_container, create_message_content ("catalogue_metrics_tab_text", Void))
			ev_root_container.set_item_text (stats_viewer.ev_root_container, create_message_content ("catalogue_stats_tab_text", Void))
			set_stats_metric_tab_appearance

			-- set events: select a notebook tab
			ev_root_container.selection_actions.extend (agent on_select_notebook)

			-- set up tool / sub-tool structures
			add_sub_tool (archetype_explorer)
			add_sub_tool (template_explorer)
			add_sub_tool (metrics_viewer)
			enable_selection_history
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

	update_tree_node (aca: attached ARCH_CAT_ARCHETYPE)
		do
			archetype_explorer.update_tree_node_for_archetype (aca)
			template_explorer.update_tree_node_for_archetype (aca)
		end

	go_to_selected_item
			-- Select and display the node of `archetype_file_tree' corresponding to the selection in `archetype_catalogue'.
			-- No events will be processed because archetype selected in ARCHETYPE_CATALOGUE already matches selected tree node
		do
			if selection_history.has_selected_item then
				archetype_explorer.select_item_in_tree (selection_history.selected_item.global_artefact_identifier)
				docking_pane.set_focus
			end
		end

	select_item_by_id (a_globally_qualified_id: attached STRING)
			-- Select `a_globally_qualified_id' in the GUI catalogue tree, unless it is the same as the current selection
		do
			if not selection_history.has_selected_archetype or else not a_globally_qualified_id.is_equal (selection_history.selected_archetype.qualified_name) then
				if source.has_item_with_id (a_globally_qualified_id) then
					archetype_explorer.select_item_in_tree (a_globally_qualified_id)
				end
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

	open_archetype
			-- open currently selected archetype
		local
			dialog: EV_FILE_OPEN_DIALOG
			fname: STRING
		do
			create dialog
			dialog.set_start_directory (current_work_directory)
			dialog.filters.extend (["*" + File_ext_archetype_source, "ADL 1.5 source files"])
			dialog.filters.extend (["*" + File_ext_archetype_adl14, "ADL 1.4 files"])
			dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
			fname := dialog.file_name.as_string_8

			if not fname.is_empty then
				if not source_repositories.adhoc_source_repository.has_path (fname) then
					set_current_work_directory (file_system.dirname (fname))
					if not file_system.file_exists (fname) then
						(create {EV_INFORMATION_DIALOG}.make_with_text ("%"" + fname + "%" not found.")).show_modal_to_window (proximate_ev_window (ev_root_container))
					else
						source.add_adhoc_item (fname)
						if not billboard.has_errors then
							selection_history.set_selected_item (source.last_adhoc_item)
							show
							repopulate
						end
						gui_agents.console_tool_append_agent.call ([billboard.content])
					end
				else
					(create {EV_INFORMATION_DIALOG}.make_with_text ("%"" + fname + "%" already added.")).show_modal_to_window (proximate_ev_window (ev_root_container))
				end
			end
		end

	edit_archetype
			-- Launch the external editor with the archetype currently selected in `archetype_directory'.
		local
			question_dialog: EV_QUESTION_DIALOG
			info_dialog: EV_INFORMATION_DIALOG
			path: STRING
		do
			if selection_history.has_selected_archetype then
				path := selection_history.selected_archetype.differential_path
				if selection_history.selected_archetype.has_differential_file and selection_history.selected_archetype.has_legacy_flat_file then
					create question_dialog.make_with_text (create_message_line("edit_which_file_question",
						<<file_system.basename (path), file_system.basename (selection_history.selected_archetype.legacy_flat_path)>>))
					question_dialog.set_title ("Edit " + selection_history.selected_archetype.qualified_name)
					question_dialog.set_buttons (<<"Differential", "Legacy (ADL 1.4 flat)">>)
					question_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
					if question_dialog.selected_button.starts_with ("L") then
						path := selection_history.selected_archetype.legacy_flat_path
					end
				elseif selection_history.selected_archetype.has_legacy_flat_file then
					create info_dialog.make_with_text (create_message_line ("edit_legacy_file_info",
						<<file_system.basename (selection_history.selected_archetype.legacy_flat_path)>>))
					info_dialog.set_title ("Edit " + selection_history.selected_archetype.id.as_string)
					info_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
					path := selection_history.selected_archetype.legacy_flat_path
				end
				execution_environment.launch (editor_app_command + " %"" + path + "%"")
			end
		end

	save_archetype_as
			-- Save to an ADL or HTML file via a GUI file save dialog.
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			error_dialog: EV_INFORMATION_DIALOG
			file: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
			name, format: STRING
		do
			if selection_history.has_validated_selected_archetype then
				name := extension_replaced (selection_history.selected_archetype.full_path, "")

				create save_dialog
				save_dialog.set_title ("Save Archetype")
				save_dialog.set_file_name (name)
				save_dialog.set_start_directory (current_work_directory)

				from archetype_serialiser_formats.start until archetype_serialiser_formats.off loop
					format := archetype_serialiser_formats.item
					save_dialog.filters.extend (["*" + archetype_file_extensions [format], "Save as " + format.as_upper])
					archetype_serialiser_formats.forth
				end

				save_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
				name := save_dialog.file_name.as_string_8

				if not name.is_empty then
					set_current_work_directory (file_system.dirname (name))
					format := archetype_serialiser_formats [save_dialog.selected_filter_index]

					if not file_system.has_extension (name, archetype_file_extensions [format]) then
						name.append (archetype_file_extensions [format])
					end

					ok_to_write := True
					create file.make (name)

					if file.exists then
						create question_dialog.make_with_text (create_message_content ("file_exists_replace_question", <<file_system.basename (name)>>))
						question_dialog.set_title ("Save as " + format.as_upper)
						question_dialog.set_buttons (<<"Yes", "No">>)
						question_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
						ok_to_write := question_dialog.selected_button.same_string ("Yes")
					end

					if ok_to_write then
						selection_history.selected_archetype.save_differential_as (name, format)
						gui_agents.console_tool_append_agent.call ([selection_history.selected_archetype.status])
					end
				end
			else
				create error_dialog.make_with_text (create_message_content ("compile_before_serialising", Void))
				error_dialog.show_modal_to_window (proximate_ev_window (ev_root_container))
			end
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
			if attached source and then source.template_count > 0 then
				ev_root_container.item_tab (template_explorer.ev_root_container).set_pixmap (pixmaps ["template_catalog"])
			else
				ev_root_container.item_tab (template_explorer.ev_root_container).set_pixmap (pixmaps ["template_catalog_grey"])
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
