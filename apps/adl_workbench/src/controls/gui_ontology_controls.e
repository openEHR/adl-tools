indexing
	component:   "openEHR Archetype Project"
	description: "Populate ontology controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_ONTOLOGY_CONTROLS

inherit
	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
		end

	SHARED_APPLICATION_CONTEXT
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW) is
		require
			a_main_window /= Void
		do
			gui := a_main_window
   			gui.ontology_notebook.set_minimum_height(gui.Status_area_min_height)
			in_differential_mode := True
		end

feature -- Status

	in_differential_mode: BOOLEAN
			-- True if visualisation should show contents of differential archetype, else flat archetype

feature -- Commands

	clear is
			-- wipe out content from ontology-related controls
		do
			gui.ontology_term_definitions_multi_column_list.wipe_out
			gui.ontology_constraint_definitions_multi_column_list.wipe_out
		end

	populate is
			-- populate ontology controls
		do
			clear

			if archetype_directory.has_valid_selected_archetype then
				populate_term_definitions
				populate_constraint_definitions
			end
		end

	set_differential_view
			-- Set `in_differential_mode' on.
		do
			in_differential_mode := True
			populate
		end

	set_flat_view
			-- Set `in_differential_mode' off.
		do
			in_differential_mode := False
			populate
		end

	select_term(a_term_code: STRING) is
			-- select row for a_term_code in term_definitions control
		do
			select_coded_term_row (a_term_code, gui.ontology_term_definitions_multi_column_list)
		end

	select_constraint(a_term_code: STRING) is
			-- select row for a_term_code in term_definitions control
		do
			select_coded_term_row (a_term_code, gui.ontology_constraint_definitions_multi_column_list)
		end

