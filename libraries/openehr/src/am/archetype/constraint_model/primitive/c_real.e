note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of REAL"
	keywords:    "archetype, real"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_REAL

inherit
	C_ORDERED [REAL]
		redefine
			assumed_value, enter_subtree, exit_subtree, format_value
		end

create
	make, make_interval, make_value, make_value_list, make_example, default_create, make_identified_default

feature {NONE} -- Initialisation

	make_example
		do
			make_interval (create {PROPER_INTERVAL[REAL]}.make_bounded (0.0, 1.0, True, True))
		end

feature -- Access

    assumed_value: detachable REAL_REF
            -- value to be assumed if none sent in data

	prototype_value: REAL
		do
			if not constraint.is_empty then
				if attached constraint.first.lower as l then
					if attached constraint.first.upper as u then
						Result := (l + u) / 2
					else
						Result := l
					end
				elseif attached constraint.first.upper as u then
					Result := u
				else
					create Result.default_create
				end
			else
				create Result.default_create
			end
		end

feature -- Status Report

	valid_assumed_value (a_value: REAL_REF): BOOLEAN
		do
			Result := valid_value (a_value.item)
		end

feature -- Conversion

	format_value (a_val: REAL): STRING
		do
			Result := format_real (a_val)
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_c_real (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_real (Current, depth)
		end

end


