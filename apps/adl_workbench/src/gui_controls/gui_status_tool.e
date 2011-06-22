note
	component:   "openEHR Archetype Project"
	description: "Status area control and logic"
	keywords:    "ADL, archetype workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_STATUS_TOOL

inherit
	CONSTANTS
		export
			{NONE} all
		end

	EV_SHARED_APPLICATION
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (select_archetype_from_gui_data: PROCEDURE [ANY, TUPLE [EV_ANY]])
		do
			-- create lower down controls
			create compiler_error_control.make (select_archetype_from_gui_data, agent update_with_compiler_errors)

			-- create widgets
			create ev_notebook
			create ev_status_area

			-- connect them together
			ev_notebook.extend (ev_status_area)
			ev_notebook.extend (compiler_error_control.grid)

			-- set visual characteristics
			ev_notebook.set_item_text (ev_status_area, "Console")
			ev_notebook.set_item_text (compiler_error_control.grid, "Errors")
			ev_status_area.set_minimum_height (200)
			ev_status_area.disable_edit
		end

feature -- Access

	ev_notebook: EV_NOTEBOOK

feature -- Commands

	append_status_text (a_text: attached STRING)
		do
			ev_status_area.append_text (a_text)
			ev_application.process_graphical_events
		end

	clear_status_area
		do
			ev_status_area.remove_text
		end

	add_compiler_error (aca: attached ARCH_CAT_ARCHETYPE)
		do
			compiler_error_control.extend_and_select (aca)
		end

	clear_compiler_errors
		do
			compiler_error_control.clear
		end

	export_repository_report (xml_file_name: attached STRING)
			-- Export the contents of the grid and other statistics to XML in `xml_name'.
		require
			xml_file_name_valid: not xml_file_name.is_empty
		do
			compiler_error_control.export_repository_report (xml_file_name)
		end

feature -- GUI feedback

	update_with_compiler_errors (parse_error_count, validity_error_count, warning_count: NATURAL)
		do
			ev_notebook.set_item_text (compiler_error_control.grid, "Errors (" + parse_error_count.out + "/" + validity_error_count.out + "/" + warning_count.out + ")")
		end

feature {NONE} -- Implementation

	ev_status_area: EV_TEXT

	compiler_error_control: GUI_COMPILER_ERROR_CONTROL

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
--| The Original Code is adl_path_map.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
