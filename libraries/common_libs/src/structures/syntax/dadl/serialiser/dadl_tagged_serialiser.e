note
	component:   "openEHR Archetype Project"
	description: "Serialise DADL archetype to any tagged format"
	keywords:    "test, DADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DADL_TAGGED_SERIALISER

inherit
	DT_SERIALISER

	XML_TOOLS
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

	start_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- start serialising an DT_COMPLEX_OBJECT_NODE
		local
			xml_attrs: HASH_TABLE [STRING, STRING]
		do
			-- indent
			last_result.append (create_indent (depth//2 + multiple_attr_count))

			-- only output tag for object inside a container		
			if not a_node.is_root and then a_node.parent.is_container_type then
				create xml_attrs.make (0)

				-- if object addressable, generate XML 'node_id' attr i.e. <item node_id="key">
				if a_node.is_addressable then
					xml_attrs.put (a_node.node_id, "node_id")
				end

				-- if typing info applies, generate XML 'rm_type_name' attr i.e. <item rm_type_name="TYPE_NAME">
				if a_node.is_typed and (a_node.type_visible or full_type_marking_on or a_node.is_root and output_typed_encapsulated) then
					xml_attrs.put (a_node.rm_type_name, "rm_type_name")
				end

				-- output the starting tag with attributes
				last_result.append (xml_tag_start("item", xml_attrs))

				-- new line
				last_result.append (format_item(FMT_NEWLINE))
			end
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- end serialising an DT_COMPLEX_OBJECT_NODE
		do
			-- indent
			last_result.append (create_indent(depth//2 + multiple_attr_count))

			-- end tag for items in a container
			if not a_node.is_root and then a_node.parent.is_container_type then
				last_result.append (xml_tag_end("item") + format_item(FMT_NEWLINE))
			end
		end

	start_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- start serialising an DT_ATTRIBUTE_NODE
		do
			last_result.append (create_indent (depth//2 + multiple_attr_count) + xml_tag_start (a_node.rm_attr_name, Void) + format_item(FMT_NEWLINE))
			if not a_node.is_nested and a_node.is_container_type then
				multiple_attr_count := multiple_attr_count + 1
			end
		end

	end_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			if not a_node.is_nested and a_node.is_container_type then
				multiple_attr_count := multiple_attr_count - 1
			end
			if not last_object_simple or a_node.is_container_type then
				last_result.append (create_indent (depth//2 + multiple_attr_count))
			end
			last_result.append (xml_tag_end (a_node.rm_attr_name) + format_item(FMT_NEWLINE))
			last_object_simple := False
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
			start_object_leaf (a_node, depth)
			last_object_simple := True
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end ("item") + format_item(FMT_NEWLINE))
			end
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			start_object_leaf (a_node, depth)
			last_object_simple := True
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end ("item") + format_item(FMT_NEWLINE))
			end
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			start_object_leaf (a_node, depth)
			last_object_simple := True
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end ("item") + format_item(FMT_NEWLINE))
			end
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		do
			start_object_leaf (a_node, depth)
			last_object_simple := True
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end ("item") + format_item(FMT_NEWLINE))
			end
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		do
			start_object_leaf (a_node, depth)
			last_object_simple := True
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end ("item") + format_item(FMT_NEWLINE))
			end
		end

feature {NONE} -- Implementation

	multiple_attr_count: INTEGER
			-- counter for how many multiple attributes at the current point

	last_object_simple: BOOLEAN
			-- True if last object traversed was an OBJECT_SIMPLE

	start_object_leaf (a_node: DT_OBJECT_LEAF; depth: INTEGER)
			-- start serialising a DT_OBJECT_LEAF
		local
			xml_attrs: HASH_TABLE [STRING, STRING]
			s: STRING
		do
			-- generate an XML tag if object in a container
			if a_node.parent.is_container_type then
				create xml_attrs.make(0)
				xml_attrs.put (a_node.node_id, "node_id")
				last_result.append (create_indent (depth//2 + 1) + xml_tag_start ("item", xml_attrs))
			else
				last_result.remove_tail (format_item (FMT_NEWLINE).count)
			end

			if attached {DT_PRIMITIVE_OBJECT} a_node as a_dt_p_o then
				s := a_dt_p_o.as_serialised_string (agent primitive_value_to_simple_string, agent xml_quote)
			elseif attached {DT_PRIMITIVE_OBJECT_LIST} a_node as a_dt_p_o_l then
				s := a_dt_p_o_l.as_serialised_string (agent primitive_value_to_simple_string, agent xml_quote)
			else
				s := a_node.as_string
			end
			last_result.append (s)
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
