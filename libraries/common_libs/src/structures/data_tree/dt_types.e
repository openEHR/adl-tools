indexing
	component:   "openEHR Archetype Project"
	description: "Type definitions for DT structures and coversion"
	keywords:    "Data Tree"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_TYPES

inherit
	INTERNAL
		export
			{NONE} all
		end

	TYPE_UTILITIES
		export
			{NONE} all
		end

feature {NONE} -- Definitions

	primitive_types: ARRAYED_LIST[INTEGER] is
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend (dynamic_type (create {INTEGER}))
			Result.extend (dynamic_type (create {REAL}))
			Result.extend (dynamic_type (create {DOUBLE}))
			Result.extend (dynamic_type (create {BOOLEAN}))
			Result.extend (dynamic_type (create {CHARACTER}))
			Result.extend (dynamic_type (create {STRING}.make_empty))
			Result.extend (dynamic_type (create {DATE}.make_now))
			Result.extend (dynamic_type (create {DATE_TIME}.make_now))
			Result.extend (dynamic_type (create {TIME}.make_now))
			Result.extend (dynamic_type (create {DATE_TIME_DURATION}.make (0, 0, 0, 0, 0, 0)))
			Result.extend (dynamic_type (create {CODE_PHRASE}))
			Result.extend (dynamic_type (create {URI}.make_from_string ("http://no.way.home")))
			Result.extend (dynamic_type (create {INTEGER_REF}))
			Result.extend (dynamic_type (create {REAL_REF}))
			Result.extend (dynamic_type (create {DOUBLE_REF}))
			Result.extend (dynamic_type (create {BOOLEAN_REF}))
			Result.extend (dynamic_type (create {CHARACTER_REF}))

			-- When DT_OBJECT_CONVERTER retrieves the type id of a .NET primitive type via field_static_type_of_type,
			-- it receives a primitive .NET type (Int32, etc.), which is compatible with the corresponding Eiffel type,
			-- but has different type id. We therefore need to list these .NET types too.
			-- We can retrieve these .NET type ids from the Eiffel strings, as shown below.
			-- This fixes the problem, without having to list .NET types explicitly here, which would not be portable of course.
			Result.extend (dynamic_type_from_string ("INTEGER_32"))
			Result.extend (dynamic_type_from_string ("REAL_32"))
			Result.extend (dynamic_type_from_string ("REAL_64"))
			Result.extend (dynamic_type_from_string ("BOOLEAN"))
			Result.extend (dynamic_type_from_string ("CHARACTER_8"))
		end

	primitive_sequence_types: ARRAYED_LIST [INTEGER] is
			-- the list of dynamic types of abstract types from cvt_table
			-- e.g. types like LIST[INTEGER] are there, but not LINKED_LIST[INTEGER]
		local
			-- These are just here to make sure the types are compiled in.
			-- N.B. SEQUENCE is deferred; therefore we can't create a prototype object for it as we are doing for INTERVAL, etc.
			seq_boolean: SEQUENCE [BOOLEAN]
			seq_integer: SEQUENCE [INTEGER]
			seq_real: SEQUENCE [REAL]
			seq_double: SEQUENCE [DOUBLE]
			seq_string: SEQUENCE [STRING]
			seq_character: SEQUENCE [CHARACTER]
			seq_boolean_ref: SEQUENCE [BOOLEAN_REF]
			seq_integer_ref: SEQUENCE [INTEGER_REF]
			seq_real_ref: SEQUENCE [REAL_REF]
			seq_double_ref: SEQUENCE [DOUBLE_REF]
			seq_character_ref: SEQUENCE [CHARACTER_REF]
			seq_date: SEQUENCE [DATE]
			seq_date_time: SEQUENCE [DATE_TIME]
			seq_time: SEQUENCE [TIME]
			seq_duration: SEQUENCE [DATE_TIME_DURATION]
			seq_uri: SEQUENCE [URI]
			seq_code_phrase: SEQUENCE [CODE_PHRASE]
		once
			Create Result.make (0)
			Result.compare_objects
			Result.extend (dynamic_type_from_string ("SEQUENCE [INTEGER]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [BOOLEAN]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [REAL]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [DOUBLE]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [CHARACTER]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [STRING]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [DATE]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [DATE_TIME]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [TIME]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [DURATION]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [URI]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [CODE_PHRASE]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [INTEGER_REF]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [BOOLEAN_REF]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [REAL_REF]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [DOUBLE_REF]"))
			Result.extend (dynamic_type_from_string ("SEQUENCE [CHARACTER_REF]"))
		end

	primitive_interval_types: ARRAYED_LIST [INTEGER] is
			-- the list of dynamic types of intervals of primitives
		once
			Create Result.make (0)
			Result.compare_objects
			Result.extend (dynamic_type (create {INTERVAL [INTEGER]}))
			Result.extend (dynamic_type (create {INTERVAL [REAL]}))
			Result.extend (dynamic_type (create {INTERVAL [DOUBLE]}))
			Result.extend (dynamic_type (create {INTERVAL [DATE]}))
			Result.extend (dynamic_type (create {INTERVAL [DATE_TIME]}))
			Result.extend (dynamic_type (create {INTERVAL [TIME]}))
			Result.extend (dynamic_type (create {INTERVAL [DATE_TIME_DURATION]}))
			Result.extend (dynamic_type (create {INTERVAL [INTEGER_REF]}))
			Result.extend (dynamic_type (create {INTERVAL [REAL_REF]}))
			Result.extend (dynamic_type (create {INTERVAL [DOUBLE_REF]}))
		end

