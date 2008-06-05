indexing
	component:   "openEHR Archetype Project"
	description: "Object node type representing constraint on text or term"
	keywords:    "test, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_CODE_PHRASE

inherit
	C_DOMAIN_TYPE
		redefine
			default_create
		end

create
	make_from_pattern, make_from_terminology_id, make_dt, default_create

feature -- Definitions

	-- FIXME: these have been copied from CODE_PHRASE for now;
	-- in future, this class should just use C_CODE_PHRASE to represent its data

	separator: STRING is "::"

feature -- Initialisation

	default_create is
			--
		do
			precursor
			rm_type_name := (create {CODE_PHRASE}.default_create).generator
			create representation.make_anonymous(Current)
			fail_reason := Void
		ensure then
			Any_allowed: any_allowed
		end

	make_dt is
			--
		do
			default_create
		ensure then
			Any_allowed: any_allowed
		end

	make_from_terminology_id(a_terminology_id: STRING) is
			-- make from terminology_id
		do
			default_create
			create terminology_id.make(a_terminology_id)
		ensure
			Not_any_allowed: not any_allowed
			Terminology_id_set: terminology_id.value.is_equal(a_terminology_id)
		end

	make_from_pattern(a_pattern: STRING) is
			-- make from pattern of form "terminology_id::code, code, ... [; code]"
			-- Pattern "terminology_id::" is legal
		require
			a_pattern /= Void and then valid_pattern(a_pattern)
		do
			if terminology_id /= Void then
				-- parse_pattern has already been run and generated the results
			else
				parse_pattern(a_pattern)
			end
		ensure
			Not_any_allowed: not any_allowed
			Terminology_id_exists: terminology_id /= Void
		end

feature -- Access

	terminology_id: TERMINOLOGY_ID
			-- id of terminology from which codes come. If code list empty, any code from
			-- this terminology is allowed

	code_list: ARRAYED_LIST[STRING]
			-- list of codes in terminology designated by terminology_id

	code_count: INTEGER is
			-- number of codes in code_list
		do
			if code_list /= Void then
				Result := code_list.count
			end
		end

	default_value: CODE_PHRASE is
			-- generate a default value from this constraint object of the form
			-- "terminology_id::code_string"
		do
			if assumed_value /= Void then
				Result := assumed_value
			elseif any_allowed then
				create Result.default_create
			else -- must have a terminology_id	
				if code_list /= Void then
					create Result.make_from_string (terminology_id.value + separator + code_list.first)
				else
					create Result.make_from_string (terminology_id.value + separator)
				end
			end
		end

	fail_reason: STRING

feature -- Status Report

	any_allowed: BOOLEAN is
			-- True if any value allowed
			-- i.e. no terminology_id or code_list
		do
			Result := terminology_id = Void and code_list = Void
		end

	is_local: BOOLEAN is
			-- True if this terminology id = "local"
		require
			not any_allowed
		do
			Result := terminology_id.is_local
		end

	valid_value (a_value: like default_value): BOOLEAN is
			-- check a value of the form "terminology_id::code_string"
		do
			if any_allowed then
				Result := True
			else
				if terminology_id /= Void then
					Result := a_value.terminology_id.value.is_equal(terminology_id.value)
					if code_list /= Void then
						Result := Result and code_list.has(a_value.code_string)
					end
				end
			end
		end

	has_code(a_code: STRING): BOOLEAN is
			-- True if 'a_code' found in code list
		require
			Code_valid: a_code /= Void and then not a_code.is_empty
		do
			Result := code_list /= Void and code_list.has(a_code)
		end

	valid_pattern(a_pattern: STRING): BOOLEAN is
			-- verify that the pattern of form "terminology_id::code, code, ... [; code]"
			-- is valid, i.e. that there are no repeats
		require
			Pattern_valid: a_pattern /= Void and then not a_pattern.is_empty
		do
			parse_pattern(a_pattern)
			Result := fail_reason = Void
		end

