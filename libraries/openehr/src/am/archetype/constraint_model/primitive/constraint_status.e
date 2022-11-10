note
	component:   "openEHR ADL Tools"
	description: "[
					Status of constraint, with values allowing for 'soft' constraints, which are effectively different kinds of suggestions.
				 ]"
	keywords:    "archetype, terminology"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2022- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CONSTRAINT_STATUS

feature -- Definitions

	Required: 	INTEGER = 0

	Extensible: INTEGER = 1

	Preferred: 	INTEGER = 2

	Example:    INTEGER = 3

feature -- Access

	value: INTEGER

feature -- Status Report

	valid_value (v: INTEGER): BOOLEAN
			-- True if v is a valid constraint status
		do
			Result := v >= Required and v <= Example
		end

	valid_value_name (s: STRING): BOOLEAN
			-- True if s is a valid constraint status name
		do
			Result := value_names.has (s)
		end

feature -- Modification

	set_value (v: INTEGER)
		require
			valid_value (v)
		do
			value := v
		end

	set_from_name (s: STRING)
			-- set from a string name
		require
			valid_value_name (s)
		do
			set_value (value_names.item (s))
		end

	set_required
		do
			value := Required
		end

	set_extensible
		do
			value := Extensible
		end

	set_preferred
		do
			value := Preferred
		end

	set_example
		do
			value := Example
		end

feature -- Output

	as_string: STRING
		do
			Result := ""
			across value_names as csr loop
				if csr.item = value then
					Result := csr.key
				end
			end
		end

feature {NONE} -- Implementation

	value_names: HASH_TABLE [INTEGER, STRING]
		once
			create Result.make(0)
			Result.put (Required,   "Required")
			Result.put (Extensible, "Extensible")
			Result.put (Preferred,  "Preferred")
			Result.put (Example,    "Example")
		end

invariant

	Value_valid: valid_value (value)

end


