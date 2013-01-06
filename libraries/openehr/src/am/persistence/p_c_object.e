note
	component:   "openEHR Archetype Project"
	description: "Persistent form of C_OBJECT"
	keywords:    "persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class P_C_OBJECT

inherit
	P_ARCHETYPE_CONSTRAINT

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
		end

feature -- Initialisation

	make (a_co: C_OBJECT)
		do
			rm_type_name := a_co.rm_type_name
			if a_co.is_addressable then
				node_id := a_co.node_id
			end
			if attached a_co.occurrences then
				occurrences := a_co.occurrences.as_string
			end
			sibling_order := a_co.sibling_order
		end

feature -- Access

	rm_type_name: STRING
			-- type name from reference model, of object to instantiate

	node_id: STRING
		attribute
			create Result.make_from_string (Anonymous_node_id)
		end

	occurrences: detachable STRING

	sibling_order: detachable SIBLING_ORDER
			-- set if this node should be ordered with respect to an inherited sibling; only settable
			-- on specialised nodes

feature -- Factory

	populate_c_instance (a_c_o: C_OBJECT)
			-- populate fields not already populated from creation of a C_XXX instance
		do
			if attached occurrences as occ then
				a_c_o.set_occurrences (create {MULTIPLICITY_INTERVAL}.make_from_string (occ))
			end
			if attached sibling_order as so then
				a_c_o.set_sibling_order (so)
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
--| The Original Code is cadl_object_item.e.
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
