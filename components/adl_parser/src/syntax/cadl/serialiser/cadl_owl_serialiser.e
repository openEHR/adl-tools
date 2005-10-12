indexing
	component:   "openEHR Archetype Project"
	description: "[
			 Serialise CADL archetype to OWL abstract syntax
	             ]"
	keywords:    "serialiser, OWL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CADL_OWL_SERIALISER 

inherit
	CONSTRAINT_MODEL_SERIALISER
	
	OWL_DEFINITIONS
	
	SHARED_ARCHETYPE_CONTEXT
		export
			{NONE} all
		end
	
creation
	make

feature -- Modification

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- start serialising an C_COMPLEX_OBJECT
		local
			node_concept_ref:STRING
			l_primitive_obj: C_PRIMITIVE_OBJECT
			l_constraint_ref: CONSTRAINT_REF
			l_object_pattern_key, l_attr_pattern_key, l_prim_obj_value: STRING
			l_obj_buffer: STRING
		do
			-- common definitions
			if a_node.is_addressable then
				node_concept_ref := current_archetype.ontology.term_definition(language, a_node.node_id).item("text")
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
				from
					a_node.attributes.start
				until
					a_node.attributes.off
				loop
					l_primitive_obj ?= a_node.attributes.item.children.first
					l_constraint_ref ?= a_node.attributes.item.children.first
					if l_primitive_obj /= Void then
						l_prim_obj_value := "%"" + l_primitive_obj.as_string + "%""
					elseif l_constraint_ref /= Void then
						l_prim_obj_value := symbol(SYM_ALL_VALUES_FROM) + symbol(SYM_OPEN_PAREN) +
											"%"this:" + l_constraint_ref.as_string + "%"" + symbol(SYM_CLOSE_PAREN)
					else
						l_prim_obj_value := "%"(non-primitive object)%""
					end
					l_obj_buffer.append(create_indent(3) +
						symbol(SYM_RESTRICTION) + symbol(SYM_OPEN_PAREN) + 
						"%"rm:" + a_node.attributes.item.rm_attribute_name + "%"" + format_item(FMT_SPACE) +
						l_prim_obj_value + symbol(SYM_CLOSE_PAREN) + format_item(FMT_NEWLINE)
					)
					a_node.attributes.forth
				end

				l_obj_buffer.append(create_indent(2) + symbol(SYM_CLOSE_PAREN) + 
						symbol(SYM_CLOSE_PAREN) + format_item(FMT_NEWLINE))
				last_result.replace_substring_all(l_object_pattern_key, l_obj_buffer)
			end
		end
		
	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- end serialising an C_COMPLEX_OBJECT
		do	
		end

	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- start serialising an ARCHETYPE_SLOT
		do
		end
		
	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- end serialising an ARCHETYPE_SLOT
		do	
		end

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
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
						node_concept_ref := current_archetype.ontology.term_definition(language, a_node.children.item.node_id).item("text")
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
		
	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- end serialising an C_ATTRIBUTE
		do
			last_result.append(format_item(FMT_NEWLINE))
		end

	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- start serialising an ARCHETYPE_INTERNAL_REF
		do
		end
		
	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- end serialising an ARCHETYPE_INTERNAL_REF
		do
			-- nothing needed
		end

	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- start serialising a CONSTRAINT_REF
		do
			last_object_simple := True
		end
		
	end_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- end serialising a CONSTRAINT_REF
		do
		end

	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
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
		
	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- end serialising an C_PRIMITIVE_OBJECT
		do
			-- nothing needed
			-- EXCEPTION TEST
		end

	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- start serialising an C_DOMAIN_TYPE
		do
		end
		
	end_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- end serialising an C_DOMAIN_TYPE
		do
		end

	start_c_coded_term(a_node: C_CODED_TERM; depth: INTEGER) is
			-- start serialising an C_CODED_TERM
		local
			adl_term: ARCHETYPE_TERM
		do
			if a_node.code_count = 1 or a_node.code_count = 0 then
				-- last_result.append(apply_style(clean(a_node.as_string), STYLE_TERM_REF))
				-- create last_object_simple_buffer.make(0)
				if a_node.is_local and a_node.code_count = 1 then
					-- last_object_simple_buffer.append(format_item(FMT_INDENT))
					
					adl_term := current_archetype.ontology.term_definition(language, a_node.code_list.first)
					-- last_object_simple_buffer.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) + 
					--	adl_term.item("text"), STYLE_COMMENT))			
				end				
				last_object_simple := True
				
			elseif a_node.code_count > 1 then
				-- last_result.append(create_indent(depth) + apply_style(clean("[" + a_node.terminology_id.as_string + 
				--	a_node.separator), STYLE_TERM_REF) + format_item(FMT_NEWLINE))
				from
					a_node.code_list.start
				until
					a_node.code_list.off
				loop
					-- last_result.append(create_indent(depth) + apply_style(clean(a_node.code_list.item), STYLE_TERM_REF))
					if not a_node.code_list.islast then
						-- last_result.append (format_item(FMT_LIST_ITEM_SEPARATOR))
					else
						-- last_result.append(apply_style("]", STYLE_TERM_REF))
					end
					if a_node.is_local then
						adl_term := current_archetype.ontology.term_definition(language, a_node.code_list.item)
						-- last_result.append(format_item(FMT_INDENT) + 
							-- apply_style(format_item(FMT_COMMENT) + 
							-- adl_term.item("text"), STYLE_COMMENT))			
					end
					-- last_result.append(format_item(FMT_NEWLINE))
					a_node.code_list.forth
				end				
			end				
		end
		
	end_c_coded_term(a_node: C_CODED_TERM; depth: INTEGER) is
			-- end serialising an C_CODED_TERM
		do
		end

	start_c_ordinal(a_node: C_ORDINAL; depth: INTEGER) is
			-- start serialising an C_ORDINAL
		local
			adl_term: ARCHETYPE_TERM
			i: INTEGER
		do
			if a_node.items.count = 1 then
				-- last_result.append(apply_style(clean(a_node.as_string), STYLE_TERM_REF))
				create last_object_simple_buffer.make(0)
				if a_node.is_local then
					-- last_object_simple_buffer.append(format_item(FMT_INDENT))
					adl_term := current_archetype.ontology.term_definition(language, a_node.items.first.symbol.code_string)
					-- last_object_simple_buffer.append(format_item(FMT_INDENT) + apply_style(format_item(FMT_COMMENT) + 
						-- adl_term.item("text"), STYLE_COMMENT))			
				end				
				last_object_simple := True
			elseif a_node.items.count > 1 then
				from
					a_node.items.start
					i := 1
				until
					a_node.items.off
				loop
					-- last_result.append(create_indent(depth) + apply_style(a_node.items.item.as_string, STYLE_TERM_REF))
					if i < a_node.items.count then
						-- last_result.append (format_item(FMT_LIST_ITEM_SEPARATOR))
					else -- pad same number of spaces
						-- last_result.append (create {STRING}.make_filled(' ', format_item(FMT_LIST_ITEM_SEPARATOR).count))
					end
					if a_node.is_local then
						adl_term := current_archetype.ontology.term_definition(language, a_node.items.item.symbol.code_string)
						-- last_result.append(format_item(FMT_INDENT) + 
							-- apply_style(format_item(FMT_COMMENT) + 
							-- adl_term.item("text"), STYLE_COMMENT))			
					end
					-- last_result.append(format_item(FMT_NEWLINE))
					a_node.items.forth
					i := i + 1
				end				
			end				
		end
		
	end_c_ordinal(a_node: C_ORDINAL; depth: INTEGER) is
			-- end serialising an C_ORDINAL
		do
		end

	serialise_occurrences(a_node: C_OBJECT; depth: INTEGER) is
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
		
	serialise_existence(a_node: C_ATTRIBUTE; depth: INTEGER) is
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
		
	serialise_cardinality(a_node: C_ATTRIBUTE; depth: INTEGER) is
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
--| The Original Code is cadl_owl_serialiser.e.
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
