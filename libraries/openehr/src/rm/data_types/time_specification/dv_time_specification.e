note
	component:   "openEHR Data Types"
	
	description: "[
			 Abstract concept of time in the future, specified syntactically.
			 Subtypes define the syntaxes.
			 ]"
	keywords:    "time specification"

	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class DV_TIME_SPECIFICATION

inherit
	DATA_VALUE
	
feature -- Access

	value: DV_PARSABLE
	
	calendar_alignment: STRING
			-- Indicates what prototypical point in the calendar the specification is
			-- aligned to, e.g. “5th of the month”. Empty if not aligned. Extracted 
			-- from the ‘value’ attribute.
		deferred
		end
			
	event_alignment: STRING
			-- Indicates what real-world event the specification is aligned to if any. 
			-- Extracted from the ‘value’ attribute.
		deferred
		end
		
	institution_specified: BOOLEAN
			-- Indicates if the specification is aligned with institution schedules, 
			-- e.g. a hospital nursing changeover or meal serving times. 
			-- Extracted from the ‘value’ attribute.
		deferred
		end
			
feature -- Output

	as_string: STRING
		do
			Result := value.as_string
		ensure then
			Result.is_equal(value.as_string)
		end

	as_canonical_string:STRING
			-- 
		do
			Result := "<value>" + value.as_canonical_string + "</value>"
		end

invariant
	Value_valid: value /= Void

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
--| The Original Code is dv_time_specification.e.
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
