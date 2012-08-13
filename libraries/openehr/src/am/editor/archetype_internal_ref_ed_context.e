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

class ARCHETYPE_INTERNAL_REF_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, display_in_grid
		end

create
	make

feature -- Access

	arch_node: ARCHETYPE_INTERNAL_REF
			-- archetype node being edited

feature -- Display

	display_in_grid (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag: BOOLEAN; a_lang: STRING)
		local
			p, s: STRING
			gli: EV_GRID_LABEL_ITEM
		do
			precursor (in_technical_view_flag, show_rm_inheritance_flag, show_codes_flag, a_lang)

			-- set constraint column to referenced path
			create s.make_empty
			s.append ("use ")
			if in_technical_view then
				p := arch_node.target_path.twin
			else
				p := flat_ontology.physical_to_logical_path (arch_node.target_path, language, True)
			end
			p.replace_substring_all ({OG_PATH}.segment_separator_string, "%N" + {OG_PATH}.segment_separator_string)
			p.remove_head (1)
			s.append (p)
			create gli.make_with_text (utf8_to_utf32 (s))
			gli.set_foreground_color (c_attribute_colour)
			gui_grid_row.set_item (Definition_grid_col_constraint, gli)
			gui_grid_row.set_height (gli.text_height + Default_grid_row_expansion)
		end

feature -- Modification


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
