note
	component:   "openEHR Archetype Project"
	description: "Object node type representing constraint on text or term"
	keywords:    "codephrase, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class C_CODE_PHRASE

inherit
	C_DOMAIN_TYPE
		redefine
			out, enter_subtree, exit_subtree, synchronise_to_tree, inferred_specialisation_status, node_conforms_to, default_create
		end

create
	make_from_pattern, make_from_terminology_id, make_dt, default_create

feature -- Definitions

	-- FIXME: these have been copied from CODE_PHRASE for now;
	-- in future, this class should just use C_CODE_PHRASE to represent its data

	separator: STRING = "::"

feature -- Initialisation

	default_create
		do
			make_from_terminology_id ("(uninitialised)")
		end

	make_from_terminology_id (a_terminology_id: STRING)
			-- Make from `terminology_id'.
		do
			create terminology_id.make (a_terminology_id)
		ensure
			Not_any_allowed: not any_allowed
			Terminology_id_set: attached terminology_id as tid and then tid.value.is_equal (a_terminology_id)
		end

	make_from_pattern (a_pattern: STRING)
			-- Make from pattern of form "terminology_id::code, code, ... [; code]".
			-- Pattern "terminology_id::" is legal.
		require
			valid_pattern (a_pattern)
		do
			initialise_from_pattern (a_pattern)
		ensure
			Not_any_allowed: not any_allowed
			Terminology_id_exists: attached terminology_id
		end

feature -- Access

	terminology_id: detachable TERMINOLOGY_ID
			-- id of terminology from which codes come. If code list empty, any code from
			-- this terminology is allowed

	code_list: detachable ARRAYED_LIST[STRING]
			-- list of codes in terminology designated by terminology_id

	code_count: INTEGER
			-- number of codes in code_list
		do
			if attached code_list then
				Result := code_list.count
			end
		end

	prototype_value: CODE_PHRASE
			-- generate a default value from this constraint object of the form
			-- "terminology_id::code_string"
		do
			if attached assumed_value as av then
				Result := av
			elseif any_allowed then
				create Result
			elseif attached terminology_id as tid then
				 -- must have a terminology_id	
				if attached code_list as clist then
					create Result.make_from_string (tid.value + separator + clist.first)
				else
					create Result.make_from_string (tid.value + separator)
				end
			else
				create Result.default_create
			end
		end

	fail_reason: detachable STRING

feature -- Statistics

	constrained_rm_attributes: ARRAYED_SET [STRING]
			-- report which attributes of the equivalent DV_QUANTITY are being constrained here
		do
			create Result.make (0)
			Result.compare_objects
			if attached terminology_id then
				Result.extend ("terminology_id")
			end
			if attached code_list then
				Result.extend ("code_string")
			end
		end

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed
			-- i.e. no terminology_id or code_list
		do
			Result := terminology_id = Void and code_list = Void
		end

	is_local: BOOLEAN
			-- True if this terminology id = "local"
		require
			not any_allowed
		do
			Result := attached terminology_id as tid and then tid.is_local
		end

	valid_value (a_value: like prototype_value): BOOLEAN
			-- check a value of the form "terminology_id::code_string"
		do
			if any_allowed then
				Result := True
			else
				if attached terminology_id as tid then
					Result := a_value.terminology_id.value.is_equal (tid.value)
					if attached code_list as clist then
						Result := Result and clist.has (a_value.code_string)
					end
				end
			end
		end

	has_code (a_code: STRING): BOOLEAN
			-- True if 'a_code' found in code list
		require
			Code_valid: not a_code.is_empty
		do
			Result := attached code_list as clist and then clist.has (a_code)
		end

	has_parent_code (a_code: STRING): BOOLEAN
			-- True if an immediate parent of 'a_code' found in code list, assuming a_code is sepcialised
		require
			Code_valid: not a_code.is_empty
		do
			if attached code_list as clist and is_refined_code (a_code) then
				Result := clist.has (specialisation_parent_from_code (a_code))
			end
		end

	valid_pattern (a_pattern: STRING): BOOLEAN
			-- Verify that the pattern of form "terminology_id::[code, code, ... [; code]]" is valid
		require
			Pattern_valid: not a_pattern.is_empty
		local
			sep_pos, end_pos: INTEGER
			str, code_str: STRING
			assumed_code: detachable STRING
			codes: LIST[STRING]
			code_set: ARRAYED_SET[STRING]
		do
			fail_reason := Void
			str := a_pattern.twin
			str.prune_all (' ')
			str.prune_all ('%T')
			sep_pos := str.substring_index (separator, 1)
			if sep_pos > 1 then
				-- get the part after the terminology_id
				end_pos := str.index_of (';', sep_pos)-1
				if end_pos < 0 then
					end_pos := str.count
				else
					assumed_code := str.substring (end_pos+2, str.count)
				end
				if end_pos > sep_pos + separator.count then
					code_str := str.substring (sep_pos + separator.count, end_pos)
					codes := code_str.split (',')
					create code_set.make (0)
					code_set.compare_objects
					across codes as codes_csr loop
						code_set.extend (codes_csr.item)
					end
					if code_set.count /= codes.count then
						fail_reason := "duplicate code(s) found in code list"
					elseif attached assumed_code as ac and then not code_set.has (ac) then
						fail_reason := "assumed value code " + ac + " not found in code list"
					end
				end
			else
				fail_reason := "no terminology_id specified"
			end
			Result := fail_reason = Void
		ensure
			not Result implies not fail_reason.is_empty
		end

feature -- Comparison

	node_conforms_to (a_parent: like Current; an_rm_schema: BMM_SCHEMA): BOOLEAN
			-- True if this node is a subset, i.e. a redefinition of, `other'. Evaluated as True if
			-- 	a) this node contains codes already in `other' (but with some removed) and/or
			--	b) this node contains redefinitions of codes found in `other'
		do
			if precursor (a_parent, an_rm_schema) then
				if a_parent.any_allowed then
					Result := True
				elseif attached terminology_id as tid and attached a_parent.terminology_id as parent_tid then
					if tid.is_equal (parent_tid) then
						if a_parent.code_list = Void then
							Result := True
						elseif attached code_list as clist then
							Result := across clist as code_list_csr all a_parent.has_code (code_list_csr.item) or else a_parent.has_parent_code (code_list_csr.item) end
						end
					end
				end
			end
		end

