note
	component:   "openEHR Archetype Project"
	description: "[
				 A control for controlling EV_TREE and EV_GRID in tree mode. It provides 4
				 buttons with the functions:
				 	- collapse all
					- collapse 1 level
					- expand 1 level
					- expand all
				 These appear as follows:

				 	+---++---++---++---+
					| 0 || - || + || * |
				 	+---++---++---++---+

				 ]"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_TREEVIEW_CONTROL

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_title: detachable STRING; a_tree_ctl: GUI_TREE_CONTROL_I)
		local
			ev_view_label: EV_LABEL
			ev_hbox: EV_HORIZONTAL_BOX
		do
			gui_tree_control := a_tree_ctl

			create ev_root_container
			ev_root_container.set_minimum_width (115)

			-- add title
			if attached a_title then
				create ev_view_label.make_with_text (utf8_to_utf32 (a_title))
				ev_view_label.align_text_left
				ev_root_container.extend (ev_view_label)
				ev_root_container.disable_item_expand (ev_view_label)
			end

			create ev_hbox
			ev_root_container.extend (ev_hbox)
			ev_root_container.disable_item_expand (ev_hbox)

			-- collapse all button
			create ev_collapse_button
			ev_collapse_button.set_text ("0")
			ev_collapse_button.set_tooltip (get_text ("collapse_complete_tooltip"))
			ev_collapse_button.select_actions.extend (agent on_collapse_all)
			ev_hbox.extend (ev_collapse_button)

			-- collapse one level button
			create ev_collapse_one_button
			ev_collapse_one_button.set_text ("-")
			ev_collapse_one_button.set_tooltip (get_text ("collapse_one_level_tooltip"))
			ev_collapse_one_button.select_actions.extend (agent on_collapse_one_level)
			ev_hbox.extend (ev_collapse_one_button)

			-- expand one level button
			create ev_expand_one_button
			ev_expand_one_button.set_text ("+")
			ev_expand_one_button.set_tooltip (get_text ("expand_one_level_tooltip"))
			ev_expand_one_button.select_actions.extend (agent on_expand_one_level)
			ev_hbox.extend (ev_expand_one_button)

			-- expand all button
			create ev_expand_button
			ev_expand_button.set_text ("*")
			ev_expand_button.set_tooltip (get_text ("expand_complete_tooltip"))
			ev_expand_button.select_actions.extend (agent on_expand_all)
			ev_hbox.extend (ev_expand_button)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	gui_tree_control: GUI_TREE_CONTROL_I

	ev_expand_button, ev_expand_one_button, ev_collapse_one_button, ev_collapse_button: EV_BUTTON

feature -- Commands

	ev_tree_do_all (a_node_action: attached PROCEDURE [ANY, TUPLE [ANY]])
			-- do enter_action and exit_action to all nodes in the structure
		do
			gui_tree_control.ev_tree_do_all (a_node_action)
		end

feature -- Events

	on_collapse_one_level
		do
			gui_tree_control.on_collapse_one_level
		end

	on_expand_one_level
		do
			gui_tree_control.on_expand_one_level
		end

	on_expand_all
		do
			gui_tree_control.on_expand_all
		end

	on_collapse_all
		do
			gui_tree_control.on_collapse_all
		end

feature {NONE} -- Implementation


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
--| The Original Code is gui_grid_treeview_control.e
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
