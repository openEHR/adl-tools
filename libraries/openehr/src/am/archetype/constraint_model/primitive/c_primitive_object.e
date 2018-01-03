note
	component:   "openEHR ADL Tools"
	description: "Abstract parent type for primitive types in Archetype Object Model."
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_PRIMITIVE_OBJECT

inherit
	C_LEAF_OBJECT
		redefine
			default_create, out, c_conforms_to, c_congruent_to
		end

feature {NONE} -- Initialisation

	default_create
			-- set `rm_type_name'
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			rm_type_name := constrained_typename
			set_node_id (Primitive_node_id)
		end

	make (a_constraint: like constraint)
		do
			default_create
			constraint := a_constraint
		end

	make_example
		deferred
		end

	make_identified_default (a_node_id: STRING)
			-- make a default version with a node identifier - normally used to constrain just the type
		require
			Object_id_valid: is_valid_id_code (a_node_id)
		do
			default_create
			set_node_id (a_node_id)
		end

feature -- Access

	constraint: ANY
			-- single constraint represented by this object; redefine in descendants.

	constrained_typename: STRING
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			Result := generating_type.name
			Result.remove_head (2)
		end

    assumed_value: detachable ANY
            -- value to be assumed if none sent in data

	match_path: STRING
			-- same as path but with final object_id removed
		local
			an_og_path: OG_PATH
		do
			an_og_path := og_path
			an_og_path.last.clear_object_id
			Result := an_og_path.as_string
		end

	single_value: ANY
			-- single value if single-valued
		require
			is_single_value
		deferred
		end

feature -- Comparison

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same or narrower constraints as `other'.
			-- `other' is typically in a flat archetype.
			-- Returns True only when the following is True:
			--	rm_type_name is the same as rm_type_name of other;
			--	occurrences is same (= Void) or a sub-interval
		do
			Result := occurrences_conforms_to (other) and rm_type_name.is_case_insensitive_equal (other.rm_type_name)
		end

	c_congruent_to (other: like Current): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses no constraints in addition to `other', other than
			-- possible redefinition of the node id, which doesn't matter, since this won't get lost in a compressed path.
			-- `other' is typically in a flat archetype
			-- Used to determine if path segments can be compressed;
			-- Returns True if:
			--	aom_builtin_type is identical (same as rm_type_name, except when rm_type_name has been overridden)
		do
			Result := constrained_typename.is_case_insensitive_equal (other.constrained_typename)
		end

feature -- Status Report

	is_enumerated_type_constraint: BOOLEAN
			-- True if this constraint is actually of an enumerated type that conforms to a primitive type, not a primitive

	has_assumed_value: BOOLEAN
			-- True if there is an assumed value
		do
			Result := attached assumed_value
		end

	valid_assumed_value (a_value: like assumed_value): BOOLEAN
		deferred
		end

	is_single_value: BOOLEAN
			-- true if constraint is a single value
		deferred
		end

	is_identified: BOOLEAN
			-- True if an explicit node-id was set on this node, as it would be to constraint just the type,
			-- or to override such a node with a particular constraint (the parent node-id must be mentioned)
		do
			Result := not node_id.is_equal (Primitive_node_id)
		end

feature -- Modification

	set_assumed_value (a_value: attached like assumed_value)
			-- set `assumed_value'
		require
			valid_assumed_value (a_value)
		do
			assumed_value := a_value
		ensure
			assumed_value_set: assumed_value = a_value
		end

	set_enumerated_type_constraint
		do
			is_enumerated_type_constraint := True
		end

feature -- Modification

	set_constraint (a_constraint: like constraint)
		do
			constraint := a_constraint
		end

feature -- Output

	as_string: STRING
			-- generate `constraint' as string
		do
			create Result.make (0)
			Result.append (constraint_as_string)
			if attached assumed_value as att_av then
				Result.append ("; " + att_av.out)
			end
		end

	as_enumeration_string (enum_map: HASH_TABLE [STRING, STRING]): STRING
			-- for an enumerated type, generate a set of strings corresponding to the values in `enum_map'
			-- whose keys are enumeration values in string form
		require
			is_enumerated_type_constraint
		do
			create Result.make (0)
		end

	out: STRING
		do
			Result := as_string
		end

feature {NONE} -- Implementation

	constraint_as_string: STRING
			-- generate `constraint' as string
		deferred
		end

invariant
	Assumed_value_valid: attached assumed_value as av implies valid_value (av)

end


