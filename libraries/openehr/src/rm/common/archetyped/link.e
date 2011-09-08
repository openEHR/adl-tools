note
	component:   "openEHR Data Types"

	description: "[
	              Links used to record bidirectional relationships between archetyped structures 
			  in the record, including across transactions.
			  ]"
	keywords:    "link, path"
	requirements:""

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class LINK
	
create
	make, make_from_display_string, make_from_canonical_string

feature -- Initialization

	make, make_from_display_string(str:STRING)
			-- make from a single string
		do
			-- TO_BE_IMPLEM
		end

	make_from_canonical_string(str:STRING)
			-- make from a canonical string
		do
			-- TO_BE_IMPLEM
		end

feature -- Access

	target: DV_EHR_URI
			-- the LOCATABLE element considered to be the logical target of the link.
			-- Typically an ARCHETYPED element rather than an interior element (such as
			-- an organiser).

	meaning: DV_TEXT
			-- Used to describe the relationship, usually in clinical terms, such as 
			-- "in response to" (the relationship between test results and an order), 
			-- "follow-up to" and so on. Such relationships can represent any clinically 
			-- meaningful connection between pieces of information. 
			-- Value for meaning include those described in Annex C, ENV 13606:2 
			-- under the categories of "generic", "documenting and reporting", 
			-- "organisational", "clinical", "circumstancial", and "view management".

	type: DV_TEXT
			-- indicates a clinical or domain-level meaning for the kind of link, for example 
			-- "problem thread" or "see also". If type values are designed appropriately, they 
			-- can be used by the requestor of EHR extracts to categorise links which must be
			-- followed and which can be broken when the extract is created.
			
feature -- Output

	as_display_string: STRING
			-- string form displayable for humans
		do
			create Result.make(0)
		end
	
	as_canonical_string: STRING
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			Result := "<target>" + target.as_canonical_string + "</target>" +
				"<meaning>" + meaning.as_canonical_string + "</meaning>"
					
		end
		
invariant
	meaning_exists: meaning /= Void
	type_exists: type /= Void
	target_exists: target /= Void

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
--| The Original Code is link.e.
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
