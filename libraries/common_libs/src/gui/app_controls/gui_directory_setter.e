note
	component:   "openEHR Archetype Project"
	description: "[
				 Visual control for a data source containing a directory path, enabling both direct setting
				 and browsing by the user.
				 Visual control structure is a text edit field with a title, in-place editing, and a browse
				 button.
				 
					        +----------------------------+ +--------+
				    Title: 	|                            | | Browse |
						    +----------------------------+ +--------+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_DIRECTORY_SETTER

inherit
	GUI_SINGLE_LINE_TEXT_CONTROL
		rename
			make as make_text_control, make_active as make_active_text_control, make_readonly as make_readonly_text_control
		end

create
	make, make_active, make_readonly

feature -- Initialisation

	make (a_title: STRING; a_data_source: like data_source_agent; min_height, min_width: INTEGER)
		do
			make_text_control (a_title, a_data_source, min_height, min_width, True, True)
			initialise_browse_button
		ensure
			not is_readonly
		end

	make_readonly (a_title: STRING; a_data_source: like data_source_agent; min_height, min_width: INTEGER)
		do
			make_readonly_text_control (a_title, a_data_source, min_height, min_width, True, True)
		ensure
			is_readonly
		end

	make_active (a_title: STRING; a_data_source: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER)
		do
			make_active_text_control (a_title, a_data_source, a_data_source_setter_agent, a_data_source_remove_agent, an_undo_redo_chain, min_height, min_width, True, True)
			initialise_browse_button
		ensure
			not is_readonly
		end

feature -- Access

	ev_browse_button: EV_BUTTON

feature -- Modification

	set_default_directory_agent (an_agent: like default_directory_agent)
		do
			default_directory_agent := an_agent
		end

	set_post_select_agent (an_agent: like post_select_agent)
		do
			post_select_agent := an_agent
		end

feature -- Events

	on_browse
			-- Let the user browse for the directory
		local
			ds_val, initial_dir: STRING
		do
			ds_val := data_source_agent.item ([])
			if attached default_directory_agent and (not attached ds_val or else ds_val.is_empty) then
				initial_dir := default_directory_agent.item ([])
			else
				initial_dir := ds_val
			end
			ev_data_control.set_text (get_directory (initial_dir, proximate_ev_window (ev_root_container)))
			if attached post_select_agent then
				post_select_agent.call ([])
			end
		end

feature {NONE} -- Implementation

	default_directory_agent: detachable FUNCTION [ANY, TUPLE, STRING]
			-- agent that will return a reasonable default directory for when the user hits the browser button

	post_select_agent: detachable PROCEDURE [ANY, TUPLE]
			-- agent to execute after directory choice has been made

	initialise_browse_button
		do
			create ev_browse_button
			ev_browse_button.set_text (get_text ("browse_button_text"))
			ev_root_container.extend (ev_browse_button)
			ev_root_container.disable_item_expand (ev_browse_button)
			ev_browse_button.select_actions.extend (agent on_browse)
		end

	get_directory (init_value: detachable STRING; a_parent_window: attached EV_WINDOW): STRING
			-- get a directory from user. `init_value' may be Void or empty
		local
			dialog: EV_DIRECTORY_DIALOG
			a_dir: DIRECTORY
			error_dialog: EV_INFORMATION_DIALOG
			default_result: STRING
		do
			create dialog

			if attached init_value and then (create {DIRECTORY}.make (init_value)).exists then
				dialog.set_start_directory (init_value)
				default_result := init_value
			else
				create default_result.make_empty
			end

			from until attached Result loop
				dialog.show_modal_to_window (a_parent_window)

				if not attached dialog.selected_button or else dialog.selected_button.is_equal (get_text ("cancel_button_text")) then
					Result := default_result
				else
					if not dialog.directory.is_empty then
						create a_dir.make (dialog.directory.as_string_8)

						if a_dir.exists then
							Result := a_dir.name
						else
							create error_dialog.make_with_text (get_msg ("directory_does_not_exist", <<dialog.directory>>))
							error_dialog.show_modal_to_window (a_parent_window)
						end
					else
						create error_dialog.make_with_text (get_text ("empty_directory_does_not_exist"))
						error_dialog.show_modal_to_window (a_parent_window)
					end
				end
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
