indexing
	component:   "openEHR Archetype Project"
	description: "[
			     Converter for fragments of ADL syntax that need to be upgraded in archetypes 
				 that have been created with earlier versions of the parser.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_SYNTAX_CONVERTER

feature -- Access

	perform_syntax_upgrade(dadl_text: STRING) is
			-- perform any upgrades likely to be required on older archetypes
			-- dadl_text will be of form "C_SOME_TYPE <xxxxx>"
		require
			dadl_text /= Void
		local
			pos: INTEGER
		do
			-- get type name
			pos := dadl_text.substring_index("C_QUANTITY", 1)
			if pos > 0 then
				dadl_text.replace_substring ("C_DV_QUANTITY", pos, pos+("C_QUANTITY").count-1)
				convert_c_quantity_property(dadl_text)
			else
				pos := dadl_text.substring_index("C_ORDINAL", 1)
				if pos > 0 then
					dadl_text.replace_substring ("C_DV_ORDINAL", pos, pos+("C_ORDINAL").count-1)
				end
			end
		end
		
	convert_c_quantity_property(dadl_text: STRING) is
			-- convert an old style C_QUANTITY property dADL fragment from ADL 1.x
			-- to ADL 1.4 
			-- The old fragment looks like this:
			--		property = <"xxxx">
			-- The new one looks like this:
			--		property = <[openehr:xxxx]>
			--
		require
			dadl_text /= Void
		local
			lpos, rpos: INTEGER
			old_str, prop_name, new_str: STRING
		do
			old_str := "property = <%""
			lpos := dadl_text.substring_index(old_str, 1)
			if lpos > 0 then
				rpos := dadl_text.index_of('>', lpos)
				prop_name := dadl_text.substring (lpos + old_str.count, rpos-2)
				prop_name.replace_substring_all (" ", "_")
				if not prop_name.has_substring("openehr::") then
					new_str := "property = <[openehr::" + prop_name + "]>"
				else
					new_str := "property = <[" + prop_name + "]>"
				end
				
				dadl_text.replace_substring (new_str, lpos, rpos)
			end
		end

	convert_non_conforming_duration(a_str: STRING): STRING is
			-- fix an ISO8601-like duration string which is missing a 'T' character
			-- called from cADL lexer, matched by pattern: 
			-- P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[dD])?([0-9]+h)?([0-9]+m)?([0-9]+s)?
		require
			a_str /= Void and then not a_str.is_empty
		local
			ind, i: INTEGER
		do
			Result := a_str.twin
			
			-- try lower case (can't use to_lower - not safe for some cultures/character sets)
			ind := Result.index_of ('h', 1)
			if ind = 0 then
				ind := Result.index_of ('m', 1)
				if ind = 0 then
					ind := Result.index_of ('s', 1)
				end
			end

			-- try upper case
			if ind = 0 then
				ind := Result.index_of ('H', 1)
				if ind = 0 then
					ind := Result.index_of ('M', 1)
					if ind = 0 then
						ind := Result.index_of ('S', 1)
					end
				end
			end
			
			if ind > 0 then
				from
					i := ind - 1
				until
					i <= 1 or not Result.item(i).is_digit
				loop
					i := i - 1
				end
				-- have to insert a 'T' to the right of the cursor
				Result.insert_character ('T', i+1)
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
--| The Original Code is adl_syntax_converter.e.
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
