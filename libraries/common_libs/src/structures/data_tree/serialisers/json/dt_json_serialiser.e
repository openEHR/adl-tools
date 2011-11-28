note
	component:   "openEHR Archetype Project"
	description: "Serialise DT structure to JSON syntax"
	keywords:    "Data tree, JSON"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_JSON_SERIALISER

inherit
	DT_SERIALISER

	JSON_SYMBOLS
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
			if not a_node.is_root then
				start_object_item (a_node, depth)
			end
			last_result.append (symbol (SYM_JSON_START_OBJECT) + format_item (FMT_NEWLINE))
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- end serialising a DT_COMPLEX_OBJECT_NODE
		do
			last_result.append (create_indent (depth//2 + multiple_attr_count))
			last_result.append (symbol (SYM_JSON_END_OBJECT))
			if not a_node.is_root then
				end_object_item (a_node, depth)
			end
		end

	start_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- start serialising a DT_ATTRIBUTE_NODE
		do
			-- output: indent "$attr_name":
			last_result.append (create_indent (depth//2 + multiple_attr_count))
			last_result.append (symbol (Sym_json_attribute_name_delimiter) + a_node.im_attr_name + symbol (Sym_json_attribute_name_delimiter))
			last_result.append (symbol (SYM_JSON_EQ))

			-- if it is a container, first output typing info, if option on
			-- then '['
			if a_node.is_container_type then
				multiple_attr_count := multiple_attr_count + 1
				last_result.append (symbol (SYM_JSON_START_ARRAY))

				-- look into the objects in the container; if it turns out to be a HASH_TABLE,
				-- i.e. with real hash keys (not just numbers) we need to put out another SYM_JSON_START_OBJECT
				-- token (JSON is very dumb about hash maps)
				if not a_node.is_empty and then a_node.first_child.is_addressable and then not a_node.first_child.id.is_integer then
					last_result.append (symbol (SYM_JSON_START_OBJECT))
				end
				last_result.append (format_item (FMT_NEWLINE))
			end
		end

	end_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			if a_node.is_container_type then
				multiple_attr_count := multiple_attr_count - 1

				-- output the indent
				last_result.append (create_indent (depth//2 + multiple_attr_count))

				-- look into the objects in the container; if it turns out to be a HASH_TABLE,
				-- i.e. with real hash keys (not just numbers) we need to put out another SYM_JSON_END_OBJECT
				-- token (JSON is very dumb about hash maps)
				if not a_node.is_empty and then a_node.first_child.is_addressable and then not a_node.first_child.id.is_integer then
					last_result.append (symbol (SYM_JSON_END_OBJECT))
				end
				last_result.append (symbol (SYM_JSON_END_ARRAY))
				if a_node.parent.last /= a_node then
					last_result.append (symbol (SYM_JSON_ITEM_DELIMITER))
				end
				last_result.append (format_item (FMT_NEWLINE))
			end
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
			start_object_item (a_node, depth)
			last_result.append (a_node.as_serialised_string (agent primitive_value_to_json_string, agent dadl_clean))
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
			end_object_item (a_node, depth)
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			last_result.append (symbol (SYM_JSON_START_ARRAY))
			start_object_item (a_node, depth)
			last_result.append (a_node.as_serialised_string (agent primitive_value_to_json_string, ", ", "", agent dadl_clean))
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			last_result.append (symbol (SYM_JSON_END_ARRAY))
			end_object_item (a_node, depth)
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		local
			str: STRING
		do
			last_result.append (symbol (SYM_JSON_START_OBJECT) + "%N")
			start_object_item (a_node, depth)
			str := a_node.as_serialised_string (
					agent primitive_value_to_json_string,
					agent format_attr_name,
					agent (s: STRING): STRING do Result := s end,
					symbol (SYM_JSON_EQ),
					symbol (sym_json_item_delimiter) + "%N")
			str.append ("%N")
			last_result.append (indented (str, create_indent (depth//2 + multiple_attr_count + 1)))
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			last_result.append (create_indent (depth//2 + multiple_attr_count) + symbol (SYM_JSON_END_OBJECT))
			end_object_item (a_node, depth)
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		do
			start_object_item (a_node, depth)
			last_result.append (a_node.as_string)
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
			end_object_item (a_node, depth)
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		do
			last_result.append (symbol (SYM_JSON_START_ARRAY))
			start_object_item (a_node, depth)
			last_result.append (a_node.as_string)
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
			last_result.append (symbol (SYM_JSON_END_ARRAY))
			end_object_item (a_node, depth)
		end

feature {NONE} -- Implementation

	multiple_attr_count: INTEGER
			-- counter for how many multiple attributes at the current point

	start_object_item (a_node: DT_OBJECT_ITEM; depth: INTEGER)
			-- start serialising a DT_OBJECT_LEAF
		do
			-- for containers contianing primitive types, put out the key as if it were an attribute name (JSON doesn't distinguish between hash
			-- keys and proper attribute names)
			if a_node.is_addressable then
				-- indent
				last_result.append (create_indent (depth//2 + multiple_attr_count))
				if not a_node.id.is_integer then
					last_result.append (format_attr_name (dadl_clean (a_node.id)))
					last_result.append (symbol (SYM_JSON_EQ))
				end
			end
		end

	end_object_item (a_node: DT_OBJECT_ITEM; depth: INTEGER)
			-- start serialising a DT_OBJECT_LEAF
		do
			if a_node.parent.is_container_type and then a_node.parent.last_child /= a_node or else
				not a_node.parent.is_container_type and then a_node.parent.parent.last /= a_node.parent
			then
				last_result.append (symbol (SYM_JSON_ITEM_DELIMITER))
			end
			last_result.append (format_item (FMT_NEWLINE))
		end

	format_attr_name (an_attr_name: STRING): STRING
			-- from a normal attribute name, generate the JSON formatting, i.e. with enclosing ""
		do
			create Result.make_empty
			Result.append (symbol (Sym_json_attribute_name_delimiter) + an_attr_name + symbol (Sym_json_attribute_name_delimiter))
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
