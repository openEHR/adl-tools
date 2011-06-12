note
	component:   "openEHR Archetype Project"
	description: "Archetype notebook"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_ARCH_NOTEBOOK_CONTROL

inherit
	CONSTANTS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY

create
	make

feature {NONE}-- Initialization

	make (a_main_window: attached MAIN_WINDOW)
		do
			gui := a_main_window

			archetype_notebook := a_main_window.archetype_notebook

			-- create widgets
			create source_rich_text
			create dadl_rich_text
			create xml_rich_text

			-- connect widgets
			archetype_notebook.extend (description_controls.notebook)
			archetype_notebook.extend (node_map_control.hbox)
			archetype_notebook.extend (path_map_control.hbox)
			archetype_notebook.extend (slot_map_control.ev_slots_vbox)
			archetype_notebook.extend (ontology_controls.vbox)
			archetype_notebook.extend (annotations_control.grid)
			archetype_notebook.extend (source_rich_text)
			archetype_notebook.extend (dadl_rich_text)
			archetype_notebook.extend (xml_rich_text)

			-- set visual characteristics
			archetype_notebook.set_minimum_width (app_min_width)
			archetype_notebook.set_minimum_height (arch_notebook_min_height)

			archetype_notebook.set_item_text (description_controls.notebook, "Description")
			archetype_notebook.item_tab (description_controls.notebook).set_pixmap (pixmaps ["description"])

			archetype_notebook.set_item_text (node_map_control.hbox, "Definition")
			archetype_notebook.item_tab (node_map_control.hbox).set_pixmap (pixmaps ["node_map"])

			archetype_notebook.set_item_text (path_map_control.hbox, "Paths")
			archetype_notebook.item_tab (path_map_control.hbox).set_pixmap (pixmaps ["paths"])

			archetype_notebook.set_item_text (slot_map_control.ev_slots_vbox, "Slots")
			archetype_notebook.item_tab (slot_map_control.ev_slots_vbox).set_pixmap (pixmaps ["archetype_slot"])

			archetype_notebook.set_item_text (ontology_controls.vbox, "Terminology")
			archetype_notebook.item_tab (ontology_controls.vbox).set_pixmap (pixmaps ["terminology"])

			archetype_notebook.set_item_text (annotations_control.grid, "Annotations")
			archetype_notebook.item_tab (annotations_control.grid).set_pixmap (pixmaps ["annotations"])

			archetype_notebook.set_item_text (source_rich_text, "ADL (adls)")
			archetype_notebook.item_tab (source_rich_text).set_pixmap (pixmaps ["diff"])

			archetype_notebook.set_item_text (dadl_rich_text, "dADL")
			archetype_notebook.set_item_text (xml_rich_text, "XML")

			source_rich_text.disable_edit
			source_rich_text.set_tab_width ((source_rich_text.tab_width/2).floor)  -- this is in pixels, and assumes 7-pixel wide chars

			dadl_rich_text.disable_edit
			dadl_rich_text.set_tab_width ((source_rich_text.tab_width/2).floor)

			xml_rich_text.disable_edit

			set_tab_texts

			-- set events: press Enter on Slots map trees
			slot_map_control.suppliers_tree.key_press_actions.force (agent on_slot_map_suppliers_tree_key_press)
			slot_map_control.clients_tree.key_press_actions.force (agent on_slot_map_clients_tree_key_press)
			slot_map_control.suppliers_tree.pointer_double_press_actions.force (agent on_slot_map_suppliers_tree_double_click)
			slot_map_control.clients_tree.pointer_double_press_actions.force (agent on_slot_map_clients_tree_double_click)

			-- set events: select a notebook tab
			archetype_notebook.selection_actions.extend (agent on_select_archetype_notebook)

			-- set events: path map
			path_map_control.path_list.key_press_actions.extend (agent on_path_map_key_press)

		end

