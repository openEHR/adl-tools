note
	component:   "openEHR ADL Tools"
	description: "Archetype source text control"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_SOURCE_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			enable_edit, disable_edit
		end

create
	make

feature {NONE}-- Initialization

	make
		do
			-- create root Notebook
			create ev_root_container
			create gui_controls.make (0)

			create evx_adl_14_source_editor.make_editable (agent adl_14_source_text, agent save_adl_14_source_editor_text)
			ev_root_container.extend (evx_adl_14_source_editor.ev_root_container)
			ev_root_container.set_item_text (evx_adl_14_source_editor.ev_root_container, get_text (ec_adl_14_source_tab_text))
			gui_controls.extend (evx_adl_14_source_editor)

			create evx_adl_14_converted_editor.make (agent adl_14_converted_text)
			ev_root_container.extend (evx_adl_14_converted_editor.ev_root_container)
			ev_root_container.set_item_text (evx_adl_14_converted_editor.ev_root_container, get_text (ec_adl_14_converted_tab_text))
			gui_controls.extend (evx_adl_14_converted_editor)

			create evx_adl_15_source_editor.make_editable (agent adl_15_source_text, agent save_adl_15_source_editor_text)
			ev_root_container.extend (evx_adl_15_source_editor.ev_root_container)
			ev_root_container.set_item_text (evx_adl_15_source_editor.ev_root_container, get_text (ec_adl_15_source_tab_text))
			gui_controls.extend (evx_adl_15_source_editor)

			create evx_adl_15_converted_editor.make (agent adl_15_converted_text)
			ev_root_container.extend (evx_adl_15_converted_editor.ev_root_container)
			ev_root_container.set_item_text (evx_adl_15_converted_editor.ev_root_container, get_text (ec_adl_15_converted_tab_text))
			evx_adl_15_converted_editor.add_button (Void, Void, get_text (ec_save_15_converted_button_text), get_text (ec_save_15_converted_button_tooltip), agent save_15_converted_source, Void)
			gui_controls.extend (evx_adl_15_converted_editor)

			create evx_adl_151_serialised_editor.make (agent adl_151_serialised_text)
			ev_root_container.extend (evx_adl_151_serialised_editor.ev_root_container)
			ev_root_container.set_item_text (evx_adl_151_serialised_editor.ev_root_container, get_text (ec_adl_151_serialised_tab_text))
			evx_adl_151_serialised_editor.add_button (Void, Void, get_text (ec_save_151_serialised_button_text), get_text (ec_save_151_serialised_button_tooltip), agent save_151_serialised_source, Void)
			gui_controls.extend (evx_adl_151_serialised_editor)

			differential_view := True

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

feature -- Commands

	enable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.enable_editable end)
		end

	disable_edit
			-- disable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.disable_editable end)
		end

