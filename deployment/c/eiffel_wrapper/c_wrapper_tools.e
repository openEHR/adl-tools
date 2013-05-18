note
	component:   "openEHR ADL Tools"
	description: "C wrapper tools"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class C_WRAPPER_TOOLS

feature -- Conversion

	eif_list_string_to_c_array(a_list: LIST [STRING]): POINTER
			-- convert and Eiffel a_list: ARRAYED_LIST [STRING] to
			-- ARRAY<POINTER>, which is passed back as a POINTER
        local
            i: INTEGER
            c_str: BASE_C_STRING
            c_str_array: ANY
       do
            create eif_ptr_array.make(0, a_list.count-1)
            from
                a_list.start
            until
                a_list.off
            loop
                create c_str.make(a_list.item)
                eif_ptr_array.put(c_str.item, i)  -- put a pointer to a string into the array
                i := i + 1
                a_list.forth
            end
            c_str_array := eif_ptr_array.to_c -- get hold of the SPECIAL holding the string pointers
            Result := $c_str_array -- generate a pointer to that
        end

   eif_ptr_array: ARRAY [POINTER]

   c_array_string_to_eif_list (a_str_lst: ARRAY [POINTER]): ARRAYED_LIST [STRING]
			-- convert a C ARRAY<POINTER> to an Eiffel ARRAYED_LIST [STRING]
		require
			a_str_lst /= void
		local
			c_a_str: BASE_C_STRING
			i: INTEGER
		do
			create Result.make(0)

			from
				i := a_str_lst.lower
			until
				i > a_str_lst.upper
			loop
				create c_a_str.make_by_pointer (a_str_lst.item(i))
				Result.extend(c_a_str.string)
				i := i + 1
			end
		end

end



