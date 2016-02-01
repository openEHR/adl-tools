note
	component:   "openEHR ADL Tools"
	description: "Model of tables of annotations keyed by path for a resource."
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class RESOURCE_ANNOTATION_PATH_TABLE

create
	make, make_empty

feature -- Initialisation

	make (a_path_table: HASH_TABLE [HASH_TABLE [STRING, STRING], STRING])
		do
			path_table := a_path_table
		end

	make_empty
		do
			create path_table.make (0)
		end

feature -- Access

	path_table: HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]

	values_at_path (a_path: STRING): detachable HASH_TABLE [STRING, STRING]
			-- Return annotations at `a_path' from `values'
		do
			Result := path_table.item (a_path)
		end

feature -- Status Report

	has_path (a_path: STRING): BOOLEAN
			-- True if `a_path' found in `values'
		do
			Result := path_table.has (a_path)
		end

feature -- Modification

	replace_values_at_path (a_path: STRING; a_values: HASH_TABLE [STRING, STRING])
			-- add `an_annotations' at key `a_path'; replace any existing at that path
		do
			path_table.force (a_values, a_path)
		end

	merge_values_at_path (a_path: STRING; a_values: HASH_TABLE [STRING, STRING])
			-- add `an_annotations' at key `a_path' to existing annotations
		do
			if not path_table.has (a_path) then
				path_table.put (create {HASH_TABLE [STRING, STRING]}.make (0), a_path)
			end
			if attached path_table.item (a_path) as val_table then
				across a_values as values_csr loop
					val_table.force (values_csr.item, values_csr.key)
				end
			end
		end

	add_value_at_path (a_path, annot_key, annot_content: STRING)
			-- add an annotation consisting of key `annot_key' & `annot_content' at path `a_path';
			-- replace any existing at same path
		local
			val_table: HASH_TABLE [STRING, STRING]
		do
			if path_table.has (a_path) and then attached path_table.item (a_path) as att_item then
				val_table := att_item
			else
				create val_table.make (0)
				path_table.put (val_table, a_path)
			end
			val_table.force (annot_content, annot_key)
		end

end


