note
	component:   "openEHR ADL Tools"
	description: "[
			 Serialise assertion archetype to a tagged format, where each attribute
			 is enclosed in tags.
	             ]"
	keywords:    "serialiser, assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ASSERTION_TAGGED_SERIALISER 

inherit
	ASSERTION_SERIALISER
	
	CADL_TOKENS
		export
			{NONE} all
		end
		
	XML_TOOLS
		export
			{NONE} all
		end
	
	XML_SERIALISER_DEFINITIONS
		export
			{NONE} all
		end

create
	make
	
feature -- Modification

	start_assertion(invs: ARRAYED_LIST[ASSERTION]; depth: INTEGER)
			-- start serialising an ASSERTION
		local
			attrs: HASH_TABLE [STRING, STRING]
		do
			from
				invs.start
			until
				invs.off
			loop
				create attrs.make(0)
				attrs.put(invs.item.tag, tag(TAG_INVARIANT_TAG))

				last_result.append(create_indent(depth+2) + xml_tag_start(tag(TAG_ITEM), attrs) + format_item(FMT_NEWLINE))
				last_result.append(invs.item.expression.as_string + format_item(FMT_NEWLINE))						
				last_result.append(create_indent(depth+2) + xml_tag_end(tag(TAG_ITEM)) + format_item(FMT_NEWLINE))
				invs.forth
			end
			last_result.append(create_indent(depth+1) + xml_tag_end(symbol(SYM_INVARIANT)) + format_item(FMT_NEWLINE))
		end
		
	end_assertion(a_node: ARRAYED_LIST[ASSERTION]; depth: INTEGER)
			-- end serialising an ASSERTION
		do	
		end
			
end


