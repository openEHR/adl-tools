note
	component:   "openEHR ADL Tools"
	description: "[
				 Controller for multiple editor tools within a docking area. Note that within this interface,
				 all tools are technically 'editors' in the docking sense, and also that the docking manager
				 puts its own 'tools' in which are not editors.
				 ]"
	keywords:    "GUI, docking"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GUI_DOCKING_EDITOR_CONTROLLER

inherit
	SHARED_GUI_HISTORY_TOOLBAR

feature -- Definitions

	Editor_group_name: STRING
		once
			Result := "editor"
		end

	Editor_pixmap: EV_PIXMAP
		once
			create Result.default_create
		end

	Tab_title_width: INTEGER = 10
			-- Max number of text chars in string to populate editor tab

feature -- Initialisation

	make_docking (a_docking_manager: SD_DOCKING_MANAGER)
		do
			docking_manager := a_docking_manager
			create docking_tools.make (0)
		end

feature -- Access

	active_tool: GUI_TOOL
			-- get currently active tool
		require
			has_tools
		do
			check attached docking_tools.item (active_tool_id) as at then
				Result := at.tool
			end
		end

	docking_pane_by_tool_artefact_id (an_id: STRING): detachable SD_CONTENT
			-- return a tool for artefact with id `an_artefact_id' or Void if none
		do
			from docking_tools.start until docking_tools.off or
				(docking_tools.item_for_iteration.tool.is_populated and then
				docking_tools.item_for_iteration.tool.tool_artefact_id.same_string (an_id))
			loop
				docking_tools.forth
			end
			if not docking_tools.off then
				Result := docking_tools.item_for_iteration.docking_pane
			end
		end

	tools_count: INTEGER
		do
			Result := docking_tools.count
		end

feature -- Status Report

	has_tools: BOOLEAN
			-- True if there are any tools here
		do
			Result := not docking_tools.is_empty
		end

	has_visible_tools: BOOLEAN
			-- is there any tool whose content is displayed?
		do
			from docking_tools.start until docking_tools.off or docking_tools.item_for_iteration.tool.ev_root_container.is_displayed loop
				docking_tools.forth
			end
			Result := not docking_tools.off
		end

	has_docking_pane_with_tool_artefact_id (an_artefact_id: STRING): BOOLEAN
			-- return True if there is a tool for artefact with id `an_artefact_id'
		do
			from docking_tools.start until docking_tools.off or
				(docking_tools.item_for_iteration.tool.is_populated and then
				docking_tools.item_for_iteration.tool.tool_artefact_id.same_string (an_artefact_id))
			loop
				docking_tools.forth
			end
			Result := not docking_tools.off
		end

