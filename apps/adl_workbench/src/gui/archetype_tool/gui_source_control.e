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

	OPERATOR_TYPES
		export
			{NONE} all
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
			evx_adl_151_serialised_editor.set_text_filter (get_text (ec_symbolic_text), get_text (ec_symbolic_text_tooltip), agent symbolic_text)
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
			if source.file_mgr.has_legacy_flat_file and then attached source.file_mgr.legacy_flat_text_original as ft then
				Result := ft
			end
		end

	evx_adl_14_converted_editor: EVX_TEXT_EDITOR_CONTROL

	adl_14_converted_text: detachable STRING
		do
			if source.file_mgr.has_legacy_flat_file and then attached source.file_mgr.legacy_flat_text as legacy_conv_text then
				Result := legacy_conv_text
			end
		end

	evx_adl_15_source_editor: EVX_TEXT_EDITOR_CONTROL

	adl_15_source_text: detachable STRING
		do
			-- following check has to also look at adl_version since that reflects most recently read file
			-- if the version is 1.4, then the 1.4 file was read for the most recent parse, even if the
			-- 1.5 file was subsequently created as a result, but before this routine gets called.
			if source.has_source_file and not source.file_mgr.adl_version.is_equal (Adl_14_version) then
				Result := source.file_mgr.source_text_original
			end
		end

	evx_adl_15_converted_editor: EVX_TEXT_EDITOR_CONTROL

	adl_15_converted_text: detachable STRING
		do
			if source.file_mgr.is_text_converted then
				if attached source.differential_archetype then
					Result := source.differential_serialised
				elseif source.has_source_file then
					Result := source.source_text
				end
			end
		end

	evx_adl_151_serialised_editor: EVX_TEXT_EDITOR_CONTROL

	adl_151_serialised_text: detachable STRING
		do
			if source.is_valid_differential and then attached source.differential_serialised as sda then
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
				if not source.file_mgr.adl_version.is_empty then
					ev_root_container.set_item_text (evx_adl_15_source_editor.ev_root_container, get_msg (ec_adl_ver_source_tab_text, <<source.file_mgr.adl_version>>))
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
			-- save the final serialised result as the new source. Useful to correct any formatting, occasionally causes
			-- minor syntax upgrading
		do
			if attached source as att_source then
				att_source.save_differential_text
				evx_adl_15_source_editor.populate
				gui_agents.console_tool_append_agent.call (get_msg (ec_saved_serialised_msg, <<att_source.source_file_path>>))
				gui_agents.select_archetype_agent.call ([att_source])
				gui_agents.refresh_archetype_editors_agent.call ([att_source.id.as_string])
			end
		end

	save_15_converted_source
			-- save the intermediate converted 1.5 source which contains ADL 1.5.1 modifications on ADL 1.5 old style source
		do
			if attached source as att_source then
				att_source.save_differential_text
				evx_adl_15_source_editor.populate
				gui_agents.console_tool_append_agent.call (get_msg (ec_saved_converted_msg, <<att_source.source_file_path>>))
				gui_agents.select_archetype_agent.call ([att_source])
				gui_agents.refresh_archetype_editors_agent.call ([att_source.id.as_string])
			end
		end

	save_adl_15_source_editor_text (a_text: STRING)
			-- save what is in a 1.5/1.5.1 editor pane to the differential file
			-- and then select the archetype in the catalogue to force a recompile
		do
			if attached source as att_source then
				att_source.save_text_to_differential_file (a_text)
				att_source.signal_source_edited
				gui_agents.console_tool_append_agent.call (get_msg (ec_saved_source_msg, <<att_source.source_file_path>>))
				gui_agents.select_archetype_agent.call ([att_source])
				gui_agents.refresh_archetype_editors_agent.call ([att_source.id.as_string])
			end
		end

	save_adl_14_source_editor_text (a_text: STRING)
			-- save what is in a 1.4 editor pane to the 1.4 file
			-- and then select the archetype in the catalogue to force a recompile
		do
			if attached source as att_source then
				att_source.save_text_to_legacy_file (a_text)
				gui_agents.console_tool_append_agent.call (get_msg (ec_saved_14_source_msg, <<att_source.source_file_path>>))
				gui_agents.select_archetype_agent.call ([att_source])
				gui_agents.refresh_archetype_editors_agent.call ([att_source.id.as_string])
			end
		end

	symbolic_text (raw_text: STRING): STRING
			-- convert text rendering of symbols e.g. 'matches' to UTF-8 characters
		local
			loc_text, loc_matches, sym_len, text_len, csr: INTEGER
			sym, utf8_sym: STRING
			test_chr: CHARACTER
			paren_matched, no_match: BOOLEAN
		do
			create Result.make (raw_text.count)

			-- perform 'matches' substitution
			loc_text := 1
			text_len := raw_text.count
			sym := operator_symbol (op_matches)
			sym_len := sym.count
			utf8_sym := operator_glyph (op_matches)
			from loc_matches := 1 until loc_matches = 0 or else loc_matches > text_len loop
				loc_matches := raw_text.substring_index (sym, loc_matches)
				if loc_matches /= 0 then
					-- now read ahead to see if this instance of 'matches' is a keyword; check by
					-- testing for whitespace followed by '{'
					paren_matched := False
					no_match := False
					from csr := loc_matches + sym_len until paren_matched or no_match loop
						test_chr := raw_text.item (csr)
						if test_chr = ' ' or test_chr = '%T' or test_chr = '%N' or test_chr = '%R' then
							csr := csr + 1
						elseif test_chr = '{' then
							paren_matched := True
						else
							no_match := True
						end
					end
					if paren_matched then
						Result.append (raw_text.substring (loc_text, loc_matches - 1))
						Result.append (utf8_sym)
						loc_text := loc_matches + sym_len
					else
						Result.append (raw_text.substring (loc_text, csr))
						loc_text := csr + 1
					end
					loc_matches := loc_text
				end
			end

			-- remaining part of text after last 'matches'
			if loc_text < text_len then
				Result.append (raw_text.substring (loc_text, text_len))
			end
		end

end



