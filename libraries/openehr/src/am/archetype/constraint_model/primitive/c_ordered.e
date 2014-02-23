note
	component:   "openEHR ADL Tools"
	description: "Abstract constrainer type for instances of comparable primitive types"
	keywords:    "archetype, comparable"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_ORDERED [G -> COMPARABLE create default_create end]

inherit
	C_PRIMITIVE_OBJECT
		redefine
			default_create, constraint, c_congruent_to, c_conforms_to, assumed_value, as_string
		end

feature -- Initialisation

	default_create
		do
			precursor
			create constraint.make (0)
		end

	make_interval (an_interval: INTERVAL [G])
			-- make single constraint with `an_interval'
		do
			default_create
			constraint.extend (an_interval)
		ensure
			constraint.has (an_interval)
		end

	make_value_list (a_values: LIST [G])
			-- make from a list of values
		require
			Values_valid: not a_values.is_empty
		do
			default_create
			across a_values as vals_csr loop
				constraint.extend (create {POINT_INTERVAL [G]}.make (vals_csr.item))
			end
		end

	make_value (v: G)
		do
			default_create
			constraint.extend (create {POINT_INTERVAL [G]}.make (v))
		end

feature -- Access

	constraint: ARRAYED_LIST [INTERVAL [G]]
			-- single constraint represented by this object; accommodates
			-- single interval, multiple interval, list of single values, mixed values / intervals

	prototype_value: G
		do
			if not constraint.is_empty then
				if attached constraint.first.lower as l then
					Result := l
				elseif attached constraint.first.upper as u then
					Result := u
				else
					create Result.default_create
				end
			else
				create Result.default_create
			end
		end

	assumed_value: detachable COMPARABLE

feature -- Status Report

	valid_value (a_value: G): BOOLEAN
		do
			Result := across constraint as ivl_csr some ivl_csr.item.has (a_value) end
		end

feature -- Comparison

	c_congruent_to (other: like Current): BOOLEAN
			-- True if this node is the same as `other'
		do
			Result := precursor (other) and constraint.count = other.constraint.count and
				across constraint as ivl_csr all
					ivl_csr.item.is_equal (other.constraint.i_th (ivl_csr.cursor_index))
				end
		end

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node is a strict subset of `other'
		do
			Result := precursor (other, rm_type_conformance_checker) and
				across constraint as ivl_csr all
					across other.constraint as other_ivl_csr some other_ivl_csr.item.contains (ivl_csr.item) end
				end
		end

feature -- Modification

	add_value (a_val: G)
		do
			constraint.extend (create {POINT_INTERVAL [G]}.make (a_val))
		end

	add_interval (an_interval: INTERVAL [G])
		do
			constraint.extend (an_interval)
		end

feature -- Output

	as_string: STRING
			-- generate `constraint' as string
		do
			Result := constraint_as_string
			if attached {G} assumed_value as av then
				Result.append ("; " + format_value (av))
			end
		end

feature {NONE} -- Implementation

	constraint_as_string: STRING
			-- <precursor>
		do
			create Result.make_empty
			across constraint as ivl_csr loop
				if not ivl_csr.item.is_point then
					Result.append_character ('|')
				end
				Result.append (ivl_csr.item.as_string)
				if not ivl_csr.item.is_point then
					Result.append_character ('|')
				end
				if not ivl_csr.is_last then
					Result.append (", ")
				end
			end
		end

	format_value (a_val: G): STRING
		do
			Result := a_val.out
		end

end


