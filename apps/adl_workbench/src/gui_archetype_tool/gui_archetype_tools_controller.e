note
	component:   "openEHR Archetype Project"
	description: "Controller for multiple archetype tools within a docking area."
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_ARCHETYPE_TOOLS_CONTROLLER

inherit
	GUI_DOCKING_EDITOR_CONTROLLER
		redefine
			Editor_group_name, Editor_pixmap, tool_type
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY

create
	make

feature -- Definitions

	Editor_group_name: STRING = "archetype tool"

	Editor_pixmap: EV_PIXMAP
		once
			Result := pixmaps ["archetype_2"]
		end

feature -- Initialisation

	make (a_docking_manager: attached SD_DOCKING_MANAGER)
		do
			make_docking (a_docking_manager)
		end

feature -- Commands

	create_new_tool
		local
			new_tool: like tool_type
		do
			create new_tool.make
			add_new_tool (new_tool)
		end

	populate_active_tool (aca: ARCH_CAT_ARCHETYPE)
			-- Populate content from visual controls.
		do
			if not has_tools then
				create_new_tool
			end
			active_tool.gui_tool_populate (aca)
			populate_active_tool_pane (aca.id.as_string, aca.id.as_abbreviated_string, pixmaps [aca.group_name])
		end

feature {NONE} -- Implementation

	tool_type: GUI_ARCHETYPE_TOOL

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
--| The Original Code is gui_arhetype_tools_controller.e
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
