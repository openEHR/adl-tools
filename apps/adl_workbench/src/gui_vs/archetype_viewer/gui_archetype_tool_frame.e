note
	component:   "openEHR ADL Tools"
	description: "[
				 Archetype common tool frame for archetype tools and editors. The Frame consists of the 
				 toolbar containing widgets for:
				 	- is_generated flag
				 	- archetype id, 
				 	- flat/differential controls, 
				 	- language combo, 
				 	- and ADL version indicator.
				 Additionally there is a notebook for the main content.
				 ]"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GUI_ARCHETYPE_TOOL_FRAME

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL

	SHARED_GUI_ARCHETYPE_TOOL_AGENTS
		export
			{NONE} all
		end

feature -- Definitions

	arch_notebook_min_height: INTEGER = 350

	arch_notebook_min_width: INTEGER = 500

feature {NONE}-- Initialization

	make
		do
			-- create root widget
			create ev_root_container

			-- text field handling
			create text_widget_handler.set_root (ev_root_container)

			-- connect toolbar to parent widget
			create tool_bar.make
			ev_root_container.extend (tool_bar.ev_root_container)
			ev_root_container.disable_item_expand (tool_bar.ev_root_container)

			-- toolbar
			tool_bar.add_tool_bar

			-- archetype set-to-primary-source button (= not is_generated flag)
			tool_bar.add_tool_bar_button (get_icon_pixmap ("tool/edit_active"), get_icon_pixmap ("tool/edit_inactive"),
				get_text (ec_archetype_is_primary_source_button_text), Void)
			check attached tool_bar.last_tool_bar_button as tb then
				ev_primary_source_button := tb
			end

			-- if editing, add undo and redo buttons; need to do this here to insert the controls
			-- in the right visual location
			if can_edit then
				add_editing_controls
			end

			-- archetype id
			tool_bar.add_expanding_text_field ("", "")
			check attached tool_bar.last_text_field as tf then
				ev_archetype_id := tf
			end

			-- diff/flat 'View' label + diff & flat controls
			tool_bar.add_tool_bar_with_title (get_msg (ec_diff_flat_form_label, Void))
			tool_bar.add_tool_bar_radio_button (get_icon_pixmap ("tool/diff_class"),
				get_text (ec_differential_view_button_tooltip), agent on_differential_view)
			check attached tool_bar.last_tool_bar_radio_button as tbrb then
				ev_differential_view_button := tbrb
			end
			tool_bar.add_tool_bar_radio_button (get_icon_pixmap ("tool/flat_class"),
				get_text (ec_flat_view_button_tooltip), agent on_flat_view)
			check attached tool_bar.last_tool_bar_radio_button as tbrb then
				ev_flat_view_button := tbrb
			end

			-- add language combo box
			tool_bar.add_fixed_combo_box (get_msg (ec_language_label, Void),
				get_msg (ec_language_combo_tooltip, Void), 60, agent on_select_language)
			check attached tool_bar.last_combo_box as cb then
				ev_language_combo := cb
			end

			-- add version text field
			tool_bar.add_titled_label (get_msg (ec_adl_version_label_text, Void), "",
				get_msg (ec_adl_version_label_tooltip, Void), 30)
			check attached tool_bar.last_label as lb then
				ev_adl_version_text := lb
			end

			-- main content area
			create ev_notebook
			ev_root_container.extend (ev_notebook)
			ev_notebook.set_minimum_width (arch_notebook_min_width)
			ev_notebook.set_minimum_height (arch_notebook_min_height)
			ev_notebook.selection_actions.extend (agent on_select_notebook)

			differential_view := True
			ev_differential_view_button.enable_select
		end

feature -- Access

	ev_archetype_id: EV_TEXT_FIELD

	ev_root_container: EV_VERTICAL_BOX

	ev_notebook: EV_NOTEBOOK

feature -- Events

	on_select_notebook
			-- Called by `selection_actions' of `archetype_notebook'.
		do
			if attached {GUI_ARCHETYPE_TARGETTED_TOOL} ev_notebook.selected_item.data as arch_tool and attached source as src then
				-- do anything required when tool becomes visible again
				arch_tool.on_selected

				-- update content if out of date in any way
				if tool_out_of_date (arch_tool) and	arch_tool.can_populate (src) then
					arch_tool.populate (src, differential_view, selected_language)
				elseif selected_language /= arch_tool.selected_language and arch_tool.can_repopulate then
					arch_tool.repopulate_with_language (selected_language)
				elseif tool_refresh_required (arch_tool) then
					arch_tool.repopulate
				end
			end
		end

	on_set_primary_source
		do
		end

