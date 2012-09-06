note
	component:   "openEHR Archetype Project"
	description: "Editor context for a C_COMPLEX_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_COMPLEX_OBJECT_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, make, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Initialisation

	make (an_arch_node: like arch_node; an_archetype: ARCHETYPE; a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY; an_rm_schema: BMM_SCHEMA)
		do
			precursor (an_arch_node, an_archetype, a_flat_ontology, an_rm_schema)
			create attributes.make (0)
		end

feature -- Access

	arch_node: C_COMPLEX_OBJECT
			-- archetype node being edited

	attributes: ARRAYED_LIST [C_ATTRIBUTE_ED_CONTEXT]

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)
			across attributes as attr_csr loop
				attr_csr.item.prepare_display_in_grid (a_gui_grid)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			across attributes as attr_csr loop
				attr_csr.item.display_in_grid (ui_settings)
			end
		end

	expand_to_rm
		local
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			if in_differential_view then
				props := rm_class.properties
			else
				props := rm_class.flat_properties
			end
			across props as props_csr loop
				do_rm_property (props.item_for_iteration)
			end
		end

feature -- Modification

	add_attribute (a_node: C_ATTRIBUTE_ED_CONTEXT)
			-- add a new attribute node
		do
			attributes.extend (a_node)
			a_node.set_parent (Current)
		end

feature {NONE} -- Implementation

	do_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION)
			-- enter a BMM_PROPERTY_DEFINITION
		local
			bmm_class_def: BMM_CLASS_DEFINITION
		do
--			-- first of all work out whether we want this property
--			if not (attached {C_COMPLEX_OBJECT} co as cco and then cco.has_attribute (a_bmm_prop.name))
--				and not attached {C_REFERENCE_OBJECT} co
--				and not (attached {C_DOMAIN_TYPE} co as cdt and then cdt.constrained_rm_attributes.has (a_bmm_prop.name))
--			then
--				ev_grid_rm_row_stack.extend (node_grid_row_map.item (co))
--				ev_grid_rm_row_removals_stack.extend (False)
--				create rm_node_path.make_from_string (co.path)

--				-- do this property
--				enter_rm_property (a_bmm_prop, depth)

--				-- if it wasn't removed, do its children, to a certain depth
--				if not ev_grid_rm_row_removals_stack.item then
--					bmm_class_def := rm_schema.class_definition (a_bmm_prop.type.root_class)
--					bmm_class_def.do_supplier_closure (not differential_view, agent continue_rm_property, agent enter_rm_property, agent exit_rm_property)
--				end

--				exit_rm_property (a_bmm_prop)

--				ev_grid_rm_row_stack.remove
--				ev_grid_rm_row_removals_stack.remove
--			end
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
