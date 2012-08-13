note
	component:   "openEHR Archetype Project"
	description: "Editor context for an ARCHETYPE_SLOT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_SLOT_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, c_pixmap, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: ARCHETYPE_SLOT
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		local
			constraint_str: STRING
		do
			precursor (a_gui_grid)

			-- add closed indicator in constraint column
			if arch_node.is_closed then
				gui_grid.set_last_row_label_col (Definition_grid_col_constraint, Archetype_slot_closed, Void, c_constraint_colour, Void)
			else
				-- create child nodes for includes & excludes
				if arch_node.has_includes then
					across arch_node.includes as includes_csr loop
						gui_grid.add_sub_row (gui_grid_row, includes_csr.item)

						-- put pixmap on RM col
						gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, get_text ("include_text"), Void,
							c_object_colour, get_icon_pixmap ("am/added/" + arch_node.generating_type + "_include"))

						-- put assertions in constraint col
						constraint_str := object_invariant_string (includes_csr.item)
						constraint_str.replace_substring_all (" ", "%N")
						gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, c_constraint_colour, Void)
					end
				end

				if arch_node.has_excludes then
					across arch_node.excludes as excludes_csr loop
						gui_grid.add_sub_row (gui_grid_row, excludes_csr.item)

						-- put pixmap on RM col
						gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, get_text ("exclude_text"), Void,
							c_object_colour, get_icon_pixmap ("am/added/" + arch_node.generating_type + "_exclude"))

						-- put assertions in constraint col
						constraint_str := object_invariant_string (excludes_csr.item)
						constraint_str.replace_substring_all (" ", "%N")
						gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, c_constraint_colour, Void)
					end
				end
			end
		end

	display_in_grid (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag: BOOLEAN; a_lang: STRING)
		local
			i: INTEGER
		do
			precursor (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag, a_lang)
			from i := 1 until i > gui_grid.last_row.subrow_count loop
				gui_grid.last_row.subrow (i).item (Definition_grid_col_constraint).set_foreground_color (c_constraint_colour)
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	c_pixmap: EV_PIXMAP
			-- find a pixmap for an ARCHETYPE_SLOT node if using RM pixmaps
		local
			base_pixmap_name, slot_pixmap_name: STRING
		do
			if use_rm_pixmaps then
				base_pixmap_name := rm_icon_dir + resource_path_separator + rm_schema.rm_publisher.as_lower + resource_path_separator + arch_node.rm_type_name
				create slot_pixmap_name.make_empty
				slot_pixmap_name.append (base_pixmap_name)
				slot_pixmap_name.append ("_slot")
				if has_icon_pixmap (slot_pixmap_name) then
					Result := get_icon_pixmap (slot_pixmap_name)
				else
					Result := get_icon_pixmap (base_pixmap_name)
				end
			else
				Result := precursor
			end
		end

	object_invariant_string (an_inv: ASSERTION): STRING
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string
			if not show_codes then
				Result := flat_ontology.substitute_codes (Result, language)
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
