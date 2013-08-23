note
	component:   "openEHR ADL Tools"
	description: "[
			 	 Serialise CADL archetype to any syntax format, i.e. where the
			 	 output reflects the tree hierarchy of the parse tree inline - nodes
			 	 are presented in the order of the tree traversal, and the semantics 
			 	 of the tree are output as language syntax keywords, symbols etc.
	             ]"
	keywords:    "serialiser, CADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_SYNTAX_SERIALISER

inherit
	C_SERIALISER
		redefine
			start_c_complex_object, end_c_complex_object,
			start_c_attribute, end_c_attribute,
			start_archetype_slot, end_archetype_slot,
			start_archetype_internal_ref, start_constraint_ref,
			start_c_archetype_root, end_c_archetype_root,
			start_c_primitive_object
		end

	CADL_TOKENS
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature -- Visitor

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising a C_COMPLEX_OBJECT
		do
			serialise_sibling_order (a_node, depth)
			last_result.append (create_indent (depth))
			serialise_type_node_id (a_node, depth)

			-- output occurrences
			serialise_occurrences(a_node, depth)

			-- for prohibited nodes, just output the comment if available
			if a_node.is_prohibited then
				serialise_comment (a_node)

			-- output 'matches {*' if any_allowed, and no occurrences defined or node_id redefinition
			elseif a_node.any_allowed then
				if not (attached a_node.occurrences or
					a_node.is_addressable and archetype.is_specialised and then specialisation_depth_from_code (a_node.node_id) = archetype.specialisation_depth)
				then
					last_result.append (apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
					last_result.append (symbol(SYM_START_CBLOCK))
					last_result.append (apply_style(symbol(SYM_ANY), STYLE_VALUE))
				end

			-- output  'matches {%N' or 'matches { -- comment%N'
			else
				last_result.append (apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				last_result.append (symbol(SYM_START_CBLOCK))
				serialise_comment (a_node)
				last_result.append (format_item(FMT_NEWLINE))
			end
		end

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- end serialising a C_COMPLEX_OBJECT
		do
			if a_node.is_prohibited then
				-- output final '%N' (done below)

			elseif a_node.any_allowed then
				-- output '}%N' or '} -- comment%N'
				if not (attached a_node.occurrences or
					a_node.is_addressable and archetype.is_specialised and then specialisation_depth_from_code (a_node.node_id) = archetype.specialisation_depth)
				then
					last_result.append (symbol(SYM_END_CBLOCK))
				end
				serialise_comment (a_node)

			else
				-- deal with attribute tuples
				if attached a_node.attribute_tuples as att_tuples then
					across att_tuples as att_tuples_csr loop
						start_c_attribute_tuple (att_tuples_csr.item, depth + 1)
						end_c_attribute_tuple (att_tuples_csr.item, depth + 1)
					end
				end

				-- output '%T}%N'
				last_result.append (create_indent (depth))
				last_result.append (symbol (SYM_END_CBLOCK))
			end

			last_result.append (format_item(FMT_NEWLINE))
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- start serialising an ARCHETYPE_SLOT
		do
			serialise_sibling_order(a_node, depth)
			last_result.append (create_indent (depth))
			last_result.append (apply_style(symbol(SYM_ALLOW_ARCHETYPE), STYLE_KEYWORD) + format_item(FMT_SPACE))

			serialise_type_node_id (a_node, depth)

			if a_node.is_closed then
				-- output 'closed ' or 'closed -- comment'
				last_result.append (apply_style(symbol(SYM_CLOSED), STYLE_KEYWORD) + format_item(FMT_SPACE))
				serialise_comment (a_node)

			elseif a_node.any_allowed then
				-- output 'matches {*'
				-- (comment has to be serialised in end_ routine)
				serialise_occurrences(a_node, depth)
				if not (attached a_node.occurrences or
					a_node.is_addressable and archetype.is_specialised and then specialisation_depth_from_code (a_node.node_id) = archetype.specialisation_depth)
				then
					last_result.append (apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
					last_result.append (symbol(SYM_START_CBLOCK))
					last_result.append (apply_style(symbol(SYM_ANY), STYLE_VALUE))
				end

			else
				-- output occurrences
				-- 'matches { -- comment%N' or 'matches {%N'
				serialise_occurrences(a_node, depth)
				last_result.append (apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				last_result.append (symbol(SYM_START_CBLOCK))
				serialise_comment (a_node)
				last_result.append (format_item(FMT_NEWLINE))
			end
		end

	end_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- end serialising an ARCHETYPE_SLOT
		do
			if a_node.is_closed then
				last_result.append (format_item(FMT_NEWLINE))

			elseif a_node.any_allowed then
				-- output '}%N' or '} -- comment%N'
				if not (attached a_node.occurrences or
					a_node.is_addressable and archetype.is_specialised and then specialisation_depth_from_code (a_node.node_id) = archetype.specialisation_depth)
				then
					last_result.append (symbol(SYM_END_CBLOCK))
				end
				serialise_comment (a_node)
				last_result.append (format_item(FMT_NEWLINE))

			else -- output includes & excludes, indent the end block, since must be on new line
				if a_node.has_any_includes then
					last_result.append (create_indent(depth+1) + apply_style(symbol(SYM_INCLUDE), STYLE_KEYWORD) + format_item(FMT_NEWLINE))
					across a_node.includes as includes_csr loop
						last_result.append (create_indent(depth+2) + includes_csr.item.expression.as_string + format_item(FMT_NEWLINE))
					end
				end

				if a_node.has_any_excludes then
					last_result.append (create_indent(depth+1) + apply_style(symbol(SYM_EXCLUDE), STYLE_KEYWORD) + format_item(FMT_NEWLINE))
					across a_node.excludes as excludes_csr loop
						last_result.append (create_indent(depth+2) + excludes_csr.item.expression.as_string + format_item(FMT_NEWLINE))
					end
				end
				last_result.append (create_indent(depth))
				last_result.append (symbol(SYM_END_CBLOCK))
				last_result.append (format_item(FMT_NEWLINE))
			end
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- start serialising an C_ATTRIBUTE
		local
			p: STRING
		do
			-- ignore attrs whose object is a C_PRIM_OBJ and which are in c_attribute_tuples
			if not a_node.is_second_order_constrained then
				-- path-compressed output form
				if a_node.has_differential_path then
					p := a_node.path
				else
					p := a_node.rm_attribute_name
				end
				last_result.append (create_indent (depth) + apply_style (p, identifier_style (a_node)) + format_item (FMT_SPACE))

				serialise_existence (a_node, depth)
				serialise_cardinality (a_node, depth)

				if a_node.any_allowed then
					if not attached a_node.existence and not attached a_node.cardinality then
						last_result.append (apply_style (symbol (SYM_MATCHES), STYLE_OPERATOR) + format_item (FMT_SPACE))
						last_result.append (symbol (SYM_START_CBLOCK))
						last_result.append (symbol (SYM_ANY))
					end
				else
					last_result.append (apply_style (symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item (FMT_SPACE))
					last_result.append (symbol (SYM_START_CBLOCK))
					last_result.append (format_item (FMT_NEWLINE))
				end
			end
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- end serialising an C_ATTRIBUTE
		do
			-- ignore attrs whose object is a C_PRIM_OBJ and which are in c_attribute_tuples
			if not a_node.is_second_order_constrained then
				if last_object_inline then
					last_result.append (symbol (SYM_END_CBLOCK))
					if attached last_coded_constraint_comment as s then
						last_result.append (s)
						s.wipe_out
					end
					last_object_inline := False

				elseif a_node.any_allowed then
					if not attached a_node.existence and not attached a_node.cardinality then
						last_result.append (symbol (SYM_END_CBLOCK))
					end

				else
					last_result.append (create_indent (depth))
					last_result.append (symbol (SYM_END_CBLOCK))
				end

				last_result.append (format_item (FMT_NEWLINE))
			end
		end

	start_c_attribute_tuple (a_node: C_ATTRIBUTE_TUPLE; depth: INTEGER)
			-- enter a C_ATTRIBUTE_TUPLE
		do
			last_result.append (create_indent (depth) + "[")
			across a_node.members as c_attrs_csr loop
				last_result.append (c_attrs_csr.item.rm_attribute_name)
		--		serialise_existence (a_node, depth)
		--		serialise_cardinality (a_node, depth)
				if not c_attrs_csr.is_last then
					last_result.append (", ")
				end
			end
			last_result.append ("]" + format_item (FMT_SPACE))

			last_result.append (apply_style (symbol (SYM_MATCHES), STYLE_OPERATOR) + format_item (FMT_SPACE))
			last_result.append (symbol (SYM_START_CBLOCK))
			last_result.append (format_item(FMT_NEWLINE))

			across a_node.children as c_obj_tuples_csr loop
				start_c_object_tuple (c_obj_tuples_csr.item, depth + 1)
				if not c_obj_tuples_csr.is_last then
					last_result.append (",")
				end

				-- append any pending comment
				if attached last_coded_constraint_comment as s then
					last_result.append (s)
					s.wipe_out
				end
				last_object_inline := False

				last_result.append (format_item (FMT_NEWLINE))
			end
		end

	end_c_attribute_tuple (a_node: C_ATTRIBUTE_TUPLE; depth: INTEGER)
			-- exit a C_ATTRIBUTE_TUPLE
		do
			last_result.append (create_indent (depth) + symbol (SYM_END_CBLOCK))
			last_result.append (format_item (FMT_NEWLINE))
		end

	start_c_object_tuple (a_node: C_OBJECT_TUPLE; depth: INTEGER)
			-- start serialising an C_OBJECT_TUPLE
		do
			last_result.append (create_indent (depth) + "[")
			across a_node.members as c_prim_objs_csr loop
				last_result.append (symbol (SYM_START_CBLOCK))
				if attached {C_STRING} c_prim_objs_csr.item as c_str and then attached c_str.strings then
					last_result.append (apply_style (c_str.clean_as_string (agent clean), STYLE_VALUE))
				elseif attached {C_TERMINOLOGY_CODE} c_prim_objs_csr.item as ctc then
					serialise_c_terminology_code (ctc, depth)
				else
					last_result.append (apply_style (c_prim_objs_csr.item.as_string, STYLE_VALUE))
				end
				last_result.append (symbol (SYM_END_CBLOCK))
				if not c_prim_objs_csr.is_last then
					last_result.append (", ")
				end
			end
			last_result.append ("]" + format_item (FMT_SPACE))
		end

	start_archetype_internal_ref (a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- start serialising an ARCHETYPE_INTERNAL_REF
		do
			last_result.append (create_indent(depth) + apply_style (symbol (SYM_USE_NODE), STYLE_KEYWORD) + format_item(FMT_SPACE))
			serialise_type_node_id (a_node, depth)
			if not a_node.use_target_occurrences then
				serialise_occurrences (a_node, depth)
			end
			last_result.append (a_node.target_path)
			last_result.append (format_item (FMT_INDENT) + apply_style (format_item(FMT_COMMENT) +
						safe_comment (ontology.physical_to_logical_path (a_node.target_path, language, False)), STYLE_COMMENT))
			last_result.append (format_item (FMT_NEWLINE))
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
			-- if there are no children, it must be in differential mode, else it is in flat mode
		local
			id: STRING
		do
			-- have to obtain the ontology from the main archetype directory because the archetype being serialised
			-- here might be in differential form, and have no component_ontologies aet up
			ontologies.extend (current_arch_cat.archetype_index.item (a_node.archetype_id).flat_archetype.ontology)

			if a_node.has_attributes then -- in flat mode; treat like normal C_COMPLEX_OBJECT with children
				start_c_complex_object (a_node, depth)

			else -- it is in source mode, there are no children, only slot fillers
				-- output '%Tuse_archetype TYPE[at_code, archetype_id] <occurrences>%N'
				-- or '%Tuse_archetype TYPE[archetype_id] <occurrences>%N'
				last_result.append (create_indent(depth) + apply_style(symbol(SYM_USE_ARCHETYPE), STYLE_KEYWORD) + format_item(FMT_SPACE))
				last_result.append (apply_style (a_node.rm_type_name, identifier_style (a_node)))
				id := "["
				if attached a_node.slot_node_id then
					id.append (a_node.slot_node_id + ", ")
				end
				id.append (a_node.archetype_id + "]")
				last_result.append (apply_style(id, STYLE_TERM_REF))

				last_result.append (format_item(FMT_SPACE))

				serialise_occurrences(a_node, depth)
				last_result.append (format_item(FMT_NEWLINE))
			end
		end

	end_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
			if a_node.has_attributes then
				end_c_complex_object (a_node, depth)
			end
			ontologies.remove
		end

	start_c_reference_object (a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_constraint_ref (a_node: CONSTRAINT_REF; depth: INTEGER)
			-- start serialising a CONSTRAINT_REF
		do
			-- remove last newline due to C_ATTRIBUTE
			last_result.remove_tail (format_item (FMT_NEWLINE).count)

			last_result.append (apply_style (a_node.as_string, STYLE_TERM_REF))

			-- add the comment
			create last_coded_constraint_comment.make(0)
			last_coded_constraint_comment.append (format_item (FMT_INDENT))
			last_coded_constraint_comment.append (format_item (FMT_INDENT) + apply_style (format_item (FMT_COMMENT) +
					safe_comment (ontology.constraint_definition (language, a_node.target).text), STYLE_COMMENT))
			last_object_inline := True
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising an C_PRIMITIVE_OBJECT
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				last_result.remove_tail (format_item(FMT_NEWLINE).count)	-- remove last newline due to C_ATTRIBUTE
				if attached {C_STRING} a_node as c_str and then attached c_str.strings then
					last_result.append (apply_style (c_str.clean_as_string (agent clean), STYLE_VALUE))
					last_object_inline := True
				elseif attached {C_TERMINOLOGY_CODE} a_node as ctc then
					serialise_c_terminology_code (ctc, depth)
				else
					last_result.append (apply_style (a_node.as_string, STYLE_VALUE))
					last_object_inline := True
				end
			end
		end

	serialise_occurrences (a_node: C_OBJECT; depth: INTEGER)
			-- any positive range
		local
			s: STRING
		do
			if attached a_node.occurrences then
				last_result.append (apply_style(symbol(SYM_OCCURRENCES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				last_result.append (apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				s := a_node.occurrences.as_string
				last_result.append (symbol(SYM_START_CBLOCK) + apply_style(s, STYLE_VALUE) +
					symbol(SYM_END_CBLOCK) + format_item(FMT_SPACE))
			end
		end

	serialise_existence (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- can only  be a range of 0..1 or 1..1
		local
			s: STRING
		do
			if attached a_node.existence then
				last_result.append (apply_style(symbol(SYM_EXISTENCE), STYLE_OPERATOR) + format_item(FMT_SPACE))
				last_result.append (apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				s := a_node.existence.as_string
				last_result.append (symbol(SYM_START_CBLOCK) + apply_style(s, STYLE_VALUE) +
					symbol(SYM_END_CBLOCK) + format_item(FMT_SPACE))
			end
		end

	serialise_cardinality (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- includes a range and possibly ordered, unique qualifiers
		local
			s: STRING
		do
			if a_node.is_multiple and attached a_node.cardinality then
				last_result.append (apply_style(symbol(SYM_CARDINALITY), STYLE_OPERATOR) + format_item(FMT_SPACE))
				last_result.append (apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				s := a_node.cardinality.as_string
				last_result.append (symbol(SYM_START_CBLOCK) + apply_style(s, STYLE_VALUE) +
					symbol(SYM_END_CBLOCK) + format_item(FMT_SPACE))
			end
		end

feature {NONE} -- Implementation

	serialise_sibling_order (a_node: C_OBJECT; depth: INTEGER)
			-- serialise C_OBJECT.sibling_order if this is a differential archetype (it should not be there otherwise)
		do
			if differential_view and attached a_node.sibling_order then
				last_result.append (create_indent (depth))
				if a_node.sibling_order.is_after then
					last_result.append (apply_style(symbol(SYM_AFTER), STYLE_KEYWORD) + format_item(FMT_SPACE))
				else
					last_result.append (apply_style(symbol(SYM_BEFORE), STYLE_KEYWORD) + format_item(FMT_SPACE))
				end
				last_result.append (apply_style("[" + a_node.sibling_order.sibling_node_id + "]", STYLE_TERM_REF))
				last_result.append (format_item(FMT_NEWLINE))
			end
		end

	serialise_type_node_id (a_node: C_OBJECT; depth: INTEGER)
			-- common serialising for all C_OBJECTs
		do
			last_result.append (apply_style (a_node.rm_type_name, identifier_style (a_node)))

			if a_node.is_addressable then
				last_result.append (apply_style("[" + a_node.node_id + "]", STYLE_TERM_REF))
			end

			last_result.append (format_item(FMT_SPACE))
		end

	serialise_c_terminology_code (a_node: C_TERMINOLOGY_CODE; depth: INTEGER)
		do
			if a_node.code_count = 1 or a_node.code_count = 0 then
				-- output the actual constraint value
				last_result.append (apply_style (a_node.as_string, STYLE_TERM_REF))

				-- hold the comment over in `last_object_simple_buffer'
				create last_coded_constraint_comment.make(0)
				if not a_node.any_allowed and then (a_node.is_local and a_node.code_count = 1 and ontology.has_term_code (a_node.code_list.first)) then
					last_coded_constraint_comment.append (format_item (FMT_INDENT))

					check attached ontology.term_definition (language, a_node.code_list.first) as adl_term then
						last_coded_constraint_comment.append (format_item (FMT_INDENT) + apply_style (format_item (FMT_COMMENT) +
							safe_comment (adl_term.text), STYLE_COMMENT))
					end
				end
				last_object_inline := True

			else
				-- add a newline, because for all other C_PRIMITIVE_OBJECTs the existing one will be stripped, but this
				-- is a multi-line output and needs to start on a new line
				last_result.append (format_item (FMT_NEWLINE))
				last_result.append (create_indent (depth) + apply_style("[" +
					a_node.terminology_id + Terminology_separator, STYLE_TERM_REF) +
					format_item (FMT_NEWLINE))

				across a_node.code_list as code_list_csr loop
					last_result.append (create_indent(depth) + apply_style (code_list_csr.item, STYLE_TERM_REF))
					if not code_list_csr.is_last then
						last_result.append (format_item (FMT_LIST_ITEM_SEPARATOR))
					elseif attached a_node.assumed_value then
						last_result.append (format_item (FMT_ASSUMED_VALUE_SEPARATOR))
					else -- this will only get done if there is no assumed value
						last_result.append (apply_style ("]", STYLE_TERM_REF))
					end

					if a_node.is_local and ontology.has_term_code (code_list_csr.item) then
						check attached ontology.term_definition (language, code_list_csr.item) as adl_term then
							last_result.append (format_item(FMT_INDENT) +
								apply_style (format_item (FMT_COMMENT) +
								safe_comment (adl_term.text), STYLE_COMMENT))
						end
					end
					last_result.append (format_item (FMT_NEWLINE))
				end

				if attached a_node.assumed_value as av then
					last_result.append (create_indent(depth) + apply_style(av.code_string, STYLE_TERM_REF))
					last_result.append (apply_style ("]", STYLE_TERM_REF))
					last_result.append (format_item (FMT_INDENT) + apply_style (format_item (FMT_COMMENT) +
							"assumed value", STYLE_COMMENT))
					last_result.append (format_item (FMT_NEWLINE))
				end
			end
		end

	last_object_inline: BOOLEAN
			-- True if last object traversed was an OBJECT_SIMPLE

	last_coded_constraint_comment: detachable STRING

	odin_engine: ODIN_ENGINE
			-- for handling inline dADL sections like for C_QUANTITY
		once
			create Result.make
		end

	identifier_style (constraint: ARCHETYPE_CONSTRAINT): INTEGER
			-- The formatting identifier style appropriate to the the specialisation status of `constraint'.
		do
			inspect constraint.inferred_specialisation_status (ontology.specialisation_depth).value
			when {SPECIALISATION_STATUS}.ss_inherited then
				Result := style_inherited_identifier
			when {SPECIALISATION_STATUS}.ss_redefined then
				Result := style_redefined_identifier
			else
				Result := style_identifier
			end
		end

	serialise_comment (a_node: C_OBJECT)
			-- the valid_code() check below is to ensure we have an at-code not an archetype id,
			-- as can occur in a template
		local
			s: STRING
		do
			if a_node.is_addressable then
				s := a_node.node_id
				if is_valid_code(s) and ontology.has_term_code(s) then
					last_result.append (format_item (FMT_INDENT) + apply_style (format_item (FMT_COMMENT) +
						safe_comment (ontology.term_definition(language, s).text), STYLE_COMMENT))
				end
			end
		end

end


