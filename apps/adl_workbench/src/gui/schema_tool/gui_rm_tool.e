note
	component:   "openEHR ADL Tools"
	description: "GUI tool for a single RM"
	keywords:    "GUI, reference model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_RM_TOOL

inherit
	GUI_RM_TARGETTED_TOOL

	STRING_UTILITIES
		export
			{NONE} all
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	notebook_min_height: INTEGER = 350

feature {NONE}-- Initialization

	make
		do
			-- create root widget
			create ev_root_container

			-- create subordinate widgets
			create ev_action_bar
			create ev_rm_id

			create ev_notebook
			create description_controls.make
			create statistical_information_control.make

			-- connect widgets
			ev_root_container.extend (ev_action_bar)
			ev_root_container.extend (ev_notebook)

			ev_action_bar.extend (ev_rm_id)

			ev_notebook.extend (description_controls.ev_root_container)
			ev_notebook.extend (statistical_information_control.ev_root_container)

			-- set visual characteristics
			ev_root_container.disable_item_expand (ev_action_bar)
			ev_action_bar.set_padding (10)
			ev_action_bar.set_border_width (4)
			ev_rm_id.disable_edit

			ev_notebook.set_minimum_width (500)
			ev_notebook.set_minimum_height (notebook_min_height)

			ev_notebook.set_item_text (description_controls.ev_root_container, get_msg (ec_description_tab_text, Void))
			ev_notebook.item_tab (description_controls.ev_root_container).set_pixmap (get_icon_pixmap ("tool/description"))

			ev_notebook.set_item_text (statistical_information_control.ev_root_container, get_msg (ec_stat_info_tab_text, Void))
			ev_notebook.item_tab (statistical_information_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/statistics"))

			-- set events: select a notebook tab
			ev_notebook.selection_actions.extend (agent on_select_archetype_notebook)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_rm_id: EV_TEXT_FIELD

	ev_root_container: EV_VERTICAL_BOX

	ev_notebook: EV_NOTEBOOK

feature -- Events

	on_select_archetype_notebook
			-- Called by `selection_actions' of `archetype_notebook'.
		do
			if attached {GUI_RM_TARGETTED_TOOL} ev_notebook.selected_item.data as rm_tool and attached source as s then
				if s /= rm_tool.source and rm_tool.can_populate (s) then
					rm_tool.populate (s)
				end
			end
		end

feature {NONE} -- Implementation

	do_clear
			-- Wipe out content from visual controls.
		do
			ev_rm_id.remove_text
			description_controls.clear
			statistical_information_control.clear
 		end

	do_populate
		do
			ev_rm_id.set_text (source.schema_id)

			-- pre-populate the description and node-map controls, or else populate the validity control and show it
			check attached source as s then
				description_controls.populate (s)
				statistical_information_control.populate (s)
			end
		end

	description_controls: GUI_RM_DESCRIPTION_CONTROLS

	statistical_information_control: GUI_RM_INFORMATION_TOOL

	ev_action_bar: EV_HORIZONTAL_BOX

end


