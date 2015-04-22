note
	component:   "openEHR ADL Tools"
	description: "Model of annotations for a single path in a resource."
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class RESOURCE_ANNOTATION_VALUE_TABLE

inherit
	HASH_TABLE [STRING, STRING]

create
	make

feature -- Modification

	add_value (a_tag, a_value: STRING)
			-- add `an_item' at key `a_tag'; replace any existing at the same tag
		do
			force (a_value, a_tag)
		end

feature -- Output

	values_as_string: STRING
			-- generate a multi-line string of the form
			-- 	tag1: val1
			-- 	tag2: val2
			-- etc
		do
			create Result.make_empty
			from start until off loop
				Result.append (key_for_iteration + ": " + item_for_iteration + "%N")
				forth
			end
		end

end


