indexing
	component:   "openEHR Data Types"
	description: "Items which are truly boolean data, such as true/false or yes/no answers."
	keywords:    "boolean, data"

	requirements:"ISO 18308 TS V1.0 STR ??"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_BOOLEAN

inherit
	DATA_VALUE

create 
	default_create,
	make,
	make_from_canonical_string

feature -- Initialization

	make is
		do
			-- nothing special required, since value defaults to False
		ensure
			value_false: value = False
		end

	make_from_string (a_str:STRING) is
			-- "True" or "False"
		do
			a_str.to_lower
			if a_str.is_equal("true") then
				set_true
			end
		end
	
	make_from_canonical_string (a_str:STRING) is
			-- "<value>True</value>" or "<value>False</value>"
		do
			make_from_string(xml_remove_tags(a_str))
		end
	
feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
			Result := xml_has_tag(str, "value", 1)
		end

feature -- Access

	value: BOOLEAN
			-- Boolean value of this item

feature -- Modify

	set_true is
		do
			value := True
		ensure
			value_set: value = True
		end

	set_false is
		do
			value := False
		ensure
			value_set: value = False
		end
	
feature -- Output

	as_string: STRING is
			-- "True" or "False"
		do
			Result := value.out
		end
	
	as_canonical_string: STRING is
			-- <value>: BOOLEAN ("True" or "False")
		do
			Result := "<value>" + as_string + "</value>"
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
--| The Original Code is dv_boolean.e.
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
