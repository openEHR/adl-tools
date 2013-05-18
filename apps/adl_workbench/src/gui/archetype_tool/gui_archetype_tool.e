note
	component:   "openEHR ADL Tools"
	description: "Archetype notebook"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GUI_ARCHETYPE_TOOL

inherit
	GUI_ARCHETYPE_TOOL_FRAME
		redefine
			make, do_clear, disable_edit
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

feature {NONE}-- Initialization

	make
		do
			precursor

			-- set up shared agents
			tool_agents.set_code_select_action_agent (agent select_ontology_item_from_code)

			-- core tool creation
			make_core_tools

			-- description control
			ev_notebook.extend (description_controls.ev_root_container)
			ev_notebook.set_item_text (description_controls.ev_root_container, get_text (ec_description_tab_text))
			ev_notebook.item_tab (description_controls.ev_root_container).set_pixmap (get_icon_pixmap ("tool/description"))

			-- definition control
			ev_notebook.extend (definition_control.ev_root_container)
			ev_notebook.set_item_text (definition_control.ev_root_container, get_text (ec_definition_tab_text))
			ev_notebook.item_tab (definition_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/node_map"))

			-- ontology control
			ev_notebook.extend (ontology_controls.ev_root_container)
			ev_notebook.set_item_text (ontology_controls.ev_root_container, get_text (ec_terminology_tab_text))
			ev_notebook.item_tab (ontology_controls.ev_root_container).set_pixmap (get_icon_pixmap ("tool/terminology"))

			-- annotation control
			ev_notebook.extend (annotations_control.ev_root_container)
			ev_notebook.set_item_text (annotations_control.ev_root_container, get_text (ec_annotations_tab_text))
			ev_notebook.item_tab (annotations_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/annotations"))
		end

feature -- UI Feedback

	select_ontology_item_from_code (a_code: attached STRING)
			-- select `a_code' in the ontology tab of this tool
		do
			if not ontology_controls.is_populated then
				ontology_controls.populate (source, differential_view, selected_language)
			end
			ev_notebook.select_item (ontology_controls.ev_root_container)
			if is_term_code (a_code) then
				ontology_controls.select_term (a_code)
			elseif is_constraint_code (a_code) then
				ontology_controls.select_constraint (a_code)
			end
		end

feature -- Commands

	update_rm_icons_setting
			-- call this routine if rm_icons setting changed elsewhere in tool
		do
			if definition_control.can_repopulate then
				definition_control.repopulate
			end
		end

	disable_edit
		do
			description_controls.disable_edit
		end

feature {NONE} -- Implementation

	make_core_tools
		deferred
		end

	do_clear
			-- Wipe out content from visual controls.
		do
			precursor
			description_controls.clear
			definition_control.clear
			ontology_controls.clear
			annotations_control.clear
		end

	description_controls: GUI_DESCRIPTION_CONTROLS

	definition_control: GUI_DEFINITION_CONTROL

	ontology_controls: GUI_ONTOLOGY_CONTROLS

	annotations_control: GUI_ANNOTATIONS_CONTROL

end


