note
	component:   "openEHR Archetype Project"
	description: "Represents the order of this node with respect to sibling nodes of the same (ordered) parent"
	keywords:    "specialisation, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SIBLING_ORDER

create
	make_before, make_after

feature -- Initialisation

	make_before(a_sibling_node_id: STRING)
			-- make to indicate node is before another node
		require
			Sibling_node_id_valid: a_sibling_node_id /= Void and then not a_sibling_node_id.is_empty
		do
			sibling_node_id := a_sibling_node_id
			is_before := True
		ensure
			Sibling_node_id_set: sibling_node_id = a_sibling_node_id
			Is_before: is_before
		end

	make_after(a_sibling_node_id: STRING)
			-- make to indicate node is after another node
		require
			Sibling_node_id_valid: a_sibling_node_id /= Void and then not a_sibling_node_id.is_empty
		do
			sibling_node_id := a_sibling_node_id
		ensure
			Sibling_node_id_set: sibling_node_id = a_sibling_node_id
			Is_before: is_after
		end

feature -- Access

	sibling_node_id: STRING

feature -- Status Report

	is_before: BOOLEAN

	is_after: BOOLEAN
		do
			Result := not is_before
		end

feature -- Output

	as_string: STRING
			-- output as a string
		do
			create Result.make(0)

			if is_before then
				Result.append ("before ")
			else
				Result.append ("after ")
			end
			Result.append ("[" + sibling_node_id + "]")
		end

invariant
	Validity: sibling_node_id /= Void

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
--| The Original Code is cadl_cardinality.e.
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
