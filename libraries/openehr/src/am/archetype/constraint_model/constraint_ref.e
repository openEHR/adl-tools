note
	component:   "openEHR ADL Tools"
	description: "[
			 Object node type representing a reference to a constraint
			 defined in the ontology section of the archetype.
			 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CONSTRAINT_REF

inherit
	C_OBJECT
		redefine
			representation_cache
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_code: STRING)
			-- make from pattern of form "[acNNNN[.NN[etc]]]"
		do
			rm_type_name := Any_type
			target := a_code
			create representation_cache.make_anonymous
			representation_cache.set_content (Current)
		ensure
			Target_set: target = a_code
		end

feature -- Access

	target: STRING
			-- reference to another constraint object containing the logical
			-- constraints for this object, defined outside the archetype,
			-- usually in the ontology section of an ADL archetype
			-- [called 'reference' in AOM, but that is a keyword in Eiffel]

	external_reference: detachable DV_PARSABLE
			-- direct reference to external resource in the form of a String, typically a URI;
			-- the `formalism' attribute can be used to record the exact syntax model of the
			-- parsable value, enabling it to be processed within archetype tools

feature -- Status Report

	is_resolved: BOOLEAN
			-- True if `external_reference' is assigned
		do
			Result := attached external_reference
		ensure
			Result = attached external_reference
		end

feature -- Comparison

	is_subset_of (other: like Current): BOOLEAN
			-- True if this node is a subset, i.e. a redefinition of, `other'
			-- Returns False if they are the same, or if they do not correspond
		do
				-- FIXME - tobe implemented
		end

feature -- Conversion

	as_string: STRING
			--
		do
			create Result.make_empty
			Result.append ("[" + target + "]")
		end

feature -- Modification

	set_external_reference_from_string (an_ext_ref, a_syntax: STRING)
			-- set `external_reference' from two parameters - the actual reference (e.g. a URI string)
			-- and a syntax model, used to help interpret the reference structure
		require
			Ref_valid: not an_ext_ref.is_empty
			Syntax_valid: not a_syntax.is_empty
		do
			create external_reference.make (an_ext_ref, a_syntax)
		end

	set_external_reference (an_ext_ref: DV_PARSABLE)
		do
			external_reference := an_ext_ref
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_constraint_ref (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_constraint_ref (Current, depth)
		end

feature {NONE} -- Implementation

	representation_cache: detachable OG_OBJECT_LEAF
		note
			option: transient
		attribute
		end

	create_default_representation: attached like representation_cache
			-- create a reasonable `representation' instance
		do
			create Result.make_anonymous
		end

end


