note
	component:   "openEHR ADL Tools"

	description: "[
			 Ancestor class of identifiers of informational objects. Ids may be completely meaningless, 
			 in which case their only job is to refer to something, or may carry some information to do 
			 with the identified object.
			 ]"
	keywords:    "object identifiers"
	design:      "openEHR Common Reference Model 1.4.1"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class OBJECT_ID

inherit
	COMPARABLE
		redefine
			out
		end

	OPENEHR_DEFINITIONS
		export
			{NONE} all
		undefine
			is_equal, out
		end

feature {NONE} -- Initialization

	make_from_string (a_string: STRING)
			-- make from a string of the same form as `id', i.e. "root::extension"
		require
			String_exists: valid_id (a_string)
		do
			value := a_string
		end

feature -- Access

	value: STRING
        attribute
            create Result.make_empty
        end

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
			--
		require
			an_id_valid: not an_id.is_empty
		deferred
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := value < other.value
		end

feature -- Output

	out: STRING
		do
			Result := value
		end

invariant
	value_valid: not value.is_empty

end