feature -- Access

	primitive_sequence_conforming_type(a_type_id: INTEGER): INTEGER is
			-- Type which is the primitive_sequence type to which a_type_id conforms
			-- Returns 0 if not found
		require
			Type_valid: a_type_id >= 0
		do
			if type_conforms_to(a_type_id, sequence_any_type_id) then
				if primitive_sequence_conforming_types.has(a_type_id) then
					Result := primitive_sequence_conforming_types.item(a_type_id)
				else
					if primitive_sequence_types.has(a_type_id) then
						Result := a_type_id
					else
						from
							primitive_sequence_types.start
						until
							primitive_sequence_types.off or Result /= 0
						loop
							debug ("DT")
								io.put_string(generator +
									".primitive_sequence_conforming_type: call to type_conforms_to(" +
									type_name_of_type(a_type_id) + ", " +
									type_name_of_type(primitive_sequence_types.item)
									+ "):")
							end
							if type_conforms_to(a_type_id, primitive_sequence_types.item) then
								Result := primitive_sequence_types.item
								debug ("DT")
									io.put_string(" True%N")
								end
							else
								debug ("DT")
									io.put_string(" False%N")
								end
							end
							primitive_sequence_types.forth
						end
					end
					if Result /= 0 then
						primitive_sequence_conforming_types.put(Result, a_type_id)
					end
				end
			end
		end

	any_primitive_conforming_type(a_type_id: INTEGER): INTEGER is
			-- Returns a_type_id if in any of the primitive types which
			-- a_type_id, or
			-- one of the primitive_sequence types to which a_type_id conforms
			-- or 0 if not found
		require
			Type_valid: a_type_id >= 0
		do
debug ("DT")
	io.put_string("--->ENTER any_primitive_conforming_type(" + a_type_id.out + ")%N")
end
			if is_any_primitive_type(a_type_id) then
				Result := a_type_id
			elseif generic_count_of_type(a_type_id) > 0 then
				Result := primitive_sequence_conforming_type(a_type_id)
			end
debug ("DT")
	io.put_string("<---EXIT any_primitive_conforming_type(" + a_type_id.out + ")=" + Result.out + "%N")
end
		end

