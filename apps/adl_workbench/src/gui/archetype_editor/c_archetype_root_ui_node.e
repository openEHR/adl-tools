note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_ARCHETYPE_ROOT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ARCHETYPE_ROOT_UI_NODE

inherit
	C_COMPLEX_OBJECT_UI_NODE
		redefine
			arch_node, rm_properties, display_constraint, c_pixmap, build_context_menu
		end

create
	make

feature -- Access

	arch_node: detachable C_ARCHETYPE_ROOT
			-- archetype node being edited

	rm_properties: HASH_TABLE [BMM_PROPERTY [BMM_TYPE], STRING]
			-- don't produce any RM properties, since node is another archetype
		do
			if ed_context.in_differential_view and not ed_context.editing_enabled then
				create Result.make (0)
			else
				Result := rm_type.base_class.flat_properties
			end
		end

feature {NONE} -- Implementation

	c_pixmap: EV_PIXMAP
			-- find a pixmap for an ARCHETYPE_SLOT node if using RM pixmaps
		local
			base_pixmap_name, ref_pixmap_name: STRING
		do
			if use_rm_pixmaps and attached arch_node as a_n then
				base_pixmap_name := rm_icon_dir + resource_path_separator + ed_context.rm_schema.rm_publisher.as_lower + resource_path_separator + a_n.rm_type_name
				create ref_pixmap_name.make_empty
				ref_pixmap_name.append (base_pixmap_name)
				ref_pixmap_name.append ("_reference")
				if has_icon_pixmap (ref_pixmap_name) then
					Result := get_icon_pixmap (ref_pixmap_name)
				else
					Result := get_icon_pixmap (base_pixmap_name)
				end
			else
				Result := precursor
			end
		end

	display_constraint
		do
			if attached arch_node as car and not ed_context.archetype.is_template then
				evx_grid.set_last_row_label_col (Definition_grid_col_constraint, car.archetype_ref, Void, c_constraint_colour, Void)
			end
		end

	build_context_menu
		local
			an_mi: EV_MENU_ITEM
		do
			precursor
			if attached arch_node as car then
				if attached {ARCH_LIB_ARCHETYPE_EDITABLE} current_library.matching_archetype (car.archetype_ref) as ext_ref_node then
					create an_mi.make_with_text_and_action (get_text (ec_open_target_in_new_tab), agent (gui_agents.select_archetype_in_new_tool_agent).call ([ext_ref_node]))
					an_mi.set_pixmap (get_icon_pixmap ("archetype/" + ext_ref_node.group_name))
					context_menu.extend (an_mi)
				end
			end
		end

end