feature {NONE} -- Implementation

	target_archetype: ARCHETYPE is
			-- differential or flat version of archetype, depending on setting of `in_differential_mode'
		require
			archetype_directory.has_selected_archetype
		do
			if in_differential_mode then
				Result := archetype_directory.selected_archetype.differential_archetype
			else
				Result := archetype_directory.selected_archetype.flat_archetype
			end
		end

	gui: MAIN_WINDOW
			-- main window of system

	ontology: !ARCHETYPE_ONTOLOGY is
			-- access to ontology of selected archetype
		require
			archetype_selected: archetype_directory.has_selected_archetype
		do
			Result := target_archetype.ontology
		end

	populate_term_definitions is
			-- Populate the Term Definitions list.
		require
			archetype_selected: archetype_directory.has_selected_archetype
		local
			col_titles: ARRAYED_LIST[STRING]
			pl: EV_MULTI_COLUMN_LIST
			list_row: EV_MULTI_COLUMN_LIST_ROW
			a_term: ARCHETYPE_TERM
			i: INTEGER
		do
			-- populate column titles
			pl := gui.ontology_term_definitions_multi_column_list
			create col_titles.make(0)
			col_titles.extend("code")
--			col_titles.extend("text")
			from
				ontology.term_attribute_names.start
			until
				ontology.term_attribute_names.off
			loop
--				if not ontology.term_attribute_names.item.is_equal("text") then
					col_titles.extend (ontology.term_attribute_names.item)
--				end
				ontology.term_attribute_names.forth
			end

			from
				ontology.terminologies_available.start
			until
				ontology.terminologies_available.off
			loop
				col_titles.extend (utf8 (ontology.terminologies_available.item))
				ontology.terminologies_available.forth
			end
			pl.set_column_titles(col_titles)

			-- populate data
			from
				ontology.term_codes.start
			until
				ontology.term_codes.off
			loop
				create list_row
				list_row.extend (utf8 (ontology.term_codes.item))
				a_term := ontology.term_definition(current_language, ontology.term_codes.item)
--				list_row.extend (a_term.item ("text"))

				from
					ontology.term_attribute_names.start
				until
					ontology.term_attribute_names.off
				loop
--					if not ontology.term_attribute_names.item.is_equal("text") and a_term.has_key (ontology.term_attribute_names.item) then					
					if a_term.has_key (ontology.term_attribute_names.item) then
						list_row.extend (utf8 (a_term.item(ontology.term_attribute_names.item)))
					else
						list_row.extend (" - ")
					end
					ontology.term_attribute_names.forth
				end

				-- populate bindings
				from
					ontology.terminologies_available.start
				until
					ontology.terminologies_available.off
				loop
					if ontology.has_term_binding (ontology.terminologies_available.item, a_term.code) then
						list_row.extend (utf8 (ontology.term_binding (
							ontology.terminologies_available.item, a_term.code
						).as_string))
					else
						list_row.extend(" - ")
					end
					ontology.terminologies_available.forth
				end

				pl.extend(list_row)
				ontology.term_codes.forth
			end

			from
				i := 1
			until
				i > pl.column_count
			loop
				pl.resize_column_to_content(i)
				i := i + 1
			end
		end

	populate_constraint_definitions is
			-- Populate the Constraint Definitions list
		require
			archetype_selected: archetype_directory.has_selected_archetype
		local
			col_titles: ARRAYED_LIST[STRING]
			pl: EV_MULTI_COLUMN_LIST
			list_row: EV_MULTI_COLUMN_LIST_ROW
			a_term: ARCHETYPE_TERM
			i: INTEGER
		do
			-- build columns
			pl := gui.ontology_constraint_definitions_multi_column_list
			create col_titles.make(0)
			col_titles.extend("code")
--			col_titles.extend("text")
			from
				ontology.term_attribute_names.start
			until
				ontology.term_attribute_names.off
			loop
--				if not ontology.term_attribute_names.item.is_equal("text") then
					col_titles.extend (ontology.term_attribute_names.item)
--				end
				ontology.term_attribute_names.forth
			end

			from
				ontology.terminologies_available.start
			until
				ontology.terminologies_available.off
			loop
				col_titles.extend (utf8 (ontology.terminologies_available.item))
				ontology.terminologies_available.forth
			end

			pl.set_column_titles(col_titles)
			from
				ontology.constraint_codes.start
			until
				ontology.constraint_codes.off
			loop
				create list_row

				-- populate constraint codes
				list_row.extend (utf8 (ontology.constraint_codes.item))
				a_term := ontology.constraint_definition(current_language, ontology.constraint_codes.item)
--				list_row.extend (utf8 (a_term.item ("text")))
				from
					ontology.term_attribute_names.start
				until
					ontology.term_attribute_names.off
				loop
--					if not ontology.term_attribute_names.item.is_equal("text")  and a_term.has_key (ontology.term_attribute_names.item) then
					if a_term.has_key (ontology.term_attribute_names.item) then
						list_row.extend (utf8 (a_term.item (ontology.term_attribute_names.item)))
					else
						list_row.extend (" - ")
					end
					ontology.term_attribute_names.forth
				end

				-- populate bindings
				from
					ontology.terminologies_available.start
				until
					ontology.terminologies_available.off
				loop
					if ontology.has_constraint_binding (ontology.terminologies_available.item, a_term.code) then
						list_row.extend (utf8 (ontology.constraint_binding(
							ontology.terminologies_available.item, a_term.code).as_string))
					else
						list_row.extend(" - ")
					end
					ontology.terminologies_available.forth
				end

				pl.extend(list_row)
				ontology.constraint_codes.forth
			end

			from i := 1
			until i > pl.column_count
			loop pl.resize_column_to_content(i)
				i := i + 1
			end

		end

	select_coded_term_row (a_term_code: STRING; list_control: EV_MULTI_COLUMN_LIST) is
			-- Select the row for `a_term_code' in `list_control'.
		do
			list_control.remove_selection

			from
				list_control.start
			until
				list_control.off
			loop
				if list_control.item.first.is_equal (a_term_code) then
					list_control.item.enable_select

					if list_control.is_displayed then
						list_control.ensure_item_visible (list_control.item)
					end
				end

				list_control.forth
			end
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
--| The Original Code is adl_ontology_controls.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
