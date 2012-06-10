note
	component:   "openEHR Archetype Project"
	description: "[
				 General model of a primitive data control, consisting of a data source, a visual control, a title,
				 routines for populate, clear, and agents for editing.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


deferred class GUI_DATA_CONTROL

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	GUI_UTILITIES
		export
			{NONE} all
		end

feature -- Definitions

	default_min_height: INTEGER = 23

	default_min_width: INTEGER = 50

feature -- Access

	ev_data_control: EV_PRIMITIVE
		deferred
		end

	data_source_agent: FUNCTION [ANY, TUPLE, ANY]
			-- specialise in descendants

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE[ANY]]
			-- agent for creating & setting the data source

	data_source_remove_agent: detachable PROCEDURE [ANY, TUPLE]
			-- agent for removing an the data source when it becomes empty,
			-- in the case where it is a detachable attribute
			-- of its owning class.

	undo_redo_chain: detachable UNDO_REDO_CHAIN
		-- reference to undo/redo chain from owning visual context

feature -- Status Report

	is_readonly: BOOLEAN
			-- True if user interaction of this control is not allowed

	is_active: BOOLEAN
			-- True if `ev_data_control' enabled for user interaction

feature -- Modification

	add_linked_control (a_control: GUI_TITLED_DATA_CONTROL)
			-- add a control that is to be repopulated if this control is selected in some way
		do
			if not attached linked_data_controls then
				create linked_data_controls.make(0)
			end
			linked_data_controls.extend (a_control)
		end

feature -- Commands

	clear
			-- Wipe out content.
		deferred
		end

	populate
		deferred
		end

	enable_active
			-- enable user interaction, do nothing if `is_readonly'
		do
			if not is_readonly then
				do_enable_active
				is_active := True
			end
		end

	disable_active
			-- disable user interaction, do nothing if `is_readonly'
		do
			if not is_readonly then
				do_disable_active
				is_active := False
			end
		end

feature {NONE} -- Implementation

	create_ev_data_control
		deferred
		end

	linked_data_controls: detachable ARRAYED_LIST [GUI_DATA_CONTROL]

	do_enable_active
			-- enable user interaction
		require
			not is_readonly
		do
			ev_data_control.enable_sensitive
		end

	do_disable_active
			-- disable user interaction
		require
			not is_readonly
		do
			ev_data_control.disable_sensitive
		end

invariant
	is_readonly implies not ev_data_control.is_sensitive

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
