indexing
	component:   "openEHR Data Structures Reference Model"

	description: "[
	             A data structure of the form of a table, in which the columns have names.
	  		 The internal structure is:
				root: CLUSTER				
					col_1: CLUSTER					
						row_1: ELEMENT				
						row_2: ELEMENT				
						....					
						row_N: ELEMENT			

					col_2: CLUSTER					
						row_1: ELEMENT				
						row_2: ELEMENT				
						....					
						row_N: ELEMENT			

					....					

					col_N: CLUSTER					
						row_1: ELEMENT				
						row_2: ELEMENT				
						....					
						row_N: ELEMENT							
							
			 Valid paths are of the form:			
				whole table: |<root-name>						
				column: |<root-name>|col=<column-name>			
				row: |<root-name>|row=<n>			
				cell: |<root-name>|col=<column-name>|row=<n>					
				column: col=<column-name>			
				row: row=<n>			
				cell: col=<column-name>|row=<n>
	  	       ]"
	keywords:    "content, spatial, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ITEM_TABLE

inherit
	ITEM_STRUCTURE

feature -- Access

	columns: LIST[CLUSTER]
			-- CLUSTERs containing column data

	row_count:INTEGER is
			-- Return the number of rows
		do
		end

	row_names: LIST[DV_TEXT] is
			-- Return the row names
		do
		end

	column_count: INTEGER is
			-- Return the number of columns
		do
		end

	column_names: LIST[DV_TEXT] is
			-- Return the column names
		do
		end

	ith_row(i:INTEGER): LIST[ELEMENT] is
			-- Return the i-th row
		require
			i >0 and i < row_count
		do
		end

	has_row_with_name(a_key:STRING): BOOLEAN is
			-- True if there is a row whose first column has the name ‘a_key’
		require
			a_key /= Void and then not a_key.is_empty
		do
		end

	has_column_with_name(a_key:STRING): BOOLEAN is
			-- True if there is a column with name ‘a_key’
		require
			a_key /= Void and then not a_key.is_empty
		do
		end

	named_row(a_key:STRING): LIST[ELEMENT] is
			-- Return the row whose first column has the name ‘a_key’
		require
			Valid_key: has_row_with_name(a_key)
		do
		end

	has_row_with_keys(keys:SET[STRING]): BOOLEAN  is
			-- True if there is a row whose first n columns have the names in ‘keys’
		do
		end

	keyed_row(keys:SET[STRING]): LIST[ELEMENT] is
			-- Return the row whose first n columns have the names in ‘keys’
		require
			has_row_with_keys(keys)
		do
		end

	element_at_cell_ij(i, j:INTEGER): ELEMENT is
			-- Return the element at the column i, row j.
		require
			Valid_column: i >= 1 and i <= column_count
			Valid_row: j >= 1 and j <= row_count
		do
		end

	element_at_named_cell(row_key, column_key:STRING): ELEMENT is
			-- Return the element at the row whose first column has the name ‘row_key’ and column has the name ‘col_key’
		require
			Valid_row: has_row_with_name(row_key)
			Valid_column: has_column_with_name(column_key)
		do
		end

	path_of_item (a_loc: LOCATABLE): STRING is
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE is
			-- The item at a path (relative to this item).
		do
		end

feature -- Status Report

	valid_path (a_path: STRING): BOOLEAN is
			-- True if the path is valid with respect to the current item.
		do
		end

feature -- Conversion

	as_hierarchy: CLUSTER is
			-- the physical representation as a CEN 13606-compliant structure
		do
		end

invariant
	-- Valid_structure: representation.items.forall(agent {ITEM}.type = "CLUSTER" and then agent {ITEM}.items.forall(agent {ITEM}.type = "ELEMENT"))

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
--| The Original Code is table_s.e.
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
