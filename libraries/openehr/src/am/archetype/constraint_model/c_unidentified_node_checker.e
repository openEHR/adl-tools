note
	component:   "openEHR ADL Tools"
	description: "[
			     This class is OBSOLETE. See C_ATTRIBUTE validity routines.
				 Archetype visitor to look for attributes that are either multiple or have multiple alternatives, whose
				 child objects are not identified, but only if the children are not C_PRIMITIVEs or
				 C_C_Os whose values are C_PRMITIVEs. Record any such nodes as warnings
		         ]"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class C_UNIDENTIFIED_NODE_CHECKER

inherit
	C_VISITOR
		rename
			initialise as initialise_visitor
		redefine
			start_c_attribute
		end

create
	initialise

feature -- Initialisation

	initialise(an_ontology: ARCHETYPE_ONTOLOGY)
			-- set ontology required for interpreting meaning of object nodes
		require
			Ontology_valid: an_ontology /= Void
		do
			initialise_visitor(an_ontology)
			create warnings.make(0)
		end

feature -- Access

	warnings: STRING

feature -- Visitor

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- FIXME: this can probably be done in a smarter way by an analysis of paths?
		obsolete
			"This routine is replaced by C_ATTRIBUTE validity routines that ensure only valid child can be added to an attribute"
		local
			ca: C_ATTRIBUTE
			found: BOOLEAN
		do
			-- only check nodes that are either multiple or are single but have multiple alternative children					
			if a_node /= Void and (a_node.is_multiple or else a_node.child_count > 1) then
				from a_node.children.start until a_node.children.off loop
					if attached {C_COMPLEX_OBJECT} a_node.children.item as cco and not cco.is_addressable then
						-- see if it has any C_COMPLEX_OBJECT children
						from
							found := False
							cco.attributes.start
						until
							cco.attributes.off or found
						loop
							ca := cco.attributes.item
							from ca.children.start until ca.children.off or found loop
								if attached {C_COMPLEX_OBJECT} ca.children.item as cco2 then
									warnings.append("Warning: child node of type " + cco.rm_type_name + " at path " + a_node.path + " has no id.%N")
									found := True
								end
								ca.children.forth
							end
							cco.attributes.forth
						end
					end
					a_node.children.forth
				end
			end
		end

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		do
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		do
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_c_reference_object (a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do
		end

	start_archetype_internal_ref (a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		do
		end

	start_constraint_ref (a_node: CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		do
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		do
		end

end


