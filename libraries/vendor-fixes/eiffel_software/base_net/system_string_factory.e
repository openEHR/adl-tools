indexing
	description: "Factory for creating SYSTEM_STRING instances."
	date: "$Date$"
	revision: "$Revision$"

class
	SYSTEM_STRING_FACTORY

inherit
	STRING_HANDLER

feature -- Conversion

	from_string_to_system_string (a_str: STRING_GENERAL): SYSTEM_STRING is
			-- Convert `a_str' to an instance of SYSTEM_STRING.
		require
			is_dotnet: {PLATFORM}.is_dotnet
			a_str_not_void: a_str /= Void
		local
			i, nb: INTEGER
			l_str: STRING_BUILDER
			bytes: NATIVE_ARRAY [NATURAL_8]
		do
			if a_str.is_string_8 then
				nb := a_str.count
				create bytes.make (nb)

				from
					i := 1
				until
					i > nb
				loop
					bytes.put (i - 1, a_str.code (i).to_natural_8)
					i := i + 1
				end

				Result := {ENCODING}.utf8.get_string (bytes)
			else
				nb := a_str.count
				create l_str.make (nb)
				from
					i := 1
				until
					i > nb
				loop
					l_str := l_str.append_character (a_str.code (i).to_character_8)
					i := i + 1
				end
				Result := l_str.to_string
			end
		ensure
			from_string_to_system_string_not_void: Result /= Void
		end

	read_system_string_into (a_str: SYSTEM_STRING; a_result: STRING_GENERAL) is
			-- Fill `a_result' with `a_str' content.
		require
			is_dotnet: {PLATFORM}.is_dotnet
			a_str_not_void: a_str /= Void
			a_result_not_void: a_result /= Void
			a_result_valid: a_result.count = a_str.length
		local
			i, nb: INTEGER
			l_str8: STRING
			bytes: NATIVE_ARRAY [NATURAL_8]
		do
			if a_result.is_string_8 then
				i := a_str.length
				create bytes.make ({ENCODING}.utf8.get_max_byte_count (i))
				i := {ENCODING}.utf8.get_bytes (a_str, 0, i, bytes, 0)
				l_str8 ?= a_result
				l_str8.make (i)
				l_str8.set_count (i)
				{SYSTEM_ARRAY}.copy (bytes, l_str8.area.native_array, i)
			else
				from
					i := 0
					nb := a_str.length
				until
					i = nb
				loop
					a_result.put_code (a_str.chars (i).natural_32_code, i + 1)
					i := i + 1
				end
			end
		end

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end
