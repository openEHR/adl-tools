note
	component:   "openEHR ADL Tools"
	description: "Model of annotations for a single path in a resource."
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class RESOURCE_ANNOTATION_NODE_ITEMS

create
	make

feature -- initialisation

	make
		do
			create items.make (0)
		end

feature -- Access

	items: HASH_TABLE [STRING, STRING]
			-- List of tagged values

feature -- Modification

	add_item (a_tag, an_item: STRING)
			-- add `an_item' at key `a_tag'; replace any existing at the same tag
		do
			items.force (an_item, a_tag)
		end

feature -- Output

	as_string: STRING
			-- generate a multi-line string of the form
			-- 	tag1: val1
			-- 	tag2: val2
			-- etc
		do
			create Result.make_empty
			across items as items_csr loop
				Result.append (items_csr.key + ": " + items_csr.item + "%N")
			end
		end

end


