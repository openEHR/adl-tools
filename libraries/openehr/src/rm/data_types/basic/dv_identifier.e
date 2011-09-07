note
	component:   "openEHR Data Types"
	description: "[
				 Real-world entity identifiers, such as driver's licence number, 
			     SSN, presciption number, order number etc.
			     ]"
	keywords:    "identifier, data type"

	requirements:""
	design:      "openEHR Data Types Reference Model 1.9"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_IDENTIFIER

inherit
	DATA_VALUE

create 
	default_create,
	make,
	make_from_canonical_string

feature -- Initialization

	make
		do
		end

	make_from_string (a_str:STRING)
			-- 
		do
		end
	
	make_from_canonical_string (a_str:STRING)
			-- "<issuer>xxx</issuer>
			-- <id>xxx</id>
			-- <type>xxxx</type>"
		do
		end
	
feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
			Result := xml_has_tag(str, "issuer", 1) and
				xml_has_tag(str, "id", 1) and
				xml_has_tag(str, "type", 1)
		end

feature -- Access

	assigner: STRING
			-- organisation which assigned this id to the item it identifies

	issuer: STRING	
			-- Issuing agency of these kind of ids

	id: STRING	
			-- The identifier value. Often structured, according to the 
			-- definition of the issuing authority’s rules.

	type: STRING	
			-- The identifier type, such as “prescription”, or “SSN”. 
			-- One day a controlled vocabulary might be possible for this.

feature -- Modify

feature -- Output

	as_string: STRING
		do
		end
	
	as_canonical_string: STRING
			-- 
		do
		end
	
invariant
	assigner_valid: assigner /= Void and then not assigner.is_empty
	issuer_valid: issuer /= Void and then not issuer.is_empty
	id_valid: id /= Void and then not id.is_empty
	type_valid: type /= Void and then not type.is_empty	

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
