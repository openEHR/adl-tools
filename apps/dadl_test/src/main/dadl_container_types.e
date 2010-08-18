note
	component:   "openEHR dADL Project"
	description: "Type for testing dADL serialise/deserialise of simple types."
	keywords:    "test, dADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class DADL_CONTAINER_TYPES

feature -- Access

	my_array_integer: ARRAYED_LIST[INTEGER]
			-- arrayed list

	my_table:HASH_TABLE[INTEGER,INTEGER]
			-- hash table

	my_table2:HASH_TABLE[A_CLIENT,INTEGER]
			-- hast table user type

	my_tuple:TUPLE[A_CLIENT,INTEGER]
			-- tuple

	my_list:LINKED_LIST[TUPLE[A_CLIENT]]
			-- linked list tuple

	my_array2:ARRAY[LINKED_LIST[TUPLE[A_CLIENT]]]


feature -- Element change

	set_client(a_client:A_CLIENT) is
			--
		do
			my_client := a_client
		end

	set_self_reference is
			--
		do
			myself := current
		end


	init_array is
			--
		do
			create my_array.make (1, 5)
			my_array.put (my_client, 1)
			my_array.put (my_client, 2)
			my_array.put (my_client, 3)
		end

	init_array2 is
			--
		local
			list:LINKED_LIST[TUPLE[A_CLIENT]]
			client:A_CLIENT
		do
			create list.make
			create client
			client.set_my_boolean (false)
--			client.set_my_string2 ("client_string_test")
			list.extend([client])
			create my_array2.make (1, 5)
			my_array2.put (list, 1)
		end

	init_tuple is
			--
		do
			create my_tuple
			my_tuple.put (my_client,1)
			my_tuple.put_integer (100, 2)
		end

	init_list is
			--
		do
			create my_list.make
			my_list.extend ([my_client])
		end

	init_pointer is
			--
		local
			integer:INTEGER
		do
			create my_pointer
			my_pointer.set_item (my_client.default_pointer)
		end

	init_empty is
			--
		do
			create my_empty
		end

	init_array3 is
			--
		do
			create my_array3.make(5)
			my_array3.extend(1)
			my_array3.extend(2)
		end

	init_table is
			--
		do
			create my_table.make(5)
			my_table.put(2,5)
			my_table.put(3,4)
		end

	init_table2 is
			--
		do
			create my_table2.make(5)
			my_table2.put(my_client,66)
			my_table2.put(my_client,666)
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
--| The Original Code is dadl_base_types.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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
