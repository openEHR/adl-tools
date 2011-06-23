note
	component:   "openEHR Archetype Project"
	description: "Controller for CLASS_MAP_TOOL in docking structure."
	keywords:    "ADL, archetype, class map, docking"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_CLASS_MAP_TOOL_CONTROLLER

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all;
			{ANY} has_current_profile
		end

create
	make

feature -- Initialisation

	make (a_docking_manager: attached SD_DOCKING_MANAGER)
		do
			docking_manager := a_docking_manager
		end

feature -- Access

	tool: GUI_CLASS_MAP_CONTROL

	docking_pane: SD_CONTENT

feature -- Status Report

feature -- Commands

	populate
			-- Populate content from visual controls.
		require
			has_current_profile
		do
			if not attached docking_pane then
				create_new_tool
			end
			docking_pane.set_long_title (current_arch_cat.selected_class.display_name)
			docking_pane.set_short_title (current_arch_cat.selected_class.display_name.substring (1, current_arch_cat.selected_class.display_name.count.min (10)))
			docking_pane.set_pixmap (pixmaps [current_arch_cat.selected_class.group_name])
			tool.populate (current_arch_cat.selected_class)
			docking_pane.set_focus
		end

	clear
			-- Populate content from visual controls.
		do
			if attached tool then
				docking_pane.set_long_title ("")
				docking_pane.set_short_title ("")
				docking_pane.set_pixmap (pixmaps ["class_concrete"])
				tool.clear
			end
		end

	remove
		do
			docking_pane.close
			docking_pane.destroy
			docking_pane := Void
		end

feature {NONE} -- Implementation

	docking_manager: attached SD_DOCKING_MANAGER

	docking_manager_last_editor: SD_CONTENT
			-- obtain last (i.e. rightmost) editor from docking manager
			-- FIXME: should be managed inside SD_DOCKING_MANAGER
		do
			from docking_manager.contents.start until docking_manager.contents.off loop
				if docking_manager.contents.item.type = {SD_ENUMERATION}.editor then
					Result := docking_manager.contents.item
				end
				docking_manager.contents.forth
			end
		end

	create_new_tool
		local
			last_ed: SD_CONTENT
		do
			last_ed := docking_manager_last_editor
			create tool.make
			create docking_pane.make_with_widget_title_pixmap (tool.ev_root_container, pixmaps ["class_concrete"], "Class map")
			docking_manager.contents.extend (docking_pane)
			docking_pane.close_request_actions.extend (agent remove)
			docking_pane.set_type ({SD_ENUMERATION}.editor)
			if attached last_ed then
				docking_pane.set_tab_with (last_ed, False)
			else
				docking_pane.set_top ({SD_ENUMERATION}.top)
			end
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
--| The Original Code is gui_class_map_tool_controller.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
