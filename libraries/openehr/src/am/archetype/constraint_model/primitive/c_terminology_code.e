note
	component:   "openEHR ADL Tools"
	description: "[
					Constrainer type for instances of TERMINOLOGY_CODE. The primary expression of the
					constraint is in the property `code_list', and comes in 3 variations:
						* a single at-code
						* a single ac-code, representing a value-set that is defined in the archetype terminology
						* a list of at- and/or ac-codes, representing the possibilities of a tuple constraint
					The last possibility above is enabled by the merge_tuple routine, which enables the constraint
					of another single-valued C_TERMINOLOGY_CODE to be merged with the current one.
				 ]"
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
	make, default_create

feature -- Initialisation

	make (a_code: STRING)
			-- create with at-code or ac-code `a_code'
		require
			is_valid_value_code (a_code) or is_valid_constraint_code (a_code)
		do
			default_create
			code_list.extend (a_code)
		end

feature -- Access

	code_list: ARRAYED_LIST [STRING]
			-- at-code list of single value or tuple of single values
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	code: STRING
			-- single at- or ac-code
		require
			not is_tuple
		do
			Result := code_list.first
		end

	expanded_value_set: ARRAYED_LIST [STRING]
			-- effective value or value set of single constraint in code_list, mediated by terminology
			-- to expand an ac-code
		require
			not is_tuple
		do
			if is_value_set_code then
				Result := value_set_extractor.item ([code])
			else
				create Result.make (0)
				Result.compare_objects
				Result.extend (code)
			end
		end

	list_count: INTEGER
			-- number of individual constraint items
		do
			Result := code_list.count
		end

	prototype_value: TERMINOLOGY_CODE
		do
			create Result.make (Local_terminology_id, code)
		end

	assumed_value: detachable TERMINOLOGY_CODE

	i_th_constraint (i: INTEGER): C_TERMINOLOGY_CODE
			-- extract i-th code from list and make a C_TERMINOLOGY_CODE from that
		do
			create Result.make (code_list.i_th (i))
		end

feature -- Status Report

	is_value_set_code: BOOLEAN
			-- True if there is just one 'ac' code
		do
			Result := code_list.count = 1 and then is_valid_constraint_code (code_list.first)
		end

	valid_value (a_value: TERMINOLOGY_CODE): BOOLEAN
			-- see if `a_value', which must be an at-code, is one of the allowed codes in the
			-- value set(s) of this constraint
		do
			if a_value.terminology_id.is_equal (Local_terminology_id) and is_valid_value_code (a_value.code_string) then
				Result := code_list.has (a_value.code_string)
				if not Result then
					Result := across code_list as code_list_csr some
						is_valid_constraint_code (code_list_csr.item) and then value_set_extractor.item ([code_list_csr.item]).has (a_value.code_string)
					end
				end
			end
		end

	valid_assumed_value (a_value: TERMINOLOGY_CODE): BOOLEAN
			-- is `a_value' valid to be set as an assumed value for this object?
			-- True if `code' is an ac-code and `a_value' is an at-code. We don't check against
			-- `expanded_value_set' because it may not be constructed yet.
		do
			Result := a_value.terminology_id.is_equal (Local_terminology_id)
				and is_valid_constraint_code (code) and is_valid_value_code (a_value.code_string)
		end

feature -- Comparison

	c_equal (other: like Current): BOOLEAN
			-- True if this node is the same as `other'
		do
			Result := precursor (other) and list_count = other.list_count and then
				across code_list as list_csr all other.code_list.has (list_csr.item) end
		end

feature -- Modification

	merge_tuple (other: like Current)
			-- merge the constraints of `other' into this constraint object. We just add items to
			-- the end of lists of constraints in the subtypes, since the constraints may represent
			-- a tuple vector, in which case duplicates are allowed
		do
			code_list.extend (other.code_list.first)
		end

	add_tuple_code (a_code: STRING)
		require
			is_valid_value_code (a_code) or is_valid_constraint_code (a_code)
		do
			code_list.extend (a_code)
		end

	set_assumed_value_from_code (a_code: STRING)
		require
			code_list.has (a_code)
		do
			create assumed_value.make (Local_terminology_id, a_code)
		end

feature {ARCHETYPE} -- Modification

	set_value_set_extractor (an_agent: attached like value_set_extractor)
		do
			value_set_extractor := an_agent
		end

feature {AOM_POST_PARSE_PROCESSOR} -- Modification

	has_value_code (a_value_code: STRING): BOOLEAN
			-- True if this constraint object knows about the at-code `a_value_code'
		do
			Result := code_list.has (a_value_code) or else (attached assumed_value as att_av and then att_av.code_string.is_equal (a_value_code))
		end

	set_code (a_code: STRING)
			-- create with ac-code, and assumed 'local' terminology
		require
			not is_tuple and is_valid_value_code (a_code) or is_valid_constraint_code (a_code)
		do
			code_list.put_i_th (a_code, 1)
		end

	replace_code (old_code, new_code: STRING)
		require
			has_value_code (old_code)
		local
			i: INTEGER
		do
			-- due to tuple constraints, there could be more than
			-- one occurrence of the old_code in the list
			from code_list.start until code_list.off loop
				if code_list.item.is_equal (old_code) then
					code_list.replace (new_code)
				end
				code_list.forth
			end

			-- check the assumed code
			if attached assumed_value as att_av then
				if att_av.code_string.is_equal (old_code) then
					att_av.set_code_string (new_code)
				end
			end
		end

feature {P_C_TERMINOLOGY_CODE} -- Modification

	set_constraint (a_code_list: ARRAYED_LIST [STRING])
		do
			create code_list.make (0)
			code_list.compare_objects
			code_list.append (a_code_list)
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			Result.append ("[")
			Result.append (code)
			if attached assumed_value as av then
				Result.append ("; " + av.code_string)
			end
			Result.append ("]")
		end

	as_expanded_string: STRING
		require
			not is_tuple
		do
			create Result.make(0)
			Result.append ("[")

			Result.append (Local_terminology_id)
			Result.append (Terminology_separator)
			if not is_value_set_code then
				Result.append (code)
			else
				across expanded_value_set as code_list_csr loop
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

	i_th_constraint_as_string (i: INTEGER): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		do
			create Result.make(0)
			Result.append_character ('[')
			Result.append (code_list.i_th (i))
			Result.append_character (']')
		end

feature {NONE} -- Implementation

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
			-- If both nodes are value set refs, i.e. ac-codes, this ac-code
			-- must be a specialisation of the other
		do
			if is_value_set_code and other.is_value_set_code then
				Result := codes_conformant (code_list.first, other.code_list.first) and then
					is_list_subset (expanded_value_set, other.expanded_value_set)
			else
				Result := codes_conformant (code_list.first, other.code_list.first)
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

	value_set_extractor: detachable FUNCTION [ANY, TUPLE [ac_code: STRING], ARRAYED_LIST [STRING]]
		note
			option: stable
		attribute
		end

end