feature -- Access

	gui: MAIN_WINDOW
			-- FIXME keep here until refactoring finished

	archetype_notebook: EV_NOTEBOOK

	description_controls: GUI_DESCRIPTION_CONTROLS
		once
			create Result.make (agent gui.on_select_all)
		end

	node_map_control: GUI_NODE_MAP_CONTROL
		once
			create Result.make (agent select_ontology_item_from_code)
		end

	path_map_control: GUI_PATH_MAP_CONTROL
		once
			create Result.make
		end

	slot_map_control: GUI_SLOT_MAP_CONTROL
		once
			create Result.make (agent update_slots_tab_label)
		end

	ontology_controls: GUI_ONTOLOGY_CONTROLS
		once
			create Result.make
		end

	annotations_control: GUI_ANNOTATIONS_CONTROL
		once
			create Result.make
		end

	source_rich_text, dadl_rich_text, xml_rich_text: EV_RICH_TEXT

	selected_path_filter: STRING
			-- currently selected filter in path map, for saving across sessions
		do
			Result := path_map_control.selected_filter
		end

	path_map_selected_columns: attached ARRAYED_LIST [STRING]
			-- currently selected path map columns, for saving across sessions
		local
			ev_items: DYNAMIC_LIST [EV_LIST_ITEM]
		do
			ev_items := path_map_control.column_check_list.checked_items
			create Result.make (0)
			from ev_items.start until ev_items.off loop
				Result.extend (ev_items.item.text.as_string_8)
				ev_items.forth
			end
		end

