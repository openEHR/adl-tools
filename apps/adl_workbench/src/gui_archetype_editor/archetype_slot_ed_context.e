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
			make, arch_node, c_pixmap, prepare_display_in_grid, display_in_grid, build_context_menu
		end

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_arch_node: like arch_node; an_ed_context: ARCH_ED_CONTEXT_STATE)
		do
			precursor (an_arch_node, an_ed_context)
			create assertions_index.make (0)
			create ev_row_index.make (0)
		end

feature -- Access

	arch_node: ARCHETYPE_SLOT
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)

			-- add closed indicator in constraint column
			if arch_node.is_closed then
				gui_grid.set_last_row_label_col (Definition_grid_col_constraint, Archetype_slot_closed, Void, c_constraint_colour, Void)
			else
				-- create child nodes for includes & excludes
				if arch_node.has_substantive_includes then
					across arch_node.includes as includes_csr loop
						gui_grid.add_sub_row (gui_grid_row, includes_csr.item)

						-- put pixmap on RM col
						gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, get_text ("include_text"), Void,
							c_object_colour, get_icon_pixmap ("am/added/" + arch_node.generating_type + "_include"))

						-- put blank text in constraint col
						gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, "", Void, c_constraint_colour, Void)

						-- remember the association
						assertions_index.extend (includes_csr.item)
						ev_row_index.extend (gui_grid.last_row)
					end
					is_required := arch_node.has_open_excludes

				elseif arch_node.has_substantive_excludes then
					across arch_node.excludes as excludes_csr loop
						gui_grid.add_sub_row (gui_grid_row, excludes_csr.item)

						-- put pixmap on RM col
						gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, get_text ("exclude_text"), Void,
							c_object_colour, get_icon_pixmap ("am/added/" + arch_node.generating_type + "_exclude"))

						-- put blank text in constraint col
						gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, "", Void, c_constraint_colour, Void)

						-- remember the association
						assertions_index.extend (excludes_csr.item)
						ev_row_index.extend (gui_grid.last_row)
					end
					is_required := arch_node.has_open_includes
				end
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)

			-- iterate through the assertions
			across assertions_index as assn_csr loop
				gui_grid.set_last_row (ev_row_index.i_th (assn_csr.target_index))
				gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, Void, Void, c_object_colour, Void)
				gui_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, assertion_string (assn_csr.item), Void, c_constraint_colour, Void)
			end
		end

feature {NONE} -- Implementation

	c_pixmap: EV_PIXMAP
			-- find a pixmap for an ARCHETYPE_SLOT node if using RM pixmaps
		local
			base_pixmap_name, slot_pixmap_name: STRING
		do
			if use_rm_pixmaps then
				base_pixmap_name := rm_icon_dir + resource_path_separator + ed_context.rm_schema.rm_publisher.as_lower + resource_path_separator + arch_node.rm_type_name
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

	assertion_string (an_inv: ASSERTION): STRING
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string
			if not display_settings.show_codes then
				Result := ed_context.flat_ontology.substitute_codes (Result, display_settings.language)
			end
			Result.replace_substring_all (" ", "%N")
			Result.replace_substring_all ("|", "|%N")
			if is_required then
				Result.append ("%N(" + get_text ("slot_match_required_text") + ")")
			else
				Result.append ("%N(" + get_text ("slot_match_recommended_text") + ")")
			end
		end

	assertions_index: ARRAYED_LIST [ASSERTION]
			-- index of includes and excludes assertions

	ev_row_index: ARRAYED_LIST [EV_GRID_ROW]
			-- index of grid sub-row objects coresponding to items in `assertions_index'

	is_required: BOOLEAN

	context_slot_sub_menu: EV_MENU

	build_context_menu
		local
			an_mi: EV_MENU_ITEM
			slot_match_ids: ARRAYED_SET [STRING]
			ara: ARCH_CAT_ARCHETYPE
		do
			precursor
			create slot_match_ids.make (0)
			slot_match_ids.compare_objects
			if arch_node.has_substantive_includes then
				across arch_node.includes as slot_includes_csr loop
					if attached {STRING} slot_includes_csr.item.extract_regex as a_regex then
						slot_match_ids.merge (current_arch_cat.matching_ids (a_regex, arch_node.rm_type_name, Void))
					end
				end
				if arch_node.has_open_excludes then
					create context_slot_sub_menu.make_with_text (get_text ("archetype_slot_node_submenu_exact_text"))
				else
					create context_slot_sub_menu.make_with_text (get_text ("archetype_slot_node_submenu_preferred_text"))
				end

				-- ensure we have only a unique set
				across slot_match_ids as slot_match_ids_csr loop
					ara := current_arch_cat.archetype_index.item (slot_match_ids_csr.item)
					create an_mi.make_with_text_and_action (slot_match_ids_csr.item, agent (gui_agents.select_archetype_in_new_tool_agent).call ([ara]))
					an_mi.set_pixmap (get_icon_pixmap ("archetype/" + ara.group_name))
					context_slot_sub_menu.extend (an_mi)
				end

				if not context_slot_sub_menu.is_empty then
					context_menu.extend (context_slot_sub_menu)
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