feature {NONE} -- Implementation

	update_line_numbers (flag: BOOLEAN)
		do
			set_show_line_numbers (flag)
			try_repopulate
		end

	gui_controls: ARRAYED_LIST [EVX_CONTROL_SHELL]

	evx_adl_14_source_editor: EVX_TEXT_EDITOR_CONTROL

	adl_14_source_text: detachable STRING
		do
			if source.has_legacy_flat_file and then attached source.legacy_flat_text_original as ft then
				Result := ft
			end
		end

	evx_adl_14_converted_editor: EVX_TEXT_EDITOR_CONTROL

	adl_14_converted_text: detachable STRING
		do
			if source.has_legacy_flat_file and then attached source.legacy_flat_text_converted as legacy_conv_text then
				Result := legacy_conv_text
			end
		end

	evx_adl_15_source_editor: EVX_TEXT_EDITOR_CONTROL

	adl_15_source_text: detachable STRING
		do
			if source.has_differential_file then
				Result := source.differential_text_original
			end
		end

	evx_adl_15_converted_editor: EVX_TEXT_EDITOR_CONTROL

	adl_15_converted_text: detachable STRING
		do
			if source.is_text_converted then
				if attached source.differential_archetype then
					Result := source.differential_serialised
				elseif source.has_differential_file then
					Result := source.differential_text
				end
			end
		end

	evx_adl_151_serialised_editor: EVX_TEXT_EDITOR_CONTROL

	adl_151_serialised_text: detachable STRING
		do
			if source.is_valid_differential and then attached source.serialised_differential_archetype as sda then
				 Result := sda
			end
		end

	do_clear
		do
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.clear end)
		end

	do_populate
		local
			sel_tab: detachable EV_NOTEBOOK_TAB
		do
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.populate end)

			-- set pixmaps
			-- ADL 1.4 source
			if not evx_adl_14_source_editor.is_empty then
				sel_tab := ev_root_container.item_tab (evx_adl_14_source_editor.ev_root_container)
				sel_tab.set_pixmap (get_icon_pixmap ("tool/edit_active"))
			else
				ev_root_container.item_tab (evx_adl_14_source_editor.ev_root_container).remove_pixmap
			end

			-- ADL 1.4 converted
			if not evx_adl_14_converted_editor.is_empty then
				sel_tab := ev_root_container.item_tab (evx_adl_14_converted_editor.ev_root_container)
				sel_tab.set_pixmap (get_icon_pixmap ("tool/serialised"))
			else
				ev_root_container.item_tab (evx_adl_14_converted_editor.ev_root_container).remove_pixmap
			end

			-- ADL 1.5 source
			if not evx_adl_15_source_editor.is_empty then
				sel_tab := ev_root_container.item_tab (evx_adl_15_source_editor.ev_root_container)
				sel_tab.set_pixmap (get_icon_pixmap ("tool/edit_active"))
				if not source.differential_text_adl_version.is_empty then
					ev_root_container.set_item_text (evx_adl_15_source_editor.ev_root_container, get_msg (ec_adl_ver_source_tab_text, <<source.differential_text_adl_version>>))
				else
					ev_root_container.set_item_text (evx_adl_15_source_editor.ev_root_container, get_msg (ec_adl_ver_source_tab_text, <<latest_adl_version>>))
				end
			else
				ev_root_container.item_tab (evx_adl_15_source_editor.ev_root_container).remove_pixmap
			end

			-- ADL 1.5 converted
			if not evx_adl_15_converted_editor.is_empty then
				sel_tab := ev_root_container.item_tab (evx_adl_15_converted_editor.ev_root_container)
				sel_tab.set_pixmap (get_icon_pixmap ("tool/serialised"))
			else
				ev_root_container.item_tab (evx_adl_15_converted_editor.ev_root_container).remove_pixmap
			end

			-- ADL 1.5.1 serialised
			if not evx_adl_151_serialised_editor.is_empty then
				sel_tab := ev_root_container.item_tab (evx_adl_151_serialised_editor.ev_root_container)
				sel_tab.set_pixmap (get_icon_pixmap ("tool/test_passed"))
			else
				ev_root_container.item_tab (evx_adl_151_serialised_editor.ev_root_container).remove_pixmap
			end

			-- select the most recent active tab
			if attached sel_tab as att_sel_tab then
				att_sel_tab.enable_select
			end
		end

	save_151_serialised_source
		do
			if attached source as att_source then
				att_source.save_differential_validated
				evx_adl_15_source_editor.populate
				gui_agents.console_tool_append_agent.call (get_msg (ec_saved_serialised_msg, <<att_source.differential_path>>))
				gui_agents.select_archetype_agent.call ([att_source])
			end
		end

	save_15_converted_source
		do
			if attached source as att_source then
				att_source.save_differential_text
				evx_adl_15_source_editor.populate
				gui_agents.console_tool_append_agent.call (get_msg (ec_saved_converted_msg, <<att_source.differential_path>>))
				gui_agents.select_archetype_agent.call ([att_source])
			end
		end

	save_adl_15_source_editor_text (a_text: STRING)
			-- save what is in a 1.5/1.5.1 editor pane to the differential file
		local
			fp: PLAIN_TEXT_FILE
		do
			if attached source as att_source then
				create fp.make_open_write (att_source.differential_path)
				fp.put_string (a_text)
				fp.close
				att_source.signal_source_edited
				gui_agents.select_archetype_agent.call ([att_source])
			end
		end

	save_adl_14_source_editor_text (a_text: STRING)
			-- save what is in a 1.5/1.5.1 editor pane to the differential file
		local
			fp: PLAIN_TEXT_FILE
		do
			if attached source as att_source and then attached att_source.legacy_flat_path as lfp then
				create fp.make_open_write (lfp)
				fp.put_string (a_text)
				fp.close
				att_source.signal_source_edited
				gui_agents.select_archetype_agent.call ([att_source])
			end
		end

end



