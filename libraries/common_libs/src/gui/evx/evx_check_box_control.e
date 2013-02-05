note
	component:   "openEHR Archetype Project"
	description: "[
				 Visual control for a BOOLEAN data source that outputs to an EV_CHECK_BUTTON.
				 Visual control structure is a check-box with a title.
				 
					+-+
					| | Title
					+-+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_CHECK_BOX_CONTROL

inherit
	EVX_DATA_CONTROL
		redefine
			data_source_agent, data_source_setter_agent
		end

create
	make, make_linked, make_readonly

feature -- Initialisation

	make (a_title: STRING; a_tooltip: detachable STRING; a_data_source_agent: like data_source_agent)
			-- make with a data_source agent, typically for a Dialog box
			-- caller should use `is_selected' to inspect state when OK is pressed
		do
			data_source_agent := a_data_source_agent

			-- create the data control and add to ev_container
			create_ev_data_control
			ev_data_control.set_text (a_title)
			if attached a_tooltip then
				ev_data_control.set_tooltip (a_tooltip)
			end
		ensure
			not is_readonly
		end

	make_readonly (a_title: STRING; a_tooltip: detachable STRING; a_data_source_agent: like data_source_agent)
			-- make readonly with a data_source agent, typically for a Dialog box
		do
			make (a_title, a_tooltip, a_data_source_agent)
			is_readonly := True
		ensure
			is_readonly
		end

	make_linked (a_title: STRING; a_tooltip: detachable STRING;
				a_data_source_agent: like data_source_agent;
				a_data_source_setter_agent: attached like data_source_setter_agent)
			-- make for a normal form with active semantics
		do
			make (a_title, a_tooltip, a_data_source_agent)
			data_source_setter_agent := a_data_source_setter_agent
			ev_data_control.select_actions.extend (agent on_select)
		ensure
			not is_readonly
		end

feature -- Access

	ev_data_control: EV_CHECK_BUTTON

	data_source_agent: FUNCTION [ANY, TUPLE, BOOLEAN]

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [BOOLEAN]]
			-- agent for setting the data source

feature -- Status Report

	is_selected: BOOLEAN
			-- report state of checkbox
		do
			Result := ev_data_control.is_selected
		end

feature -- Commands

	clear
			-- Wipe out content
		do
			ev_data_control.select_actions.block
			ev_data_control.disable_select
			ev_data_control.select_actions.resume
		end

	populate
		do
			ev_data_control.select_actions.block
			if data_source_agent.item ([]) then
				ev_data_control.enable_select
			else
				ev_data_control.disable_select
			end
			ev_data_control.select_actions.resume
		end

feature {NONE} -- Implementation

	create_ev_data_control
		do
			create ev_data_control
		end

	on_select
		do
			data_source_setter_agent.call ([ev_data_control.is_selected])
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
