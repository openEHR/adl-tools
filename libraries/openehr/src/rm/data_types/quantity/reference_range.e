indexing
	component:   "openEHR Data Types"
	
	description: "[
				 Defines a named range to be associated with any ORDERED datum. Each such 
				 range is particular to the patient and context, e.g. sex, age, and any 
				 other factor which affects ranges.
				 ]"
	keywords:    "Reference range for ordered data items"

	requirements:"ISO 18308 TS V1.0 STR 3.13"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class REFERENCE_RANGE [G -> DV_ORDERED]

inherit
	CANONICAL_FRAGMENT
	
create
	make, make_from_canonical_string
	
feature -- Initialization

	make(a_meaning: DV_CODED_TEXT; a_range:DV_INTERVAL[G]) is
			-- make a range from a meaning and an interval
		require
			Meaning_exists: a_meaning /= Void
			Range_exists: a_range /= Void
		do
			meaning := a_meaning
			range := a_range
		ensure
			Meaning_set: meaning = a_meaning
			Range_set: range = a_range
		end
	
	make_from_canonical_string(str:STRING) is
		do
		end
		
feature -- Access

	meaning: DV_CODED_TEXT
			-- Term whose value indicates the meaning of this range, e.g. “normal”, 
			-- “critical”, “therapeutic” etc.

	range: DV_INTERVAL[G]
			-- The data range for this meaning, e.g. “critical” etc.

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
		do
		end

	has (v: G): BOOLEAN is
		require
			Value_exists: v /= Void
		do
			Result := range.has(v)
		end

feature -- Conversion

	as_string: STRING is
		do
			Result := range.as_string + " (" + meaning.as_string + ")"
		end
	
	as_canonical_string: STRING is
		do
			Result := "<range>" + range.as_canonical_string + "</range>" +
				"<meaning>" + meaning.as_canonical_string + "</meaning>"
		end
	
invariant
	Meaning_exists: meaning /= Void
	Range_exists: range /= Void
	Range_is_simple: (range.lower_unbounded or else range.lower.is_simple) and 
						(range.upper_unbounded or else range.upper.is_simple)

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
--| The Original Code is dv_reference_range.e.
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
