note
	component:   "openEHR Archetype Project"
	description: "GUI tool for a single RM"
	keywords:    "GUI, reference model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_RM_TOOL

inherit
	GUI_TOOL
		redefine
			source
		end

	GUI_DEFINITIONS
		export
			{NONE} all
		end

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
			ev_root_container.set_data (Current)

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

			ev_notebook.set_item_text (description_controls.ev_root_container, create_message_content ("description_tab_text", Void))
			ev_notebook.item_tab (description_controls.ev_root_container).set_pixmap (pixmaps ["description"])

			ev_notebook.set_item_text (statistical_information_control.ev_root_container, create_message_content ("stat_info_tab_text", Void))
			ev_notebook.item_tab (statistical_information_control.ev_root_container).set_pixmap (pixmaps ["statistics"])

			-- set events: select a notebook tab
			ev_notebook.selection_actions.extend (agent on_select_archetype_notebook)
		end

feature -- Access

	source: BMM_SCHEMA

	ev_rm_id: EV_TEXT_FIELD

	ev_root_container: EV_VERTICAL_BOX

	ev_notebook: EV_NOTEBOOK

feature -- Events

	on_select_archetype_notebook
			-- Called by `selection_actions' of `archetype_notebook'.
		do
			if attached {GUI_RM_TARGETTED_TOOL} ev_notebook.selected_item.data as rm_tool and attached source then
				if source /= rm_tool.source and rm_tool.can_populate (source) then
					rm_tool.populate (source)
				end
			end
		end

feature -- Commands

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
			description_controls.populate (source)
			statistical_information_control.populate (source)
		end

	description_controls: GUI_RM_DESCRIPTION_CONTROLS

	statistical_information_control: GUI_RM_INFORMATION_TOOL

	ev_action_bar: EV_HORIZONTAL_BOX

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
--| The Original Code is gui_archetype_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 20011
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
