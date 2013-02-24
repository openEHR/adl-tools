note
	component:   "openEHR Archetype Project"
	description: "[
				 Visual control for a data source that outputs to text field control.
				 Visual control structure is a text edit field with a title, in-place editing.
				 
					        +----------------------------+
				    Title: 	|                            |
						    +----------------------------+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class EVX_TEXT_CONTROL

inherit
	EVX_TITLED_DATA_CONTROL
		rename
			make as make_data_control, make_linked as make_linked_data_control
		redefine
			data_source_agent, data_source_setter_agent, do_enable_editable, do_disable_editable
		end

feature -- Initialisation

	make (a_title: STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_data_control (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally)
			ev_data_control.focus_in_actions.extend (agent on_select_all)
		end

	make_linked (a_title: STRING; a_data_source_agent: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_linked_data_control (a_title,
				a_data_source_agent, a_data_source_setter_agent, a_data_source_remove_agent,
				an_undo_redo_chain, min_height, min_width, arrange_horizontally)
			ev_data_control.focus_in_actions.extend (agent on_select_all)
			ev_data_control.focus_out_actions.extend (agent do if is_editable then process_edit end end)
		end

feature -- Access

	ev_data_control: EV_TEXT_COMPONENT
		deferred
		end

	data_control_text: STRING_8
			-- STRING_8 converted form of text from UI
		do
			Result := ev_data_control.text.to_string_8
		end

	data_source_agent: FUNCTION [ANY, TUPLE, detachable STRING]

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- agent for creating & setting the data source

	update_validity_agent: detachable FUNCTION [ANY, TUPLE [STRING], BOOLEAN]
			-- agent that if set will be used to check data entered into the control
			-- for validity; if invalid, an error dialog will be displayed and the
			-- value will be reverted to its previous value

	validity_error_msg_agent: detachable FUNCTION [ANY, TUPLE [args: detachable ARRAY [STRING]], STRING]
			-- agent that if passed optional string args, will generate a message with the arguments
			-- correctly interpolated, suitable for screen display.

feature -- Commands

	clear
			-- Wipe out content.
		do
			ev_data_control.remove_text
		end

	populate
			-- populate content.
		do
			if attached {STRING} data_source_agent.item ([]) as str then
				ev_data_control.set_text (utf8_to_utf32 (str))
			else
				ev_data_control.remove_text
			end
		end

	set_focus
			-- select text
		do
			ev_data_control.select_all
			ev_data_control.set_focus
		end

feature -- Modification

	set_validity_agents (an_update_validity_agent: like update_validity_agent; a_validity_error_msg_agent: like validity_error_msg_agent)
		do
			update_validity_agent := an_update_validity_agent
			validity_error_msg_agent := a_validity_error_msg_agent
		end

feature {NONE} -- Implementation

	process_edit
		require
			Setter_agent_available: attached data_source_setter_agent
		local
			old_val, new_val: STRING
			undo_agt, redo_agt: detachable PROCEDURE [ANY, TUPLE]
			error_dialog: EV_INFORMATION_DIALOG
		do
			new_val := utf32_to_utf8 (ev_data_control.text)
			if attached data_source_agent.item ([]) as ds then
				create old_val.make_from_string (ds)
			else
				create old_val.make_empty
			end

			if not old_val.same_string (new_val) then
				if attached update_validity_agent and attached validity_error_msg_agent and then
					 not update_validity_agent.item ([new_val])
				then
					ev_data_control.focus_out_actions.block
					create error_dialog.make_with_text (validity_error_msg_agent.item ([<<new_val>>]))
					check attached proximate_ev_window (ev_data_control) as pw then
						error_dialog.show_modal_to_window (pw)
					end
					populate
					ev_data_control.focus_out_actions.resume
				else
					-- if user is removing value then use the remove agent, else use the setting agent
					if old_val.is_empty then
						undo_agt := data_source_remove_agent
					else
						undo_agt := agent data_source_setter_agent.call ([old_val])
					end

					if new_val.is_empty then
						redo_agt := data_source_remove_agent
					else
						redo_agt := agent data_source_setter_agent.call ([new_val])
					end

					data_source_setter_agent.call ([new_val])

					if attached undo_redo_chain as urc and attached undo_agt as ua and attached redo_agt as ra then
						urc.add_link (ua, agent populate, ra, agent populate)
					end
				end
			end
		end

	on_select_all
		do
			if ev_data_control.text_length > 0 then
				ev_data_control.select_all
			end
		end

	do_enable_editable
			-- enable editing
		do
			precursor
			ev_data_control.enable_edit
		end

	do_disable_editable
			-- disable editing
		do
			precursor
			ev_data_control.disable_edit
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
