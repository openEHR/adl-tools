indexing
	component:   "openEHR Archetype Project"
	description: "[
			 Serialise CADL archetype to any syntax format, i.e. where the
			 output reflects the tree hierarchy of the parse tree inline - nodes
			 are presented in the order of the tree traversal, and the semantics 
			 of the tree are output as language syntax keywords, symbols etc.
	             ]"
	keywords:    "serialiser, CADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CADL_SYNTAX_SERIALISER

inherit
	CONSTRAINT_MODEL_SERIALISER

	CADL_TOKENS
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_CONTEXT
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Modification

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- start serialising an C_COMPLEX_OBJECT
		local
			s:STRING
		do
			last_result.append(create_indent(depth))
			last_result.append(apply_style(clean(a_node.rm_type_name), STYLE_IDENTIFIER))

			if a_node.is_addressable then
				last_result.append(apply_style("[" + a_node.node_id + "]", STYLE_TERM_REF))
			end

			last_result.append(format_item(FMT_SPACE))
			serialise_occurrences(a_node, depth)
			last_result.append(apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
			last_result.append(symbol(SYM_START_CBLOCK))

			if a_node.any_allowed then
				last_result.append(apply_style(symbol(SYM_ANY), STYLE_VALUE))
			elseif a_node.is_addressable then
				s := a_node.node_id
				last_result.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
					safe_comment(ontology.term_definition(current_language, s).item("text")), STYLE_COMMENT))
				last_result.append(format_item(FMT_NEWLINE))
			else
				last_result.append(format_item(FMT_NEWLINE))
			end
		end

	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- end serialising an C_COMPLEX_OBJECT
		do
			if not a_node.any_allowed then
				last_result.append(create_indent(depth))
			end
			last_result.append(symbol(SYM_END_CBLOCK) + format_item(FMT_NEWLINE))
		end

	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- start serialising an ARCHETYPE_SLOT
		local
			s:STRING
		do
			last_result.append(create_indent(depth))

			last_result.append(apply_style(symbol(SYM_ALLOW_ARCHETYPE), STYLE_KEYWORD) + format_item(FMT_SPACE))

			last_result.append(apply_style(clean(a_node.rm_type_name), STYLE_IDENTIFIER))

			if a_node.is_addressable then
				last_result.append(apply_style("[" + a_node.node_id + "]", STYLE_TERM_REF))
			end
			last_result.append(format_item(FMT_SPACE))
			serialise_occurrences(a_node, depth)
			last_result.append(apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
			last_result.append(symbol(SYM_START_CBLOCK))

			if a_node.any_allowed then
				last_result.append(apply_style(symbol(SYM_ANY), STYLE_VALUE))
			elseif a_node.is_addressable then
				s := a_node.node_id
				last_result.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
					safe_comment(ontology.term_definition(current_language, s).item("text")), STYLE_COMMENT))
				last_result.append(format_item(FMT_NEWLINE))
			else
				last_result.append(format_item(FMT_NEWLINE))
			end
		end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- end serialising an ARCHETYPE_SLOT
		local
			invs: ARRAYED_LIST[ASSERTION]
		do
			-- output includes & excludes, indent then end block, since must be on new line
			if not a_node.any_allowed then
				if a_node.has_includes then
					last_result.append(create_indent(depth+1) + apply_style(symbol(SYM_INCLUDE), STYLE_KEYWORD) +
						format_item(FMT_NEWLINE))

					invs := a_node.includes
					from
						invs.start
					until
						invs.off
					loop
						last_result.append(create_indent(depth+2) +
							invs.item.expression.as_string + format_item(FMT_NEWLINE))
						invs.forth
					end
				end

				if a_node.has_excludes then
					last_result.append(create_indent(depth+1) + apply_style(symbol(SYM_EXCLUDE), STYLE_KEYWORD) +
						format_item(FMT_NEWLINE))

					invs := a_node.excludes
					from
						invs.start
					until
						invs.off
					loop
						last_result.append(create_indent(depth+2) +
							invs.item.expression.as_string + format_item(FMT_NEWLINE))
						invs.forth
					end
				end
				last_result.append(create_indent(depth))
			end
			last_result.append(symbol(SYM_END_CBLOCK))

			last_result.append(format_item(FMT_NEWLINE))
		end

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- start serialising an C_ATTRIBUTE
		do
			last_result.append(create_indent(depth) + apply_style(a_node.rm_attribute_name, STYLE_IDENTIFIER) + format_item(FMT_SPACE))
			serialise_existence(a_node, depth)
			serialise_cardinality(a_node, depth)
			last_result.append(apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
			last_result.append(symbol(SYM_START_CBLOCK))
			if a_node.any_allowed then
				last_result.append(symbol(SYM_ANY))
			else
				last_result.append(format_item(FMT_NEWLINE))
			end
		end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- end serialising an C_ATTRIBUTE
		do
			if not last_object_simple and not a_node.any_allowed then
				last_result.append(create_indent(depth))
			end

			last_result.append(symbol(SYM_END_CBLOCK))

			if last_object_simple then
				if last_object_simple_buffer /= Void then
					last_result.append(last_object_simple_buffer)
					last_object_simple_buffer.wipe_out
				end
				last_object_simple := False
			end

			last_result.append(format_item(FMT_NEWLINE))
		end

	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- start serialising an ARCHETYPE_INTERNAL_REF
		do
			last_result.append(create_indent(depth) + apply_style(symbol(SYM_USE_NODE), STYLE_KEYWORD) + format_item(FMT_SPACE))
			last_result.append(a_node.rm_type_name + format_item(FMT_SPACE))
			if not a_node.use_target_occurrences then
				serialise_occurrences(a_node, depth)
			end
			last_result.append(a_node.target_path)
			last_result.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
						safe_comment(ontology.physical_to_logical_path (a_node.target_path, current_language)), STYLE_COMMENT))
			last_result.append(format_item(FMT_NEWLINE))
		end

	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- end serialising an ARCHETYPE_INTERNAL_REF
		do
			-- nothing needed
		end

	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- start serialising a CONSTRAINT_REF
		do
			last_result.remove_tail(format_item(FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE	
			last_result.append(apply_style(a_node.as_string, STYLE_TERM_REF))
			create last_object_simple_buffer.make(0)
			last_object_simple_buffer.append(format_item(FMT_INDENT))

			-- add the comment
			last_object_simple_buffer.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
					safe_comment(ontology.constraint_definition(current_language, a_node.target).item("text")), STYLE_COMMENT))
			last_object_simple := True
		end

	end_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- end serialising a CONSTRAINT_REF
		do
		end

	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- start serialising an C_PRIMITIVE_OBJECT
		local
			s: STRING
		do
			last_result.remove_tail(format_item(FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE
			if {c_str: C_STRING} a_node.item and then c_str.strings /= Void then
				s := c_str.clean_as_string(agent clean)
			else
				s := a_node.as_string
			end
			last_result.append (apply_style (s, STYLE_VALUE))
			last_object_simple := True
		end

	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- end serialising an C_PRIMITIVE_OBJECT
		do
			-- nothing needed
			-- EXCEPTION TEST
		end

	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- start serialising an C_DOMAIN_TYPE
		do
			if dadl_engine = Void then
				create dadl_engine.make
			end
			dadl_engine.set_tree (a_node.dt_representation)
			dadl_engine.serialise (output_format)
			last_result.append((create {STRING_UTILITIES}).indented(dadl_engine.serialised, create_indent(depth)))
		end

	end_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- end serialising an C_DOMAIN_TYPE
		do
		end

	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER) is
			-- start serialising an C_CODE_PHRASE
		local
			adl_term: ARCHETYPE_TERM
		do
			if a_node.code_count = 1 or a_node.code_count = 0 then
				last_result.remove_tail(format_item(FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE	
				last_result.append(apply_style(a_node.as_string, STYLE_TERM_REF))
				create last_object_simple_buffer.make(0)
				if not a_node.any_allowed and then (a_node.is_local and a_node.code_count = 1) then
					last_object_simple_buffer.append(format_item(FMT_INDENT))

					adl_term := ontology.term_definition(current_language, a_node.code_list.first)
					last_object_simple_buffer.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
						safe_comment(adl_term.item("text")), STYLE_COMMENT))
				end
				last_object_simple := True

			elseif a_node.code_count > 1 then
				last_result.append(create_indent(depth) + apply_style("[" +
					a_node.terminology_id.value + a_node.separator, STYLE_TERM_REF) +
					format_item(FMT_NEWLINE))
				from
					a_node.code_list.start
				until
					a_node.code_list.off
				loop
					last_result.append(create_indent(depth) + apply_style(a_node.code_list.item, STYLE_TERM_REF))
					if not a_node.code_list.islast then
						last_result.append (format_item(FMT_LIST_ITEM_SEPARATOR))
					elseif a_node.assumed_value /= Void then
						last_result.append (format_item(FMT_ASSUMED_VALUE_SEPARATOR))
					else -- this will only get done if there is no assumed value
						last_result.append(apply_style("]", STYLE_TERM_REF))
					end

					if a_node.is_local and ontology.has_term_code (a_node.code_list.item) then
						adl_term := ontology.term_definition(current_language, a_node.code_list.item)
						last_result.append(format_item(FMT_INDENT) +
							apply_style(format_item(FMT_COMMENT) +
							safe_comment(adl_term.item("text")), STYLE_COMMENT))
					end
					last_result.append(format_item(FMT_NEWLINE))
					a_node.code_list.forth
				end

				if a_node.assumed_value /= Void then
					last_result.append(create_indent(depth) + apply_style(a_node.assumed_value.code_string, STYLE_TERM_REF))
					last_result.append(apply_style("]", STYLE_TERM_REF))
					last_result.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
							"assumed value", STYLE_COMMENT))
					last_result.append(format_item(FMT_NEWLINE))
				end
			end
		end

	end_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER) is
			-- end serialising an C_CODE_PHRASE
		do
		end

	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER) is
			-- start serialising an C_DV_ORDINAL
		local
			adl_term: ARCHETYPE_TERM
			i: INTEGER
		do
			if a_node.any_allowed then
				-- output in C_DV_ORDINAL style
				start_c_domain_type(a_node, depth)
			elseif a_node.items.count = 1 then
				last_result.remove_tail(format_item(FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE	
				last_result.append(apply_style(clean(a_node.as_string), STYLE_TERM_REF))
				create last_object_simple_buffer.make(0)
				if a_node.is_local then
					last_object_simple_buffer.append(format_item(FMT_INDENT))
					adl_term := ontology.term_definition(current_language, a_node.items.first.symbol.code_string)
					last_object_simple_buffer.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
						safe_comment(adl_term.item("text")), STYLE_COMMENT))
				end
				last_object_simple := True

			elseif a_node.items.count > 1 then
				from
					a_node.items.start
					i := 1
				until
					a_node.items.off
				loop
					last_result.append(create_indent(depth) + apply_style(a_node.items.item.as_string, STYLE_TERM_REF))
					if i < a_node.items.count then
						last_result.append (format_item(FMT_LIST_ITEM_SEPARATOR))
					elseif a_node.assumed_value /= Void then
						last_result.append (format_item(FMT_ASSUMED_VALUE_SEPARATOR))
					else -- pad same number of spaces
						last_result.append (create {STRING}.make_filled(' ', format_item(FMT_LIST_ITEM_SEPARATOR).count))
					end
					if a_node.is_local then
						adl_term := ontology.term_definition(current_language, a_node.items.item.symbol.code_string)
						last_result.append(format_item(FMT_INDENT) +
							apply_style(format_item(FMT_COMMENT) +
							safe_comment(adl_term.item("text")), STYLE_COMMENT))
					end
					last_result.append(format_item(FMT_NEWLINE))
					a_node.items.forth
					i := i + 1
				end

				if a_node.assumed_value /= Void then
					last_result.append(create_indent(depth) + apply_style(a_node.assumed_value.value.out, STYLE_TERM_REF))
					last_result.append (create {STRING}.make_filled(' ', format_item(FMT_LIST_ITEM_SEPARATOR).count))
					last_result.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
							"assumed value", STYLE_COMMENT))
					last_result.append(format_item(FMT_NEWLINE))
				end
			end
		end

	end_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER) is
			-- end serialising an C_DV_ORDINAL
		do
		end

	start_c_scale(a_node: C_DV_SCALE; depth: INTEGER) is
			-- start serialising an C_DV_SCALE
		local
			adl_term: ARCHETYPE_TERM
			i: INTEGER
		do
			if a_node.any_allowed then
				-- output in C_DV_SCALE style
				start_c_domain_type(a_node, depth)
			elseif a_node.items.count = 1 then
				last_result.remove_tail(format_item(FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE	
				last_result.append(apply_style(clean(a_node.as_string), STYLE_TERM_REF))
				create last_object_simple_buffer.make(0)
				if a_node.is_local then
					last_object_simple_buffer.append(format_item(FMT_INDENT))
					adl_term := ontology.term_definition(current_language, a_node.items.first.symbol.code_string)
					last_object_simple_buffer.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
						safe_comment(adl_term.item("text")), STYLE_COMMENT))
				end
				last_object_simple := True

			elseif a_node.items.count > 1 then
				from
					a_node.items.start
					i := 1
				until
					a_node.items.off
				loop
					last_result.append(create_indent(depth) + apply_style(a_node.items.item.as_string, STYLE_TERM_REF))
					if i < a_node.items.count then
						last_result.append (format_item(FMT_LIST_ITEM_SEPARATOR))
					elseif a_node.assumed_value /= Void then
						last_result.append (format_item(FMT_ASSUMED_VALUE_SEPARATOR))
					else -- pad same number of spaces
						last_result.append (create {STRING}.make_filled(' ', format_item(FMT_LIST_ITEM_SEPARATOR).count))
					end
					if a_node.is_local then
						adl_term := ontology.term_definition(current_language, a_node.items.item.symbol.code_string)
						last_result.append(format_item(FMT_INDENT) +
							apply_style(format_item(FMT_COMMENT) +
							safe_comment(adl_term.item("text")), STYLE_COMMENT))
					end
					last_result.append(format_item(FMT_NEWLINE))
					a_node.items.forth
					i := i + 1
				end

				if a_node.assumed_value /= Void then
					last_result.append(create_indent(depth) + apply_style(a_node.assumed_value.value.out, STYLE_TERM_REF))
					last_result.append (create {STRING}.make_filled(' ', format_item(FMT_LIST_ITEM_SEPARATOR).count))
					last_result.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
							"assumed value", STYLE_COMMENT))
					last_result.append(format_item(FMT_NEWLINE))
				end
			end
		end

	end_c_scale(a_node: C_DV_SCALE; depth: INTEGER) is
			-- end serialising an C_DV_SCALE
		do
		end

	serialise_occurrences(a_node: C_OBJECT; depth: INTEGER) is
			-- any positive range
		local
			s: STRING
		do
			if not a_node.occurrences.is_equal(default_occurrences) then
				last_result.append(apply_style(symbol(SYM_OCCURRENCES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				last_result.append(apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				s := a_node.occurrences.as_occurrences_string
				last_result.append(symbol(SYM_START_CBLOCK) + apply_style(s, STYLE_VALUE) +
					symbol(SYM_END_CBLOCK) + format_item(FMT_SPACE))
			end
		end

	serialise_existence(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- can only  be a range of 0..1 or 1..1
		local
			s: STRING
		do
			if not a_node.existence.is_equal(default_existence) then
				last_result.append(apply_style(symbol(SYM_EXISTENCE), STYLE_OPERATOR) + format_item(FMT_SPACE))
				last_result.append(apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				s := a_node.existence.as_occurrences_string
				last_result.append(symbol(SYM_START_CBLOCK) + apply_style(s, STYLE_VALUE) +
					symbol(SYM_END_CBLOCK) + format_item(FMT_SPACE))
			end
		end

	serialise_cardinality(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- includes a range and possibly ordered, unique qualifiers
		local
			s: STRING
		do
			if a_node.is_multiple then
				last_result.append(apply_style(symbol(SYM_CARDINALITY), STYLE_OPERATOR) + format_item(FMT_SPACE))
				last_result.append(apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				s := a_node.cardinality.as_string
				last_result.append(symbol(SYM_START_CBLOCK) + apply_style(s, STYLE_VALUE) +
					symbol(SYM_END_CBLOCK) + format_item(FMT_SPACE))
			end
		end

feature {NONE} -- Implementation

	last_object_simple: BOOLEAN
			-- True if last object traversed was an OBJECT_SIMPLE

	last_object_simple_buffer: STRING

	dadl_engine: DADL_ENGINE

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is cadl_serialiser.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
