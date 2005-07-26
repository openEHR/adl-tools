indexing
	component:   "openEHR Data Types"
	description: "[
				 For representing state values which obey a defined state machine, 
				 such as a variable representing the states of an instruction or care process.
				 ]"

	keywords:    "state, data"

	requirements:"ISO 18308 TS V1.0 STR ??"
	design:      "openEHR Data Types Reference Model 1.7"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_STATE

inherit
	DATA_VALUE
		redefine
			default_create
		end

create 
	default_create,
	make,
	make_from_canonical_string
	
feature -- Definitions

	Default_state: STRING is "Unknown"

feature -- Initialization

	default_create is
		do
			create value.default_create
		end

	make (a_state: DV_CODED_TEXT) is
			-- make from named state
		require
			State_valid: a_state /= Void
		do
			value := a_state
		ensure then
			Value_set: value = a_state
		end
	
	make_from_string (a_str:STRING) is
			-- make from canonical string (same as make_from_canonical_string)
		do
			make_from_canonical_string(a_str)
		end

	make_from_canonical_string (a_str:STRING) is
			-- <value>
			-- 		<value>xxxx</value>
			-- 		<language>
			-- 				<terminology_id>
			--					<name>string</name>
			-- 					[<version_id>string</version_id>]
			-- 				</terminology_id>
			-- 				<code_string>string</code_string>
			-- 		</language>
			-- 		<charset>
			-- 				<terminology_id>
			--					<name>string</name>
			-- 					[<version_id>string</version_id>]
			-- 				</terminology_id>
			-- 				<code_string>string</code_string>
			-- 		</charset>
			-- 		<defining_code>
			-- 				<terminology_id>
			--					<name>string</name>
			-- 					[<version_id>string</version_id>]
			-- 				</terminology_id>
			-- 				<code_string>string</code_string>
			-- 		</defining_code>
			-- </value>
			-- <is_terminal>boolean</is_terminal>
		do
			create value.make_from_canonical_string(xml_extract_from_tags(a_str, "value", 1))
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
			Result := xml_has_tag(str, "value", 1)
		end

feature -- Access

	value: DV_CODED_TEXT
			-- The state name. State names are determined by a state/event table defined in archetypes
			
	is_terminal: BOOLEAN
			-- True if there are no transitions from this state to any other state

feature -- Output

	as_string: STRING is
			-- name of current state
		do
			Result := value.as_string
		ensure then
			Result.is_equal(value.as_string)
		end
	
	as_canonical_string: STRING is
			-- <value>value</value>
		do
			Result := "<value>" + value.as_canonical_string + "</value>" + 
					"<is_terminal>" + is_terminal.out + "</is_terminal>"
		end

invariant
	value_exists: value /= Void

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
--| The Original Code is dv_state.e.
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
