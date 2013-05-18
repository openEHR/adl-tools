note
	component:   "openEHR ADL Tools"
	description: "parent type of constrainer types of simple types"
	keywords:    "archetype, string, data"
	design:      "openEHR Common Archetype Model 0.2"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_PRIMITIVE

inherit
	ANY
		redefine
			out
		end

feature -- Access

	prototype_value: ANY
			-- 	generate a prototype value from this constraint object
		deferred
		end

	assumed_value: detachable like prototype_value
			-- assumed value for this constraint object
			-- FIXME: consider consolidating with assumed_value in C_DOMAIN_TYPE

	rm_type_name: STRING
			-- generate a Reference Model type name that this type constrains. Generally this is
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			Result := generating_type
			Result.remove_head (2)
		end

feature -- Status Report

	valid_value (a_value: like prototype_value): BOOLEAN
		deferred
		end

	has_assumed_value: BOOLEAN
			-- True if there is an assumed value
		do
			Result := attached assumed_value
		end

feature -- Modification

	set_assumed_value (a_value: like prototype_value)
			-- set `assumed_value'
		require
			valid_value (a_value)
		do
			assumed_value := a_value
		ensure
			assumed_value_set: assumed_value = a_value
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		deferred
		end

feature -- Output

	as_string: STRING
		deferred
		end

	out: STRING
		do
			Result := as_string
		end

invariant
	Assumed_value_valid: attached assumed_value as av implies valid_value (av)

end


