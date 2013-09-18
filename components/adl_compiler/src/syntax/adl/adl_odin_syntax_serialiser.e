note
	component:   "openEHR ADL Tools"
	description: "[
		         Temporary variant of DT_DADL_SERIALISER needed until ADL 1.5 is universally used. This
				 variant implements two ADL-specific variations of standard ODIN:
					* the dadl type name is serialised with "()" if ADL version is >= 1.5
					*
				 ]"
	keywords:    "test, ODIN"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_ODIN_SYNTAX_SERIALISER

inherit
	DT_ODIN_SERIALISER
		redefine
			start_complex_object_node
		end

	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		end

create
	make

feature -- Visitor

	start_complex_object_node(a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising a DT_COMPLEX_OBJECT
		do
			if not a_node.is_root and then a_node.parent.is_multiple then
				last_result.append (create_indent (depth//2 + multiple_attr_count))
			end
			if a_node.is_addressable then
				last_result.append (apply_style ("[%"" + a_node.node_id + "%"]", STYLE_IDENTIFIER))
				last_result.append (format_item (FMT_SPACE))
				last_result.append (apply_style (symbol(SYM_EQ), STYLE_OPERATOR) + format_item (FMT_SPACE))
			end
			if a_node.is_typed and a_node.type_visible then
				last_result.append (convert_dadl_type_name (a_node.rm_type_name) + format_item (FMT_SPACE) + symbol (SYM_START_DBLOCK) +
					format_item(FMT_NEWLINE))
			elseif not a_node.is_root then
				last_result.append (symbol (SYM_START_DBLOCK) + format_item (FMT_NEWLINE))
			end
		end

end


