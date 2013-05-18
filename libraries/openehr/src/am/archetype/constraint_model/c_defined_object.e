note
	component:   "openEHR ADL Tools"
	description: "[
				 ADL object nodes that are defined in line, rather than being
				 defined as references to exterior resources.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_DEFINED_OBJECT

inherit
	C_OBJECT

feature -- Access

	prototype_value: ANY
			-- 	generate a default value from this constraint object
		deferred
		end

    assumed_value: detachable like prototype_value
            -- value to be assumed if none sent in data

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed ('*' received in parsed input)
		deferred
		end

	valid_value (a_value: like prototype_value): BOOLEAN
		deferred
		end

	has_assumed_value: BOOLEAN
			-- True if there is an assumed value
		do
			Result := attached assumed_value
		end

feature -- Modification

	set_assumed_value (a_value: attached like assumed_value)
			-- set `assumed_value'
		require
			valid_value(a_value)
		do
			assumed_value := a_value
		ensure
			assumed_value_set: assumed_value = a_value
		end

invariant
	Assumed_value_valid: attached assumed_value as av implies valid_value (av)
	Any_allowed_validity: not (any_allowed and is_prohibited)

end


