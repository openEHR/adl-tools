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
	C_ORDERED [INTEGER]
		redefine
			assumed_value, enter_subtree, exit_subtree, as_enumeration_string
		end

create
	make, make_interval, make_value, make_value_list, make_example, default_create

feature {NONE} -- Initialisation

	make_example
		do
			make_interval (create {PROPER_INTERVAL[INTEGER]}.make_bounded (0, 1, True, True))
		end

feature -- Access

    assumed_value: detachable INTEGER_REF
            -- value to be assumed if none sent in data

    constraint_values: ARRAYED_SET [INTEGER]
    		-- constraint values as a list of integer values
    	local
    		i: INTEGER
    	do
    		create Result.make (0)
    		across constraint as ivl_csr loop
    			from i := ivl_csr.item.lower until i > ivl_csr.item.upper loop
    				Result.extend (i)
    				i := i + 1
    			end
    		end
    	end

feature -- Status Report

	valid_assumed_value (a_value: INTEGER_REF): BOOLEAN
		do
			Result := valid_value (a_value.item)
		end

feature -- Output

	as_enumeration_string (enum_map: HASH_TABLE [STRING, STRING]): STRING
			-- for an enumerated type, generate a set of strings corresponding to the values in `enum_map'
			-- whose keys are enumeration values in string form
		do
			create Result.make (0)
			across constraint_values as vals_csr loop
				check attached enum_map.item (vals_csr.item.out) as enum_item_name then
					Result.append (enum_item_name)
				end
				if not vals_csr.is_last then
					Result.append (", ")
				end
			end
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_c_integer (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_integer (Current, depth)
		end

end


