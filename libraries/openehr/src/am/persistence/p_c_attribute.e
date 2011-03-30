note
	component:   "openEHR Archetype Project"
	description: "node in ADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_C_ATTRIBUTE

inherit
	P_ARCHETYPE_CONSTRAINT

create
	make

feature -- Initialisation

	make (a_ca: attached C_ATTRIBUTE)
			-- make from C_ATTRIBUTE
		do
			rm_attribute_name := a_ca.rm_attribute_name
			differential_path := a_ca.differential_path
			if attached a_ca.existence then
				existence := a_ca.existence.as_string
			end
			if attached a_ca.cardinality then
				cardinality := a_ca.cardinality.as_string
			end
			if a_ca.has_children then
				create children.make (0)
				from a_ca.children.start until a_ca.children.off loop
					if attached {C_ARCHETYPE_ROOT} a_ca.children.item as c_ar then
						children.extend (create {P_C_ARCHETYPE_ROOT}.make(c_ar))
					elseif attached {C_COMPLEX_OBJECT} a_ca.children.item as c_co then
						children.extend (create {P_C_COMPLEX_OBJECT}.make(c_co))
					elseif attached {ARCHETYPE_SLOT} a_ca.children.item as a_s then
						children.extend (create {P_ARCHETYPE_SLOT}.make(a_s))
					elseif attached {ARCHETYPE_INTERNAL_REF} a_ca.children.item as a_ir then
						children.extend (create {P_ARCHETYPE_INTERNAL_REF}.make(a_ir))
					elseif attached {CONSTRAINT_REF} a_ca.children.item as cr then
						children.extend (create {P_CONSTRAINT_REF}.make(cr))
					elseif attached {C_CODE_PHRASE} a_ca.children.item as c_cp then
						children.extend (create {P_C_CODE_PHRASE}.make(c_cp))
					elseif attached {C_DV_ORDINAL} a_ca.children.item as c_dvo then
						children.extend (create {P_C_DV_ORDINAL}.make(c_dvo))
					elseif attached {C_DV_QUANTITY} a_ca.children.item as c_dvq then
						children.extend (create {P_C_DV_QUANTITY}.make(c_dvq))
					elseif attached {C_PRIMITIVE_OBJECT} a_ca.children.item as c_po then
						children.extend (create {P_C_PRIMITIVE_OBJECT}.make(c_po))
					end
					a_ca.children.forth
				end
			end
		end

feature -- Access

	rm_attribute_name: STRING

	differential_path: STRING

	children: ARRAYED_LIST [P_C_OBJECT]

	existence: STRING

	cardinality: STRING

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
--| The Original Code is cadl_rel_node.e.
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
