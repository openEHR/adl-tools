note
	component:   "openEHR Archetype Project"
	description: "[
				 General model of a data control, consisting of a data source, visual control(s), an outer container,
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


deferred class EVX_TITLED_DATA_CONTROL

inherit
	EVX_DATA_CONTROL

feature -- Initialisation

	make (a_title: detachable STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER; arrange_horizontally, allow_expansion: BOOLEAN)
		local
			mh, mw: INTEGER
		do
			data_source_agent := a_data_source_agent

			mh := min_height.max (default_min_height) + Default_border_width
			mw := min_width.max (default_min_width) + Default_border_width

			-- create a container to hold title and data control
			if arrange_horizontally then
				create {EV_HORIZONTAL_BOX} ev_root_container
			else
				create {EV_VERTICAL_BOX} ev_root_container
			end
			ev_root_container.set_data (Current)

			-- if there is a title, set appropriate padding & border
			if attached a_title and then not a_title.is_empty then
				ev_root_container.set_padding (Default_padding_width)
				ev_root_container.set_border_width (Default_border_width)

				-- create the title and add to ev_container
				create ev_title_label
				ev_title_label.set_text (a_title)
				ev_root_container.extend (ev_title_label)
				ev_root_container.disable_item_expand (ev_title_label)

				-- add some more spacing due to title
				mh := mh + Default_border_width
				mw := mw + Default_border_width

				if arrange_horizontally then
					mw := mw + ev_title_label.width + Default_padding_width
				else
					mh := mh + ev_title_label.height + Default_padding_width
				end
			end

			-- create the data control and add to ev_container
			create_ev_data_control
			ev_root_container.extend (ev_data_control)
			ev_data_control.set_minimum_width (min_width.max (default_min_width))

			ev_root_container.set_minimum_height (mh)
			ev_root_container.set_minimum_width (mw)

			-- control expanding characteristics of main control
			if not allow_expansion then
				ev_root_container.extend (create {EV_CELL})
				ev_root_container.disable_item_expand (ev_data_control)
			end
		ensure
			not is_readonly
		end

	make_readonly (a_title: detachable STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER; arrange_horizontally, allow_expansion: BOOLEAN)
			-- make so that no user interaction with visual control is possible
		do
			make (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally, allow_expansion)
			is_readonly := True
			do_disable_editable
		ensure
			is_readonly
		end

	make_editable (a_title: STRING; a_data_source_agent: like data_source_agent;
				a_data_source_create_agent: like data_source_setter_agent;
				a_data_source_remove_agent: like data_source_remove_agent;
				an_undo_redo_chain: UNDO_REDO_CHAIN;
				min_height, min_width: INTEGER;
				arrange_horizontally, allow_expansion: BOOLEAN)
			-- make with active editing agents so that changes made in the visual control
			-- affect the data source
		do
			make (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally, allow_expansion)
			data_source_setter_agent := a_data_source_create_agent
			data_source_remove_agent := a_data_source_remove_agent
			undo_redo_chain := an_undo_redo_chain
		ensure
			not is_readonly
		end

feature -- Access

	ev_root_container: EV_BOX

	ev_title_label: EV_LABEL

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
