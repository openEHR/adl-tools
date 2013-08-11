note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of TERMINOLOGY_CODE"
	keywords:    "archetype, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_TERMINOLOGY_CODE

inherit
	C_PRIMITIVE

	BASIC_DEFINITIONS
		export
			{NONE} all
		undefine
			default_create, out
		end

create
	make, make_with_codes, make_with_code

feature -- Definitions

	-- FIXME: these have been copied from CODE_PHRASE for now;
	-- in future, this class should just use C_CODE_PHRASE to represent its data

	separator: STRING = "::"

feature -- Initialisation

	make (a_terminology_id: STRING)
		do
			default_create
			terminology_id := a_terminology_id
		end

	make_with_codes (a_terminology_id: STRING; codes: SET [STRING])
		require
			Codes_valid: codes.object_comparison and not codes.is_empty
		do
			default_create
			terminology_id := a_terminology_id
			create code_list.make
			code_list.compare_objects
			code_list.merge (codes)
		end

	make_with_code (a_terminology_id: STRING; code: STRING)
		do
			default_create
			terminology_id := a_terminology_id
			create code_list.make
			code_list.compare_objects
			code_list.extend (code)
		end

feature -- Access

	terminology_id: STRING

	terminology_version: detachable STRING

	code_list: detachable LINKED_SET [STRING]

	prototype_value: TERMINOLOGY_CODE
		do
			create Result.make (terminology_id, "01")
		end

feature -- Status Report

	valid_value (a_value: TERMINOLOGY_CODE): BOOLEAN
		do
			if a_value.terminology_id.is_equal (terminology_id) then
				if attached code_list as att_codes then
					Result := att_codes.has (a_value.code_string)
				else
					Result := True
				end
			end
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			if other.terminology_id.is_equal (terminology_id) then
				if attached code_list as att_codes and then attached other.code_list as other_att_codes then
					Result := att_codes.is_subset (other_att_codes)
				end
			end
		end

feature -- Modification

	set_terminology_version (a_version: STRING)
		do
			terminology_version := a_version
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			Result.append ("[" + terminology_id)

			if attached terminology_version as tv then
				Result.append (tv)
			end
			Result.append (separator)

			if attached code_list as clist then
				across clist as code_list_csr loop
				if not code_list_csr.is_first then
						Result.append (", ")
					end
					Result.append (code_list_csr.item)
				end
			end

			if attached assumed_value as av then
				Result.append ("; " + av.code_string)
			end

			Result.append ("]")
		end

end


