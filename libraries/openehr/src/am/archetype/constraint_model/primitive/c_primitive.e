note
	component:   "openEHR ADL Tools"
	description: "parent type of constrainer types of simple types"
	keywords:    "archetype, string, data"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_PRIMITIVE

inherit
	ANY
		redefine
			out, default_create
		end

feature -- Initialisaiton

	default_create
			-- set `rm_type_name'
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			rm_type_name := generating_type
			rm_type_name.remove_head (2)
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
			-- Reference Model type name that this type constrains

feature -- AOM type mappings

	rm_type_mapping: detachable AOM_TYPE_MAPPING
			-- optional mapping from property names in descendants of this type to property names in
			-- an RM type

	rm_property_name (a_key: STRING): STRING
			-- return the name of a property name that is either a native one of this class,
			-- or else a mapped name from a reference model in use by the compiler
		do
			if attached rm_type_mapping as rm_tm and then rm_tm.property_mappings.has (a_key) and then attached rm_tm.property_mappings.item (a_key) as prop_mapping then
				Result := prop_mapping.target_property_name
			else
				Result := a_key
			end
		end

	set_rm_type_mapping (a_rm_type_mapping: attached like rm_type_mapping)
		do
			rm_type_mapping := a_rm_type_mapping
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

	set_rm_type_name (a_name: STRING)
		do
			rm_type_name := a_name
		end

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


