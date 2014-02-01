note
	component:   "openEHR ADL Tools"
	description: "Helper class that contains output of parsing ADL term constraint patter e.g. local::at10, at11, at12; at10"
	keywords:    "archetype, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TERM_CONSTRAINT_PARSE_STRUCTURE

inherit
	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make, make_local

feature -- Initialisation

	make
		do
			create terminology_id.make_empty
			create codes.make (0)
			codes.compare_objects
		end

	make_local
			-- make empty with terminology = "local"
		do
			make
			terminology_id.append (Local_terminology_id)
		end

feature -- Access

	terminology_id: STRING

	codes: ARRAYED_LIST [STRING]

	assumed_code: detachable STRING

feature -- Status Report

	is_local: BOOLEAN
			-- True if the terminology_id here = "local"
		do
			Result := terminology_id.is_equal (Local_terminology_id)
		end

	is_single: BOOLEAN
			-- True if it's a single code in the term set
		do
			Result := codes.count = 1
		end

	has_code (a_code: STRING): BOOLEAN
		do
			Result := codes.has (a_code)
		end

	has_codes: BOOLEAN
		do
			Result := not codes.is_empty
		end

	has_assumed_code: BOOLEAN
		do
			Result := attached assumed_code
		end

	first_code: STRING
		require
			has_codes
		do
			codes.start
			Result := codes.item
		end

feature -- Modification

	set_terminology_id (a_terminology_id: STRING)
		require
			not a_terminology_id.is_empty
		do
			terminology_id := a_terminology_id
		end

	add_code (a_code: STRING)
		require
			not has_code (a_code)
		do
			codes.extend (a_code)
		end

	set_assumed_code (a_code: STRING)
		require
			has_code (a_code)
		do
			assumed_code := a_code
		end

feature -- Factory

	convert_to_local (at_code_generator: FUNCTION [ANY, TUPLE, STRING])
			-- create an at-coded equivalent structure in `last_converted_local' and bindings from the
			-- at-codes in the new structure to the current codes in `last_converted_local_bindings',
			-- using the URI template `binding_uri_template', which must have $terminology_id and
			-- $code_string embedded
		require
			not is_local
		local
			new_at_code, uri_str: STRING
		do
			create last_converted_local.make_local
			create last_converted_local_bindings.make (0)
			create last_converted_binding_map.make (0)
			across codes as codes_csr loop
				-- generate at-code in new structure
				new_at_code := at_code_generator.item ([])
				last_converted_local.add_code (new_at_code)

				-- if this code is the assumed one, write the at-code in to new structure
				if attached assumed_code as att_ac and then att_ac.is_equal (codes_csr.item) then
					last_converted_local.set_assumed_code (new_at_code)
				end

				-- create a binding entry
				uri_str := uri_for_code (terminology_id, codes_csr.item)
				last_converted_local_bindings.put (create {URI}.make_from_string (uri_str), new_at_code)
				last_converted_binding_map.put (new_at_code, codes_csr.item)
			end
		end

	last_converted_local: detachable TERM_CONSTRAINT_PARSE_STRUCTURE

	last_converted_local_bindings: detachable HASH_TABLE [URI, STRING]

	last_converted_binding_map: detachable HASH_TABLE [STRING, STRING]

end


