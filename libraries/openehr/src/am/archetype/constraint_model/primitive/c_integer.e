note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of INTEGER"
	keywords:    "archetype, integer"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_INTEGER

inherit
	C_PRIMITIVE_OBJECT

create
	make_range, make_list, make_simple_list, default_create

feature -- Initialisation

	make_range (an_interval: INTERVAL [INTEGER])
		do
			default_create
			range := an_interval
		end

	make_list (a_list: LIST [INTEGER])
			-- make from a list of integers
		require
			a_list_valid: not a_list.is_empty
		do
			default_create
			create list.make (0)
			list.append (a_list)
		end

	make_simple_list (a_val: INTEGER)
			-- make from one integer
		do
			default_create
			create list.make (0)
			list.extend (a_val)
		end

feature -- Access

	range: detachable INTERVAL [INTEGER]

	list: detachable ARRAYED_LIST [INTEGER]

	prototype_value: INTEGER_REF
		do
			if attached range as r then
				Result := r.lower
			else
				check attached list as l then
					Result := l.first
				end
			end
		end

feature -- Status Report

	valid_value (a_value: INTEGER_REF): BOOLEAN
		do
			if attached range as r then
				Result := r.has (a_value)
			elseif attached list as l then
				Result := l.has (a_value)
			end
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			if attached range as rng then
				Result.append("|" + rng.as_string + "|")
			elseif attached list as l then
				across l as list_csr loop
					if list_csr.target_index > 1 then
						Result.append (", ")
					end
					Result.append (list_csr.item.out)
				end
			end
			if attached assumed_value as av then
				Result.append ("; " + av.out)
			end
		end

	as_canonical_string: STRING
		do
			Result := as_string
		end

feature {P_C_INTEGER} -- Modification

	set_constraint (a_range: like range; a_list: like list)
		do
			list := a_list
			range := a_range
		end

feature {NONE} -- Implementation

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			if attached range as rng and attached other.range as other_rng then
				Result := other_rng.contains (rng)
			elseif attached list as l and attached other.list as other_l then
				Result := across l as l_csr some other_l.has (l_csr.item) end
			end
		end

invariant
	attached range xor attached list

end


