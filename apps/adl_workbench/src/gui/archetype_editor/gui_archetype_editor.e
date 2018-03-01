note
	component:   "openEHR ADL Tools"
	description: "Archetype editor container"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_ARCHETYPE_EDITOR

inherit
	GUI_ARCHETYPE_TOOL
		redefine
			make, do_populate,
			can_edit, enable_edit, disable_edit, attach_gui_context,
			add_editing_controls, on_set_primary_source
		end

	GUI_EDITING_ENABLED
		export
			{NONE} all
		redefine
			populate_undo_redo_controls
		end

create
	make

feature {NONE}-- Initialization

	make
		do
			precursor

			-- translation control
			-- ev_notebook.extend (translation_control.ev_root_container)
			-- ev_notebook.set_item_text (translation_control.ev_root_container, get_text (ec_translation_tab_text))
			-- ev_notebook.item_tab (translation_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/translation"))

			ev_root_container.set_data (Current)

			link_sub_tools
		end

feature -- Status Report

	can_edit: BOOLEAN
			-- True if this tool has editing capability
		do
			Result := True
		end

feature -- Commands

	enable_edit
		do
			precursor
			description_controls.enable_edit
			definition_control.enable_edit
			terminology_controls.enable_edit
			annotations_control.enable_edit
			translation_control.enable_edit
		end

	disable_edit
		do
			precursor
			description_controls.disable_edit
			definition_control.disable_edit
			terminology_controls.disable_edit
			annotations_control.disable_edit
			translation_control.disable_edit
		end

feature -- Events

	on_set_primary_source
		do
--			if source_archetype.is_generated then
--				edit_archetype.set_is_generated
--			else
--				edit_archetype.clear_is_generated
--			end
			populate_primary_source_indicator
		end

feature {NONE} -- Implementation

	make_core_tools
		do
			check attached undo_redo_chain end
			create description_controls.make_editable (undo_redo_chain)
			create definition_control.make_editable (undo_redo_chain)
			create terminology_controls.make_editable (undo_redo_chain)
			create annotations_control.make
			create translation_control.make
		end

	do_populate
			-- pre-populate the description and node-map controls
		do
			precursor
			if attached source as src and then attached selected_language as sel_lang and then description_controls.can_populate (src, [differential_view, sel_lang]) then
				description_controls.populate (src, differential_view, sel_lang)
				definition_control.populate (src, differential_view, sel_lang)
			end
		end

	attach_gui_context
		do
			if attached source as src and then src.is_valid then
				check attached undo_redo_chain end
				src.editor_state.set_editable (undo_redo_chain)
			end
		end

	do_commit
		do
			safe_source.commit
			gui_agents.call_refresh_archetype_viewers_agent (source.id.physical_id)
			if attached auth_source as att_source then
				gui_agents.call_console_tool_append_agent (get_msg_line (ec_arch_editor_commit_notification,
					<<att_source.id.physical_id, att_source.source_file_path>>))
			end
		end

	populate_undo_redo_controls
		do
			precursor
			populate_primary_source_indicator
		end

	add_editing_controls
		do
			add_undo_redo_commit_toolbar
		end

	translation_control: GUI_TRANSLATION_CONTROLS

end


