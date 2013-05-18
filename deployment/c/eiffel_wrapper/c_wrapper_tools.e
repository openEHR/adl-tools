note
	component:   "openEHR Archetype Project"
	description: "C wrapper tools"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"


class C_WRAPPER_TOOLS

feature -- Conversion

	eif_list_string_to_c_array(a_list: LIST [STRING]): POINTER
			-- convert and Eiffel a_list: ARRAYED_LIST [STRING] to
			-- ARRAY<POINTER>, which is passed back as a POINTER
        local
            i: INTEGER
            c_str: BASE_C_STRING
            c_str_array: ANY
       do
            create eif_ptr_array.make(0, a_list.count-1)
            from
                a_list.start
            until
                a_list.off
            loop
                create c_str.make(a_list.item)
                eif_ptr_array.put(c_str.item, i)  -- put a pointer to a string into the array
                i := i + 1
                a_list.forth
            end
            c_str_array := eif_ptr_array.to_c -- get hold of the SPECIAL holding the string pointers
            Result := $c_str_array -- generate a pointer to that
        end

   eif_ptr_array: ARRAY [POINTER]

   c_array_string_to_eif_list (a_str_lst: ARRAY [POINTER]): ARRAYED_LIST [STRING]
			-- convert a C ARRAY<POINTER> to an Eiffel ARRAYED_LIST [STRING]
		require
			a_str_lst /= void
		local
			c_a_str: BASE_C_STRING
			i: INTEGER
		do
			create Result.make(0)

			from
				i := a_str_lst.lower
			until
				i > a_str_lst.upper
			loop
				create c_a_str.make_by_pointer (a_str_lst.item(i))
				Result.extend(c_a_str.string)
				i := i + 1
			end
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
--| The Original Code is adl_interface.e.
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
