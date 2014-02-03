note
	component:   "openEHR ADL Tools"
	description: "[
					Constrainer type for instances of TERMINOLOGY_CODE. The primary expression of the
					constraint is in the property `tuple_constraint', and comes in 3 variations:
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
			constraint, i_th_tuple_constraint, assumed_value, c_conforms_to, set_constraint,
			as_string, i_th_tuple_constraint_as_string
		end

	OPENEHR_DEFINITIONS
		undefine
			out, default_create
		end

create
	make, default_create

feature -- Access

	constraint: STRING
			-- single at- or ac-code
		do
			Result := tuple_constraint.first
		end

	i_th_tuple_constraint (i: INTEGER): like Current
			-- obtain i-th tuple constraint item
		do
			create Result.make (tuple_constraint.i_th (i).deep_twin)
			if attached value_set_extractor as att_vse then
				Result.set_value_set_extractor (att_vse)
			end
		end

	expanded_value_set: ARRAYED_LIST [STRING]
			-- effective value or value set of single constraint in tuple_constraint, mediated by terminology
			-- to expand an ac-code
		require
			not is_tuple
		do
			if is_valid_constraint_code (constraint) then
				Result := value_set_extractor.item ([constraint])
			else
				create Result.make (0)
				Result.compare_objects
				Result.extend (constraint)
			end
		end

	i_th_expanded_value_set (i: INTEGER): ARRAYED_LIST [STRING]
			-- effective value or value set of i-th tuple constraint in tuple_constraint, mediated by terminology
			-- to expand an ac-code
		require
			i > 0 and i <= tuple_count
		do
			if is_valid_constraint_code (tuple_constraint.i_th (i)) then
				Result := value_set_extractor.item ([tuple_constraint.i_th (i)])
			else
				create Result.make (0)
				Result.compare_objects
				Result.extend (tuple_constraint.i_th (i))
			end
		end

	prototype_value: TERMINOLOGY_CODE
		do
			create Result.make (Local_terminology_id, expanded_value_set.first)
		end

	assumed_value: detachable TERMINOLOGY_CODE

feature -- Status Report

	valid_value (a_value: TERMINOLOGY_CODE): BOOLEAN
			-- see if `a_value', which must be an at-code, is one of the allowed codes in the
			-- value set(s) of this constraint
		do
			if a_value.terminology_id.is_equal (Local_terminology_id) and is_valid_value_code (a_value.code_string) then
				Result := tuple_constraint.has (a_value.code_string)
				if not Result then
					Result := across tuple_constraint as tuple_csr some
						is_valid_constraint_code (tuple_csr.item) and then value_set_extractor.item ([tuple_csr.item]).has (a_value.code_string)
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
				and is_valid_constraint_code (constraint) and is_valid_value_code (a_value.code_string)
		end

feature -- Comparison

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		local
			this_code, other_code: STRING
		do
			Result := node_id_conforms_to (other) and occurrences_conforms_to (other) and
				(rm_type_name.is_case_insensitive_equal (other.rm_type_name) or else
				rm_type_conformance_checker.item ([rm_type_name, other.rm_type_name]))

			if Result and tuple_count = other.tuple_count then
				from tuple_constraint.start until tuple_constraint.off or not Result loop
					this_code := tuple_constraint.item
					other_code := other.tuple_constraint.i_th (tuple_constraint.index)

					if is_valid_constraint_code (this_code) and is_valid_constraint_code (other_code) then
						Result := codes_conformant (this_code, other_code) and then
							is_list_subset (expanded_value_set, other.i_th_expanded_value_set (tuple_constraint.index))
					else
						Result := codes_conformant (this_code, other_code)
					end
					tuple_constraint.forth
				end
			end
		end

feature -- Modification

	add_tuple_code (a_code: STRING)
		require
			is_valid_value_code (a_code) or is_valid_constraint_code (a_code)
		do
			tuple_constraint.extend (a_code)
		end

	set_assumed_value_from_code (a_code: STRING)
		require
			tuple_constraint.has (a_code)
		do
			create assumed_value.make (Local_terminology_id, a_code)
		end

feature {C_TERMINOLOGY_CODE, ARCHETYPE} -- Modification

	set_value_set_extractor (an_agent: attached like value_set_extractor)
		do
			value_set_extractor := an_agent
		end

feature {AOM_POST_PARSE_PROCESSOR} -- Modification

	has_value_code (a_value_code: STRING): BOOLEAN
			-- True if this constraint object knows about the at-code `a_value_code'
		do
			Result := tuple_constraint.has (a_value_code) or else (attached assumed_value as att_av and then att_av.code_string.is_equal (a_value_code))
		end

	set_code (a_code: STRING)
			-- create with ac-code, and assumed 'local' terminology
		require
			not is_tuple and is_valid_value_code (a_code) or is_valid_constraint_code (a_code)
		do
			tuple_constraint.put_i_th (a_code, 1)
		end

	replace_code (old_code, new_code: STRING)
		require
			has_value_code (old_code)
		do
			-- due to tuple constraints, there could be more than
			-- one occurrence of the old_code in the list
			from tuple_constraint.start until tuple_constraint.off loop
				if tuple_constraint.item.is_equal (old_code) then
					tuple_constraint.replace (new_code)
				end
				tuple_constraint.forth
			end

			-- check the assumed code
			if attached assumed_value as att_av and then att_av.code_string.is_equal (old_code) then
				att_av.set_code_string (new_code)
			end
		end

feature {P_C_TERMINOLOGY_CODE} -- Modification

	set_constraint (a_tuple_constraint: ARRAYED_LIST [STRING])
		do
			create tuple_constraint.make (0)
			tuple_constraint.compare_objects
			tuple_constraint.append (a_tuple_constraint)
		end

feature -- Output

	as_string: STRING
			-- <precursor>
		do
			create Result.make(0)
			Result.append ("[")
			Result.append (precursor)
			Result.append ("]")
		end

	as_expanded_string: STRING
			-- output in form with "local::" prepended to `expanded_value_set'
		require
			not is_tuple
		do
			create Result.make(0)
			Result.append ("[")

			Result.append (Local_terminology_id)
			Result.append (Terminology_separator)
			if not is_valid_constraint_code (constraint) then
				Result.append (constraint)
			else
				across expanded_value_set as vset_csr loop
					if not vset_csr.is_first then
						Result.append (", ")
					end
					Result.append (vset_csr.item)
				end
			end

			if attached assumed_value as av then
				Result.append ("; " + av.code_string)
			end
			Result.append ("]")
		end

	i_th_tuple_constraint_as_string (i: INTEGER): STRING
			-- <precursor>
		do
			create Result.make(0)
			Result.append_character ('[')
			Result.append (precursor (i))
			Result.append_character (']')
		end

feature {NONE} -- Implementation

	c_equal_constraint (a_constraint, other_constraint: like constraint): BOOLEAN
			-- True if `a_constraint' is the same as `other_constraint'
		do
			Result := a_constraint.is_equal (other_constraint)
		end

	constraint_as_string (a_constraint: like constraint): STRING
			-- generate `constraint' as string
		do
			Result := a_constraint
		end

	do_constraint_conforms_to (a_constraint, other_constraint: like constraint): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
			-- If both nodes are value set refs, i.e. ac-codes, this ac-code
			-- must be a specialisation of the other
		do
		end

	is_list_subset (list1, list2: like tuple_constraint): BOOLEAN
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


