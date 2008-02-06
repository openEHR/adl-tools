indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Generate a flat archetype from a source differential form archetype, and, if the latter is
				 specialised, its flat parent.
		         ]"
	keywords:    "archetype, comparison, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_FLATTENER

inherit
	ARCHETYPE_TERM_CODE_TOOLS
		export {NONE}
			all
		end

create
	make

feature -- Initialisation

	make(a_flat_archetype: FLAT_ARCHETYPE; a_src_archetype: DIFFERENTIAL_ARCHETYPE) is
			-- create with flat archetype of parent and source (differential) archetype of
			-- archetype for which we wish to generate a flat archetype
		require
			Flat_archetype_attached: a_flat_archetype /= Void
			Src_archetype_attached: a_src_archetype /= Void
			Comparability: comparable_archetypes(a_flat_archetype, a_src_archetype)
		do
			flat_archetype := a_flat_archetype
			src_archetype := a_src_archetype
		end

feature -- Access

	flat_archetype: FLAT_ARCHETYPE
			-- flat archetype of parent, if applicable

	src_archetype: DIFFERENTIAL_ARCHETYPE
			-- archetype for which flat form is being generated

	output: FLAT_ARCHETYPE
			-- generated flat archetype - logically an overlay of `flat_archetype' and `src_archetype'

