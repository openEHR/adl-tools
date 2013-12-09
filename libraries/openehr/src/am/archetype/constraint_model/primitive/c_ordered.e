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
			default_create, assumed_value, c_equal
		end

feature -- Initialisation

	default_create
		do
			precursor
			create list.make (0)
		end

	make_interval (an_interval: INTERVAL [G])
		do
			default_create
			list.extend (an_interval)
		ensure
			list.has (an_interval)
		end

	make_list (a_list: like list)
		do
			default_create
			list := a_list
		ensure
			list = a_list
		end

	make_list_simple (a_list: LIST [G])
			-- make from a list of values
		require
			a_list_valid: not a_list.is_empty
		do
			default_create
			across a_list as vals_csr loop
				list.extend (create {POINT_INTERVAL [G]}.make (vals_csr.item))
			end
		end

	make_simple (v: G)
		do
			default_create
			list.extend (create {POINT_INTERVAL [G]}.make (v))
		end

feature -- Access

	list: ARRAYED_LIST [INTERVAL [G]]

	list_count: INTEGER
			-- number of individual constraint items
		do
			Result := list.count
		end

	i_th_constraint (i: INTEGER): INTERVAL [G]
			-- obtain i-th constraint item
		do
			Result := list.i_th (i)
		end

	prototype_value: G
		do
			if not list.is_empty then
				if attached list.first.lower as l then
					Result := l
				elseif attached list.first.upper as u then
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
			Result := across list as ivl_csr some ivl_csr.item.has (a_value) end
		end

feature -- Comparison

	c_equal (other: like Current): BOOLEAN
			-- True if this node is the same as `other'
		do
			if precursor (other) and list_count = other.list_count then
				Result := True
				from list.start until list.off or not Result loop
					Result := across other.list as other_list_csr some other_list_csr.item.is_equal (list.item) end
					list.forth
				end
			end
		end

feature -- Modification

	merge_tuple (other: like Current)
			-- merge the constraints of `other' into this constraint object. We just add items to
			-- the end of lists of constraints in the subtypes, since the constraints may represent
			-- a tuple vector, in which case duplicates are allowed
		do
			list.append (other.list)
		end

	add_value (a_val: G)
		do
			list.extend (create {POINT_INTERVAL [G]}.make (a_val))
		end

	add_interval (an_interval: INTERVAL [G])
		do
			list.extend (an_interval)
		end

	set_constraint (a_list: like list)
		do
			list := a_list
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			if not list.is_empty then
				across list as ivl_csr loop
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

				if attached {G} assumed_value as av then
					Result.append ("; " + format_value (av))
				end
			end
		end

	i_th_constraint_as_string (i: INTEGER): STRING
			-- obtain i-th constraint item
		do
			create Result.make(0)
			if not list.i_th(i).is_point then
				Result.append_character ('|')
			end
			Result.append (list.i_th(i).as_string)
			if not list.i_th(i).is_point then
				Result.append_character ('|')
			end
		end

feature {NONE} -- Implementation

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			across list as ivl_csr loop
				Result := across other.list as other_ivl_csr some other_ivl_csr.item.contains (ivl_csr.item) end
			end
		end

	format_value (a_val: G): STRING
		do
			Result := a_val.out
		end

end


