note
	component:   "openEHR ADL Tools"
	description: "Abstract parent type for primitive types in Archetype Object Model."
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_PRIMITIVE_OBJECT

inherit
	C_LEAF_OBJECT
		redefine
			default_create, out, enter_subtree, exit_subtree
		end

feature -- Initialisaiton

	default_create
			-- set `rm_type_name'
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			rm_type_name := aom_builtin_type
			set_node_id (Primitive_node_id)
		end

	make (a_constraint: like constraint)
		do
			default_create
			constraint := a_constraint
		end

feature -- Access

	constraint: ANY
			-- single constraint represented by this object

	aom_builtin_type: STRING
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			Result := generating_type
			Result.remove_head (2)
		end

    assumed_value: detachable ANY
            -- value to be assumed if none sent in data

	match_path: STRING
			-- same as path but with final object_id removed
		local
			og_path: OG_PATH
		do
			og_path := representation.path
			og_path.last.clear_object_id
			Result := og_path.as_string
		end

feature -- Status Report

	has_assumed_value: BOOLEAN
			-- True if there is an assumed value
		do
			Result := attached assumed_value
		end

	valid_assumed_value (a_value: like assumed_value): BOOLEAN
		deferred
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

feature {P_C_PRIMITIVE_OBJECT} -- Modification

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
			if attached assumed_value then
				Result.append ("; " + assumed_value.out)
			end
		end

	out: STRING
		do
			Result := as_string
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_c_primitive_object (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_primitive_object (Current, depth)
		end

feature {NONE} -- Implementation

	constraint_as_string: STRING
			-- generate `constraint' as string
		deferred
		end

invariant
	Assumed_value_valid: attached assumed_value as av implies valid_value (av)

end


