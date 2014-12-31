note
	component:   "openEHR ADL Tools"
	description: "[
				 EV_GRID control for compiler error output. A preferable implementation is to separate the logical
				 (i.e. non-GUI related) list) of errors, probably in the class ARCHETYPE_COMPILER, which would make
				 it visible when built as a DLL or other component separate from the Vision GUI. To do that, it 
				 would require some way of the GUI update knowing how to add the latest entry/ies to the grid, 
				 without having to do a complete rebuild every time, which is what will happen when a complete
				 build of the archetype system is done.
				 ]"
	keywords:    "ADL"
	author:      "Peter Gummer <peter.gummer@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_ERROR_TOOL

inherit
	EV_KEY_CONSTANTS
		export
			{NONE} all;
		end

	EV_SHARED_APPLICATION
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

	ARCHETYPE_STATISTICAL_DEFINITIONS
		export
			{NONE} all
		end

	COMPILER_ERROR_TYPES
		export
			{NONE} all
		end

	SHARED_GUI_AGENTS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Col_category: INTEGER = 1
	Col_location: INTEGER = 2
	Col_message: INTEGER = 3

feature {NONE} -- Initialisation

	make (an_update_gui_with_compiler_error_counts_agent: like update_gui_with_compiler_error_counts)
			-- Create to control `a_main_window.compiler_output_grid'.
		do
			update_gui_with_compiler_error_counts := an_update_gui_with_compiler_error_counts_agent
			create categories.make_filled (Void, Err_type_valid, Err_type_warning)
			create ev_grid
			ev_grid.enable_tree
			ev_grid.disable_row_height_fixed
			ev_grid.hide_tree_node_connectors
		end

feature -- Commands

	clear
			-- Wipe out the content from `grid'.
		do
			ev_grid.wipe_out
			categories.discard_items

			ev_grid.insert_new_column (Col_category)
			ev_grid.insert_new_column (Col_location)
			ev_grid.insert_new_column (Col_message)
			ev_grid.column (Col_category).set_title ("Category")
			ev_grid.column (Col_location).set_title ("Archetype")
			ev_grid.column (Col_message).set_title ("Message")

			update_errors_tab_label
		end

	extend_and_select (ara: ARCH_LIB_ARCHETYPE)
			-- Add a node representing the errors or warnings of the archetype, if any.
		local
			gli: EV_GRID_LABEL_ITEM
			row: detachable EV_GRID_ROW
			cat_row, subrow, att_row: EV_GRID_ROW
			i, row_idx: INTEGER
		do
			remove_archetype_row_if_in_wrong_category (ara)

			if ara.compiler_error_type /= err_type_valid then
				ensure_row_for_category (ara.compiler_error_type)
				check attached categories [ara.compiler_error_type] as cat then
					cat_row := cat
				end

				from row_idx := 0; i := 1 until i /= 1 loop
					row_idx := row_idx + 1

					if row_idx <= cat_row.subrow_count then
						row := cat_row.subrow (row_idx)
						row.collapse

						if attached {ARCH_LIB_ARCHETYPE} row.data as other then
							i := ara.id.three_way_comparison (other.id)
						end
					else
						i := -1
					end
				end

				if i = -1 then
					cat_row.insert_subrow (row_idx)
					row := cat_row.subrow (row_idx)
					row.set_data (ara)
					row.collapse_actions.extend (agent ev_grid.step_to_viewable_parent_of_selected_row)
					row.insert_subrow (1)
				end

				check attached row as r then
					att_row := r
				end

				subrow := att_row.subrow (1)
				cat_row.expand
				create gli.make_with_text (utf8_to_utf32 (ara.id.physical_id))
				gli.set_pixmap (get_icon_pixmap ("archetype/" + ara.group_name))

				gli.set_tooltip (utf8_to_utf32 (ara.errors.as_string))
				gli.pointer_button_press_actions.force_extend (agent archetype_node_handler (row, ?, ?, ?))

				att_row.set_item (col_location, gli)
				att_row.expand
	--			gli.enable_select

				if gli.is_displayed then
					gli.ensure_visible
				end

				create gli.make_with_text (utf8_to_utf32 (ara.errors.as_string))
				subrow.set_item (col_message, gli)
				subrow.set_height (gli.text_height)

				if gli.is_displayed then
					gli.ensure_visible
				end

				ev_grid.column (Col_category).resize_to_content
				ev_grid.column (Col_location).resize_to_content
				ev_grid.column (Col_message).resize_to_content
			end

			update_errors_tab_label
		end

	export_library_report (xml_file_name: STRING)
			-- Export the contents of the grid and other statistics to XML file `xml_name'.
		require
			xml_file_name_valid: not xml_file_name.is_empty
		local
			err_type, i: INTEGER
			category: STRING
			message_lines: LIST [STRING]
			ns: XML_NAMESPACE
			document: XML_DOCUMENT
			processing: XML_PROCESSING_INSTRUCTION
			root, statistics_element, archetype_element: XML_ELEMENT
			attr: XML_ATTRIBUTE
			data: XML_CHARACTER_DATA
			create_category_element: PROCEDURE [ANY, TUPLE]
			pretty_printer: XML_INDENT_PRETTY_PRINT_FILTER
			xmlns_generator: XML_XMLNS_GENERATOR
			xml_op_stream: XML_FILE_OUTPUT_STREAM
			rpt_file_path: STRING
			xml_file: RAW_FILE
		do
			create ns.make_default
			create document.make
			create processing.make_last_in_document (document, "xml-stylesheet", "type=%"text/xsl%" href=%"ArchetypeRepositoryReport.xsl%"")
			create root.make_root (document, "archetype-repository-report", ns)

			create_category_element := agent (parent: XML_ELEMENT; description: STRING; count: INTEGER)
				local
					e: XML_ELEMENT
					a: XML_ATTRIBUTE
				do
					create e.make_last (parent, "category", parent.namespace)
					create a.make_last ("description", parent.namespace, description, e)
					create a.make_last ("count", parent.namespace, count.out, e)
				end

			create statistics_element.make_last (root, "statistics", ns)
			create_category_element.call ([statistics_element, "Total Archetypes", current_library.archetype_count])
			create_category_element.call ([statistics_element, "Specialised Archetypes", current_library.library_metrics.item (specialised_archetype_count)])
			create_category_element.call ([statistics_element, "Archetypes with slots", current_library.library_metrics.item (client_archetype_count)])
			create_category_element.call ([statistics_element, "Archetypes used by others", current_library.library_metrics.item (supplier_archetype_count)])

			from err_type := categories.lower until err_type = categories.upper loop
				err_type := err_type + 1
				check attached err_type_names [err_type] as etn then
					category := etn
				end
				create_category_element.call ([statistics_element, category, count_for_category (err_type)])

				if attached {EV_GRID_ROW} categories [err_type] as row then
					create_category_element.call ([root, category, row.subrow_count])
					if attached {XML_ELEMENT} root.last as category_element then
						from i := 0 until i = row.subrow_count loop
							i := i + 1

							if attached {ARCH_LIB_ARCHETYPE} row.subrow (i).data as ara then
								create archetype_element.make_last (category_element, "archetype", ns)
								create attr.make_last ("id", ns, ara.id.as_string, archetype_element)

								message_lines := ara.errors.as_string.split ('%N')
								from message_lines.start until message_lines.off loop
									if not message_lines.item.is_empty then
										create data.make_last (create {XML_ELEMENT}.make_last (archetype_element, "message", ns), message_lines.item)
									end
									message_lines.forth
								end
							end
						end
					end
				end
			end

			create xml_file.make (xml_file_name)
			xml_file.open_write
			if xml_file.is_open_write then
				create xml_op_stream.make (xml_file)
				create pretty_printer.make_null
				pretty_printer.set_output_stream (xml_op_stream)
				create xmlns_generator.set_next (pretty_printer)
				document.process_to_events (xmlns_generator)
				xml_file.close

				rpt_file_path := file_system.pathname (file_system.dirname (xml_file_name), Report_css_template_filename)
				file_system.copy_file (Report_css_template_path, rpt_file_path)
				file_system.copy_file (extension_replaced (Report_css_template_path, ".xsl"), extension_replaced (rpt_file_path, ".xsl"))
			end
		end

feature -- Access

	ev_grid: EV_GRID_KBD_MOUSE

	parse_error_count: INTEGER
			-- Number of parser errors.
		do
			Result := count_for_category (err_type_parse_error)
		end

	validity_error_count: INTEGER
			-- Number of parser errors.
		do
			Result := count_for_category (err_type_validity_error)
		end

	warning_count: INTEGER
			-- Number of parser errors.
		do
			Result := count_for_category (err_type_warning)
		end

feature {NONE} -- Implementation

	update_gui_with_compiler_error_counts: PROCEDURE [ANY, TUPLE [INTEGER, INTEGER, INTEGER]]
			-- agent provided by upper GUI for providing feedback about current error counts

	update_errors_tab_label
			-- On the Errors tab, indicate parse errors, validity errors and warnings.
		do
			if attached update_gui_with_compiler_error_counts then
				update_gui_with_compiler_error_counts.call ([parse_error_count, validity_error_count, warning_count])
			end
		end

	ensure_row_for_category (err_type: INTEGER)
			-- Insert a row into `grid' representing `err_type', if there was no such row already.
		require
			not_too_small: err_type >= categories.lower
			not_too_big: err_type <= categories.upper
		local
			gli: EV_GRID_LABEL_ITEM
			i, row_idx: INTEGER
			row: EV_GRID_ROW
		do
			if categories [err_type] = Void then
				from
					i := categories.upper
					row_idx := ev_grid.row_count + 1
				until
					i = err_type
				loop
					if categories [i] /= Void then
						row_idx := categories [i].index
					end

					i := i - 1
				end

				ev_grid.insert_new_row (row_idx)
				row := ev_grid.row (row_idx)
				row.set_data (err_type)
				row.collapse_actions.extend (agent ev_grid.step_to_viewable_parent_of_selected_row)
				check attached err_type_names [err_type] as etn then
					create gli.make_with_text (utf8_to_utf32 (etn))
				end
				check attached err_type_keys [err_type] as etk then
					gli.set_pixmap (get_icon_pixmap ("tool/" + etk))
				end

				row.set_item (col_category, gli)
				categories [err_type] := row
			end
		ensure
			category_row_attached: attached categories [err_type]
		end

	remove_archetype_row_if_in_wrong_category (ara: ARCH_LIB_ARCHETYPE)
			-- Remove the row representing `ara' from `grid' if it is under the wrong category.
		local
			cat_row, row: detachable EV_GRID_ROW
			row_idx: INTEGER
		do
			from row_idx := ev_grid.row_count until row_idx = 0 loop
				row := ev_grid.row (row_idx)
				row_idx := row_idx - 1

				if attached {ARCH_LIB_ARCHETYPE} row.data as other then
					if ara.id.is_equal (other.id) then
						row_idx := 0
						cat_row := row.parent_row

						if cat_row /= categories [ara.compiler_error_type] then
							if cat_row.subrow_count > 1 then
								ev_grid.remove_row (row.index)
							else
								ev_grid.remove_row (cat_row.index)

								if attached {INTEGER_REF} cat_row.data as i then
									categories [i.item] := Void
								end
							end
						end
					end
				end
			end
		end

	count_for_category (err_type: INTEGER): INTEGER
			-- Number of parser errors.
		require
			not_too_small: err_type >= categories.lower
			not_too_big: err_type <= categories.upper
		do
			if attached {EV_GRID_ROW} categories [err_type] as row then
				Result := row.subrow_count
			end
		end

	categories: ARRAY [detachable EV_GRID_ROW]
			-- Rows containing category grouper in column 1.

	archetype_node_handler (ev_ti: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {ARCH_LIB_ARCHETYPE} ev_ti.data as aca then
				create menu
				create an_mi.make_with_text_and_action (get_msg (ec_display_in_active_tab, Void), agent display_context_selected_archetype_in_active_tool (ev_ti))
				an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_tool"))
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action (get_msg (ec_display_in_new_tab, Void), agent display_context_selected_archetype_in_new_tool (ev_ti))
				an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_tool_new"))
				menu.extend (an_mi)

				menu.show
			end
		end

	display_context_selected_archetype_in_active_tool (ev_ti: EV_GRID_ROW)
		do
			ev_ti.enable_select
			if attached {ARCH_LIB_ARCHETYPE} ev_ti.data as aca then
				gui_agents.select_archetype_agent.call ([aca])
			end
		end

	display_context_selected_archetype_in_new_tool (ev_ti: EV_GRID_ROW)
		do
			ev_ti.enable_select
			if attached {ARCH_LIB_ARCHETYPE} ev_ti.data as aca then
				gui_agents.select_archetype_in_new_tool_agent.call ([aca])
			end
		end

end


