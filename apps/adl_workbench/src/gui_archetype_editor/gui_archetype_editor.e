note
	component:   "openEHR Archetype Project"
	description: "Archetype editor container"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_ARCHETYPE_EDITOR

inherit
	GUI_ARCHETYPE_TOOL_FRAME
		redefine
			make, do_clear, do_populate, can_populate, can_edit, enable_edit, disable_edit
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature {NONE}-- Initialization

	make
		do
			precursor

			-- create subordinate widgets
			create description_controls.make (agent text_widget_handler.on_select_all)
			create node_map_control.make (agent select_ontology_item_from_code)
			create ontology_controls.make
			create serialisation_control.make

			-- connect widgets
			ev_notebook.extend (description_controls.ev_root_container)
			ev_notebook.extend (node_map_control.ev_root_container)
			ev_notebook.extend (ontology_controls.ev_root_container)
			ev_notebook.extend (serialisation_control.ev_root_container)

			-- set visual characteristics
			ev_notebook.set_item_text (description_controls.ev_root_container, create_message_content ("description_tab_text", Void))
			ev_notebook.item_tab (description_controls.ev_root_container).set_pixmap (get_icon_pixmap ("tool/description"))

			ev_notebook.set_item_text (node_map_control.ev_root_container, create_message_content ("definition_tab_text", Void))
			ev_notebook.item_tab (node_map_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/node_map"))

			ev_notebook.set_item_text (ontology_controls.ev_root_container, create_message_content ("terminology_tab_text", Void))
			ev_notebook.item_tab (ontology_controls.ev_root_container).set_pixmap (get_icon_pixmap ("tool/terminology"))

			ev_notebook.set_item_text (serialisation_control.ev_root_container, create_message_content ("serialised_tab_text", Void))
			ev_notebook.item_tab (serialisation_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/serialised"))

			set_tab_texts
		end

feature -- UI Feedback

	select_ontology_item_from_code (a_code: attached STRING)
			-- if a code is selected in teh archetype definition tree, select the code in the ontology part of the UI
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

feature -- Status Report

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_edit: BOOLEAN
			-- True if this tool had editing capability
		do
			Result := True
		end

feature -- Commands

	enable_edit
		do
			precursor
			description_controls.enable_edit
		end

	disable_edit
		do
			precursor
			description_controls.disable_edit
		end

	update_rm_icons_setting
			-- call this routine if rm_icons setting changed elsewhere in tool
		do
			node_map_control.update_rm_icons_cb
		end

feature {NONE} -- Events

feature {NONE} -- Implementation

	do_clear
			-- Wipe out content from visual controls.
		do
			precursor
			description_controls.clear
			node_map_control.clear
			ontology_controls.clear
			serialisation_control.clear
		end

	do_populate
			-- pre-populate the description and node-map controls, or else populate the validity control and show it
		do
			precursor
			description_controls.populate (source, differential_view, selected_language)
			node_map_control.populate (source, differential_view, selected_language)
		end

	description_controls: GUI_DESCRIPTION_CONTROLS

	node_map_control: GUI_NODE_MAP_CONTROL

	ontology_controls: GUI_ONTOLOGY_CONTROLS

	serialisation_control: GUI_SERIALISATION_CONTROL

	set_differential_tab_texts
			-- set text on tabs for differential form of archetype
		do
			ev_notebook.set_item_text (serialisation_control.ev_root_container, create_message_content ("serialised_diff_tab_text", Void))
		end

	set_flat_tab_texts
			-- set text on tabs for flat form of archetype
		do
			ev_notebook.set_item_text (serialisation_control.ev_root_container, create_message_content ("serialised_flat_tab_text", Void))
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
