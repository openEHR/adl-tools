note
	component:   "openEHR Archetype Project"
	description: "Persistent form of C_COMPLEX_OBJECT"
	keywords:    "persistence, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_C_COMPLEX_OBJECT

inherit
	P_C_DEFINED_OBJECT
		redefine
			make, populate_c_instance
		end

create
	make

feature -- Initialisation

	make (a_cco: attached C_COMPLEX_OBJECT)
		do
			precursor (a_cco)
			if a_cco.has_attributes then
				create attributes.make (0)
				from a_cco.attributes.start until a_cco.attributes.off loop
					attributes.extend (create {P_C_ATTRIBUTE}.make(a_cco.attributes.item))
					a_cco.attributes.forth
				end
			end
		end

feature -- Access

	attributes: ARRAYED_LIST [P_C_ATTRIBUTE]

feature -- Factory

	create_c_complex_object: attached C_COMPLEX_OBJECT
		do
			if attached node_id then
				create Result.make_identified (rm_type_name, node_id)
			else
				create Result.make_anonymous (rm_type_name)
			end
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: attached C_COMPLEX_OBJECT)
			-- populate fields not already populated from creation of a C_XXX instance
		do
			precursor (a_c_o)
			if attached attributes then
				from attributes.start until attributes.off loop
					a_c_o.put_attribute (attributes.item.create_c_attribute)
					attributes.forth
				end
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
--| The Original Code is p_c_complex_objecct.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
