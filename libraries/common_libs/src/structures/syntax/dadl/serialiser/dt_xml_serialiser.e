note
	component:   "openEHR Archetype Project"
	description: "Serialise DADL archetype to any tagged format"
	keywords:    "test, DADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 20011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_XML_SERIALISER

inherit
	DT_SERIALISER
		redefine
			reset
		end

	XML_TOOLS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_XML_RULES
		export
			{NONE} all
		end

create
	make

feature -- Modification

	start_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- start serialising an DT_COMPLEX_OBJECT_NODE
		local
			doc_attr_name, doc_hdr: STRING
		do
			if not checked_for_rules and not attached serialisation_rules or xml_rules_out_of_date then
				if xml_rules.serialisation_rules.has (a_node.im_type_name) then
					serialisation_rules := xml_rules.serialisation_rules.item (a_node.im_type_name)
				else
					create serialisation_rules.make
				end
				checked_for_rules := True
			end

			-- if we are on the root nod, output the XML header
			if a_node.is_root then
				if attached serialisation_rules.doc_header then
					doc_hdr := serialisation_rules.doc_header.twin
					if attached serialisation_rules.doc_tag then
						if serialisation_rules.doc_tag.item (1) = '$' then
							doc_attr_name := serialisation_rules.doc_tag.substring (2, serialisation_rules.doc_tag.count)
							if a_node.has_attribute (doc_attr_name) and then
								a_node.attribute_node (doc_attr_name).child_count > 0 and then
								attached {DT_PRIMITIVE_OBJECT} a_node.attribute_node (doc_attr_name).first_child as dt_p_o
							then
								doc_tag_value := dt_p_o.value.out
							else
								doc_tag_value := doc_attr_name
							end
						else
							doc_tag_value := serialisation_rules.doc_tag
						end
					else
						doc_tag_value := serialisation_rules.default_doc_tag
					end
					doc_hdr.replace_substring_all ("$doc_tag", doc_tag_value)
					last_result.append (doc_hdr + format_item(FMT_NEWLINE))
				else
					last_result.append (xml_tag_start (serialisation_rules.default_doc_tag, Void) + format_item(FMT_NEWLINE))
				end

			-- only output object-level tag for object inside a container
			elseif a_node.parent.is_container_type then
				-- output the starting tag with attributes
				last_result.append (create_indent (depth//2) + xml_tag_start (a_node.parent.im_attr_name,
					xml_attrs_for_dt_complex_object (a_node)) + format_item(FMT_NEWLINE))
			end
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- end serialising an DT_COMPLEX_OBJECT_NODE
		local
			doc_ftr: STRING
		do
			if a_node.is_root then
				-- if we are on the root node, output the XML footer
				if attached serialisation_rules.doc_footer then
					doc_ftr := serialisation_rules.doc_footer.twin
					doc_ftr.replace_substring_all ("$doc_tag", doc_tag_value)
					last_result.append (doc_ftr)
				else
					last_result.append (create_indent(depth//2))
					last_result.append (xml_tag_start (serialisation_rules.default_doc_tag, Void))
				end
				last_result.append (format_item(FMT_NEWLINE))

			-- end tag for items in a container
			elseif a_node.parent.is_container_type then
				last_result.append (create_indent(depth//2) + xml_tag_end (a_node.parent.im_attr_name) + format_item(FMT_NEWLINE))
			end
		end

	start_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- start serialising an DT_ATTRIBUTE_NODE
		local
			xml_attrs: HASH_TABLE [STRING, STRING]
		do
			if dt_attr_nodes_to_ignore.has (a_node) then
				ignoring_dt_objects := True
			else
				-- don't output tag if a container type, since tags come out with each object rather than
				-- the attribute in that case
				if not a_node.is_container_type and not attached {DT_PRIMITIVE_OBJECT_LIST} a_node.first_child then
					-- if we are on single-valued node, look at child, and see if there are
					-- any rules for that type in the rule set for the overall context
					if attached {DT_COMPLEX_OBJECT_NODE} a_node.first_child as dt_obj then
						xml_attrs := xml_attrs_for_dt_complex_object (dt_obj)
					end
					last_result.append (create_indent (depth//2) + xml_tag_start (a_node.im_attr_name, xml_attrs) +
						format_item(FMT_NEWLINE))
				end
			end
		end

	end_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			if dt_attr_nodes_to_ignore.has (a_node) then
				ignoring_dt_objects := False
				dt_attr_nodes_to_ignore.prune (a_node)
			else
				if not a_node.is_container_type and not attached {DT_PRIMITIVE_OBJECT_LIST} a_node.first_child then
					-- output an indent unless a primitive type (in which case, tags are inline)
					if not last_object_primitive then
						last_result.append (create_indent (depth//2))
					end
					-- output the tag
					last_result.append (xml_tag_end (a_node.im_attr_name) + format_item(FMT_NEWLINE))
				end
				last_object_primitive := False
			end
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
			if not ignoring_dt_objects then
				-- generate an XML tag if object in a container
				if a_node.parent.is_container_type then
					-- output indent + tag
					last_result.append (create_indent (depth//2) + xml_tag_start (a_node.parent.im_attr_name, xml_attrs_for_dt_primitive_object (a_node)))
				else
					last_result.remove_tail (format_item (FMT_NEWLINE).count)
				end
				last_result.append (a_node.as_serialised_string (agent primitive_value_to_simple_string, agent xml_quote))
				last_object_primitive := True
			end
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end (a_node.parent.im_attr_name) + format_item(FMT_NEWLINE))
			end
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			-- generate an XML tag if object in a container
			last_result.append (a_node.as_serialised_string (agent primitive_value_to_xml_tagged_string (a_node.parent.im_attr_name, depth//2, ?), Void, Void, agent xml_quote))
			last_object_primitive := True
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			-- generate an XML tag if object in a container
			if a_node.parent.is_container_type then
				last_result.append (create_indent (depth//2) + xml_tag_start (a_node.parent.im_attr_name, Void))
			else
				last_result.remove_tail (format_item (FMT_NEWLINE).count)
			end
			last_result.append (a_node.as_string)
			last_object_primitive := True
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end (a_node.parent.im_attr_name) + format_item(FMT_NEWLINE))
			end
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		do
			start_object_leaf (a_node, depth)
			last_object_primitive := True
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end (a_node.parent.im_attr_name) + format_item(FMT_NEWLINE))
			end
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		do
			start_object_leaf (a_node, depth)
			last_object_primitive := True
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end (a_node.parent.im_attr_name) + format_item(FMT_NEWLINE))
			end
		end

feature -- Commands

	reset
			-- set up serialiser
		do
			precursor
			checked_for_rules := False
			serialisation_rules := Void
			ignoring_dt_objects := False
		end

feature {NONE} -- Implementation

	serialisation_rules: XML_SERIALISATION_RULES
			-- serialisation rules for the type of the root object being processed here

	last_object_primitive: BOOLEAN
			-- True if last object traversed was a DT_PRIMITIVE_XX object

	ignoring_dt_objects: BOOLEAN
			-- True if currently ignoring DT objects; only applies to primitive objects under single-value attributes

	checked_for_rules: BOOLEAN
			-- flag to indicate that a check was done for XML rules at beginning of run (i.e. at
			-- entry into root DT object)

	doc_tag_value: STRING
			-- document level tag string

	start_object_leaf (a_node: DT_OBJECT_LEAF; depth: INTEGER)
			-- start serialising a DT_OBJECT_LEAF
		do
			-- generate an XML tag if object in a container
			if a_node.parent.is_container_type then
				last_result.append (create_indent (depth//2) + xml_tag_start (a_node.parent.im_attr_name, Void))
			else
				last_result.remove_tail (format_item (FMT_NEWLINE).count)
			end
			last_result.append (a_node.as_string)
		end

	xml_attrs_for_dt_complex_object (a_dt_obj: DT_COMPLEX_OBJECT_NODE): HASH_TABLE [STRING, STRING]
			-- generate XML attribute table for `a_dt_obj' based on XML rules, if any found
		local
			attr_name: STRING
		do
			if attached serialisation_rules.rules_for_type (a_dt_obj.im_type_name) as srt then
				create Result.make (0)

				-- put the IM type name in the XML attributes
				if srt.output_dt_im_type_name_as_xml_attr then
					if a_dt_obj.is_typed then
						Result.put (a_dt_obj.im_type_name, "im:type")
					end
				end

				-- put the DT node id in the result for ids that are not just numbers (numbers are generated in
				-- the DT structure for any LIST structure, i.e. where there are no available keys).
				-- Currently just do this if there is a rule of any kind, without checking any details.
				if a_dt_obj.is_addressable and not a_dt_obj.id.is_integer then
					Result.put (a_dt_obj.id, "id")
				end

				-- for each rule of type 'convert object value to XML attribute', see if the attribute exists
				-- and if so, construct the appropriate XML attribute information to put into the tag, below
				if attached srt.convert_to_xml_attr_attr_names then
					from srt.convert_to_xml_attr_attr_names.start until srt.convert_to_xml_attr_attr_names.off loop
						attr_name := srt.convert_to_xml_attr_attr_names.item
						if a_dt_obj.has_attribute (attr_name) and then
							attached {DT_PRIMITIVE_OBJECT} a_dt_obj.attribute_node (attr_name).first_child as dt_po
						then
							dt_attr_nodes_to_ignore.extend (a_dt_obj.attribute_node (attr_name))
							Result.put (dt_po.value.out, attr_name)
						end
						srt.convert_to_xml_attr_attr_names.forth
					end
				end
			end
		end

	xml_attrs_for_dt_primitive_object (a_dt_obj: DT_PRIMITIVE_OBJECT): HASH_TABLE [STRING, STRING]
			-- generate XML attribute table for `a_dt_obj' based on XML rules, if any found
		local
			attr_name: STRING
		do
			if attached serialisation_rules.rules_for_type (a_dt_obj.im_type_name) as srt then
				create Result.make (0)

				-- put the DT node id in the result for ids that are not just numbers (numbers are generated in
				-- the DT structure for any LIST structure, i.e. where there are no available keys).
				-- Currently just do this if there is a rule of any kind, without checking any details.
				if a_dt_obj.is_addressable and not a_dt_obj.id.is_integer then
					Result.put (a_dt_obj.id, "id")
				end

--				-- put the IM type name in the result
--				if srt.output_dt_im_type_name_as_xml_attr then
--					if a_dt_obj.is_typed then
--						Result.put (a_dt_obj.im_type_name, "im:type")
--					end
--				end
			end
		end

	dt_attr_nodes_to_ignore: ARRAYED_LIST [DT_ATTRIBUTE_NODE]
		once
			create Result.make (0)
		end

	primitive_value_to_xml_tagged_string (a_tag: attached STRING; an_indent: INTEGER; a_prim_val: attached ANY): STRING
			-- generate a XML-tagged string containing `a_prim_val'
		do
			create Result.make_empty
			Result.append (create_indent (an_indent) + xml_tag_start (a_tag, Void))
			Result.append (primitive_value_to_simple_string (a_prim_val))
			Result.append (xml_tag_end (a_tag) + format_item(FMT_NEWLINE))
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
