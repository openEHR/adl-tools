note
	component:   "openEHR Archetype Project"
	description: "Serialise DADL archetype to any syntax format"
	keywords:    "test, DADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class DT_DADL_SERIALISER

inherit
	DT_SERIALISER

	DADL_TOKENS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Visitor

	start_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- start serialising a DT_COMPLEX_OBJECT_NODE
		do
			start_object_item (a_node, depth)

			-- output the type information if required, then the opening '<'
			if a_node.is_typed and (a_node.type_visible or full_type_marking_on or a_node.is_root and output_typed_encapsulated) then
				last_result.append ("(" + a_node.im_type_name + ")" + format_item (FMT_SPACE) + symbol(SYM_START_DBLOCK) + format_item (FMT_NEWLINE))
			elseif not a_node.is_root then
				last_result.append (symbol(SYM_START_DBLOCK) + format_item(FMT_NEWLINE))
			end
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- end serialising a DT_COMPLEX_OBJECT_NODE
		do
			last_result.append (create_indent (depth//2 + multiple_attr_count))
			if not a_node.is_root or else a_node.is_typed and (a_node.type_visible or full_type_marking_on or output_typed_encapsulated) then
				last_result.append (symbol(SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
			end
		end

	start_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- start serialising a DT_ATTRIBUTE_NODE
		do
			-- don't output anything if nested - generate nested keyed objects only
			if not a_node.is_nested then
				-- output:  indent $attr_name ' ' = ' '
				last_result.append (create_indent (depth//2 + multiple_attr_count))
				last_result.append (apply_style (a_node.im_attr_name, STYLE_IDENTIFIER))
				last_result.append (format_item (FMT_SPACE) + apply_style (symbol (SYM_EQ), STYLE_OPERATOR) + format_item (FMT_SPACE))

				-- if it is a container, first output typing info, if option on
				-- then '<'
				if a_node.is_container_type then
					if a_node.is_typed and (a_node.type_visible or full_type_marking_on) then
						last_result.append ("(" + a_node.im_type_name + ")" + format_item(FMT_SPACE))
					end
					multiple_attr_count := multiple_attr_count + 1
					last_result.append (symbol (SYM_START_DBLOCK) + format_item (FMT_NEWLINE))
				end
			end
		end

	end_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			-- don't output anything if nested - generate nested keyed objects only
			if not a_node.is_nested then
				if a_node.is_container_type then
					multiple_attr_count := multiple_attr_count - 1
					last_result.append (create_indent (depth//2 + multiple_attr_count) + symbol (SYM_END_DBLOCK) + format_item (FMT_NEWLINE))
				end
			end
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_serialised_string (agent primitive_value_to_dadl_string, agent clean), STYLE_VALUE))
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_serialised_string (agent primitive_value_to_dadl_string, ", ", ", ...", agent clean), STYLE_VALUE))
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		do
			start_object_leaf(a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		do
			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
		end

feature {NONE} -- Implementation

	multiple_attr_count: INTEGER
			-- counter for how many multiple attributes at the current point

	start_object_item (a_node: DT_OBJECT_ITEM; depth: INTEGER)
			-- start serialising a DT_OBJECT_ITEM
		do
			if a_node.is_addressable then
				-- indent
				last_result.append (create_indent (depth//2 + multiple_attr_count))
				-- tag id
				last_result.append (apply_style ("[%"" + clean (a_node.id) + "%"]", STYLE_IDENTIFIER))
				-- ' = '
				last_result.append (format_item (FMT_SPACE) + apply_style (symbol (SYM_EQ), STYLE_OPERATOR) + format_item (FMT_SPACE))
			end
		end

	start_object_leaf (a_node: DT_OBJECT_LEAF; depth: INTEGER)
			-- start serialising a DT_OBJECT_LEAF
		do
			start_object_item (a_node, depth)
			last_result.append (symbol (SYM_START_DBLOCK))
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
--| The Original Code is dadl_serialiser.e.
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
