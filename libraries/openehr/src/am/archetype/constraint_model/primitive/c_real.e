note

	component:   "openEHR ADL Tools"

	description: "Constrainer type for instances of REAL"
	keywords:    "archetype, boolean, data"

	design:      "openEHR Common Archetype Model 0.2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class C_REAL

inherit
	C_PRIMITIVE

create
	make_range, make_list, make_simple_list

feature -- Initialisation

	make_range (an_interval: INTERVAL[REAL])
		do
			default_create
			range := an_interval
		end

	make_list (a_list: LIST[REAL])
			-- make from a list of integers
		require
			a_list_valid: not a_list.is_empty
		do
			default_create
			create list.make(0)
			list.append (a_list)
		end

	make_simple_list (a_val: REAL)
			-- make from one real
		do
			default_create
			create list.make (0)
			list.extend (a_val)
		end

feature -- Access

	range: detachable INTERVAL [REAL]

	list: detachable ARRAYED_LIST [REAL]

	prototype_value: REAL_REF
		do
			if attached range then
				Result := range.lower
			else
				Result := list.first
			end
		end

feature -- Status Report

	valid_value (a_value: REAL_REF): BOOLEAN
		do
			if attached range as r then
				Result := r.has (a_value)
			elseif attached list as l then
				Result := l.has (a_value)
			end
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			if attached range as rng and attached other.range as other_rng then
				Result := other_rng.contains (rng)
			elseif attached list as l and attached other.list as other_l then
				Result := across l as l_csr some other_l.has (l_csr.item) end
			end
		end

feature -- Output

	as_string: STRING
		local
			out_val: STRING
		do
			create Result.make(0)
			if attached range as rng then
				Result.append ("|" + rng.as_string + "|")
			elseif attached list as l then
				across l as l_csr loop
					if l_csr.target_index > 1 then
						Result.append (", ")
					end

					-- FIXME: REAL.out is broken; forgets to output '.0'
					out_val := l_csr.item.out
					if out_val.index_of ('.', 1) = 0 then
						out_val.append (".0")
					end
					Result.append (out_val)
				end
			end
			if attached assumed_value as av then
				-- FIXME: REAL.out is broken; forgets to output '.0'
				out_val := av.out
				if out_val.index_of ('.', 1) = 0 then
					out_val.append (".0")
				end
				Result.append ("; " + out_val)
			end
		end

invariant
	attached range xor attached list

end


