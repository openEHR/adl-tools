note
	component:   "openEHR Archetype Project"
	description: "Editor context interface for EXPR_LEAF node"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EXPR_LEAF_ED_CONTEXT

inherit
	EXPR_ITEM_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: EXPR_LEAF

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			gui_grid := a_gui_grid
			gui_grid.add_sub_row (parent.gui_grid_row, arch_node)
			gui_grid_row := gui_grid.last_row
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			gui_grid.set_last_row_label_col (Rules_grid_col_expr_type, meaning, Void, c_meaning_colour, c_pixmap)
		end

feature {NONE} -- Implementation

	meaning: STRING
			-- generate useful string representatoin for meaning column
		local
			last_node_id: STRING
			og_path: OG_PATH
		do
			create Result.make_empty
			if arch_node.is_archetype_definition_ref then
				create og_path.make_from_string (arch_node.item.out)
				last_node_id := og_path.last_object_node_id
				if not last_node_id.is_empty then
					Result.append (ed_context.flat_ontology.term_definition (display_settings.language, last_node_id).text)
				else
					Result.append (arch_node.item.out)
				end
			elseif arch_node.is_constraint and attached {C_CODE_PHRASE} arch_node.item as c_cp then
				Result.append (c_code_phrase_str (c_cp))
			else
				Result.append (arch_node.as_string)
			end
		end

	c_pixmap: EV_PIXMAP
		local
			pixmap_name: STRING
		do
			pixmap_name := Pixmap_path + "operands" + resource_path_separator + arch_node.type
			if has_icon_pixmap (pixmap_name) then
				Result := get_icon_pixmap (pixmap_name)
			else
				pixmap_name := rm_icon_dir + resource_path_separator + ed_context.rm_schema.rm_publisher + resource_path_separator + arch_node.type
				if has_icon_pixmap (pixmap_name) then
					Result := get_icon_pixmap (pixmap_name)
				else
					pixmap_name := "am" + resource_path_separator + "added" + resource_path_separator + arch_node.type
					if has_icon_pixmap (pixmap_name) then
						Result := get_icon_pixmap (pixmap_name)
					end
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
