note
	component:   "openEHR Archetype Project"
	description: "Abstract idea of a GUI tool in docking arrangement"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class GUI_TOOL

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

	SHARED_GUI_AGENTS
		export
			{NONE} all
		end

feature -- Access

	source: detachable ANY
			-- source object to which this tool is targetted

	ev_root_container: EV_CONTAINER
		deferred
		end

	last_populate_timestamp: detachable DATE_TIME
			-- timestamp of last populate or repopulate

	tool_unique_id: INTEGER
			-- unique id of this tool instance over the session
		do
			Result := ev_root_container.object_id
		end

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		deferred
		end

	selection_history: detachable SELECTION_HISTORY

	selected_item: IDENTIFIED_TOOL_ARTEFACT
		require
			is_selection_history_enabled
		do
			check attached selection_history.selected_item as i then
				Result := i
			end
		end

	mini_tool_bar: EV_WIDGET
		do
		end

feature -- Status Report

	can_populate (a_source: like source): BOOLEAN
		do
			Result := True
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated
		end

	is_populated: BOOLEAN
		do
			Result := attached source
		end

	is_selection_history_enabled: BOOLEAN
		do
			Result := attached selection_history
		end

	has_sub_tool (a_tool: GUI_TOOL): BOOLEAN
			-- True if `a_tools' has already been attached via a call to `add_sub_tool'
		do
			Result := attached sub_tools and then sub_tools.has (a_tool)
		end

	can_edit: BOOLEAN
			-- True if this tool has editing capability
		do
			Result := False
		end

	editing_enabled: BOOLEAN
			-- True if this tool is in edit mode

feature -- Commands

	clear
			-- Wipe out content from visual controls and reset controls to reasonable state
		do
			do_clear
			last_populate_timestamp := Void
			source := Void
		ensure
			not is_populated
		end

	populate (a_source: like source)
			-- populate the control by creating it from scratch
		require
			can_populate (a_source)
		do
			clear
			source := a_source
			do_populate
			create last_populate_timestamp.make_now
		ensure
			is_populated
		end

	repopulate
			-- repopulate current tree items if needed
		require
			can_repopulate: can_repopulate
		do
			do_populate
			create last_populate_timestamp.make_now
		end

	try_repopulate
			-- repopulate if possible; useful for buttons on tool that would cause live repopulate
		do
			if can_repopulate then
				repopulate
			end
		end

	enable_selection_history
		local
			a_sel_hist: like selection_history
		do
			create a_sel_hist.make
			set_selection_history (a_sel_hist)
		end

	set_selection_history (a_hist: like selection_history)
		do
			selection_history := a_hist
			if attached sub_tools then
				sub_tools.do_all (
					agent (a_tool: GUI_TOOL)
						do
							a_tool.set_selection_history (selection_history)
						end
				)
			end
		end

	go_to_selected_item
			-- go to the item corresponding to the current selection in `history', if enabled
		do
		end

	enable_edit
			-- enable editing
		require
			can_edit
		do
			editing_enabled := True
		end

	disable_edit
			-- disable editing
		do
			editing_enabled := False
		end

feature {GUI_TOOL} -- Events

	on_selected
			-- processing required if this tool is visually selected, e.g. in a notebook
		do
		end

	on_rotate_view
			-- if there are multiple views available within one area, tat can be rotated with a tool-frame mini-control
		do
		end

feature {GUI_TOOL} -- Implementation

	do_clear
			-- clear visual controls
		deferred
		end

	do_populate
			-- populate visual controls
		deferred
		end

	ultimate_parent_tool: GUI_TOOL
			-- reference to tool at root of this tool
		do
			from Result := Current until Result.parent_tool = Void loop
				Result := Result.parent_tool
			end
		end

	parent_tool: detachable GUI_TOOL
			-- reference to parent tool

	sub_tools: detachable LIST [GUI_TOOL]
			-- list of subtools of this tool

	add_sub_tool (a_tool: GUI_TOOL)
		require
			not has_sub_tool (a_tool)
		do
			if not attached sub_tools then
				create {ARRAYED_LIST [GUI_TOOL]} sub_tools.make (0)
			end
			sub_tools.extend (a_tool)
			a_tool.set_parent_tool (Current)
			if attached selection_history then
				a_tool.set_selection_history (selection_history)
			end
		end

	set_parent_tool (a_tool: GUI_TOOL)
		do
			parent_tool := a_tool
		end

invariant
	Reverse_link_set: ev_root_container.data = Current

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
--| The Original Code is gui_archetype_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 20011
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
