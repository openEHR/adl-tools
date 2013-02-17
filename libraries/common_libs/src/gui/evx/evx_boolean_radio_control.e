note
	component:   "openEHR Archetype Project"
	description: "Boolean Radio button group, functionally same as a toggle button."
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_BOOLEAN_RADIO_CONTROL

inherit
	EVX_DATA_CONTROL
		redefine
			data_source_agent, data_source_setter_agent, hide, show
		end

create
	make

feature -- Initialisation

	make (a_state_1_label, a_state_2_label: STRING;
			a_state_1_tooltip_text, a_state_2_tooltip_text: detachable STRING;
			a_data_source_agent: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			min_height, min_width: INTEGER)
		do
			data_source_agent := a_data_source_agent
			data_source_setter_agent := a_data_source_setter_agent

			create_ev_data_control
			ev_data_control.set_text (utf8_to_utf32 (a_state_1_label))
			ev_data_control_peer.set_text (utf8_to_utf32 (a_state_2_label))
			if attached a_state_1_tooltip_text then
				ev_data_control.set_tooltip (utf8_to_utf32 (a_state_1_tooltip_text))
			end
			if attached a_state_2_tooltip_text then
				ev_data_control_peer.set_tooltip (utf8_to_utf32 (a_state_2_tooltip_text))
			end

			ev_data_control.select_actions.extend (agent toggle_state)
			ev_data_control_peer.select_actions.extend (agent toggle_state)
		ensure
			not is_readonly
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX
			-- holding the two radio buttons; add this container to parent widget hierarchy

	ev_data_control: EV_RADIO_BUTTON
			-- first radio button

	ev_data_control_peer: EV_RADIO_BUTTON
			-- second radio button

	data_source_agent: FUNCTION [ANY, TUPLE, BOOLEAN]

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [BOOLEAN]]
			-- agent for creating & setting the data source

feature -- Commands

	clear
		do
		end

	populate
		do
			if data_source_agent.item ([]) then
				ev_data_control.select_actions.block
				ev_data_control.enable_select
				ev_data_control.select_actions.resume
			else
				ev_data_control_peer.select_actions.block
				ev_data_control_peer.enable_select
				ev_data_control_peer.select_actions.resume
			end
		end

feature -- Commands

	hide
		do
			ev_root_container.hide
		end

	show
		do
			ev_root_container.show
		end

feature -- Modification

	set_pixmaps (a_state_1_pixmap, a_state_2_pixmap: detachable EV_PIXMAP)
		do
			if attached a_state_1_pixmap as pm1 then
				ev_data_control.set_pixmap (pm1)
			end
			if attached a_state_2_pixmap as pm2 then
				ev_data_control.set_pixmap (pm2)
			end
		end

feature {NONE} -- Implementation

	create_ev_data_control
		do
			create ev_data_control
			create ev_data_control_peer
			create ev_root_container
			ev_root_container.extend (ev_data_control)
			ev_root_container.disable_item_expand (ev_data_control)
			ev_root_container.extend (ev_data_control_peer)
			ev_root_container.disable_item_expand (ev_data_control_peer)
		end

	toggle_state
			-- change state
		do
			if attached data_source_setter_agent then
				data_source_setter_agent.call ([not data_source_agent.item ([])])
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
