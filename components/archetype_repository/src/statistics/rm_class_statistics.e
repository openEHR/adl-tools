note
	component:   "openEHR ADL Tools"
	description: "Statistical data accumulator for a single class used within an archetype"
	keywords:    "path"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class RM_CLASS_STATISTICS

create
	make

feature -- Initialisation

	make (a_class_name: STRING; is_root: BOOLEAN)
		do
			rm_class_name := a_class_name
			create rm_attributes.make (0)
			rm_class_count := 1
			is_archetype_root_class := is_root
		end

feature -- Access

	rm_class_name: STRING

	rm_attributes: HASH_TABLE [INTEGER, STRING]
			-- table of number of occurrences of this attribute of this class

	rm_class_count: INTEGER
			-- occurrences of class `rm_class_name' covered by this statistical object

feature -- Status Report

	is_archetype_root_class: BOOLEAN

feature -- Modification

	add_rm_class_occurrence
			-- increment `rm_class_count' to indicate a new class is being counted
		do
			rm_class_count := rm_class_count + 1
		end

	add_rm_attribute_occurrence (an_attr_name: STRING)
		do
			if rm_attributes.has (an_attr_name) then
				rm_attributes.force (rm_attributes.item (an_attr_name) + 1, an_attr_name)
			else
				rm_attributes.put (1, an_attr_name)
			end
		end

	add_rm_attribute_occurrences (attr_names: ARRAYED_SET [STRING])
		do
			across attr_names as attr_names_csr loop
				add_rm_attribute_occurrence (attr_names_csr.item)
			end
		end

	merge (other: RM_CLASS_STATISTICS)
		require
			other.rm_class_name.same_string (rm_class_name)
		do
			rm_class_count := rm_class_count + other.rm_class_count
			across other.rm_attributes as other_rm_attrs_csr loop
				if rm_attributes.has (other_rm_attrs_csr.key) then
					rm_attributes.force (rm_attributes.item (other_rm_attrs_csr.key) + other_rm_attrs_csr.item, other_rm_attrs_csr.key)
				else
					rm_attributes.put (other_rm_attrs_csr.item, other_rm_attrs_csr.key)
				end
			end
			is_archetype_root_class := is_archetype_root_class or other.is_archetype_root_class
		end

feature {NONE} -- Implementation

end


