note
	component:   "openEHR ADL Tools"

	description: "[
				 A logical composite text value consisting of a series of DV_TEXTs, 
				 i.e. terms and plain text potentially with simple formatting, to form 
				 a larger tract of prose, which may be interpreted for display purposes as 
				 a paragraph.
				 ]"
	keywords:    "text, data"

	requirements:"ISO 18308 TS V1.0 STR 2.6"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_PARAGRAPH

inherit
	DATA_VALUE
		redefine
			default_create
		end
		
create 
	make,
	make_from_string,
	make_from_canonical_string

feature -- Initialization

	default_create
		do
			create items.make
		end

	make (an_item_list: LINKED_LIST [DV_TEXT])
		require
			items_exists: an_item_list /= void and then not an_item_list.is_empty
		do
			items := an_item_list
		ensure
			items_set: items = an_item_list
		end

	make_from_string(str:STRING)
		do
		end

	make_from_canonical_string(str:STRING)
		do
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
		end

feature -- Element Change

	add_paragraph_item (new_item: DV_TEXT)
		require
			item_valid: new_item /= void
		do
			if items = void then
				create items.make
			end
			items.extend (new_item)
		end
	
feature -- Access

	items: LINKED_LIST [DV_TEXT]
			-- Items making up the paragraph, each of which is a text list 
			-- (which has its own formatting).

feature -- Output

	as_string: STRING
		do
			create Result.make (0)
			from
				items.start
			until
				items.off
			loop
				if not items.isfirst then
					Result.append (" ")
				end
				Result.append (items.item.as_string)
				items.forth
			end
		end

	as_canonical_string: STRING
		do
			create Result.make (0)
			Result.append ("<items>")
			from
				items.start
			until
				items.off
			loop
				Result.append ("<item>" + items.item.as_canonical_string + "</item>")
				items.forth
			end
			Result.append ("</items>")
		end

invariant
	items_exists: items /= void and then not items.is_empty
	
end



