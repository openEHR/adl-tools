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

class C_CODED_TERM

inherit
	C_DOMAIN_TYPE
		redefine
			default_create
		end

create
	make_from_pattern, make_from_terminology_id, make_dt

feature -- Definitions

	-- FIXME: these have been copied from CODE_PHRASE for now;
	-- in future, this class should just use C_CODE_PHRASE to represent its data
	
	separator: STRING is "::"
	
feature -- Initialisation
		
	default_create is
			-- 
		do
			precursor
			rm_type_name := (create {CODE_PHRASE}.make("UNKNOWN::unknown")).generator			
			create code_list.make(0)
			code_list.compare_objects
			any_allowed := True
			create representation.make_anonymous(Current)
		ensure then
			Any_allowed: any_allowed
		end
		
	make_dt is
			-- 
		do
			default_create
		end
		
	make_from_terminology_id(a_terminology_id: STRING) is
			-- make from terminology_id
		do
			default_create
			create terminology_id.make(a_terminology_id)
		ensure
			Any_allowed: any_allowed
			Terminology_id_set: terminology_id.value.is_equal(a_terminology_id)
		end
		
	make_from_pattern(a_pattern: STRING) is
			-- make from pattern of form "terminology_id::code, code, ..."
			-- Pattern "terminology_id::" is legal
		local
			pos1, pos2, sep_pos: INTEGER
			code_str: STRING
			a_code: STRING
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
					add_code(a_code)
				end
				pos1 := pos2+2
				
				if found_assumed_value then
					pos2 := code_str.count
					a_code := code_str.substring(pos1, pos2)
					a_code.left_adjust
					a_code.right_adjust
					set_assumed_value(a_code)
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
		end
		
feature -- Access

	terminology_id: TERMINOLOGY_ID
			-- id of terminology from which codes come. If code list empty, any code from
			-- this terminology is allowed
	
	code_list: ARRAYED_LIST[STRING]
			-- list of codes in terminology. Empty list means "any allowed"
			
	code_count: INTEGER is
			-- number of codes in code_list
		do
			Result := code_list.count
		end

	standard_equivalent: C_COMPLEX_OBJECT is
		do
			-- FIXME: to be implemented
		end
	
	default_value: STRING is
			-- 	generate a default value from this constraint object
		do
			if not code_list.is_empty then
				Result := code_list.first			
			else
				-- FIXME: this code is unlikely to be correct; but there is no general way to guess a 
				-- code from this constraint if only terminology_id is set
				Result := "unknown"
			end
		end
		
feature -- Status Report

	is_local: BOOLEAN is
			-- True if this terminology id = "local"
		do
			Result := terminology_id.is_local
		end

	valid_value (a_value: like default_value): BOOLEAN is 
		do
			if any_allowed then
				Result := True
			elseif not code_list.is_empty then
				Result := code_list.has(a_value)
			else
				Result := True -- no guarantee that this terminology really has this code of course
			end
		end
		
	has_code(a_code: STRING): BOOLEAN is
			-- True if 'a_code' found in code list
		require
			Code_valid: a_code /= Void and then not a_code.is_empty
		do
			Result := code_list.has(a_code)
		end
		
feature -- Modification

	add_code(a_code: STRING) is
			-- 	add a term to the list
		require
			Code_valid: a_code /= Void 
		do
			code_list.extend(a_code)
			any_allowed := False
		ensure
			Code_added: code_list.has(a_code)
			Not_any_allowed: not any_allowed
		end
	
feature -- Conversion

	as_string: STRING is
			-- 
		do
			create Result.make (0)
			Result.append("[" + terminology_id.value + separator)
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
			
			if assumed_value /= Void then
				Result.append("; " + assumed_value)
			end
			Result.append ("]")
		end

feature -- Serialisation

	enter_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER) is
			-- perform serialisation at start of block for this node
		do
			serialiser.start_c_coded_term(Current, depth)
		end
		
	exit_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER) is
			-- perform serialisation at end of block for this node
		do
			serialiser.end_c_coded_term(Current, depth)
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

invariant
	List_validity: terminology_id /= Void and code_list /= Void
	Any_allowed_validity: not code_list.is_empty xor any_allowed
	
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