feature -- Source Control

	inferred_specialisation_status (spec_level: INTEGER): SPECIALISATION_STATUS
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Values are defined in SPECIALISATION_STATUSES
			-- FIXME: this code is only an attempt to work out the specialisation status,
			-- since it can only test if the codes are local to the archetype. If they come
			-- from an outside terminology, there is no way to know definitively.
		do
			create Result.make (ss_propagated)
			if not any_allowed and terminology_id.is_local and code_list /= Void then
				across code_list as code_list_csr loop
					Result := Result.specialisation_dominant_status (specialisation_status_from_code (code_list_csr.item, spec_level))
				end
			end
		end

feature -- Modification

	add_code (a_code: STRING)
			-- 	add a term to the list
		require
			Not_any_allowed: not any_allowed
			Code_valid: not has_code (a_code)
		do
			if code_list = Void then
				create code_list.make (0)
				code_list.compare_objects
			end
			code_list.extend (a_code)
		ensure
			Code_added: has_code (a_code)
			Not_any_allowed: not any_allowed
		end

	set_code_list (a_code_list: ARRAYED_LIST[STRING])
		do
			code_list := a_code_list
			code_list.compare_objects
		end

feature -- Output

	out: STRING
		do
			Result := as_string
		end

feature -- Conversion

	as_string: STRING
			--
		do
			create Result.make_empty

			if any_allowed then
				Result.append ("*")
			else
				Result.append ("[" + terminology_id.value + separator)

				if attached code_list as clist then
					across clist as code_list_csr loop
						if code_list_csr.cursor_index > 1 then
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

	standard_equivalent: C_COMPLEX_OBJECT
		do
			-- FIXME: to be implemented
			create Result.make_anonymous (Any_type)
		end

feature -- Synchronisation

	synchronise_to_tree
			-- synchronise to parse tree representation
		do
            if any_allowed then -- only represent as an inline dADL if any_allowed, else use syntax
				Precursor
			end
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
            Precursor (visitor, depth)
			visitor.start_c_code_phrase (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
            Precursor (visitor, depth)
			visitor.end_c_code_phrase (Current, depth)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend ("terminology_id")
			Result.extend ("code_list")
			Result.extend ("assumed_value")
		end

feature {NONE} -- Implementation

	initialise_from_pattern (a_pattern: attached STRING)
			-- parse pattern of form "terminology_id::code, code, ... [; code]"
			-- Pattern "terminology_id::" is legal
		require
			valid_pattern(a_pattern)
		local
			sep_pos, end_pos: INTEGER
			str: STRING
		do
			str := a_pattern.twin
			str.prune_all (' ')
			str.prune_all ('%T')
			sep_pos := str.substring_index (separator, 1)
			create terminology_id.make (str.substring (1, sep_pos-1))
			end_pos := str.index_of (';', sep_pos)-1
			if end_pos < 0 then
				end_pos := str.count
			else
				set_assumed_value (create {CODE_PHRASE}.make_from_string (terminology_id.value + separator + str.substring (end_pos+2, str.count)))
			end
			if end_pos > sep_pos + separator.count then
				create code_list.make(0)
				code_list.compare_objects
				code_list.append (str.substring (sep_pos + separator.count, end_pos).split (','))
			end
		ensure
			not any_allowed
		end

invariant
	List_validity: code_list /= Void implies (not code_list.is_empty and terminology_id /= Void)
	Any_allowed_validity: terminology_id /= Void xor any_allowed

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is cadl_object_term.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
