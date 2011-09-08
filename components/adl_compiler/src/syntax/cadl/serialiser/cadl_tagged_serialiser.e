note
	component:   "openEHR Archetype Project"
	description: "[
			 Serialise CADL archetype to a tagged format, where each attribute
			 is enclosed in tags.
	             ]"
	keywords:    "serialiser, CADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CADL_TAGGED_SERIALISER

inherit
	C_SERIALISER
		redefine
			start_c_complex_object, end_c_complex_object,
			start_c_attribute, end_c_attribute,
			start_archetype_slot, end_archetype_slot,
			start_archetype_internal_ref, start_constraint_ref,
			start_c_archetype_root,
			start_c_code_phrase, start_c_ordinal, start_c_quantity,
			start_c_primitive_object
		end

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
			attrs: HASH_TABLE [STRING, STRING]
		do
			-- lead tag + attributes
			create attrs.make(0)

			attrs.put ("complex object constraint", tag(TAG_NODE_TYPE))
			attrs.put (a_node.rm_type_name, tag(TAG_NODE_RM_CLASS))

			if a_node.is_addressable then
				attrs.put (a_node.node_id, tag(TAG_NODE_ID))
			end

			attrs.put (a_node.occurrences.as_occurrences_string, symbol(SYM_OCCURRENCES))

			last_result.append(create_indent(depth) + xml_tag_start(tag(TAG_NODE), attrs) + format_item(FMT_NEWLINE))

			-- output level
			last_result.append(create_indent(depth+1) + xml_tag_enclose(tag(TAG_NODE_LEVEL),
					(depth//2).out, Void) + format_item(FMT_NEWLINE))

			-- output parent node id
			if a_node.parent /= Void then
				last_result.append(create_indent(depth+1) + xml_tag_enclose(tag(TAG_NODE_PARENT),
						a_node.parent.parent.node_id, Void) + format_item(FMT_NEWLINE))
			end

			-- output occurrences as element
			-- serialise_occurrences(a_node, depth)

			-- output text of node id
			if a_node.is_addressable then
				last_result.append(create_indent(depth+1) + xml_tag_enclose(tag(TAG_TEXT),
					ontology.term_definition(language, a_node.node_id).item("text"), Void) + format_item(FMT_NEWLINE))
			end
		end

	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- end serialising an C_COMPLEX_OBJECT
		local
			invs: ARRAYED_LIST[ASSERTION]
			attrs: HASH_TABLE [STRING, STRING]
		do
			-- if a normal node, output invariants, indent then end block, since must be on new line
			if a_node.is_addressable then
				-- last_result := node_strings.item(a_node.node_id)	
			end

			last_result.append(create_indent(depth) + xml_tag_end(tag(TAG_NODE)) + format_item(FMT_NEWLINE))
		end

	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- start serialising an ARCHETYPE_SLOT
		local
			attrs: HASH_TABLE [STRING, STRING]
			invs: ARRAYED_LIST[ASSERTION]
		do
			-- lead tag + attributes
			create attrs.make(0)

			attrs.put ("archetype slot", tag(TAG_NODE_TYPE))
			attrs.put (a_node.rm_type_name, tag(TAG_NODE_RM_CLASS))

			if a_node.is_addressable then
				attrs.put (a_node.node_id, tag(TAG_NODE_ID))
			end

			attrs.put (a_node.occurrences.as_occurrences_string, symbol(SYM_OCCURRENCES))

			last_result.append(create_indent(depth) + xml_tag_start(tag(TAG_NODE), attrs) + format_item(FMT_NEWLINE))

			-- output level
			last_result.append(create_indent(depth+1) + xml_tag_enclose(tag(TAG_NODE_LEVEL),
					(depth//2).out, Void) + format_item(FMT_NEWLINE))

			-- output parent node id
			if a_node.parent /= Void then
				last_result.append(create_indent(depth+1) + xml_tag_enclose(tag(TAG_NODE_PARENT),
						a_node.parent.parent.node_id, Void) + format_item(FMT_NEWLINE))
			end

			-- output occurrences as element
			-- serialise_occurrences(a_node, depth)

			-- output text of node id
			if a_node.is_addressable then
				last_result.append(create_indent(depth+1) + xml_tag_enclose(tag(TAG_TEXT),
					ontology.term_definition(language, a_node.node_id).item("text"), Void) + format_item(FMT_NEWLINE))
			end

			-- output includes and excludes
			if not a_node.any_allowed then
				if a_node.has_includes then
					last_result.append(create_indent(depth+1) + xml_tag_start(symbol(SYM_INCLUDE), Void) + format_item(FMT_NEWLINE))

					invs := a_node.includes
					from
						invs.start
					until
						invs.off
					loop
						create attrs.make(0)

						last_result.append(create_indent(depth+2) + xml_tag_start(tag(TAG_ITEM), attrs) + format_item(FMT_NEWLINE))
						last_result.append(invs.item.expression.as_string + format_item(FMT_NEWLINE))
						last_result.append(create_indent(depth+2) + xml_tag_end(tag(TAG_ITEM)) + format_item(FMT_NEWLINE))
						invs.forth
					end
					last_result.append(create_indent(depth+1) + xml_tag_end(symbol(SYM_INCLUDE)) + format_item(FMT_NEWLINE))
				end

				if a_node.has_excludes then
					last_result.append(create_indent(depth+1) + xml_tag_start(symbol(SYM_EXCLUDE), Void) + format_item(FMT_NEWLINE))

					invs := a_node.excludes
					from
						invs.start
					until
						invs.off
					loop
						create attrs.make(0)

						last_result.append(create_indent(depth+2) + xml_tag_start(tag(TAG_ITEM), attrs) + format_item(FMT_NEWLINE))
						last_result.append(invs.item.expression.as_string + format_item(FMT_NEWLINE))
						last_result.append(create_indent(depth+2) + xml_tag_end(tag(TAG_ITEM)) + format_item(FMT_NEWLINE))
						invs.forth
					end
					last_result.append(create_indent(depth+1) + xml_tag_end(symbol(SYM_EXCLUDE)) + format_item(FMT_NEWLINE))
				end
			end

			last_result.append(create_indent(depth) + xml_tag_end(tag(TAG_NODE)) + format_item(FMT_NEWLINE))
		end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- end serialising an ARCHETYPE_SLOT
		do
		end

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- start serialising an C_ATTRIBUTE
		local
			attrs: HASH_TABLE [STRING, STRING]
		do
			create attrs.make(0)
			if a_node.is_relationship then
				attrs.put ("relationship constraint", tag(TAG_NODE_TYPE))
			else
				attrs.put ("attribute constraint", tag(TAG_NODE_TYPE))
			end

			-- existence is only interesting if it is different from the reference model
			-- attrs.put (a_node.existence.as_occurrences_string, symbol(SYM_EXISTENCE))
			if a_node.is_multiple then
				attrs.put (a_node.cardinality.as_string, symbol(SYM_CARDINALITY))
			end

			last_result.append(create_indent(depth) + xml_tag_start(a_node.rm_attribute_name, attrs) +
					format_item(FMT_NEWLINE))

			-- output existence and cardinality as element
			-- serialise_existence(a_node, depth)
			-- serialise_cardinality(a_node, depth)
		end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- end serialising an C_ATTRIBUTE
		do
			if not last_object_simple then
				last_result.append(create_indent(depth))
			end
			last_result.append(xml_tag_end(a_node.rm_attribute_name) + format_item(FMT_NEWLINE))
			if last_object_simple then
				if last_object_simple_buffer /= Void then
					last_result.append(create_indent(depth) + last_object_simple_buffer + format_item(FMT_NEWLINE))
					last_object_simple_buffer.wipe_out
				end
				last_object_simple := False
			end
		end

	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
			-- start serialising an CONSTRAINT_REF
		local
			attrs: HASH_TABLE [STRING, STRING]
		do
			last_result.remove_tail(format_item(FMT_NEWLINE).count)
			last_result.append(clean(a_node.as_string))
			create last_object_simple_buffer.make(0)
			last_object_simple_buffer.append(xml_tag_enclose("text",
				ontology.constraint_definition(language, a_node.target).item("text"), Void))
			from
				ontology.terminologies_available.start
			until
				ontology.terminologies_available.off
			loop
				if
					ontology.has_constraint_binding(ontology.terminologies_available.item, a_node.target) then
					create attrs.make(0)
					attrs.put(ontology.terminologies_available.item, "terminology")
					last_object_simple_buffer.append(format_item(FMT_NEWLINE) + create_indent(depth-1) +
						xml_tag_enclose("binding",
						ontology.constraint_binding(ontology.terminologies_available.item, a_node.target).as_string, attrs))
				end
				ontology.terminologies_available.forth
			end
			last_object_simple := True
		end

	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- start serialising an ARCHETYPE_INTERNAL_REF
		do
--			last_result.append(create_indent(depth) + symbol(SYM_USE_NODE) + format_item(FMT_SPACE))
--			last_result.append(a_node.rm_type_name + format_item(FMT_SPACE) + a_node.ref_path.as_string + format_item(FMT_NEWLINE))
		end

	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising an C_PRIMITIVE_OBJECT
		do
			last_result.remove_tail(format_item(FMT_NEWLINE).count)
			last_result.append(clean(a_node.as_string))
			last_object_simple := True
		end

	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- start serialising an C_DOMAIN_TYPE
		do
		end

	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER)
			-- start serialising an C_CODE_PHRASE
		local
			adl_term: ARCHETYPE_TERM
			attrs: HASH_TABLE [STRING, STRING]
		do
			if a_node.code_count = 1 or a_node.code_count = 0 then
				last_result.remove_tail(format_item(FMT_NEWLINE).count)
				last_result.append(clean(a_node.as_string))
				create last_object_simple_buffer.make(0)
				if a_node.is_local and then a_node.code_count = 1 then
					adl_term := ontology.term_definition(language, a_node.code_list.first)
					last_object_simple_buffer.append(xml_tag_enclose("text",
						adl_term.item("text"), Void))
					from
						ontology.terminologies_available.start
					until
						ontology.terminologies_available.off
					loop
						if
							ontology.has_term_binding(ontology.terminologies_available.item, adl_term.item("text")) then
							create attrs.make(0)
							attrs.put(ontology.terminologies_available.item, "terminology")
							last_object_simple_buffer.append(format_item(FMT_NEWLINE) + create_indent(depth-1) +
								xml_tag_enclose("binding",
								ontology.term_binding(ontology.terminologies_available.item, adl_term.item("text")).code_string,
								attrs))
						end
						ontology.terminologies_available.forth
					end
				end
				last_object_simple := True

			elseif a_node.code_count > 1 then
				last_result.append(create_indent(depth) + clean("[" + a_node.terminology_id.value +
					a_node.separator) + format_item(FMT_NEWLINE))
				from
					a_node.code_list.start
				until
					a_node.code_list.off
				loop
					last_result.append(create_indent(depth) + clean(a_node.code_list.item))
					if not a_node.code_list.islast then
						last_result.append (format_item(FMT_LIST_ITEM_SEPARATOR))
					else
						last_result.append("]")
					end
					if a_node.is_local then
						adl_term := ontology.term_definition(language, a_node.code_list.item)
						last_result.append(format_item(FMT_INDENT) + format_item(FMT_COMMENT) + adl_term.item("text"))
					end
					last_result.append(format_item(FMT_NEWLINE))
					a_node.code_list.forth
				end
			end
		end

	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- start serialising an C_DV_ORDINAL
		local
			adl_term: ARCHETYPE_TERM
			i: INTEGER
		do
			if a_node.items.count = 1 then
				last_result.remove_tail(format_item(FMT_NEWLINE).count)	-- remove last newline due to OBJECT_REL_NODE	
				last_result.append(clean(a_node.as_string))
				create last_object_simple_buffer.make(0)
				if a_node.is_local then
					last_object_simple_buffer.append(format_item(FMT_INDENT))
					adl_term := ontology.term_definition(language, a_node.items.first.symbol.code_string)
					last_object_simple_buffer.append(format_item(FMT_INDENT) + format_item(FMT_COMMENT) + adl_term.item("text"))
				end
				last_object_simple := True
			elseif a_node.items.count > 1 then
				from
					a_node.items.start
					i := 1
				until
					a_node.items.off
				loop
					last_result.append(create_indent(depth) + a_node.items.item.as_string)
					if i < a_node.items.count then
						last_result.append (format_item(FMT_LIST_ITEM_SEPARATOR))
					else -- pad same number of spaces
						last_result.append (create {STRING}.make_filled(' ', format_item(FMT_LIST_ITEM_SEPARATOR).count))
					end
					if a_node.is_local then
						adl_term := ontology.term_definition(language, a_node.items.item.symbol.code_string)
						last_result.append(format_item(FMT_INDENT) +
							format_item(FMT_COMMENT) +
							adl_term.item("text"))
					end
					last_result.append(format_item(FMT_NEWLINE))
					a_node.items.forth
					i := i + 1
				end
			end
		end

	start_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		do
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

	serialise_occurrences(a_node: C_OBJECT; depth: INTEGER)
			-- any positive range
		do
			last_result.append(create_indent(depth+1))
			last_result.append(xml_tag_enclose(symbol(SYM_OCCURRENCES), a_node.occurrences.as_occurrences_string, Void))
			last_result.append(format_item(FMT_NEWLINE))
		end

	serialise_existence(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- can only  be a range of 0..1 or 1..1
		do
			if not a_node.is_multiple then
				last_result.append(create_indent(depth+1))
				last_result.append(xml_tag_enclose(symbol(SYM_EXISTENCE), a_node.existence.as_occurrences_string, Void))
				last_result.append(format_item(FMT_NEWLINE))
			end
		end

	serialise_cardinality(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- includes a range and possibly ordered, unique qualifiers
		do
			if a_node.is_multiple then
				last_result.append(create_indent(depth+1))
				last_result.append(xml_tag_enclose(symbol(SYM_CARDINALITY), a_node.cardinality.as_string, Void))
				last_result.append(format_item(FMT_NEWLINE))
			end
		end

feature {NONE} -- Implementation

	last_object_simple: BOOLEAN
			-- True if last object traversed was an OBJECT_SIMPLE

	last_object_simple_buffer: STRING

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
--| The Original Code is cadl_tagged_serialiser.e.
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