feature -- Status Report

	is_any_primitive_type(a_type_id: INTEGER): BOOLEAN is
			-- True if a_type_id is any of the primitive, primitive_sequence or
			-- primitive_interval types
		require
			Type_valid: a_type_id >= 0
		do
			Result := is_primitive_type(a_type_id)
			if not Result and generic_count_of_type(a_type_id) > 0 then
				Result := primitive_sequence_types.has(a_type_id) or
						primitive_interval_types.has(a_type_id)
			end
		end

	is_any_primitive_conforming_type(a_type_id: INTEGER): BOOLEAN is
			-- True if a_type_id is any of the primitive, primitive_sequence or
			-- primitive_interval types, or conforms to one of those
		require
			Type_valid: a_type_id >= 0
		do
			Result := any_primitive_conforming_type(a_type_id) /= 0
		end

	is_primitive_type(a_type_id: INTEGER): BOOLEAN is
			-- True if one of the types STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION
		require
			Type_valid: a_type_id >= 0
		do
			Result := primitive_types.has(a_type_id)
		end

	is_primitive_sequence_type(a_type_id: INTEGER): BOOLEAN is
			-- True if a_type_id conforms to SEQUENCE of STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION, CODE_PHRASE, URI
		require
			Type_valid: a_type_id >= 0
		do
			Result := primitive_sequence_types.has(a_type_id)
		end

	is_primitive_interval_type(a_type_id: INTEGER): BOOLEAN is
			-- True if a_type_id conforms to INTERVAL of STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION, CODE_PHRASE, URI
		require
			Type_valid: a_type_id >= 0
		do
			Result := primitive_interval_types.has(a_type_id)
		end

	is_primitive_sequence_conforming_type(a_type_id: INTEGER): BOOLEAN is
			-- True if a_type_id is either any of the primitive_sequence types, or else
			-- a type which conforms to one of those types
		require
			Type_valid: a_type_id >= 0
		do
			Result := primitive_sequence_conforming_type(a_type_id) /= 0
		end

	has_primitive_type(an_obj: ANY): BOOLEAN is
			-- True if one of the types STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION
		require
			Object_valid: an_obj /= Void
		do
			Result := is_primitive_type(dynamic_type(an_obj))
		end

	has_primitive_sequence_type(an_obj: ANY): BOOLEAN is
			-- True if an_obj conforms to SEQUENCE of STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION, CODE_PHRASE, URI
		require
			Object_valid: an_obj /= Void
		do
			Result := is_primitive_sequence_type(dynamic_type(an_obj))
		end

	has_primitive_interval_type(an_obj: ANY): BOOLEAN is
			-- True if an_obj conforms to INTERVAL of STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION, CODE_PHRASE, URI
		require
			Object_valid: an_obj /= Void
		do
			Result := is_primitive_interval_type(dynamic_type(an_obj))
		end

	is_container_type(a_type_id: INTEGER): BOOLEAN is
			-- True if a_type_id is of a type which is a SEQUENCE or HASH_TABLE, which are the only
			-- CONTAINERs used in DT structures
		do
			debug ("DT")
				io.put_string(generator +
					".is_container_type: call to type_conforms_to(" +
						type_name_of_type(a_type_id) + ", " +
						type_name_of_type(sequence_any_type_id) + "), type_conforms_to(" +
						type_name_of_type(a_type_id) + ", " +
						type_name_of_type(hash_table_any_hashable_type_id) + ")%N")
			end
			Result := type_conforms_to(a_type_id, sequence_any_type_id) or
				type_conforms_to(a_type_id, hash_table_any_hashable_type_id)
			debug ("DT")
				io.put_string("%T(return)%N")
			end
		end

feature {NONE} -- Implementation

	sequence_any_type_id: INTEGER is
			-- dynamic type of SEQUENCE[ANY]
		once
			Result := dynamic_type_from_string("SEQUENCE[ANY]")
		end

	hash_table_any_hashable_type_id: INTEGER is
			-- dynamic type of HASH_TABLE[ANY, HASHABLE]
		once
			Result := dynamic_type (create {HASH_TABLE [ANY, HASHABLE]}.make (0))
		end

	primitive_sequence_conforming_types: HASH_TABLE [INTEGER, INTEGER] is
		once
			create Result.make(0)
		end

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
--| The Original Code is dadl_factory.e.
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
