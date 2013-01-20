note
	component:   "openEHR Archetype Project"
	description: "Agents required by GUI_CATALOGUE_TOOL subtools"
	keywords:    "archetype, definition, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWBPR"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class GUI_CATALOGUE_TOOL_AGENTS

feature -- Access

	edit_archetype_source_agent: detachable PROCEDURE [ANY, TUPLE [aca:ARCH_CAT_ARCHETYPE]]

	save_archetype_agent: detachable PROCEDURE [ANY, TUPLE [aca: ARCH_CAT_ARCHETYPE; diff_flag, native_format_flag: BOOLEAN]]

	archetype_explorer_select_in_tree_agent: detachable PROCEDURE [ANY, TUPLE [key: STRING]]

feature -- Modification

	set_edit_archetype_source_agent (agt: like edit_archetype_source_agent)
		do
			edit_archetype_source_agent := agt
		end

	set_save_archetype_agent (agt: like save_archetype_agent)
		do
			save_archetype_agent := agt
		end

	set_archetype_explorer_select_in_tree_agent (agt: like archetype_explorer_select_in_tree_agent)
		do
			archetype_explorer_select_in_tree_agent := agt
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
--| The Original Code is adl_node_map_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
