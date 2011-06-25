note
	component:   "openEHR Archetype Project"
	description: "Combined control for viewing archetype and template artefacts in 2 trees"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_CATALOGUE_TOOL

inherit
--	SHARED_APP_UI_RESOURCES
--		export
--			{NONE} all
--		end

	SHARED_KNOWLEDGE_REPOSITORY

create
	make

feature {NONE} -- Initialisation

	make (a_select_archetype_agent, an_edit_archetype_agent,
			a_select_archetype_in_new_tool_agent, a_select_class_agent: PROCEDURE [ANY, TUPLE])
		do
			select_archetype_agent := a_select_archetype_agent
			edit_archetype_agent := an_edit_archetype_agent
			select_archetype_in_new_tool_agent := a_select_archetype_in_new_tool_agent
			select_class_agent := a_select_class_agent

			-- create widgets
			create ev_root_container

			-- connect widgets
			ev_root_container.extend (archetype_explorer.ev_root_container)
			ev_root_container.extend (template_explorer.ev_root_container)

			-- visual characteristics
			ev_root_container.enable_item_expand (template_explorer.ev_root_container)
			ev_root_container.disable_item_expand (archetype_explorer.ev_root_container)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_SPLIT_AREA

feature -- Commands

	populate
			-- Populate content from visual controls.
		do
			archetype_explorer.populate
			template_explorer.populate
			go_to_selected_archetype
		end

	update (aca: attached ARCH_CAT_ARCHETYPE)
		do
			archetype_explorer.update_tree_node_for_archetype (aca)
			template_explorer.update_tree_node_for_archetype (aca)
		end

	go_to_selected_archetype
			-- Select and display the node of `archetype_file_tree' corresponding to the selection in `archetype_catalogue'.
			-- No events will be processed because archetype selected in ARCHETYPE_CATALOGUE already matches selected tree node
		do
			if has_current_profile and then current_arch_cat.has_selected_item then
				archetype_explorer.select_item (current_arch_cat.selected_item.ontological_name)
			end
		end

	select_archetype (id: attached STRING)
			-- Select `id' in the archetype catalogue and go to its node in explorer tree
		require
			has_current_arch_dir: attached current_arch_cat
		do
			if not current_arch_cat.has_selected_archetype or else not id.is_equal (current_arch_cat.selected_archetype.ontological_name) then
				if current_arch_cat.archetype_index.has (id) then
					archetype_explorer.select_item (id)
				end
			else
				-- discrete visual feedback for selecting same archetype as already selected?
			end
		end

feature {NONE} -- Implementation

	archetype_explorer: GUI_VIEW_ARCHETYPE_TREE_CONTROL
		once
			create Result.make (select_archetype_agent, edit_archetype_agent, select_archetype_in_new_tool_agent, select_class_agent)
		end

	template_explorer: GUI_VIEW_TEMPLATE_TREE_CONTROL
		once
			create Result.make (select_archetype_agent, agent archetype_explorer.ensure_item_visible)
		end

	select_archetype_agent, edit_archetype_agent, select_archetype_in_new_tool_agent, select_class_agent: PROCEDURE [ANY, TUPLE]

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
--| The Original Code is adl_node_control.e.
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
