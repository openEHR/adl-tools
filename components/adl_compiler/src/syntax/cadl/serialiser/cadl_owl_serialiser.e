note
	component:   "openEHR ADL Tools"
	description: "Serialise CADL archetype to OWL abstract syntax"
	keywords:    "serialiser, OWL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class CADL_OWL_SERIALISER

inherit
	C_SERIALISER

	OWL_DEFINITIONS

	SHARED_APPLICATION_CONTEXT
		export
			{NONE} all
		end

create
	make

feature -- Modification

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising an C_COMPLEX_OBJECT
		local
			node_concept_ref:STRING
			l_object_pattern_key, l_attr_pattern_key, l_prim_obj_value: STRING
			l_obj_buffer: STRING
		do
			-- common definitions
			if a_node.is_addressable then
				node_concept_ref := ontology.term_definition(language, a_node.node_id).item("text")
			else
				node_concept_ref := "unknown"
			end
			node_concept_ref.prepend("%"this:")
			node_concept_ref.append("%"")

			-- output relationship of node to archetype ontology: Class("this:node-concept" complete
			--						restriction("ba:is_about" allValuesFrom("this:atNNNN")))
			if a_node.is_addressable then
				last_result.append(
					symbol(SYM_CLASS) + symbol(SYM_OPEN_PAREN) +
					node_concept_ref + format_item(FMT_SPACE) +
					symbol(SYM_COMPLETE) + format_item(FMT_SPACE) +
					symbol(SYM_RESTRICTION) + symbol(SYM_OPEN_PAREN) +
					"%"ba:is_about%"" + format_item(FMT_SPACE) +
					symbol(SYM_ALL_VALUES_FROM) + symbol(SYM_OPEN_PAREN) +
					"%"this:" + a_node.node_id + "%"" + symbol(SYM_CLOSE_PAREN) +
					symbol(SYM_CLOSE_PAREN) + symbol(SYM_CLOSE_PAREN)
				)
				last_result.append(format_item(FMT_NEWLINE))

				-- output relationship to RM: Class("this:node-concept" partial "rm:SOME_CLASS"
				-- 	then, leave a space for restriction for each attribute e.g.
				--						restriction("rm:attr_name" allValuesFrom("this:targ_node-concept"))
				--	then: )

				l_attr_pattern_key := "$attributes:" + a_node.node_id + "$"

				last_result.append(
					symbol(SYM_CLASS) + symbol(SYM_OPEN_PAREN) +
					node_concept_ref + format_item(FMT_SPACE) +
					symbol(SYM_PARTIAL) + format_item(FMT_SPACE) +
					"%"rm:" + a_node.rm_type_name + "%"" +
					format_item(FMT_SPACE) + format_item(FMT_NEWLINE) +
					l_attr_pattern_key +
					symbol(SYM_CLOSE_PAREN) + format_item(FMT_NEWLINE)
				)
			else
				l_object_pattern_key := "$object:" + a_node.parent.parent.node_id + ":" +
										a_node.parent.rm_attribute_name + "$"
				-- non-addresable object will go inline into current attribute string
				-- 		output: allValuesFrom(intersectionOf("rm:RM_TYPE_NAME"
				-- for every attribute,
				--		output: Restriction("rm:attr_name" "attr_value"
				-- 		output: )
				create l_obj_buffer.make(0)
				l_obj_buffer.append(create_indent(2) +
					symbol(SYM_ALL_VALUES_FROM) + symbol(SYM_OPEN_PAREN) +
					symbol(SYM_INTERSECTION_OF) + symbol(SYM_OPEN_PAREN) +
					"%"rm:" + a_node.rm_type_name + "%"" + format_item(FMT_NEWLINE)
				)
				across a_node.attributes as attrs_csr loop
					if attached {C_PRIMITIVE_OBJECT} attrs_csr.item.children.first as l_primitive_obj then
						l_prim_obj_value := "%"" + l_primitive_obj.as_string + "%""
					elseif attached {CONSTRAINT_REF} attrs_csr.item.children.first as l_constraint_ref then
						l_prim_obj_value := symbol(SYM_ALL_VALUES_FROM) + symbol(SYM_OPEN_PAREN) +
											"%"this:" + l_constraint_ref.as_string + "%"" + symbol(SYM_CLOSE_PAREN)
					else
						l_prim_obj_value := "%"(non-primitive object)%""
					end
					l_obj_buffer.append(create_indent(3) +
						symbol(SYM_RESTRICTION) + symbol(SYM_OPEN_PAREN) +
						"%"rm:" + attrs_csr.item.rm_attribute_name + "%"" + format_item(FMT_SPACE) +
						l_prim_obj_value + symbol(SYM_CLOSE_PAREN) + format_item(FMT_NEWLINE)
					)
				end

				l_obj_buffer.append(create_indent(2) + symbol(SYM_CLOSE_PAREN) +
						symbol(SYM_CLOSE_PAREN) + format_item(FMT_NEWLINE))
				last_result.replace_substring_all(l_object_pattern_key, l_obj_buffer)
			end
		end

	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- start serialising an ARCHETYPE_SLOT
		do
		end

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- start serialising an C_ATTRIBUTE
		local
			node_concept_ref: STRING
			l_attr_buffer: STRING
			l_object_pattern_key, l_attr_pattern_key: STRING
		do
			create l_attr_buffer.make(0)
			if a_node.parent.is_addressable then
				l_attr_pattern_key := "$attributes:" + a_node.parent.node_id + "$"

				-- Output single and multiple attribute as a series of:
				--  restriction("rm:attr_name" someValuesFrom("this:targ_node-concept"))
				from
					a_node.children.start
				until
					a_node.children.off
				loop
					--  restriction("rm:attr_name"
					l_attr_buffer.append(create_indent(1) +
						symbol(SYM_RESTRICTION) + symbol(SYM_OPEN_PAREN) +
						"%"rm:" + a_node.rm_attribute_name + "%"" +
						format_item(FMT_SPACE) + format_item(FMT_NEWLINE)
					)

					if a_node.children.item.is_addressable then
						--  someValuesFrom("this:targ_node-concept"))
						node_concept_ref := ontology.term_definition(language, a_node.children.item.node_id).item("text")
						l_attr_buffer.append(create_indent(2) +
							symbol(SYM_SOME_VALUES_FROM) + symbol(SYM_OPEN_PAREN) +
								"%"this:" + node_concept_ref + "%""
								+ symbol(SYM_CLOSE_PAREN) + format_item(FMT_NEWLINE)
						)
					else
						-- leave placeholder for each attribute child of this object child
						-- 		output: $object:a_node.parent.node_id:a_node.rm_attribute_name$
						l_object_pattern_key := "$object:" + a_node.parent.node_id + ":" +
													a_node.rm_attribute_name + "$"
						l_attr_buffer.append(l_object_pattern_key)
					end
					l_attr_buffer.append(create_indent(1) + symbol(SYM_CLOSE_PAREN) + format_item(FMT_NEWLINE))

					a_node.children.forth
				end
				last_result.replace_substring_all(l_attr_pattern_key, l_attr_buffer)
			end
		end

	start_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
			-- start serialising an C_COMPLEX_OBJECT_PROXY
		do
		end

	start_constraint_ref (a_node: CONSTRAINT_REF; depth: INTEGER)
			-- start serialising a CONSTRAINT_REF
		do
			last_object_simple := True
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising an C_PRIMITIVE_OBJECT
		local
			l_object_pattern_key: STRING
		do
			l_object_pattern_key := "$object:" + a_node.parent.parent.node_id + ":" +
										a_node.parent.rm_attribute_name + "$"
			if last_result.has_substring(l_object_pattern_key) then
				last_result.replace_substring_all(l_object_pattern_key, "%"" + a_node.as_string + "%"")
			end
		end

	serialise_occurrences (a_node: C_OBJECT; depth: INTEGER)
			-- any positive range
		do
			if not a_node.occurrences.is_equal(default_occurrences) then
				-- last_result.append(apply_style(symbol(SYM_OCCURRENCES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				-- last_result.append(apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				-- s := a_node.occurrences.as_occurrences_string
				-- last_result.append(symbol(SYM_START_CBLOCK) + apply_style(s, STYLE_VALUE) +
					-- symbol(SYM_END_CBLOCK) + format_item(FMT_SPACE))				
			end
		end

	serialise_existence(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- can only  be a range of 0..1 or 1..1
		do
			if not a_node.existence.is_equal(default_existence) then
				-- last_result.append(apply_style(symbol(SYM_EXISTENCE), STYLE_OPERATOR) + format_item(FMT_SPACE))
				-- last_result.append(apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				-- s := a_node.existence.as_occurrences_string
				-- last_result.append(symbol(SYM_START_CBLOCK) + apply_style(s, STYLE_VALUE) +
					-- symbol(SYM_END_CBLOCK) + format_item(FMT_SPACE))
			end
		end

	serialise_cardinality(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- includes a range and possibly ordered, unique qualifiers
		local
			s: STRING
		do
			if a_node.is_multiple then
				-- last_result.append(apply_style(symbol(SYM_CARDINALITY), STYLE_OPERATOR) + format_item(FMT_SPACE))
				-- last_result.append(apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				-- s := a_node.cardinality.as_string
				-- last_result.append(symbol(SYM_START_CBLOCK) + apply_style(s, STYLE_VALUE) +
					-- symbol(SYM_END_CBLOCK) + format_item(FMT_SPACE))
			end
		end

	start_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do
		end

	start_c_archetype_root(a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do
		end

feature {NONE} -- Implementation

	last_object_simple: BOOLEAN
			-- True if last object traversed was an OBJECT_SIMPLE

	last_object_simple_buffer: STRING

	odin_engine: ODIN_ENGINE

end


