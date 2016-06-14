note
	component:   "openEHR ADL Tools"
	description: "Generic visitor class for C_xxx class objects"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_VISITOR

feature -- Initialisation

	initialise (an_archetype: ARCHETYPE)
		do
			archetype := an_archetype
			differential_view := an_archetype.is_differential
			archetype_specialisation_level := archetype.specialisation_depth
			terminologies.wipe_out
			terminologies.extend (archetype.terminology)
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

	start_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT_PROXY
		deferred
		end

	end_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
			-- exit an C_COMPLEX_OBJECT_PROXY
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

	start_c_boolean (a_node: C_BOOLEAN; depth: INTEGER)
			-- enter a C_BOOLEAN
		do
			start_c_primitive_object (a_node, depth)
		end

	end_c_boolean (a_node: C_BOOLEAN; depth: INTEGER)
			-- exit a C_BOOLEAN
		do
			end_c_primitive_object (a_node, depth)
		end

	start_c_integer (a_node: C_INTEGER; depth: INTEGER)
			-- enter a C_INTEGER
		do
			start_c_primitive_object (a_node, depth)
		end

	end_c_integer (a_node: C_INTEGER; depth: INTEGER)
			-- exit a C_INTEGER
		do
			end_c_primitive_object (a_node, depth)
		end

	start_c_real (a_node: C_REAL; depth: INTEGER)
			-- enter a C_REAL
		do
			start_c_primitive_object (a_node, depth)
		end

	end_c_real (a_node: C_REAL; depth: INTEGER)
			-- exit a C_REAL
		do
			end_c_primitive_object (a_node, depth)
		end

	start_c_date (a_node: C_DATE; depth: INTEGER)
			-- enter a C_DATE
		do
			start_c_primitive_object (a_node, depth)
		end

	end_c_date (a_node: C_DATE; depth: INTEGER)
			-- exit a C_DATE
		do
			end_c_primitive_object (a_node, depth)
		end

	start_c_date_time (a_node: C_DATE_TIME; depth: INTEGER)
			-- enter a C_DATE_TIME
		do
			start_c_primitive_object (a_node, depth)
		end

	end_c_date_time (a_node: C_DATE_TIME; depth: INTEGER)
			-- exit a C_DATE_TIME
		do
			end_c_primitive_object (a_node, depth)
		end

	start_c_time (a_node: C_TIME; depth: INTEGER)
			-- enter a C_TIME
		do
			start_c_primitive_object (a_node, depth)
		end

	end_c_time (a_node: C_TIME; depth: INTEGER)
			-- exit a C_TIME
		do
			end_c_primitive_object (a_node, depth)
		end

	start_c_duration (a_node: C_DURATION; depth: INTEGER)
			-- enter a C_DURATION
		do
			start_c_primitive_object (a_node, depth)
		end

	end_c_duration (a_node: C_DURATION; depth: INTEGER)
			-- exit a C_DURATION
		do
			end_c_primitive_object (a_node, depth)
		end

	start_c_string (a_node: C_STRING; depth: INTEGER)
			-- enter an C_STRING
		do
			start_c_primitive_object (a_node, depth)
		end

	end_c_string (a_node: C_STRING; depth: INTEGER)
			-- exit a C_STRING
		do
			end_c_primitive_object (a_node, depth)
		end

	start_c_terminology_code (a_node: C_TERMINOLOGY_CODE; depth: INTEGER)
			-- enter a C_TERMINOLOGY_CODE
		do
			start_c_primitive_object (a_node, depth)
		end

	end_c_terminology_code (a_node: C_TERMINOLOGY_CODE; depth: INTEGER)
			-- exit a C_TERMINOLOGY_CODE
		do
			end_c_primitive_object (a_node, depth)
		end

	do_rm_class (a_bmm_class: BMM_CLASS; a_c_object: C_OBJECT; depth: INTEGER)
			-- enter a BMM_CLASS_DEFINITION
		do
		end

	do_rm_property (a_bmm_prop: BMM_PROPERTY [BMM_TYPE]; a_c_object: C_OBJECT; depth: INTEGER)
			-- enter a BMM_PROPERTY
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
		note
			option: stable
		attribute
		end

	archetype_specialisation_level: INTEGER
			-- specialisation level of the archetype whose definition structure
			-- this object processes

	terminologies: ARRAYED_STACK [ARCHETYPE_TERMINOLOGY]
			-- we use a stack here to handle ontologies inside operational templates
		attribute
			create Result.make (0)
		end

	terminology: ARCHETYPE_TERMINOLOGY
			-- The ontology for `target_archetype'.
		do
			Result := terminologies.item
		end

	differential_view: BOOLEAN
			-- True if archetype is differential form

invariant


end


