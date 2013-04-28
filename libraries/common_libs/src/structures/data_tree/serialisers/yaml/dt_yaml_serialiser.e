note
	component:   "openEHR Archetype Project"
	description: "Serialise DT structure to YAML syntax"
	keywords:    "Data tree, YAML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class DT_YAML_SERIALISER

inherit
	DT_SERIALISER
		redefine
			create_indent
		end

	YAML_SYMBOLS
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
			if a_node.is_root then
				last_result.append (format_item (FMT_START_BODY))
			end
			start_object_item (a_node, depth)

			-- only output a newline if we did not just output a '- ' sequence item marker;
			-- if we did, set a flag, so that the first attribute we hit doesn't have an indent
			-- (since it is immediately after the '- ')
			if not a_node.is_root then
				if a_node.is_addressable and then a_node.id.is_integer then
					entered_anonymous_complex_object := True
				else
					addressable_complex_object_count := addressable_complex_object_count + 1
					last_result.append (format_item (FMT_NEWLINE))
				end
			end
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- end serialising a DT_COMPLEX_OBJECT_NODE
		do
			if last_result.item (last_result.count) /= '%N'  then
				last_result.append (format_item (FMT_NEWLINE))
			end
			if a_node.is_root then
				last_result.append (format_item (FMT_END_BODY) + format_item (FMT_NEWLINE))
			elseif not (a_node.is_addressable and then a_node.id.is_integer) then
				addressable_complex_object_count := addressable_complex_object_count - 1
			end
		end

	start_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- start serialising a DT_ATTRIBUTE_NODE
		do
			-- output: indent, if not the first line of a new complex object where a '  - '
			-- sequence marker has just been output
			if not entered_anonymous_complex_object then
				last_result.append (create_indent (depth//2 + multiple_attr_count + addressable_complex_object_count))
			else
				entered_anonymous_complex_object := False
			end
			-- output: $attr_name:
			last_result.append (a_node.im_attr_name)
			last_result.append (symbol (SYM_YAML_EQ))

			if a_node.is_container_type then
				multiple_attr_count := multiple_attr_count + 1
				last_result.append (format_item (FMT_NEWLINE))
			end
		end

	end_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			if a_node.is_container_type then
				multiple_attr_count := multiple_attr_count - 1
			end
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
			start_object_item (a_node, depth)
			last_result.append (a_node.as_serialised_string (agent primitive_value_to_yaml_string, agent clean))
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
			end_object_item (a_node, depth)
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			last_result.append (symbol (Sym_yaml_sequence_start))
			start_object_item (a_node, depth)
			last_result.append (a_node.as_serialised_string (agent primitive_value_to_yaml_string, ", ", "", agent clean))
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			last_result.append (symbol (Sym_yaml_sequence_end))
			end_object_item (a_node, depth)
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		local
			str: STRING
		do
			last_result.append ("%N")
			start_object_item (a_node, depth)
			str := a_node.as_serialised_string (
					agent primitive_value_to_yaml_string,
					agent (s: STRING):STRING do Result := s end,
					agent (s: STRING): STRING do Result := s end,
					symbol (SYM_YAML_EQ),
					"%N")
			str.append ("%N")
			last_result.append (indented (str, create_indent (depth//2 + multiple_attr_count + 1 + addressable_complex_object_count)))
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
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
			start_object_item (a_node, depth)
			last_result.append (a_node.as_string)
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
			end_object_item (a_node, depth)
		end

feature {NONE} -- Implementation

	multiple_attr_count: INTEGER
			-- counter for how many multiple attributes at the current point

	entered_anonymous_complex_object: BOOLEAN
			-- True if we just entered a complex object; this flag is used to enable a '-' (Sym_yaml_sequence_entry)
			-- to be output on the start of the first line of a complex object rather than on the line above.

	addressable_complex_object_count: INTEGER

	start_object_item (a_node: DT_OBJECT_ITEM; depth: INTEGER)
			-- start serialising a DT_OBJECT_LEAF
		do
			-- for containers contianing primitive types, put out the key as if it were an attribute name (YAML doesn't distinguish between hash
			-- keys and proper attribute names)
			if a_node.is_addressable then
				-- indent
				last_result.append (create_indent (depth//2 + multiple_attr_count + addressable_complex_object_count))
				last_result.append (symbol (Sym_yaml_sequence_entry))
				if not a_node.id.is_integer then
					last_result.append (clean (a_node.id))
					last_result.append (symbol (SYM_YAML_EQ))
				end
			end
		end

	end_object_item (a_node: DT_OBJECT_ITEM; depth: INTEGER)
			-- start serialising a DT_OBJECT_LEAF
		do
			if last_result.item (last_result.count) /= '%N'  then
				last_result.append (format_item (FMT_NEWLINE))
			end
		end

	create_indent (indent_level: INTEGER): STRING
		do
			Result := precursor (indent_level - 1)
		end

	primitive_value_to_yaml_string (a_prim_val: ANY): STRING
			-- generate a string, including YAML delimiters, e.g. "", '' for strings and chars.
		do
			if attached {STRING_GENERAL} a_prim_val then
				Result := "%"" + a_prim_val.out + "%""
			elseif attached {CHARACTER} a_prim_val or attached {CHARACTER_32} a_prim_val then
				Result := a_prim_val.out
			elseif attached {TERMINOLOGY_CODE} a_prim_val then
				Result := a_prim_val.out
			else
				-- FIXME: duration.out does not exist in Eiffel, and in any case would not be ISO8601-compliant
				if attached {DATE_TIME_DURATION} a_prim_val as a_dur then
					Result := (create {ISO8601_DURATION}.make_date_time_duration(a_dur)).as_string
				elseif attached {DATE_TIME} a_prim_val as a_dt then
					Result := (create {ISO8601_DATE_TIME}.make_date_time(a_dt)).as_string
				else
					Result := a_prim_val.out.as_lower
					-- FIXME: REAL.out is broken (still the case in Eiffel 6.6)
					if (attached {REAL_32} a_prim_val or attached {REAL_64} a_prim_val) and then Result.index_of ('.', 1) = 0 then
						Result.append (".0")
					end
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
