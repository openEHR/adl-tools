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
			arch_node, make, make_rm, prepare_display_in_grid, display_in_grid
		end

create
	make, make_rm

feature -- Initialisation

	make (an_arch_node: like arch_node; an_archetype: ARCHETYPE; a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY; an_rm_schema: BMM_SCHEMA)
		do
			precursor (an_arch_node, an_archetype, a_flat_ontology, an_rm_schema)
			create c_attributes.make (0)
			create rm_attributes.make (0)
		end

	make_rm (an_rm_class: BMM_CLASS_DEFINITION; an_archetype: ARCHETYPE; a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY; an_rm_schema: BMM_SCHEMA)
		do
			precursor (an_rm_class, an_archetype, a_flat_ontology, an_rm_schema)
			create c_attributes.make (0)
			create rm_attributes.make (0)
		end

feature -- Access

	arch_node: detachable C_COMPLEX_OBJECT
			-- archetype node being edited

	c_attributes: HASH_TABLE [C_ATTRIBUTE_ED_CONTEXT, STRING]
			-- editor nodes for real C_ATTRIBUTEs that are found in C_COMPLEX_OBJECT.attributes

	rm_attributes: HASH_TABLE [C_ATTRIBUTE_ED_CONTEXT, STRING]
			-- Editor nodes for unconstrained RM attributes that have been lazy-requested for viewing
			-- Once created, they don't leave, they are just displayed or hidden in the EV_GRID tree

	rm_properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			if in_differential_view then
				Result := rm_class.properties
			else
				Result := rm_class.flat_properties
			end
		end

feature -- Status Report

	is_root: BOOLEAN
			-- True if this node has no parent
		do
			Result := not attached parent
		end

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			-- set up this node in grid
			precursor (a_gui_grid)

			-- set up child property nodes in grid
			across c_attributes as attr_csr loop
				attr_csr.item.prepare_display_in_grid (gui_grid)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			across c_attributes as attr_csr loop
				attr_csr.item.display_in_grid (ui_settings)
			end

			if not rm_properties.is_empty then
				expand_to_rm (ui_settings)
			end
		end

feature -- Modification

	add_c_attribute (a_node: C_ATTRIBUTE_ED_CONTEXT)
			-- add a new attribute node
		require
			not a_node.is_rm
		do
			c_attributes.put (a_node, a_node.rm_property.name)
			a_node.set_parent (Current)
		end

	add_rm_attribute (a_node: C_ATTRIBUTE_ED_CONTEXT)
			-- add a new attribute node
		require
			a_node.is_rm
		do
			rm_attributes.put (a_node, a_node.rm_property.name)
			a_node.set_parent (Current)
		end

feature {NONE} -- Implementation

	expand_to_rm (ui_settings: GUI_DEFINITION_SETTINGS)
			--  (if this is an RM node) or else go do the work
		do
			if is_rm and gui_grid_row.subrow_count = 0 then
				-- if there are any candidate properties to be displayed given the current UI settings,
				-- then set an expand-actions event
				if can_show_rm_properties then
					gui_grid_row.expand_actions.force_extend (agent process_rm_properties (ui_settings))
					gui_grid_row.ensure_expandable
				else
					gui_grid_row.expand_actions.wipe_out
					gui_grid_row.ensure_non_expandable
				end
			else
				process_rm_properties (ui_settings)
			end
		end

	process_rm_properties (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			-- for previously expanded RM nodes, remove lazy-expand event
			if is_rm and then not can_show_rm_properties then
				gui_grid_row.expand_actions.wipe_out
				gui_grid_row.ensure_non_expandable
			else
				across rm_properties as props_csr loop
					if not c_attributes.has (props_csr.item.name) then
						prepare_rm_property (props_csr.item, ui_settings)
					end
				end
			end
		end

	can_show_rm_properties: BOOLEAN
			-- True if there are any candidate properties to be displayed given the current UI settings
		do
			Result := across rm_properties as props_csr some can_show_rm_property (props_csr.item) end
		end

	can_show_rm_property (an_rm_prop: BMM_PROPERTY_DEFINITION): BOOLEAN
			-- True if `an_rm_prop' should be shown below current object node given current UI settings
		do
			Result := show_rm_data_properties
				and (not an_rm_prop.is_im_runtime or else show_rm_runtime_properties)
				and (not an_rm_prop.is_im_infrastructure or else show_rm_infrastructure_properties)
		end

	prepare_rm_property (an_rm_prop: BMM_PROPERTY_DEFINITION; ui_settings: GUI_DEFINITION_SETTINGS)
			-- enter a BMM_PROPERTY_DEFINITION
		local
			bmm_class_def: BMM_CLASS_DEFINITION
			show_prop: BOOLEAN
			c_attr_ed_node: C_ATTRIBUTE_ED_CONTEXT
		do
			-- see if this property should be shown; if not, leave it for now
			if can_show_rm_property (an_rm_prop) then
				-- see if the property was created previously; if not create it new
				if not rm_attributes.has (an_rm_prop.name) then
					-- first time creation
					create c_attr_ed_node.make_rm (an_rm_prop, archetype, flat_ontology, rm_schema)
					add_rm_attribute (c_attr_ed_node)

					-- once-only prepare step
					c_attr_ed_node.prepare_display_in_grid (gui_grid)

					-- first-time display step
					c_attr_ed_node.display_in_grid (ui_settings)
				else
					c_attr_ed_node := rm_attributes.item (an_rm_prop.name)
				end

				-- see if it is already shown, which means it must not be hidden
				if not c_attr_ed_node.is_shown_in_grid then
					c_attr_ed_node.display_in_grid (ui_settings)
				end
			elseif rm_attributes.has (an_rm_prop.name) then
				rm_attributes.item (an_rm_prop.name).hide_in_grid
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
