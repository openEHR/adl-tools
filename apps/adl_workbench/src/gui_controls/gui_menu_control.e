note
	component:   "openEHR Archetype Project"
	description: "[
				 Menu building control for an application.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_MENU_CONTROL

feature -- Definitions

	menu_definition: STRING = "[
		menus = <
			["file"] = <
				["open"] = <
					icon_key = <"tool/open_archetype">
					action_key = <"YY">
				>
				["sep_1"] = <>
				["save_as"] = <
					action_key = <"YY">
				>
				["export_as"] = <
					action_key = <"YY">
				>
				["export_flat_as"] = <
					action_key = <"YY">
				>
				["sep_2"] = <>
				["exit"] = <
					action_key = <"YY">
				>
			>
			["edit"] = <
				["edit"] = <
					action_key = <"YY">
				>
				["select_all"] = <
					action_key = <"YY">
				>
				["sep_1"] = <>
				["clipboard"] = <
					action_key = <"YY">
				>
			>
			["view"] = <
				["differential"] = <
					icon_key = <"tool/diff_class">
					action_key = <"YY">
				>
				["flat"] = <
					icon_key = <"tool/flat_class">
					action_key = <"YY">
				>
				["new_archetype_tab"] = <
					icon_key = <"tool/archetype_tool_new">
					action_key = <"YY">
				>
				["new_class_tab"] = <
					icon_key = <"tool/class_tool_new">
					action_key = <"YY">
				>
				["sep_1"] = <>
				["reset_tool_layout"] = <
					action_key = <"YY">
				>
			>
			["history"] = <
				["back"] = <
					action_key = <"YY">
				>
				["forward"] = <
					action_key = <"YY">
				>
			>
			["repository"] = <
				["build_all"] = <
					action_key = <"YY">
				>
				["rebuild_all"] = <
					action_key = <"YY">
				>
				["sep_1"] = <>

				["build_subtree"] = <
					action_key = <"YY">
				>
				["rebuild_subtree"] = <
					action_key = <"YY">
				>
				["sep_2"] = <>

				["interrupt_build"] = <
					action_key = <"YY">
				>
				["refresh_repository"] = <
					action_key = <"YY">
				>
				["sep_3"] = <>

				["export_as_html"] = <
					action_key = <"YY">
				>
				["export_as_adl"] = <
					action_key = <"YY">
				>
				["export_as_dadl"] = <
					action_key = <"YY">
				>
				["export_as_json"] = <
					action_key = <"YY">
				>
				["export_as_yaml"] = <
					action_key = <"YY">
				>
				["export_as_xml"] = <
					action_key = <"YY">
				>
				["export_repository_report"] = <
					action_key = <"YY">
				>
				["sep_4"] = <>

				["configure_repository_profiles"] = <
					icon_key = <"tool/tools">
					action_key = <"YY">
				>
			>
			["rm_schemas"] = <
				["reload_schemas"] = <
					action_key = <"YY">
				>
				["sep_1"] = <>
				["configure_schemas"] = <
					icon_key = <"tool/tools">
					action_key = <"YY">
				>
			>
			["xml"] = <
				["sep_1"] = <>
				["edit_rules"] = <
					action_key = <"YY">
				>
			>
			["tools"] = <
				["clean_generated_files"] = <
					action_key = <"YY">
				>
				["options"] = <
					icon_key = <"tool/tools">
					action_key = <"YY">
				>
			>
			["help"] = <
				["online_help"] = <
					action_key = <"YY">
				>
				["release_notes"] = <
					action_key = <"YY">
				>
				["sep_1"] = <>

				["clinical_knowledge_manager"] = <
					action_key = <"YY">
				>
				["report_a_bug"] = <
					action_key = <"YY">
				>
				["about"] = <
					action_key = <"YY">
				>
			>
		>
	]"

feature -- Initialisation

	make (menu_keys, menu_texts: ARRAY [STRING])
			-- create a new menu with a list of String key names and texts for the individual menus
		do
			create menu_index.make(0)
			create menu_item_index.make (0)

			create ev_menu_bar
			menu_keys.do_all ()
		end

feature -- Access

	ev_menu_bar: EV_MENU_BAR

feature -- Commands

	add_menu (a_key, a_title: STRING)
		local
			a_menu: EV_MENU
		do
			create a_menu
			a_menu.set_text (a_title)
			ev_menu_bar.extend (a_menu)
			menu_index.put (a_menu, a_key)
		end

feature {NONE} -- Implementation

	menu_index: HASH_TABLE [EV_MENU, STRING]

	menu_item_index: HASH_TABLE [EV_MENU_ITEM, STRING]

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
--| The Original Code is gui_hash_table.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
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
