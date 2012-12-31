note
	component:   "openEHR Archetype Project"
	description: "[
			 	 Serialise CADL archetype to any syntax format, i.e. where the
			 	 output reflects the tree hierarchy of the parse tree inline - nodes
			 	 are presented in the order of the tree traversal, and the semantics 
			 	 of the tree are output as language syntax keywords, symbols etc.
	             ]"
	keywords:    "serialiser, CADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CADL_SYNTAX_SERIALISER

inherit
	C_SERIALISER
		redefine
			start_c_complex_object, end_c_complex_object,
			start_c_attribute, end_c_attribute,
			start_archetype_slot, end_archetype_slot,
			start_archetype_internal_ref, start_constraint_ref,
			start_c_archetype_root, end_c_archetype_root,
			start_c_code_phrase, start_c_ordinal, start_c_quantity,
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
			-- start serialising an C_COMPLEX_OBJECT
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
			-- end serialising an C_COMPLEX_OBJECT
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
				-- output '%T}%N'
				last_result.append (create_indent(depth))
				last_result.append (symbol(SYM_END_CBLOCK))
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
			-- path-compressed output form
			if a_node.has_differential_path then
				p := a_node.path
			else
				p := a_node.rm_attribute_name
			end
			last_result.append (create_indent(depth) + apply_style(p, identifier_style (a_node)) + format_item(FMT_SPACE))

			serialise_existence(a_node, depth)
			serialise_cardinality(a_node, depth)

			if a_node.any_allowed then
				if not attached a_node.existence and not attached a_node.cardinality then
					last_result.append (apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
					last_result.append (symbol(SYM_START_CBLOCK))
					last_result.append (symbol(SYM_ANY))
				end
			else
				last_result.append (apply_style(symbol(SYM_MATCHES), STYLE_OPERATOR) + format_item(FMT_SPACE))
				last_result.append (symbol(SYM_START_CBLOCK))
				last_result.append (format_item(FMT_NEWLINE))
			end
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- end serialising an C_ATTRIBUTE
		do
			if last_object_simple then
				last_result.append (symbol(SYM_END_CBLOCK))
				if last_object_simple_buffer /= Void then
					last_result.append (last_object_simple_buffer)
					last_object_simple_buffer.wipe_out
				end
				last_object_simple := False

			elseif a_node.any_allowed then
				if not attached a_node.existence and not attached a_node.cardinality then
					last_result.append (symbol(SYM_END_CBLOCK))
				end

			else
				last_result.append (create_indent(depth))
				last_result.append (symbol(SYM_END_CBLOCK))
			end

			last_result.append (format_item(FMT_NEWLINE))
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
			last_result.append (format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
						safe_comment (ontology.physical_to_logical_path (a_node.target_path, language, False)), STYLE_COMMENT))
			last_result.append (format_item(FMT_NEWLINE))
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

	start_c_domain_type (a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- enter an C_DOMAIN_TYPE
		do
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_constraint_ref (a_node: CONSTRAINT_REF; depth: INTEGER)
			-- start serialising a CONSTRAINT_REF
		do
			last_result.remove_tail (format_item (FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE	
			last_result.append (apply_style (a_node.as_string, STYLE_TERM_REF))
			create last_object_simple_buffer.make(0)
			last_object_simple_buffer.append (format_item (FMT_INDENT))

			-- add the comment
			last_object_simple_buffer.append (format_item (FMT_INDENT) + apply_style (format_item (FMT_COMMENT) +
					safe_comment (ontology.constraint_definition (language, a_node.target).text), STYLE_COMMENT))
			last_object_simple := True
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising an C_PRIMITIVE_OBJECT
		local
			s: STRING
		do
			last_result.remove_tail(format_item(FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE
			if attached {C_STRING} a_node.item as c_str and then attached c_str.strings then
				s := c_str.clean_as_string(agent clean)
			else
				s := a_node.as_string
			end
			last_result.append (apply_style (s, STYLE_VALUE))
			last_object_simple := True
		end

	start_c_quantity (a_node: C_DV_QUANTITY; depth: INTEGER)
			-- start serialising an C_DV_QUANTITY; note that the following code is generic to all
			-- C_DOMAIN_TYPEs not having a special syntax like C_CODE_PHRASE and C_DV_ORDINAL (and note
			-- that in some archetypes, these types can be represented with dADL blocks)
		do
			dadl_engine.set_tree (a_node.dt_representation)
			dadl_engine.serialise (output_format, False, True)
			last_result.append ((create {STRING_UTILITIES}).indented (dadl_engine.serialised, create_indent(depth)))
		end

	start_c_code_phrase (a_node: C_CODE_PHRASE; depth: INTEGER)
			-- start serialising an C_CODE_PHRASE
		local
			adl_term: ARCHETYPE_TERM
		do
			if a_node.code_count = 1 or a_node.code_count = 0 then
				last_result.remove_tail(format_item(FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE	
				last_result.append (apply_style(a_node.as_string, STYLE_TERM_REF))
				create last_object_simple_buffer.make(0)
				if not a_node.any_allowed and then (a_node.is_local and a_node.code_count = 1 and ontology.has_term_code(a_node.code_list.first)) then
					last_object_simple_buffer.append (format_item(FMT_INDENT))

					adl_term := ontology.term_definition(language, a_node.code_list.first)
					last_object_simple_buffer.append (format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
						safe_comment(adl_term.text), STYLE_COMMENT))
				end
				last_object_simple := True

			elseif a_node.code_count > 1 then
				last_result.append (create_indent(depth) + apply_style("[" +
					a_node.terminology_id.value + a_node.separator, STYLE_TERM_REF) +
					format_item(FMT_NEWLINE))

				from a_node.code_list.start until a_node.code_list.off loop
					last_result.append (create_indent(depth) + apply_style(a_node.code_list.item, STYLE_TERM_REF))
					if not a_node.code_list.islast then
						last_result.append (format_item(FMT_LIST_ITEM_SEPARATOR))
					elseif a_node.assumed_value /= Void then
						last_result.append (format_item(FMT_ASSUMED_VALUE_SEPARATOR))
					else -- this will only get done if there is no assumed value
						last_result.append (apply_style("]", STYLE_TERM_REF))
					end

					if a_node.is_local and ontology.has_term_code(a_node.code_list.item) then
						adl_term := ontology.term_definition(language, a_node.code_list.item)
						last_result.append (format_item(FMT_INDENT) +
							apply_style(format_item(FMT_COMMENT) +
							safe_comment(adl_term.text), STYLE_COMMENT))
					end
					last_result.append (format_item(FMT_NEWLINE))
					a_node.code_list.forth
				end

				if a_node.assumed_value /= Void then
					last_result.append (create_indent(depth) + apply_style(a_node.assumed_value.code_string, STYLE_TERM_REF))
					last_result.append (apply_style("]", STYLE_TERM_REF))
					last_result.append (format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
							"assumed value", STYLE_COMMENT))
					last_result.append (format_item(FMT_NEWLINE))
				end
			end
		end

	start_c_ordinal (a_node: C_DV_ORDINAL; depth: INTEGER)
			-- start serialising an C_DV_ORDINAL
		local
			adl_term: ARCHETYPE_TERM
			i: INTEGER
		do
			if a_node.any_allowed then
				-- output in C_DV_ORDINAL style
				dadl_engine.set_tree (a_node.dt_representation)
				dadl_engine.serialise (output_format, False, True)
				last_result.append ((create {STRING_UTILITIES}).indented (dadl_engine.serialised, create_indent(depth)))
			elseif a_node.items.count = 1 then
				last_result.remove_tail(format_item(FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE	
				last_result.append (apply_style(clean(a_node.as_string), STYLE_TERM_REF))
				create last_object_simple_buffer.make(0)
				if a_node.is_local then
					last_object_simple_buffer.append (format_item(FMT_INDENT))
					adl_term := ontology.term_definition(language, a_node.items.first.symbol.code_string)
					last_object_simple_buffer.append (format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
						safe_comment(adl_term.text), STYLE_COMMENT))
				end
				last_object_simple := True

			elseif a_node.items.count > 1 then
				from
					a_node.items.start
					i := 1
				until
					a_node.items.off
				loop
					last_result.append (create_indent(depth) + apply_style(a_node.items.item.as_string, STYLE_TERM_REF))
					if i < a_node.items.count then
						last_result.append (format_item(FMT_LIST_ITEM_SEPARATOR))
					elseif a_node.assumed_value /= Void then
						last_result.append (format_item(FMT_ASSUMED_VALUE_SEPARATOR))
					else -- pad same number of spaces
						last_result.append (create {STRING}.make_filled (' ', format_item(FMT_LIST_ITEM_SEPARATOR).count))
					end
					if a_node.is_local then
						adl_term := ontology.term_definition(language, a_node.items.item.symbol.code_string)
						last_result.append (format_item(FMT_INDENT) +
							apply_style(format_item(FMT_COMMENT) +
							safe_comment(adl_term.text), STYLE_COMMENT))
					end
					last_result.append (format_item(FMT_NEWLINE))
					a_node.items.forth
					i := i + 1
				end

				if a_node.assumed_value /= Void then
					last_result.append (create_indent(depth) + apply_style(a_node.assumed_value.value.out, STYLE_TERM_REF))
					last_result.append (create {STRING}.make_filled (' ', format_item(FMT_LIST_ITEM_SEPARATOR).count))
					last_result.append (format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
							"assumed value", STYLE_COMMENT))
					last_result.append (format_item(FMT_NEWLINE))
				end
			end
		end

	serialise_occurrences (a_node: C_OBJECT; depth: INTEGER)
			-- any positive range
		local
			s: STRING
		do
			if a_node.occurrences /= Void then
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
			if a_node.existence /= Void then
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
			if a_node.is_multiple and a_node.cardinality /= Void then
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

	last_object_simple: BOOLEAN
			-- True if last object traversed was an OBJECT_SIMPLE

	last_object_simple_buffer: detachable STRING

	dadl_engine: DADL_ENGINE
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

	serialise_comment (a_node: attached C_OBJECT)
			-- the valid_code() check below is to ensure we have an at-code not an archetype id,
			-- as can occur in a template
		local
			s: STRING
		do
			if a_node.is_addressable then
				s := a_node.node_id
				if is_valid_code(s) and ontology.has_term_code(s) then
					last_result.append (format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) +
						safe_comment (ontology.term_definition(language, s).text), STYLE_COMMENT))
				end
			end
		end

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
