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

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


deferred class GUI_TEXT_CONTROL

inherit
	GUI_DATA_CONTROL
		rename
			make as make_data_control, make_editable as make_editable_data_control
		redefine
			data_source, data_source_create_agent, enable_edit, disable_edit
		end

feature -- Definitions

	default_min_height: INTEGER = 25

	default_min_width: INTEGER = 50

feature -- Initialisation

	make (a_title: STRING; a_data_source: like data_source; min_height, min_width: INTEGER; use_hbox_container, allow_expansion: BOOLEAN;
			a_text_box_select_all_handler: PROCEDURE [ANY, TUPLE])
		do
			make_data_control (a_title, a_data_source, min_height.max (default_min_height), min_width.max (default_min_width),
				use_hbox_container, allow_expansion)
			ev_data_control.focus_in_actions.extend (a_text_box_select_all_handler)
		end

	make_editable (a_title: STRING;
			a_data_source: like data_source;
			a_data_source_create_agent: like data_source_create_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER; use_hbox_container: BOOLEAN; allow_expansion: BOOLEAN;
			a_text_box_select_all_handler: PROCEDURE [ANY, TUPLE])
		do
			make_editable_data_control (a_title,
				a_data_source, a_data_source_create_agent, a_data_source_remove_agent,
				an_undo_redo_chain,
				min_height.max (default_min_height), min_width.max (default_min_width),
				use_hbox_container, allow_expansion)
			ev_data_control.focus_in_actions.extend (a_text_box_select_all_handler)
		end

feature -- Access

	ev_data_control: EV_TEXT_COMPONENT
		deferred
		end

	data_source: FUNCTION [ANY, TUPLE, STRING]

	data_source_create_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- agent for creating & setting the data source

feature -- Commands

	enable_edit
			-- enable editing
		do
			precursor
			ev_data_control.enable_edit
		end

	disable_edit
			-- disable editing
		do
			precursor
			ev_data_control.disable_edit
		end

feature -- Commands

	do_clear
			-- Wipe out content.
		do
			ev_data_control.remove_text
		end

	do_populate
			-- populate content.
		do
			if attached {STRING} data_source.item ([]) as str then
				ev_data_control.set_text (utf8 (str))
			else
				ev_data_control.remove_text
			end
		end

feature {NONE} -- Implementation

	process_edit
		local
			old_val, new_val: STRING
			undo_agt, redo_agt: PROCEDURE [ANY, TUPLE]
		do
			new_val := ev_data_control.text
			ds := data_source.item ([])
			if attached ds then
				create old_val.make_from_string (ds)
			else
				create old_val.make_empty
			end

			if not old_val.same_string (new_val) then
				-- if user is removing value then use the remove agent, else use the setting agent
				if old_val.is_empty then
					undo_agt := data_source_remove_agent
				else
					undo_agt := agent data_source_create_agent.call ([old_val])
				end

				if new_val.is_empty then
					redo_agt := data_source_remove_agent
				else
					redo_agt := agent data_source_create_agent.call ([new_val])
				end

				data_source_create_agent.call ([new_val])
				undo_redo_chain.add_link (undo_agt, agent do_populate, redo_agt, agent do_populate)
			end
		end

	ds: STRING

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