feature -- Events

	on_select_archetype_notebook
			-- Called by `selection_actions' of `archetype_notebook'.
		do
			if archetype_notebook.selected_item = source_rich_text then
				populate_source_text
			elseif archetype_notebook.selected_item = dadl_rich_text then
				populate_dadl_text
			elseif archetype_notebook.selected_item = xml_rich_text then
				populate_xml_text
			end
		end

	on_slot_map_suppliers_tree_key_press (key: EV_KEY)
			-- When the user presses Enter on an archetype, select it in the main window's explorer tree.
		do
			if not gui.ctrl_or_alt_or_shift_pressed then
				if key /= Void and then key.code = key_enter then
					gui.select_archetype_from_gui_data (slot_map_control.suppliers_tree.selected_item)
				end
			end
		end

	on_slot_map_clients_tree_key_press (key: EV_KEY)
			-- When the user presses Enter on an archetype, select it in the main window's explorer tree.
		do
			if not gui.ctrl_or_alt_or_shift_pressed then
				if key /= Void and then key.code = key_enter then
					gui.select_archetype_from_gui_data (slot_map_control.clients_tree.selected_item)
				end
			end
		end

	on_slot_map_suppliers_tree_double_click (x, y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- When the user double-clicks on an archetype, select it in the main window's explorer tree.
		do
			gui.select_archetype_from_gui_data (slot_map_control.suppliers_tree.selected_item)
		end

	on_slot_map_clients_tree_double_click (x, y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- When the user double-clicks on an archetype, select it in the main window's explorer tree.
		do
			gui.select_archetype_from_gui_data (slot_map_control.clients_tree.selected_item)
		end

	on_path_map_key_press (key: EV_KEY)
			-- When the user presses ctrl-C on row, copy it to clipboard
		do
			if gui.ctrl_pressed and attached key and then key.code = key_c then
				gui.copy_text_to_clipboard (path_map_control.selected_text)
			end
		end

feature -- UI Feedback

	update_slots_tab_label (slots_count, used_by_count: INTEGER)
			-- On the Slots tab, indicate the numbers of slots and used-by's.
		do
			archetype_notebook.set_item_text (slot_map_control.ev_slots_vbox, "Slots (" + slots_count.out + "/" + used_by_count.out + ")")
		end

	select_ontology_item_from_code (a_code: attached STRING)
		do
			if is_term_code (a_code) then
				ontology_controls.select_term (a_code)
			elseif is_constraint_code (a_code) then
				ontology_controls.select_constraint (a_code)
			end
		end

feature -- Commands

	clear_controls
			-- Wipe out content from visual controls.
		do
			source_rich_text.remove_text
			description_controls.clear
			node_map_control.clear
			path_map_control.clear
			ontology_controls.clear
			slot_map_control.clear
			annotations_control.clear
		end

	populate_controls
			-- Populate content from visual controls.
		require
			has_current_profile
		do
			description_controls.populate
			slot_map_control.populate
			node_map_control.populate
			path_map_control.populate
			annotations_control.populate
			ontology_controls.populate
		end

	populate_source_text
			-- Display the selected archetype's differential or flat text in `source_rich_text', optionally with line numbers.
		require
			has_current_profile
		do
			if attached {ARCH_CAT_ARCHETYPE} current_arch_cat.selected_archetype as ara then
				if not differential_view then
					if ara.is_valid then
						populate_source_text_with_line_numbers (ara.flat_text)
					elseif ara.has_legacy_flat_file then
						populate_source_text_with_line_numbers (ara.legacy_flat_text)
					else -- not valid, but derived from differential source
						source_rich_text.set_text (create_message_line ("compiler_no_flat_text", <<>>))
					end
				elseif ara.has_differential_file then
					populate_source_text_with_line_numbers (ara.differential_text)
				else
					source_rich_text.set_text (create_message_line ("compiler_no_source_text", <<>>))
				end
			else
				source_rich_text.remove_text
			end
		end

	populate_dadl_text
			-- Display the selected archetype's differential or flat text in `dadl_rich_text', in dADL format.
		require
			has_current_profile
		do
			if attached {ARCH_CAT_ARCHETYPE} current_arch_cat.selected_archetype as ara then
				if ara.is_valid then
					if differential_view then
						dadl_rich_text.set_text (utf8 (ara.differential_text_dadl))
					else
						dadl_rich_text.set_text (utf8 (ara.flat_text_dadl))
					end
				else
					dadl_rich_text.set_text (create_message_line ("compiler_no_dadl_text", <<>>))
				end
			else
				dadl_rich_text.remove_text
			end
		end

	populate_xml_text
			-- Display the selected archetype's differential or flat text in `dadl_xml_text', in XML format.
		require
			has_current_profile
		do
			if attached {ARCH_CAT_ARCHETYPE} current_arch_cat.selected_archetype as ara then
				if ara.is_valid then
					if differential_view then
						xml_rich_text.set_text (utf8 (ara.differential_text_xml))
					else
						xml_rich_text.set_text (utf8 (ara.flat_text_xml))
					end
				else
					xml_rich_text.set_text (create_message_line ("compiler_no_xml_text", <<>>))
				end
			else
				xml_rich_text.remove_text
			end
		end

	populate_source_text_with_line_numbers (text: attached STRING)
			-- Display `text' in `source_rich_text', optionally with each line preceded by line numbers.
		local
			s: STRING
			len, left_pos, right_pos, number: INTEGER
		do
			if show_line_numbers then
				from
					len := text.count
					create s.make (len)
					left_pos := 1
					number := 1
				until
					left_pos > len
				loop
					s.append (number.out)

					if number < 1000 then
						s.append ("%T")
					end

					s.append (" ")

					right_pos := text.index_of ('%N', left_pos)

					if right_pos = 0 then
						right_pos := len
					end

					s.append (text.substring (left_pos, right_pos))
					left_pos := right_pos + 1
					number := number + 1
				end
			else
				s := text
			end

			source_rich_text.set_text (utf8 (s))
		end

	set_tab_texts
			-- set taxt on tabs depending on view
		local
			tab_text, str: STRING
		do
			-- source tab text
			tab_text := "ADL ("
			if differential_view then
				str := archetype_source_file_extension.twin
			else
				str := archetype_flat_file_extension.twin
			end
			str.prune_all_leading ('.')
			tab_text.append (str)
			tab_text.append_character (')')
			archetype_notebook.item_tab (source_rich_text).set_text (tab_text)

			-- dadl_tab_text
			if differential_view then
				archetype_notebook.item_tab (dadl_rich_text).set_text ("dADL (src)")
			else
				archetype_notebook.item_tab (dadl_rich_text).set_text ("dADL (flat)")
			end

			-- xml_tab_text
			if differential_view then
				archetype_notebook.item_tab (xml_rich_text).set_text ("XML (src)")
			else
				archetype_notebook.item_tab (xml_rich_text).set_text ("XML (flat)")
			end
		end

end
