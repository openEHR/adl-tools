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
			make, do_populate, can_populate,
			can_edit, enable_edit, disable_edit,
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
			ev_notebook.extend (translation_control.ev_root_container)
			ev_notebook.set_item_text (translation_control.ev_root_container, get_text (ec_translation_tab_text))
			-- ev_notebook.item_tab (translation_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/translation"))

			ev_root_container.set_data (Current)
		end

feature -- Status Report

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

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
			populate_primary_source
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
			if attached source as src and attached selected_language as sel_lang then
				description_controls.populate (src, differential_view, sel_lang)
				definition_control.populate (src, differential_view, sel_lang)
			end
		end

	attach_gui_context
		local
			gui_context: detachable ACA_EDITOR_STATE
		do
			if attached source as src then
				if not source.has_gui_context then
					create gui_context.make (src)
					source.set_gui_context (gui_context)
				elseif attached {ACA_EDITOR_STATE} source.gui_context as gc then
					gui_context := gc
				end
				check attached undo_redo_chain end
				check attached gui_context as gc then
					gc.set_editable (undo_redo_chain)
				end
			end
		end

	do_commit
		do
			source.commit
			gui_agents.refresh_archetype_viewers_agent.call ([source.id.as_string])
			gui_agents.console_tool_append_agent.call ([get_msg (ec_arch_editor_commit_notification, <<source.id.as_string, source.source_file_path>>)])
		end

	populate_undo_redo_controls
		do
			precursor
			populate_primary_source
		end

	add_editing_controls
		do
			add_undo_redo_commit_toolbar
		end

	translation_control: GUI_TRANSLATION_CONTROLS

end