feature -- Commands

	flatten_archetype is
			-- create a flat form archetype in `output'
		do
			debug ("flatten")
				io.put_string ("============== flattening archetype " + src_archetype.archetype_id.as_string + " with " + flat_archetype.archetype_id.as_string + " ==============%N")
			end
			create output.make_from_differential (src_archetype)
			flatten_definition
			flatten_invariants
			flatten_ontology
			output.rebuild
			output.set_parent_archetype_id (flat_archetype.archetype_id)
			output.set_is_valid (True)
		ensure
			output /= Void
		end

feature -- Comparison

	comparable_archetypes(a_flat_archetype: FLAT_ARCHETYPE; a_src_archetype: DIFFERENTIAL_ARCHETYPE): BOOLEAN is
		require
			Valid_flat_archetype: a_flat_archetype /= Void
			Valid_src_archetype: a_src_archetype /= Void
		do
			if a_src_archetype.is_valid then
				if a_src_archetype.is_specialised then
					if a_flat_archetype.is_valid then
						Result := a_src_archetype.parent_archetype_id.as_string.is_equal (a_flat_archetype.archetype_id.as_string)
					end
				else
					Result := True
				end
			end
		end

feature {NONE} -- Implementation

	flatten_definition is
			-- build the flat archetype definition by traversing src_archetype and determining what
			-- nodes from flat_archetype to add; do the changes to the output archetype
		local
			def_it: C_ITERATOR
		do
			create def_it.make(src_archetype.definition)
			def_it.do_until_surface(agent node_graft, agent node_test)
		end

	flatten_invariants is
			-- build the flat archetype invariants as the sum of parent and source invariants
		do
			if flat_archetype.has_invariants then
				from
					flat_archetype.invariants.start
				until
					flat_archetype.invariants.off
				loop
					output.add_invariant (flat_archetype.invariants.item.deep_twin)
					flat_archetype.invariants.forth
				end
			end
		end

	flatten_ontology is
			-- build the flat archetype ontology as the sum of parent and source ontologies
		do
			output.ontology.merge(flat_archetype.ontology)
		end

	node_graft (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)  is
		local
			src_cco, parent_cco, output_cco: C_COMPLEX_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			attr_name: STRING
			src_attr, parent_attr, an_attr, output_attr: C_ATTRIBUTE
			node_id_list: ARRAYED_LIST[STRING]
			an_obj: C_OBJECT
			spec_sts: INTEGER
		do
			src_cco ?= a_c_node
			if src_cco /= Void then
				debug ("flatten")
					io.put_string ("---------- at source object node " + src_cco.path + " ---------%N")
				end
				create apa.make_from_string (src_cco.path)
				debug ("flatten")
					io.put_string ("%Tgetting parent object node using path " + apa.path_at_level (flat_archetype.specialisation_depth) + "%N")
				end
				parent_cco ?= flat_archetype.c_object_at_path (apa.path_at_level (flat_archetype.specialisation_depth))

				-- iterate through children and clone any from flat tree that are not already overridden in src tree
				from
					parent_cco.attributes.start
				until
					parent_cco.attributes.off
				loop
					attr_name := parent_cco.attributes.item.rm_attribute_name
					debug ("flatten")
						io.put_string ("%T%Tattribute in parent: " + attr_name + " ... ")
					end
					if src_cco.has_attribute (attr_name) then
						debug ("flatten")
							io.put_string ("found in source %N")
						end
						src_attr := src_cco.c_attribute_at_path (attr_name)
						-- only interested in container attributes found in the source archetype, since they may not have all members
						-- from the parent. Here we create a list of the children that are overridden in the source, so as to avoid
						-- adding them back in from the parent. Children defined new in the source can be ignored since they don't
						-- exist in the parent.
						create node_id_list.make (0)
						node_id_list.compare_objects
						if src_attr.is_multiple then
							from
								src_attr.children.start
							until
								src_attr.children.off
							loop
								debug ("flatten")
									io.put_string ("%T%Tchecking object with node id " + src_attr.children.item.node_id + " (path = " + src_attr.children.item.path + ") ... ")
								end
								spec_sts := specialisation_status_from_code(src_attr.children.item.node_id, src_archetype.specialisation_depth).value
								if spec_sts = ss_redefined then
									node_id_list.extend(specialisation_parent_from_code_at_level (src_attr.children.item.node_id, flat_archetype.specialisation_depth))
									debug ("flatten")
										io.put_string ("ignoring %N")
									end
								elseif spec_sts = ss_inherited then
									node_id_list.extend(src_attr.children.item.node_id)
									debug ("flatten")
										io.put_string ("ignoring %N")
									end
								else
									debug ("flatten")
										io.put_string ("%N")
									end
								end
								src_attr.children.forth
							end
							-- now iterate through children of same node in parent and graft any that are not already overridden
							-- in source archetype at that node
							parent_attr := parent_cco.attributes.item
							debug ("flatten")
								io.put_string ("%T%Titerating through child objects of " + parent_attr.path + "%N")
							end

							output_attr := output.definition.c_attribute_at_path (src_attr.path)
							from
								parent_attr.children.start
							until
								parent_attr.children.off
							loop
								if not node_id_list.has (parent_attr.children.item.node_id) then
									an_obj := parent_attr.children.item.safe_deep_twin
									output_attr.put_child (an_obj)
									debug ("flatten")
										io.put_string ("%T%Tgrafted object " + an_obj.path + "%N")
									end
								end
								parent_attr.children.forth
							end
						end
					else
						debug ("flatten")
							io.put_string ("in parent only%N")
						end
						an_attr := parent_cco.attributes.item.safe_deep_twin
						output_cco ?= output.definition.c_object_at_path (parent_cco.path)
						output_cco.put_attribute (an_attr)
						debug ("flatten")
							io.put_string ("%T%Tgrafted attribute to " + an_attr.path + "%N")
						end
					end
					parent_cco.attributes.forth
				end
			end
		end

	node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN  is
		local
			apa: ARCHETYPE_PATH_ANALYSER
		do
			debug ("flatten")
				io.put_string ("%T*** checking node " + a_c_node.path + " ... ")
			end

			create apa.make_from_string(a_c_node.path)

			Result := flat_archetype.has_path (apa.path_at_level (flat_archetype.specialisation_depth))

			if Result then
				debug ("flatten")
					io.put_string (" ... INCLUDED %N")
				end
			else
				debug ("flatten")
					io.put_string (" ... excluded %N")
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
--| The Original Code is archetype_flattener.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2008
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
