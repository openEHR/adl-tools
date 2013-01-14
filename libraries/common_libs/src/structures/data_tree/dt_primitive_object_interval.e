note
	component:   "openEHR Archetype Project"
	description: "[
				 DT node of interval of ordered simple type, i.e. : INTEGER, REAL, DATE, TIME, DATE_TIME, DURATION. Has a 
				 structured serialisation method that can output the object in a form that can be tailored by agents to
				 look like dADL, JSON, YAML or any other such format.
			 	 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_PRIMITIVE_OBJECT_INTERVAL

inherit
	DT_OBJECT_LEAF

create
	make_identified, make_anonymous

feature -- Access

	value: INTERVAL[PART_COMPARABLE]

feature -- Modification

	set_value (a_value: like value)
		do
			value := a_value
			im_type_name := a_value.generating_type
		end

feature -- Conversion

	as_string: STRING
		do
			create Result.make_empty
			Result.append_character ('|')
			Result.append (value.as_string)
			Result.append_character ('|')
		end

	as_serialised_string (value_serialiser: attached FUNCTION [ANY, TUPLE [ANY], STRING];
			attr_name_formatter: attached FUNCTION [ANY, TUPLE [STRING], STRING];
			value_string_formatter: attached FUNCTION [ANY, TUPLE [STRING], STRING];
			equal_symbol, attr_delimiter: STRING): STRING
			-- generate a cleaned form of this object as a structured string following the general model (in dADL)
			-- 		lower = <0.0>
			--  	upper_unbounded = <True>
			-- etc. IN JSON, this would be:
			-- 		"lower": 0.0,
			-- 		"upper_unbounded": true
			-- The agent `attr_name_formatter' can be used to format the agent name e.g. add "" as in JSON
			-- The agent `value_string_formatter' is used to format the value, e.g. add <> as in dADL
			-- FIXME: the 'to_reference' in the below should not be required, but BOOLEAN does not conform to ANY when it is an agent argument!
		do
			create Result.make(0)
			if value.lower_unbounded then
				Result.append (attr_name_formatter.item (["lower_unbounded"]))
				Result.append (equal_symbol)
				Result.append (value_string_formatter.item ([value_serialiser.item ([value.lower_unbounded.to_reference])]))
				Result.append (attr_delimiter)
			elseif attached value.lower as val_lower then
				Result.append (attr_name_formatter.item (["lower"]))
				Result.append (equal_symbol)
				Result.append (value_string_formatter.item ([value_serialiser.item ([val_lower])]))
				Result.append (attr_delimiter)
				if not value.lower_included then
					Result.append (attr_name_formatter.item (["lower_included"]))
					Result.append (equal_symbol)
					Result.append (value_string_formatter.item ([value_serialiser.item ([value.lower_included.to_reference])]))
					Result.append (attr_delimiter)
				end
			end
			if value.upper_unbounded then
				Result.append (attr_name_formatter.item (["upper_unbounded"]))
				Result.append (equal_symbol)
				Result.append (value_string_formatter.item ([value_serialiser.item ([value.upper_unbounded.to_reference])]))
			elseif attached value.upper as val_upper then
				Result.append (attr_name_formatter.item (["upper"]))
				Result.append (equal_symbol)
				Result.append (value_string_formatter.item ([value_serialiser.item ([val_upper])]))
				if not value.upper_included then
					Result.append (attr_delimiter)
					Result.append (attr_name_formatter.item (["upper_included"]))
					Result.append (equal_symbol)
					Result.append (value_string_formatter.item ([value_serialiser.item ([value.upper_included.to_reference])]))
				end
			end
		end

feature -- Serialisation

	enter_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_primitive_object_interval (Current, depth)
		end

	exit_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_primitive_object_interval (Current, depth)
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
--| The Original Code is dadl_object_simple_interval.e.
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
