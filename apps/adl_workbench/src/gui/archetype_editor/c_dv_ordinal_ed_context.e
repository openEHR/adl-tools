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

class C_DV_ORDINAL_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: C_DV_ORDINAL
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)
			if not arch_node.any_allowed then
				-- build the grid row
				bmm_prop_value := ed_context.rm_schema.property_definition ("DV_ORDINAL", "value")
				bmm_prop_symbol := ed_context.rm_schema.property_definition ("DV_ORDINAL", "symbol")
				bmm_prop_key := bmm_prop_value.name + " - " + bmm_prop_symbol.name
				gui_grid.add_sub_row (gui_grid_row, bmm_prop_key)
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, bmm_prop_key, Void, c_attribute_colour,
					get_icon_pixmap ("rm/generic/" + bmm_prop_value.multiplicity_key_string))
				gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, "", Void, c_constraint_colour, Void)
				value_symbol_subrow := gui_grid.last_row
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			if not arch_node.any_allowed then
				gui_grid.set_last_row (value_symbol_subrow)
				gui_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, Void, Void)
			end
		end

feature -- Modification

feature {NONE} -- Implementation

	value_symbol_subrow: EV_GRID_ROW

	object_ordinal_item_string (an_ordinal: ORDINAL; assumed_flag: BOOLEAN): STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			Result.append (an_ordinal.value.out)
			Result.append (" - ")
			Result.append (term_string (an_ordinal.symbol.terminology_id.value, an_ordinal.symbol.code_string))
			if assumed_flag then
				Result.append (" (" + get_text ("assumed_text") + ")")
			end
		end

	constraint_str: STRING
			-- string to go in constraint column
		local
			assumed_flag: BOOLEAN
		do
			create Result.make_empty
			across arch_node.items as ord_items_csr loop
				assumed_flag := arch_node.has_assumed_value and then arch_node.assumed_value.value = ord_items_csr.item.value
				Result.append_string (object_ordinal_item_string (ord_items_csr.item, assumed_flag))
				if ord_items_csr.cursor_index < arch_node.items.count then
					Result.append_string ("%N")
				end
			end
		end

	bmm_prop_key: STRING

	bmm_prop_value, bmm_prop_symbol: BMM_PROPERTY_DEFINITION

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
