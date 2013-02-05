note
	component:   "openEHR Archetype Project"
	description: "Editor context for an ASSERTION. One will be needed for each ASSERTION in an archetype."
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ASSERTION_ED_CONTEXT

inherit
	EXPR_ITEM_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: ASSERTION
			-- assertion being edited

	expression_context: detachable EXPR_ITEM_ED_CONTEXT
			-- the editor context for `arch_node'.expression

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			gui_grid := a_gui_grid

			-- create a new row
			gui_grid.add_row (arch_node)
			gui_grid_row := gui_grid.last_row

			expression_context.prepare_display_in_grid (gui_grid)
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			s: STRING
		do
			precursor (ui_settings)
			expression_context.display_in_grid (ui_settings)

			create s.make_empty
			if attached arch_node.tag then
				s.append (arch_node.tag)
			end
			gui_grid.set_last_row (gui_grid_row)
			gui_grid.set_last_row_label_col (rules_grid_col_expr_type, s, Void, c_meaning_colour, c_pixmap)
			gui_grid.set_last_row_label_col (rules_grid_col_expr_value, meaning, Void, c_meaning_colour, Void)
		end

feature -- Modification

	set_expression_context (an_ed_context: like expression_context)
		do
			expression_context := an_ed_context
			expression_context.set_parent (Current)
		end

feature {EXPR_ITEM_ED_CONTEXT} -- Implementation

	meaning: STRING
			-- generate useful string representatoin for meaning column
		do
			create Result.make_empty
			Result.append (expression_context.meaning)
		end

	c_pixmap: EV_PIXMAP
		do
			Result := get_icon_pixmap (Pixmap_path + "operators" + resource_path_separator + "assertion")
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
