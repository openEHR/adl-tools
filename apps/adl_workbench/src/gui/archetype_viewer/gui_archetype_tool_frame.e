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
			tool_bar.set_visual_appearance (2, 0)
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

			-- archetype id: namespace
			tool_bar.add_fixed_text_field ("", get_text (ec_archetype_hrid_namespace_tooltip), 120)
			check attached tool_bar.last_text_field as tf then
				ev_archetype_hrid_namespace := tf
			end

			-- archetype id: namespace separator '::'
			tool_bar.add_label ({ARCHETYPE_HRID}.namespace_separator, 8, False, False)

			-- archetype id: qualified RM class
			tool_bar.add_expanding_text_field ("", get_text (ec_archetype_hrid_qualified_rm_class_tooltip))
			check attached tool_bar.last_text_field as tf then
				ev_archetype_hrid_qualified_rm_class := tf
			end

			-- archetype id: axis separator '.'
			tool_bar.add_label ({ARCHETYPE_HRID}.axis_separator.out, 3, False, False)

			-- archetype id: concept_id
			tool_bar.add_expanding_text_field ("", get_text (ec_archetype_hrid_concept_id_tooltip))
			check attached tool_bar.last_text_field as tf then
				ev_archetype_hrid_concept_id := tf
			end

			-- archetype id: axis/version separator '.v'
			tool_bar.add_label ({ARCHETYPE_HRID}.version_axis_delimiter, 8, False, False)

			-- archetype id: version_id
			tool_bar.add_fixed_text_field ("", get_text (ec_archetype_hrid_version_id_tooltip), 70)
			check attached tool_bar.last_text_field as tf then
				ev_archetype_hrid_version_id := tf
			end

			-- separator '@'
			tool_bar.add_label ("@", 12, False, False)

			-- archetype lifecycle
			tool_bar.add_fixed_text_field ("", get_text (ec_archetype_lifecycle_tooltip), 80)
			check attached tool_bar.last_text_field as tf then
				ev_archetype_lifecycle_state := tf
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

			if show_flat_form then
				differential_view := False
				ev_flat_view_button.enable_select
			else
				differential_view := True
				ev_differential_view_button.enable_select
			end
		end

feature -- Access

	ev_archetype_hrid_namespace, ev_archetype_hrid_qualified_rm_class, ev_archetype_hrid_concept_id, ev_archetype_hrid_version_id: EV_TEXT_FIELD

	ev_archetype_lifecycle_state: EV_TEXT_FIELD

	ev_root_container: EV_VERTICAL_BOX

	ev_notebook: EV_NOTEBOOK

feature -- Events

	on_select_notebook
			-- Called by `selection_actions' of `archetype_notebook'.
		do
			if attached ev_notebook.selected_item as att_sel_item and then attached {GUI_ARCHETYPE_TARGETTED_TOOL} att_sel_item.data as arch_tool
				and attached source as src and attached selected_language as sel_lang
			then
				-- do anything required when tool becomes visible again
				arch_tool.on_selected
				set_default_tool_tab (Tool_tab_reverse_index.item (ev_notebook.item_tab (att_sel_item).text))

				-- update content if out of date in any way
				if arch_tool.can_populate (src) and then tool_populate_required (arch_tool) then
					arch_tool.populate (src, differential_view, sel_lang)
				elseif arch_tool.can_repopulate and sel_lang /= arch_tool.selected_language then
					arch_tool.repopulate_with_language (sel_lang)
				elseif arch_tool.can_repopulate  and then tool_repopulate_required (arch_tool) then
					arch_tool.repopulate
				end
			end
		end

	on_set_primary_source
		do
		end

feature -- Commands

	select_flat_view
			-- select flat view on GUI
		do
			select_view (False)
		end

	select_differential_view
			-- select differential view on GUI
		do
			select_view (True)
		end

	select_view (differential_flag: BOOLEAN)
			-- select a specific view on GUI
		do
			if differential_flag and not ev_differential_view_button.is_selected then
				ev_differential_view_button.enable_select
				set_view (True)
			elseif not differential_flag and not ev_flat_view_button.is_selected then
				ev_flat_view_button.enable_select
				set_view (False)
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
			ev_archetype_hrid_namespace.remove_text
			ev_archetype_hrid_qualified_rm_class.remove_text
			ev_archetype_hrid_concept_id.remove_text
			ev_archetype_hrid_version_id.remove_text

			ev_archetype_lifecycle_state.remove_text

			ev_adl_version_text.remove_text
			ev_language_combo.wipe_out
			ev_language_combo.remove_text
		end

	do_populate
		do
			attach_gui_context
			select_view (differential_view)

			-- populate parts of archetype_hrid
			ev_archetype_hrid_namespace.set_text (source.id.namespace_string)
			ev_archetype_hrid_qualified_rm_class.set_text (source.id.qualified_rm_class)
			ev_archetype_hrid_concept_id.set_text (source.id.concept_id)
			ev_archetype_hrid_version_id.set_text (source.id.version_id)

			populate_primary_source_indicator
			if source.is_valid then
				-- lifecycle state
				if not source.differential_archetype.artefact_type.is_overlay then
					ev_archetype_lifecycle_state.set_text (source.differential_archetype.description.lifecycle_state)
				end

				ev_adl_version_text.set_text (source.differential_archetype.adl_version)
				selected_language := source.differential_archetype.original_language.code_string
				populate_languages
			end
		end

	attach_gui_context
		require
			attached source
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

	populate_primary_source_indicator
			-- populate primary source button, which is the inverse of the is_generated flag
		do
			if source.file_mgr.is_source_generated then
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

	tool_populate_required (an_arch_tool: GUI_ARCHETYPE_TARGETTED_TOOL): BOOLEAN
			-- Return True if `an_arch_tool' should be populated from scratch
		do
			if attached source as src then
				Result := src /= an_arch_tool.source or						-- different archetype chosen
					not attached src.gui_context or							-- gui refresh forced by explicit recompile request
					differential_view /= an_arch_tool.differential_view	or	-- user has changed from flat to diff view or v.v.
					not an_arch_tool.is_populated							-- some tools are pre-populated
			end
		end

	tool_repopulate_required (an_arch_tool: GUI_ARCHETYPE_TARGETTED_TOOL): BOOLEAN
			-- Return True if `an_arch_tool' should be refreshed with its current content
		require
			an_arch_tool.is_populated
		do
			if attached source as src then
				Result :=
					an_arch_tool.last_populate_timestamp < src.last_compile_attempt_timestamp or	-- source re-compiled more recently than last populate
					an_arch_tool.last_populate_timestamp < src.last_modify_timestamp				-- source modified more recently than last populate
			end
		end

end


