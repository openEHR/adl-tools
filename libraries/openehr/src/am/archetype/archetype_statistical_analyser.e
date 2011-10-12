note
	component:   "openEHR Archetype Project"
	description: "Statistical analyser for archetypes."
	keywords:    "statistics, archteype"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_STATISTICAL_ANALYSER

create
	make

feature -- Initialisation

	make (a_target: DIFFERENTIAL_ARCHETYPE)
		do
			target := a_target
		end

feature -- Access

	target: DIFFERENTIAL_ARCHETYPE
			-- differential archetype being validated

	rm_class_table: HASH_TABLE [INTEGER, STRING]
			-- counts of all RM classes

	summed_archetypable_nodes: INTEGER
			-- summed count of archetypable nodes, i.e. descendants of the class designated by
			-- the BMM attribute 'archetype_parent_class'

    summed_data_value_nodes: INTEGER
			-- summed count of archetype 'data_value' nodes, i.e. descendants of the class designated by
			-- the BMM attribute 'archetype_data_value_class'

feature -- Commands

	analyse
			-- validate description section
		local
			def_it: C_ITERATOR
		do
			reset
			create invalid_types.make(0)
			invalid_types.compare_objects
			create def_it.make (target.definition)
			def_it.do_until_surface (agent node_enter, agent node_test)
		end

feature {NONE} -- Implementation

	reset
		do
		end

	node_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of node against reference model.
		local
			arch_parent_attr_type, model_attr_class: STRING
			co_parent_flat: C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			rm_prop_def: BMM_PROPERTY_DEFINITION
		do
--			if attached {C_OBJECT} a_c_node as co then
--				if not co.is_root then -- now check if this object a valid type of its owning attribute
--					if target.is_specialised and then co.parent.has_differential_path then
--						create apa.make_from_string (co.parent.differential_path)
--						co_parent_flat := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))
--						arch_parent_attr_type := co_parent_flat.rm_type_name
--					else
--						arch_parent_attr_type := co.parent.parent.rm_type_name
--					end

--					if not invalid_types.has (arch_parent_attr_type) then
--						-- check for type substitutions such as ISO8601_DATE which appear in the archetype as a String
--						if rm_schema.has_property (arch_parent_attr_type, co.parent.rm_attribute_name) and not
--											rm_schema.valid_property_type (arch_parent_attr_type, co.parent.rm_attribute_name, co.rm_type_name) then
--							model_attr_class := rm_schema.property_type (arch_parent_attr_type, co.parent.rm_attribute_name)

--							-- flag if constraint is equal to reference model; FUTURE: remove if equal
--							if rm_schema.substitutions.has (co.rm_type_name) and then rm_schema.substitutions.item (co.rm_type_name).is_equal (model_attr_class) then
--								add_info ("ICORMTS", <<co.rm_type_name, co.path, model_attr_class,
--									arch_parent_attr_type, co.parent.rm_attribute_name>>)
--							else
--								add_error ("VCORMT", <<co.rm_type_name, co.path, model_attr_class, arch_parent_attr_type, co.parent.rm_attribute_name>>)
--								invalid_types.extend (co.rm_type_name)
--							end
--						end
--					end
--				end
--			elseif attached {C_ATTRIBUTE} a_c_node as ca then
--				if target.is_specialised and then ca.has_differential_path then
--					create apa.make_from_string (ca.differential_path)
--					co_parent_flat := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))
--					arch_parent_attr_type := co_parent_flat.rm_type_name
--				else
--					arch_parent_attr_type := ca.parent.rm_type_name -- can be a generic type like DV_INTERVAL <DV_QUANTITY>
--				end
--				if not rm_schema.has_property(arch_parent_attr_type, ca.rm_attribute_name) then
--					add_error ("VCARM", <<ca.rm_attribute_name, ca.path, arch_parent_attr_type>>)
--				else
--					rm_prop_def := rm_schema.property_definition(arch_parent_attr_type, ca.rm_attribute_name)
--					if attached ca.existence then
--						if not rm_prop_def.existence.contains(ca.existence) then
--							if not target.is_specialised and rm_prop_def.existence.equal_interval(ca.existence) then
--								add_warning ("WCAEX", <<ca.rm_attribute_name, ca.path, ca.existence.as_string>>)
--								if not validation_strict then
--									ca.remove_existence
--								end
--							else
--								add_error ("VCAEX", <<ca.rm_attribute_name, ca.path, ca.existence.as_string, rm_prop_def.existence.as_string>>)
--							end
--						end
--					end
--					if ca.is_multiple then
--						if attached {BMM_CONTAINER_PROPERTY} rm_prop_def as cont_prop then
--							if attached ca.cardinality then
--								if not cont_prop.cardinality.contains(ca.cardinality.interval) then
--									if not target.is_specialised and cont_prop.cardinality.equal_interval(ca.cardinality.interval) then
--										add_warning ("WCACA", <<ca.rm_attribute_name, ca.path, ca.cardinality.interval.as_string>>)
--										if not validation_strict then
--											ca.remove_cardinality
--										end
--									else
--										add_error ("VCACA", <<ca.rm_attribute_name, ca.path, ca.cardinality.interval.as_string, cont_prop.cardinality.as_string>>)
--									end
--								end
--							end
--						else -- archetype has multiple attribute but RM does not
--							add_error ("VCAM", <<ca.rm_attribute_name, ca.path, ca.cardinality.as_string, "(single-valued)">>)
--						end
--					elseif attached {BMM_CONTAINER_PROPERTY} rm_prop_def as cont_prop_2 then
--						add_error ("VCAM", <<ca.rm_attribute_name, ca.path, "(single-valued)", cont_prop_2.cardinality.as_string>>)
--					end
--					if rm_prop_def.is_computed then
--						-- flag if this is a computed property constraint (i.e. a constraint on a function from the RM)
--						add_warning ("WCARMC", <<ca.rm_attribute_name, ca.path, arch_parent_attr_type>>)
--					end
--				end
--			end
		end

	invalid_types: ARRAYED_LIST [STRING]

	node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- Return True if node is a C_OBJECT and class is known in RM, or if it is a C_ATTRIBUTE
		do
--			Result := True
--			if attached {C_OBJECT} a_c_node as co then
--				if not rm_schema.has_class_definition(co.rm_type_name) then
--					if not invalid_types.has(co.rm_type_name) then
--						add_error ("VCORM", <<co.rm_type_name, co.path>>)
--						invalid_types.extend (co.rm_type_name)
--					end
--					Result := False
--				end
--			end
		end

	rm_schema: attached BMM_SCHEMA

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
--| The Original Code is archetype_phase_2_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007-2011
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
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
