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

			create ev_adl_14_editor.make (agent adl_14_source_text)
			ev_root_container.extend (ev_adl_14_editor.ev_root_container)
			ev_root_container.set_item_text (ev_adl_14_editor.ev_root_container, get_text (ec_adl_14_source_tab_text))
			gui_controls.extend (ev_adl_14_editor)

			create ev_adl_14_converted_editor.make (agent adl_14_converted_text)
			ev_root_container.extend (ev_adl_14_converted_editor.ev_root_container)
			ev_root_container.set_item_text (ev_adl_14_converted_editor.ev_root_container, get_text (ec_adl_14_converted_tab_text))
			gui_controls.extend (ev_adl_14_converted_editor)

			create ev_adl_15_editor.make (agent adl_15_source_text)
			ev_root_container.extend (ev_adl_15_editor.ev_root_container)
			ev_root_container.set_item_text (ev_adl_15_editor.ev_root_container, get_text (ec_adl_15_source_tab_text))
			gui_controls.extend (ev_adl_15_editor)

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
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

	disable_edit
			-- disable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.disable_editable end)
		end

feature {NONE} -- Implementation

	update_line_numbers (flag: BOOLEAN)
		do
			set_show_line_numbers (flag)
			try_repopulate
		end

	gui_controls: ARRAYED_LIST [EVX_CONTROL_SHELL]

	ev_adl_14_editor: EVX_TEXT_EDITOR_CONTROL

	adl_14_source_text: detachable STRING
		do
			if source.has_legacy_flat_file and then attached source.legacy_flat_text as ft then
				Result := ft
			end
		end

	ev_adl_14_converted_editor: EVX_TEXT_EDITOR_CONTROL

	adl_14_converted_text: detachable STRING
		do
			if source.has_invalid_differential_file and then attached source.invalid_differential_text as inv_diff_text then
				Result := inv_diff_text
			end
		end

	ev_adl_15_editor: EVX_TEXT_EDITOR_CONTROL

	adl_15_source_text: detachable STRING
		do
			if source.has_differential_file then
				 Result := source.differential_text
			end
		end

	do_clear
		do
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.clear end)
		end

	do_populate
		do
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.populate end)
			across ev_root_container as ev_nb_tabs loop
				if attached {EVX_TEXT_EDITOR_CONTROL} ev_nb_tabs.item.data as text_ed then
					if attached text_ed.source_text.item ([]) then
						ev_root_container.item_tab (ev_nb_tabs.item).set_pixmap (get_icon_pixmap ("tool/test_passed"))
					else
						ev_root_container.item_tab (ev_nb_tabs.item).remove_pixmap
					end
				end
			end
		end

end



