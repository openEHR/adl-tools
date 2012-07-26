note
	component:   "openEHR Archetype Project"
	description: "Toggle button with two titles that change when toggled"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class EVX_TOGGLE_BUTTON_CONTROL

inherit
	EVX_DATA_CONTROL
		redefine
			data_source_agent, data_source_setter_agent
		end

create
	make

feature -- Initialisation

	make (a_state_1_label, a_state_2_label: STRING;
			a_tooltip_text: detachable STRING;
			a_data_source_agent: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			min_height, min_width: INTEGER)
		do
			data_source_agent := a_data_source_agent
			data_source_setter_agent := a_data_source_setter_agent

			create state_1_settings
			create state_2_settings

			-- reverse the lables, because a button shows the state
			-- its not in, not the current state
			state_2_settings.label := utf8_to_utf32 (a_state_1_label)
			state_1_settings.label := utf8_to_utf32 (a_state_2_label)

			create ev_data_control
			ev_data_control.set_minimum_height (default_min_height)
			if attached a_tooltip_text then
				ev_data_control.set_tooltip (utf8_to_utf32 (a_tooltip_text))
			end

			ev_data_control.select_actions.extend (agent toggle_state)
		ensure
			not is_readonly
		end

feature -- Access

	ev_data_control: EV_BUTTON

	data_source_agent: FUNCTION [ANY, TUPLE, BOOLEAN]

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [BOOLEAN]]
			-- agent for creating & setting the data source

	state_1_settings, state_2_settings: TUPLE [label: STRING_32; pixmap: detachable EV_PIXMAP]

feature -- Commands

	clear
		do
		end

	populate
		do
			set_state (data_source_agent.item ([]))
		end

feature -- Modification

	set_pixmaps (a_state_1_pixmap, a_state_2_pixmap: detachable EV_PIXMAP)
		do
			-- as for the labels, reverse the pixmaps because a button shows
			-- the other state, not the current one
			state_2_settings.pixmap := a_state_1_pixmap
			state_1_settings.pixmap := a_state_2_pixmap
		end

feature {NONE} -- Implementation

	create_ev_data_control
		do
			create ev_data_control
		end

	toggle_state
			-- change state
		do
			if attached data_source_setter_agent then
				data_source_setter_agent.call ([not data_source_agent.item ([])])
			end
		end

	set_state (in_state_1: BOOLEAN)
			-- set state
		local
			settings: like state_1_settings
		do
			if in_state_1 then
				settings := state_1_settings
			else
				settings := state_2_settings
			end

			ev_data_control.set_text (settings.label)
			if attached settings.pixmap then
				ev_data_control.set_pixmap (settings.pixmap)
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
