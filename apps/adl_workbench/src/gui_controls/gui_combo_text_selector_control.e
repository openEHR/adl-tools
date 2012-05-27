note
	component:   "openEHR Archetype Project"
	description: "[
				 Visual control for a single text field data source whose values from from a fixed set, chosen
				 from and displayed to an EV_COMBO_BOX.
				 Visual control structure is a combo-box with a title.
				 
								   Title
						+-------------------------+-+
						|                         |V|
						+-------------------------+-+
						
				 or
				 
							+-------------------------+-+
					Title	|                         |V|
							+-------------------------+-+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_COMBO_TEXT_SELECTOR_CONTROL

inherit
	GUI_TEXT_CONTROL
		rename
			make as make_text_control, make_editable as make_editable_text_control
		redefine
			enable_edit, disable_edit, data_source_setter_agent, do_populate
		end

create
	make, make_editable

feature -- Initialisation

	make (a_title: STRING; a_data_source: like data_source_agent;
			a_value_set: LIST [STRING];
			min_height, min_width: INTEGER)
		do
			make_data_control (a_title, a_data_source, min_height, min_width, True, False)
			value_set := a_value_set
			value_set.compare_objects
			ev_root_container.disable_item_expand (ev_data_control)
			ev_data_control.select_actions.extend (agent propagate_select_action)
		end

	make_editable (a_title: STRING; a_data_source: like data_source_agent;
			a_value_set: LIST [STRING];
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER)
		do
			make_editable_data_control (a_title,
				a_data_source, a_data_source_setter_agent, a_data_source_remove_agent,
				an_undo_redo_chain, min_height, min_width, True, False)
			value_set := a_value_set
			value_set.compare_objects
			ev_root_container.disable_item_expand (ev_data_control)
			ev_data_control.select_actions.extend (agent propagate_select_action)
			ev_data_control.select_actions.extend (agent process_edit)
			disable_edit
		end

feature -- Access

	value_set: LIST [STRING]
				-- list of values from which to choose the value of the source data field

	ev_data_control: EV_COMBO_BOX

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- agent for creating & setting the data source

feature -- Commands

	enable_edit
			-- enable editing
		do
			precursor
			ev_data_control.enable_edit
			ev_data_control.enable_sensitive
		end

	disable_edit
			-- disable editing
		do
			precursor
			ev_data_control.disable_edit
			ev_data_control.disable_sensitive
		end

	do_populate
			-- populate content
		local
			cur_val: STRING
			li2: EV_LIST_ITEM
		do
			ev_data_control.select_actions.block
			if not edit_enabled then
				ev_data_control.enable_sensitive
			end

			-- populate with all possible values
			ev_data_control.wipe_out
			value_set.do_all (
				agent (str: STRING)
					do
						ev_data_control.extend (create {EV_LIST_ITEM}.make_with_text (utf8_to_utf32 (str)))
					end
			)

			-- select value matching that in data source, if any match exists, otherwise select
			-- the 'unknown' value
			cur_val := data_source_agent.item ([])
			if value_set.has (cur_val) then
				ev_data_control.do_all (
					agent (li: EV_LIST_ITEM; a_val: STRING)
						do
							if li.text.same_string (a_val) then li.enable_select end
						end (?, cur_val)
				)
			else
				create li2.make_with_text (Unknown_value)
				ev_data_control.extend (li2)
				li2.enable_select
			end
			ev_data_control.select_actions.resume
			if not edit_enabled then
				ev_data_control.disable_sensitive
			end
		end

feature {NONE} -- Implementation

	propagate_select_action
		do
			if attached linked_data_controls then
				linked_data_controls.do_all (agent (a_ctl: GUI_XX_DATA_CONTROL) do a_ctl.do_populate end)
			end
		end

feature {NONE} -- Implementation

	create_ev_data_control
		do
			create ev_data_control
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
