note
	component:   "openEHR Archetype Project"
	description: "[
				 Visual control for a LIST [STRING] data source that outputs to an EV_COMBO_BOX.
				 Visual control structure is a combo-box with a title.
				 Designed for selecting various values of a list or hash, not for editing. 
				 
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

class EVX_COMBO_CONTROL

inherit
	EVX_TITLED_DATA_CONTROL
		rename
			make as make_data_control
		export
			{NONE} make_linked
		redefine
			data_source_agent
		end

create
	make

feature -- Initialisation

	make (a_title: STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_data_control (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally)
			ev_data_control.select_actions.extend (agent propagate_select_action)
		end

feature -- Access

	ev_data_control: EV_COMBO_BOX

	data_source_agent: FUNCTION [ANY, TUPLE, detachable LIST [STRING]]

feature -- Commands

	clear
			-- Wipe out content
		do
			ev_data_control.wipe_out
		end

	populate
			-- Wipe out content.
		do
			ev_data_control.select_actions.block
			ev_data_control.wipe_out
			if attached {LIST [STRING]} data_source_agent.item ([]) as strs then
				strs.do_all (
					agent (str:STRING)
						do
							ev_data_control.extend (create {EV_LIST_ITEM}.make_with_text (utf8_to_utf32 (str)))
						end
				)
			end
			ev_data_control.select_actions.resume
		end

feature {NONE} -- Implementation

	propagate_select_action
		do
			if attached linked_data_controls then
				linked_data_controls.do_all (agent (a_ctl: EVX_DATA_CONTROL) do a_ctl.populate end)
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
