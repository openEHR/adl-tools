note
	component:   "openEHR Archetype Project"
	description: "Editor context interface for an EXPR_BINARY_OPERATOR"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EXPR_BINARY_OP_ED_CONTEXT

inherit
	EXPR_OPERATOR_ED_CONTEXT
		redefine
			arch_node, display_in_grid
		end

create
	make

feature -- Access

	arch_node: EXPR_BINARY_OPERATOR

	left_operand_ed_context: detachable EXPR_ITEM_ED_CONTEXT

	right_operand_ed_context: detachable EXPR_ITEM_ED_CONTEXT

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			gui_grid := a_gui_grid
			gui_grid.add_sub_row (parent.gui_grid_row, arch_node)
			gui_grid_row := gui_grid.last_row

			left_operand_ed_context.prepare_display_in_grid (gui_grid)
			right_operand_ed_context.prepare_display_in_grid (gui_grid)
		end

	display_in_grid (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag: BOOLEAN; a_lang: STRING)
		do
			precursor (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag, a_lang)
			left_operand_ed_context.display_in_grid (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag, a_lang)
			right_operand_ed_context.display_in_grid (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag, a_lang)

			gui_grid.set_last_row (gui_grid_row)
			gui_grid.set_last_row_label_col (Rules_grid_col_expr_type, Void, Void, Void, c_pixmap)
		end

feature -- Modification

	set_left_operand_ed_context (an_ed_context: EXPR_ITEM_ED_CONTEXT)
		do
			left_operand_ed_context := an_ed_context
			an_ed_context.set_parent (Current)
		end

	set_right_operand_ed_context (an_ed_context: EXPR_ITEM_ED_CONTEXT)
		do
			right_operand_ed_context := an_ed_context
			an_ed_context.set_parent (Current)
		end

feature {EXPR_ITEM_ED_CONTEXT} -- Implementation

	meaning: STRING
			-- generate useful string representatoin for meaning column
		local
			precedence_overridden: BOOLEAN
		do
			create Result.make_empty
			if attached {EXPR_OPERATOR} arch_node.parent as parent_op then
				precedence_overridden := parent_op.precedence_overrides (arch_node)
			end
			if precedence_overridden then
				Result.append_character ('(')
			end
			Result.append (left_operand_ed_context.meaning)
			Result.append (" " + arch_node.operator.out + " ")
			Result.append (right_operand_ed_context.meaning)
			if precedence_overridden then
				Result.append_character (')')
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
