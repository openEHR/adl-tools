note
	component:   "openEHR ADL Tools"
	description: "Undo/redo enabling mixin for GUI_* classes."
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <t homas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GUI_EDITING_ENABLED

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

feature {NONE}-- Initialization

	add_undo_redo_commit_toolbar
			-- add undo/redo buttons to toolbar
		require
			tool_bar.has_ev_tool_bar
		do
			create undo_redo_chain.make (agent update_undo_redo_controls)

			-- undo button
			tool_bar.add_tool_bar_button (get_icon_pixmap ("tool/undo_active"), get_icon_pixmap ("tool/undo_inactive"),
				get_msg (ec_undo_button_tooltip, Void), agent on_undo)
			check attached tool_bar.last_tool_bar_button as ltbb then
				ev_undo_button := ltbb
			end

			-- redo button
			tool_bar.add_tool_bar_button (get_icon_pixmap ("tool/redo_active"), get_icon_pixmap ("tool/redo_inactive"),
				get_msg (ec_redo_button_tooltip, Void), agent on_redo)
			check attached tool_bar.last_tool_bar_button as ltbb then
				ev_redo_button := ltbb
			end

			-- commit button
			tool_bar.add_tool_bar_button (get_icon_pixmap ("tool/synchronise_active"), get_icon_pixmap ("tool/synchronise_inactive"),
				get_msg (ec_commit_button_tooltip, Void), agent on_commit)
			check attached tool_bar.last_tool_bar_button as ltbb then
				ev_commit_button := ltbb
			end

			create last_commit_time.make_from_epoch (0)
		end

feature -- Access

	tool_bar: EVX_TOOL_BAR
		deferred
		end

	last_commit_time: detachable DATE_TIME

feature -- Status Report

	is_dirty: BOOLEAN
			-- editable content has been changed by user actions

feature -- Events

	on_undo
		do
			undo_redo_chain.undo
		end

	on_redo
		do
			undo_redo_chain.redo
		end

	on_commit
		do
			do_commit
			is_dirty := False
			populate_commit_control
			create last_commit_time.make_now
		end

feature {NONE} -- Implementation

	ev_undo_button: detachable EV_TOOL_BAR_BUTTON
		note
			option: stable
		attribute
		end

	ev_redo_button: detachable EV_TOOL_BAR_BUTTON
		note
			option: stable
		attribute
		end

	ev_commit_button: detachable EV_TOOL_BAR_BUTTON
		note
			option: stable
		attribute
		end

	undo_redo_chain: detachable UNDO_REDO_CHAIN
		note
			option: stable
		attribute
		end

	update_undo_redo_controls
			-- set undo/redo buttons appropriately
		do
			if attached last_commit_time as lct and then undo_redo_chain.last_action_time > lct then
				is_dirty := True
			end
			populate_undo_redo_controls
		end

	populate_undo_redo_controls
			-- set undo/redo and commit controls appropriately
		do
			-- undo/redo buttons
			check attached ev_undo_button and attached ev_redo_button end
			if attached undo_redo_chain then
				if undo_redo_chain.has_undos then
					tool_bar.activate_tool_bar_button (ev_undo_button)
				else
					tool_bar.deactivate_tool_bar_button (ev_undo_button)
				end
				if undo_redo_chain.has_redos then
					tool_bar.activate_tool_bar_button (ev_redo_button)
				else
					tool_bar.deactivate_tool_bar_button (ev_redo_button)
				end
			else
				tool_bar.deactivate_tool_bar_button (ev_undo_button)
				tool_bar.deactivate_tool_bar_button (ev_redo_button)
			end

			-- commit button
			populate_commit_control
		end

	populate_commit_control
		do
			check attached ev_commit_button end
			if is_dirty then
				tool_bar.activate_tool_bar_button (ev_commit_button)
			else
				tool_bar.deactivate_tool_bar_button (ev_commit_button)
			end
		end

	do_commit
		deferred
		end

end