feature -- Commands

	select_flat_view
			-- Called from MAIN_WINDOW View menu
		do
			if not ev_flat_view_button.is_selected then
				ev_flat_view_button.enable_select
				set_view (False)
			end
		end

	select_differential_view
			-- Called from MAIN_WINDOW View menu
		do
			if not ev_differential_view_button.is_selected then
				ev_differential_view_button.enable_select
				set_view (True)
			end
		end

feature {NONE} -- Events

	on_flat_view
			-- Called by `select_actions' of `ev_flat_view_button' in this tool
		do
			set_view (False)
		end

	on_differential_view
			-- Called by `select_actions' of `ev_differential_view_button' in this tool
		do
			set_view (True)
		end

	set_view (differential_flag: BOOLEAN)
			-- set view one way or the other
		do
			if (differential_flag and not differential_view) or -- changing from flat to diff
				(not differential_flag and differential_view)  -- changing from diff to flat
			then
				differential_view := differential_flag
				set_view_tab_texts
				on_select_notebook
			end
		end

	on_select_language
			-- Repopulate the view of the archetype when the user selects a different language.
		do
			selected_language := ev_language_combo.text.as_string_8
			if attached {GUI_ARCHETYPE_TARGETTED_TOOL} ev_notebook.selected_item.data as arch_tool then
				arch_tool.repopulate_with_language (selected_language)
			end
		end

feature {NONE} -- Implementation

	do_clear
			-- Wipe out content from visual controls.
		do
			ev_archetype_id.remove_text
			ev_adl_version_text.remove_text
			ev_language_combo.wipe_out
			ev_language_combo.remove_text
		end

	do_populate
		do
			attach_gui_context
			if differential_view and not ev_differential_view_button.is_selected then
				ev_differential_view_button.enable_select
				set_view_tab_texts
			end
			ev_archetype_id.set_text (source.qualified_name)
			populate_primary_source
			if source.is_valid then
				ev_adl_version_text.set_text (source.differential_archetype.adl_version)
				selected_language := source.differential_archetype.original_language.code_string
				populate_languages
			end
		end

	attach_gui_context
		deferred
		end

	text_widget_handler: EVX_TEXT_WIDGET_HANDLER
			-- FIXME: this is a hack to get round lack of standard behaviour in Vision2 for
			-- focussed text widgets & cut & paste behaviours

	tool_bar: EVX_TOOL_BAR

	ev_differential_view_button, ev_flat_view_button: EV_TOOL_BAR_RADIO_BUTTON

	ev_primary_source_button: EV_TOOL_BAR_BUTTON

	ev_adl_version_text: EV_LABEL

	ev_language_combo: EV_COMBO_BOX

	populate_primary_source
			-- populate primary source button, which is the inverse of the is_generated flag
		do
			if source.differential_generated then
				tool_bar.deactivate_tool_bar_button (ev_primary_source_button)
			else
				tool_bar.activate_tool_bar_button (ev_primary_source_button)
			end
		end

	populate_languages
			-- Populate `language_combo' in the toolbar for currently selected archetype
		require
			source.is_valid
		do
			ev_language_combo.select_actions.block
			ev_language_combo.set_strings (source.differential_archetype.languages_available)
			ev_language_combo.do_all (agent (li: EV_LIST_ITEM) do if li.text.same_string (selected_language) then li.enable_select end end)
			ev_language_combo.select_actions.resume
		end

	set_view_tab_texts
			-- set text on tabs depending on flat / differential view
		do
			-- serialised rich text tab
			if differential_view then
				set_differential_tab_texts
			else
				set_flat_tab_texts
			end
		end

	set_differential_tab_texts
			-- set text on tabs for differential form of archetype
		do
		end

	set_flat_tab_texts
			-- set text on tabs for flat form of archetype
		do
		end

	add_editing_controls
		do
		end

	tool_out_of_date (an_arch_tool: GUI_ARCHETYPE_TARGETTED_TOOL): BOOLEAN
			-- Return True if `an_arch_tool' should be populated from scratch
		do
			if attached source as src then
				Result := src /= an_arch_tool.source or else													-- different archetype chosen
					not an_arch_tool.is_populated or else											-- some tools are pre-populated
					an_arch_tool.last_populate_timestamp < src.last_compile_attempt_timestamp or	-- source re-compiled more recently than last populate
					an_arch_tool.last_populate_timestamp < src.last_modify_timestamp or				-- source modified more recently than last populate
					differential_view /= an_arch_tool.differential_view								-- user has changed from flat to diff view or v.v.
			end
		end

	tool_refresh_required (an_arch_tool: GUI_ARCHETYPE_TARGETTED_TOOL): BOOLEAN
			-- Return True if `an_arch_tool' should be refreshed with its current content
		do
			Result := False
		end

end