feature -- Commands

	clear_all_tools_content
		do
			across docking_tools as tool loop
				tool.item.docking_pane.set_long_title ("")
				tool.item.docking_pane.set_short_title ("")
				tool.item.docking_pane.set_pixmap (Editor_pixmap)
				tool.item.tool.clear
			end
		end

	do_all_tools (an_agent: PROCEDURE [ANY, TUPLE [like active_tool]])
			-- execute `an_agent' on all of the tools currently existing (do nothing if none there)
		do
			if has_tools then
				all_tools (False).do_all (an_agent)
			end
		end

	do_all_visible_tools (an_agent: PROCEDURE [ANY, TUPLE [like active_tool]])
			-- execute `an_agent' on all of the tools currently visible on screen (do nothing if none there)
		do
			if has_tools then
				all_tools (True).do_all (an_agent)
			end
		end

	show_docking_pane_by_tool_artefact_id (an_artefact_id: STRING): BOOLEAN
			-- set focus to tool for artefact with id `an_artefact_id'
		do
			if attached {SD_CONTENT} docking_pane_by_tool_artefact_id (an_artefact_id) as pane then
				pane.set_focus
				Result := True
			end
		end

feature {NONE} -- Implementation

	docking_tools: HASH_TABLE [TUPLE [tool: like active_tool; docking_pane: SD_CONTENT], INTEGER]
			-- table of [GUI_TOOL, docking pane} tuples keyed by tool id

	docking_manager: SD_DOCKING_MANAGER

	docking_manager_last_tool: detachable SD_CONTENT
			-- obtain last (i.e. rightmost) editor from docking manager
			-- FIXME: should be managed inside SD_DOCKING_MANAGER
		do
			across docking_manager.contents as dm_contents_csr loop
				if dm_contents_csr.item.type = {SD_ENUMERATION}.editor then
					Result := dm_contents_csr.item
				end
			end
		end

	all_tools (only_visible_tools: BOOLEAN): ARRAYED_LIST [like active_tool]
			-- list of all tools currently in existence at the moment
			-- if `only_visible_tools' set, only get visible tools
		require
			has_tools
		do
			create Result.make (0)
			across docking_tools as dt_csr loop
				if not only_visible_tools or else dt_csr.item.tool.ev_root_container.is_displayed then
					Result.extend (dt_csr.item.tool)
				end
			end
		end

	active_tool_id: INTEGER
			-- id of editor tool currently in use

	active_tool_docking_pane: SD_CONTENT
		do
			check attached docking_tools.item (active_tool_id) as att_tool then
				Result := att_tool.docking_pane
			end
		end

	has_tool (a_tool_id: INTEGER): BOOLEAN
		do
			Result := docking_tools.has (a_tool_id)
		end

	add_new_tool (a_gui_tool: like active_tool)
			-- set up docking container
		local
			docking_pane: SD_CONTENT
			last_ed: detachable SD_CONTENT
		do
			-- find out what the current last editor in the docking panel is, before making a new one
			last_ed := docking_manager_last_tool
			active_tool_id := docking_tools.count + 1
			create docking_pane.make_with_widget_title_pixmap (a_gui_tool.ev_root_container, Editor_pixmap, Editor_group_name + " #" + active_tool_id.out, docking_manager)
			docking_pane.close_request_actions.extend (agent remove_tool (active_tool_id))
			docking_manager.contents.extend (docking_pane)
			docking_pane.set_type ({SD_ENUMERATION}.editor)
			if attached last_ed as le then
				docking_pane.set_tab_with (le, False)
			else
				docking_pane.set_top ({SD_ENUMERATION}.left)
				docking_pane.set_default_editor_position
			end
			docking_pane.focus_in_actions.extend (agent select_tool (active_tool_id))
			docking_tools.put ([a_gui_tool, docking_pane], active_tool_id)
		ensure
			Tool_added_to_index: docking_tools.has (active_tool_id) and then attached docking_tools.item (active_tool_id) as att_tool and then att_tool.tool = a_gui_tool
		end

	remove_tool (a_tool_id: INTEGER)
		require
			valid_tool_id: has_tool (a_tool_id)
		local
			docking_pane: SD_CONTENT
			keys: ARRAYED_LIST [INTEGER]
		do
			-- work out a sensible value for new current_archetype_tool_id
			create keys.make_from_array (docking_tools.current_keys)
			from keys.start until keys.off or keys.item = a_tool_id loop
				keys.forth
			end
			if keys.isfirst then
				if keys.count = 1 then
					active_tool_id := 0
				else
					active_tool_id := keys.i_th (2)
				end
			else
				keys.back
				active_tool_id := keys.item
			end

			-- destroy the docking pane and archetype tool controls
			if attached docking_tools.item (a_tool_id) as att_tool then
				docking_pane := att_tool.docking_pane
				docking_pane.close
				docking_pane.destroy
				docking_tools.remove (a_tool_id)
			end
		end

	select_tool (a_tool_id: INTEGER)
		require
			valid_tool_id: has_tool (a_tool_id)
		do
			active_tool_id := a_tool_id
		ensure
			active_tool_id = a_tool_id
		end

	populate_active_tool_pane (a_long_title, a_short_title: STRING; a_pixmap: EV_PIXMAP)
			-- Populate content from visual controls.
		do
			active_tool_docking_pane.set_long_title (a_long_title)
			active_tool_docking_pane.set_short_title (a_short_title)
			active_tool_docking_pane.set_pixmap (a_pixmap)
			if not active_tool_docking_pane.is_visible then
				active_tool_docking_pane.show
			end
			active_tool_docking_pane.set_focus
		end

end


