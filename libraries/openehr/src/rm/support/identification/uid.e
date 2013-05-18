note
	component:   "openEHR ADL Tools"
	description: "[
				 Abstract parent of classes representing unique identifiers which 
				 identify information entities in a durable way. UIDs only ever 
				 identify one information entity in time or space and are never re-used.
				 Ancestor class of machine unique identifier types, e.g. ISO oids,
				 UID, internet addresses.
				 ]"
	keywords:    "unique identifiers"
	design:      "openEHR Support Information Model 1.5"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class UID

feature -- Definitions

	Default_value: STRING
			-- value for default id
		deferred
		end

feature -- Initialisation

	make (a_str: STRING)
			-- make from a string
		require
			Valid_id: valid_id (a_str)
		do
			value := a_str
		ensure
			Value_set: value = a_str
		end

feature -- Access

	value: STRING
		attribute
			create Result.make_from_string (Default_value)
		end

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
			--
		require
			an_id_valid: not an_id.is_empty
		deferred
		end

invariant
	value_valid: not value.is_empty

end



