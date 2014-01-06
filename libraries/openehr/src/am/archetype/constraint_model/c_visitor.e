note
	component:   "openEHR ADL Tools"
	description: "Generic visitor class for C_xxx class objects"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"


deferred class C_VISITOR

feature -- Initialisation

	initialise (an_archetype: ARCHETYPE)
		do
			archetype := an_archetype
			differential_view := attached {DIFFERENTIAL_ARCHETYPE} an_archetype
			archetype_specialisation_level := archetype.specialisation_depth
			ontologies.wipe_out
			ontologies.extend (archetype.terminology)
		end

feature -- Visitor

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		deferred
		end

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit an C_COMPLEX_OBJECT
		do
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		deferred
		end

	end_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- exit an ARCHETYPE_SLOT
		do
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		deferred
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		deferred
		end

	end_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- exit a C_LEAF_OBJECT
		do
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		deferred
		end

	end_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
		end

	start_archetype_internal_ref (a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		deferred
		end

	end_archetype_internal_ref (a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- exit an ARCHETYPE_INTERNAL_REF
		do
		end

	start_constraint_ref (a_node: CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		deferred
		end

	end_constraint_ref (a_node: CONSTRAINT_REF; depth: INTEGER)
			-- exit a CONSTRAINT_REF
		do
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		deferred
		end

	end_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- exit an C_PRIMITIVE_OBJECT
		do
		end

	do_rm_class (a_bmm_class: BMM_CLASS_DEFINITION; a_c_object: C_OBJECT; depth: INTEGER)
			-- enter a BMM_CLASS_DEFINITION
		do
		end

	do_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION; a_c_object: C_OBJECT; depth: INTEGER)
			-- enter a BMM_PROPERTY_DEFINITION
		do
		end

feature -- Finalisation

	finalise
			-- finalise after all nodes visited
		do
			-- assume nothing; override in descendants
		end

feature {NONE} -- Implementation

	archetype: detachable ARCHETYPE
			-- archetype containing definition section being serialised

	archetype_specialisation_level: INTEGER
			-- specialisation level of the archetype whose definition structure
			-- this object processes

	ontologies: ARRAYED_STACK [ARCHETYPE_TERMINOLOGY]
			-- we use a stack here to handle ontologies inside operational templates
		attribute
			create Result.make (0)
		end

	ontology: ARCHETYPE_TERMINOLOGY
			-- The ontology for `target_archetype'.
		do
			Result := ontologies.item
		end

	differential_view: BOOLEAN
			-- True if archetype is differential form

invariant


end


