note
	component:   "openEHR ADL Tools"

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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ITEM_TABLE

inherit
	ITEM_STRUCTURE
	
	CLUSTER
		rename
			items as columns
		redefine
			columns, path_of_item, item_at_path, path_exists
		end

feature -- Access

	columns: LIST[CLUSTER]
			-- CLUSTERs containing column data

	row_count:INTEGER
			-- Return the number of rows
		do
		end

	row_names: LIST[DV_TEXT]
			-- Return the row names
		do
		end

	column_count: INTEGER
			-- Return the number of columns
		do
		end

	column_names: LIST[DV_TEXT]
			-- Return the column names
		do
		end

	ith_row(i:INTEGER): LIST[ELEMENT]
			-- Return the i-th row
		require
			i >0 and i < row_count
		do
		end

	has_row_with_name(a_key:STRING): BOOLEAN
			-- True if there is a row whose first column has the name ‘a_key’
		require
			a_key /= Void and then not a_key.is_empty
		do
		end

	has_column_with_name(a_key:STRING): BOOLEAN
			-- True if there is a column with name ‘a_key’
		require
			a_key /= Void and then not a_key.is_empty
		do
		end

	named_row(a_key:STRING): LIST[ELEMENT]
			-- Return the row whose first column has the name ‘a_key’
		require
			Valid_key: has_row_with_name(a_key)
		do
		end

	has_row_with_keys(keys:SET[STRING]): BOOLEAN
			-- True if there is a row whose first n columns have the names in ‘keys’
		do
		end

	keyed_row(keys:SET[STRING]): LIST[ELEMENT]
			-- Return the row whose first n columns have the names in ‘keys’
		require
			has_row_with_keys(keys)
		do
		end

	element_at_cell_ij(i, j:INTEGER): ELEMENT
			-- Return the element at the column i, row j.
		require
			Valid_column: i >= 1 and i <= column_count
			Valid_row: j >= 1 and j <= row_count
		do
		end

	element_at_named_cell(row_key, column_key:STRING): ELEMENT
			-- Return the element at the row whose first column has the name ‘row_key’ and column has the name ‘col_key’
		require
			Valid_row: has_row_with_name(row_key)
			Valid_column: has_column_with_name(column_key)
		do
		end

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

feature -- Conversion

	as_hierarchy: CLUSTER
			-- the physical representation as a CEN 13606-compliant structure
		do
		end

invariant
	-- Valid_structure: representation.items.forall(agent {ITEM}.type = "CLUSTER" and then agent {ITEM}.items.forall(agent {ITEM}.type = "ELEMENT"))

end


