note
	component:   "openEHR Archetype Project"
	description: "Editor context for a C_PRMITIVE_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_CODE_PHRASE_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: C_CODE_PHRASE
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		local
			bmm_prop: BMM_PROPERTY_DEFINITION
		do
			precursor (a_gui_grid)

			-- build the grid row for terminology id
			if attached arch_node.terminology_id then
				bmm_prop := rm_schema.property_definition ("CODE_PHRASE", "terminology_id")
				gui_grid.add_sub_row (gui_grid_row, bmm_prop.name)
				gui_grid.set_last_row_label_col (Node_grid_col_rm_name, bmm_prop.name, Void, c_attribute_colour, get_icon_pixmap ("rm/generic/" + bmm_prop.multiplicity_key_string))
				gui_grid.set_last_row_label_col (Node_grid_col_constraint, arch_node.terminology_id.value, Void, c_constraint_colour, Void)
			end

			-- code_string field
			if attached arch_node.code_list then
				bmm_code_string_prop := rm_schema.property_definition ("CODE_PHRASE", "code_string")
				gui_grid.add_sub_row (gui_grid_row, bmm_code_string_prop.name)
				gui_grid.set_last_row_label_col (Node_grid_col_rm_name, bmm_code_string_prop.name, Void, c_attribute_colour,
					get_icon_pixmap ("rm/generic/" + bmm_code_string_prop.multiplicity_key_string))
				gui_grid.set_last_row_label_col_multi_line (Node_grid_col_constraint, constraint_str, Void, c_constraint_colour, Void)
			end
		end

	display_in_grid (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag: BOOLEAN; a_lang: STRING)
		local
			i: INTEGER
		do
			precursor (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag, a_lang)

			-- code_string field update
			if attached arch_node.code_list then
				from i := 1 until i > gui_grid_row.subrow_count loop
					if attached {STRING} gui_grid_row.subrow (i).data as str and then str.is_equal (bmm_code_string_prop.name) then
						gui_grid.set_last_row (gui_grid_row.subrow (i))
						gui_grid.update_last_row_label_col (Node_grid_col_constraint, constraint_str, Void, Void, Void)
						i := gui_grid_row.subrow_count + 1
					end
					i := i + 1
				end
			end
		end

feature -- Modification

feature {NONE} -- Implementation

	bmm_code_string_prop: BMM_PROPERTY_DEFINITION

	constraint_str: STRING
		do
			create Result.make_empty
			across arch_node.code_list as codes_csr loop
				Result.append_string (term_string (arch_node.terminology_id.value, codes_csr.item))
				if arch_node.has_assumed_value and then arch_node.assumed_value.code_string.is_equal (codes_csr.item) then
					Result.append (" (" + get_text ("assumed_text") + ")")
				end
				if codes_csr.cursor_index < arch_node.code_list.count then
					Result.append_string ("%N")
				end
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
--| The Original Code is arch_ed_context.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
