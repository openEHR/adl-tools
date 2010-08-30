note
	component:   "openEHR Archetype Project"
	description: "[
				 Node of simple type in an dADL parse tree. Simple
				 types include: STRING, INTEGER, REAL, CHARACTER,
				 BOOLEAN. Occurrences set to the default of {1..1}
			 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_PRIMITIVE_OBJECT

inherit
	DT_OBJECT_LEAF

	-- FIXME: remove when duration.out solved
	DATE_TIME_ROUTINES
		export
			{NONE} all
		undefine
			is_equal, default_create
		end

create
	make_identified, make_anonymous

feature -- Access

	value: ANY

feature -- Modification

	set_value(a_value: ANY)
		do
			value := a_value
			rm_type_name := a_value.generating_type

			is_string := rm_type_name.starts_with ("STRING")
			is_character := rm_type_name.starts_with ("CHARACTER")
		end

feature -- Conversion

	as_string: STRING
		do
			if is_string then
				Result := "%"" + value.out + "%""
			elseif is_character then
				Result := "%'" + value.out + "%'"
			else
				-- FIXME: duration.out does not exist in Eiffel, and in any case would not be ISO8601-compliant
				if attached {DATE_TIME_DURATION} value as a_dur then
					Result := duration_to_iso8601_string(a_dur)
				elseif attached {DATE_TIME} value as a_dt then
					Result := date_time_to_iso8601_string(a_dt)
				else
					Result := value.out
					-- FIXME: REAL.out is broken
					if value.generating_type.out.substring (1, 4).is_equal ("REAL") and then Result.index_of ('.', 1) = 0 then
						Result.append(".0")
					end
				end
			end
		end

	clean_as_string (cleaner: FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		do
			if is_string then
				Result := "%"" + cleaner.item ([value.out]) + "%""
			else
				Result := as_string
			end
		end

feature -- Serialisation

	enter_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_primitive_object(Current, depth)
		end

	exit_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_primitive_object(Current, depth)
		end

feature {NONE} -- Implementation

	is_string: BOOLEAN

	is_character: BOOLEAN

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
--| The Original Code is dadl_object_simple.e.
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