feature -- Modification

	add_code(a_code: STRING) is
			-- 	add a term to the list
		require
			Not_any_allowed: not any_allowed
			Code_valid: a_code /= Void and not has_code(a_code)
		do
			if code_list = Void then
				create code_list.make(0)
				code_list.compare_objects
			end
			code_list.extend(a_code)
		ensure
			Code_added: code_list.has(a_code)
			Not_any_allowed: not any_allowed
		end

feature -- Conversion

	as_string: STRING is
			--
		do
			create Result.make (0)
			if any_allowed then
				Result.append("*")
			else
				Result.append("[" + terminology_id.value + separator)
				if code_list /= Void then
					from
						code_list.start
					until
						code_list.off
					loop
						if not code_list.isfirst then
							Result.append (", ")
						end
						Result.append (code_list.item)
						code_list.forth
					end
				end

				if assumed_value /= Void then
					Result.append("; " + assumed_value.code_string)
				end
				Result.append ("]")
			end
		end

	standard_equivalent: C_COMPLEX_OBJECT is
		do
			-- FIXME: to be implemented
		end

feature -- Serialisation

	enter_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER) is
			-- perform serialisation at start of block for this node
		do
			serialiser.start_c_code_phrase(Current, depth)
		end
		
	exit_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER) is
			-- perform serialisation at end of block for this node
		do
			serialiser.end_c_code_phrase(Current, depth)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING] is
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.extend("terminology_id")
			Result.extend("code_list")
			Result.extend("assumed_value")
			Result.compare_objects
		end

feature {NONE} -- Implementation

	parse_pattern(a_pattern: STRING) is
			-- parse pattern of form "terminology_id::code, code, ... [; code]"
			-- Pattern "terminology_id::" is legal
		require
			a_pattern /= Void and then not a_pattern.is_empty
		local
			pos1, pos2, sep_pos: INTEGER
			code_str: STRING
			a_code, assumed_code: STRING
			found_assumed_value: BOOLEAN
		do
			default_create

			sep_pos := a_pattern.substring_index(separator, 1)
			create terminology_id.make(a_pattern.substring(1, sep_pos-1))

			-- get the part after the terminology_id
			code_str := a_pattern.substring(sep_pos+separator.count, a_pattern.count)

			from
				pos1 := 1
				pos2 := code_str.index_of(',', pos1)-1
				if pos2 < 1 then
					pos2 := code_str.index_of(';', pos1)-1 -- look for assumed value
					if pos2 < 1 then
						pos2 := code_str.count
					else -- found assumed value
						found_assumed_value := True
					end
				end
			until
				pos1 > code_str.count
			loop
				if pos2 >= pos1 then
					a_code := code_str.substring(pos1, pos2)
					a_code.left_adjust
					a_code.right_adjust
					if not has_code(a_code) then
						add_code(a_code)
					else
						fail_reason := " duplicate code " + a_code + " found in code list"
					end
				end
				pos1 := pos2+2

				if found_assumed_value then
					pos2 := code_str.count
					assumed_code := code_str.substring(pos1, pos2)
					assumed_code.left_adjust
					assumed_code.right_adjust
					pos1 := pos2+2
				end

				if pos1 <= code_str.count then
					pos2 := code_str.index_of(',', pos1)-1
					if pos2 < 1 then
						pos2 := code_str.index_of(';', pos1)-1 -- look for assumed value
						if pos2 < 1 then
							pos2 := code_str.count
						else -- found assumed value
							found_assumed_value := True
						end
					end
				end
			end
			if found_assumed_value then
				if has_code(assumed_code) then
					set_assumed_value(create {CODE_PHRASE}.make_from_string(terminology_id.value + separator + assumed_code))
				else
					fail_reason := "assumed value code " + assumed_code + " not found in code list"
				end
			end
		ensure
			not any_allowed
		end

invariant
	List_validity: code_list /= Void implies (not code_list.is_empty and terminology_id /= Void)
	Any_allowed_validity: (terminology_id /= Void or code_list /= Void) xor any_allowed

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
