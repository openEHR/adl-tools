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
	C_PRIMITIVE_OBJECT
		redefine
			assumed_value, c_equal
		end

	OPENEHR_DEFINITIONS
		undefine
			out, default_create
		end

create
	make, make_from_codes, make_from_code, make_from_terminology_code, default_create

feature -- Initialisation

	make (a_terminology_id: STRING)
		do
			default_create
			terminology_id := a_terminology_id
		end

	make_from_codes (a_terminology_id: STRING; codes: LIST [STRING])
		require
			Codes_valid: codes.object_comparison and not codes.is_empty
		do
			default_create
			terminology_id := a_terminology_id
			code_list.append (codes)
		end

	make_from_code (a_terminology_id: STRING; code: STRING)
		do
			default_create
			terminology_id := a_terminology_id
			code_list.extend (code)
		end

	make_from_terminology_code (a_terminology_code: TERMINOLOGY_CODE)
		do
			default_create
			terminology_id := a_terminology_code.terminology_id
			code_list.extend (a_terminology_code.code_string)
		end

feature -- Access

	terminology_id: STRING
		attribute
			create Result.make_from_string (Local_terminology_id)
		end

	terminology_version: detachable STRING

	code_list: ARRAYED_LIST [STRING]
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	list_count: INTEGER
			-- number of individual constraint items
		do
			Result := code_list.count
		end

	prototype_value: TERMINOLOGY_CODE
		do
			if not code_list.is_empty then
				create Result.make (terminology_id, code_list.first)
			else
				create Result.make (terminology_id, "01")
			end
		end

	assumed_value: detachable TERMINOLOGY_CODE

	code_count: INTEGER
			-- number of codes in code_list
		do
			Result := code_list.count
		end

	i_th_constraint (i: INTEGER): C_TERMINOLOGY_CODE
			-- extract i-th code from list and make a TERMINOLOGY_CODE from that
		do
			create Result.make_from_code (terminology_id, code_list.i_th (i))
		end

feature -- Status Report

	is_local: BOOLEAN
			-- True if this terminology id = "local"
		do
			Result := terminology_id.is_equal (Local_terminology_id)
		end

	valid_value (a_value: TERMINOLOGY_CODE): BOOLEAN
		do
			if a_value.terminology_id.is_equal (terminology_id) then
				if not code_list.is_empty then
					Result := code_list.has (a_value.code_string)
				else
					Result := True
				end
			end
		end

	valid_assumed_value (a_value: TERMINOLOGY_CODE): BOOLEAN
		do
			Result := valid_value (a_value)
		end

feature -- Comparison

	c_equal (other: like Current): BOOLEAN
			-- True if this node is the same as `other'
		do
			Result := precursor (other) and list_count = other.list_count and then
				terminology_id.is_equal (other.terminology_id) and then
				terminology_version ~ other.terminology_version and then
				across code_list as list_csr all other.code_list.has (list_csr.item) end
		end

feature -- Modification

	merge_tuple (other: like Current)
			-- merge the constraints of `other' into this constraint object. We just add items to
			-- the end of lists of constraints in the subtypes, since the constraints may represent
			-- a tuple vector, in which case duplicates are allowed
		do
			code_list.append (other.code_list)
		end

	add_code (a_code: STRING)
		require
			not attached code_list or else attached code_list as cl and then not cl.has (a_code)
		do
			code_list.extend (a_code)
		end

	set_terminology_version (a_version: STRING)
		do
			terminology_version := a_version
		end

	set_assumed_value_from_code (a_code: STRING)
		require
			code_list.has (a_code)
		do
			create assumed_value.make (terminology_id, a_code)
		end

feature {P_C_TERMINOLOGY_CODE} -- Modification

	set_constraint (a_terminology_id: STRING; a_terminology_version: detachable STRING; a_code_list: detachable ARRAYED_LIST [STRING])
		do
			terminology_id := a_terminology_id
			terminology_version := a_terminology_version
			if attached a_code_list as att_cl then
				code_list := att_cl
			end
		end

--feature -- Conversion

--	adl_14_reformat_codes
--			-- renumber codes to support ADL 1.4 at-codes being used in ADL 1.5
--		obsolete
--			"Support for ADL 1.4 at-codes in ADL 1.5 archetypes"
--		do
--			if is_local then
--				from code_list.start until code_list.off loop
--					code_list.replace (adl_14_code_reformatted (code_list.item))
--					code_list.forth
--				end
--				if attached assumed_value as att_av then
--					create assumed_value.make (att_av.terminology_id, adl_14_code_reformatted (att_av.code_string))
--				end
--			end
--		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			Result.append ("[" + terminology_id)

			if attached terminology_version as tv then
				Result.append (tv)
			end
			Result.append (Terminology_separator)

			across code_list as code_list_csr loop
				if not code_list_csr.is_first then
					Result.append (", ")
				end
				Result.append (code_list_csr.item)
			end

			if attached assumed_value as av then
				Result.append ("; " + av.code_string)
			end

			Result.append ("]")
		end

	i_th_constraint_as_string (i: INTEGER): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		do
			create Result.make(0)
			Result.append_character ('[')
			Result.append (terminology_id)
			if attached terminology_version as tv then
				Result.append (tv)
			end
			Result.append (Terminology_separator)
			Result.append (code_list.i_th (i))
			Result.append_character (']')
		end

feature {NONE} -- Implementation

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			if other.terminology_id.is_equal (terminology_id) then
				Result := is_list_subset (code_list, other.code_list)
			end
		end

	is_list_subset (list1, list2: like code_list): BOOLEAN
			-- determine if list1 is a subset of list 2, even though they
			-- might contain duplicates
		local
			set1, set2: ARRAYED_SET [STRING]
		do
			create set1.make (0)
			set1.compare_objects
			set1.fill (list1)

			create set2.make (0)
			set2.compare_objects
			set2.fill (list2)

			Result := set1.is_subset (set2)
		end

end


