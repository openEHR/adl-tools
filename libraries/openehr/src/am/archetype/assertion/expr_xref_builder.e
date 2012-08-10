note
	component:   "openEHR Archetype Project"
	description: "Visitor to build list of path references found in assertions"
	keywords:    "visitor, assertion expressions"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EXPR_XREF_BUILDER

inherit
	EXPR_VISITOR
		rename
			initialise as initialise_visitor
		redefine
			start_expr_leaf
		end

feature -- Initialisation

	initialise (an_archetype: ARCHETYPE; an_assertion: ASSERTION)
			-- set assertion
		do
			archetype := an_archetype
			initialise_visitor (an_assertion)
		end

feature -- Visitor

	start_expr_leaf (a_node: EXPR_LEAF; depth: INTEGER)
			-- enter an EXPR_LEAF
		do
			if a_node.is_archetype_definition_ref and attached {STRING} a_node.item as tgt_path then
				if not archetype.invariants_index.has (tgt_path) then
					archetype.invariants_index.put (create {ARRAYED_LIST[EXPR_LEAF]}.make(0), tgt_path)
				end
				archetype.invariants_index.item (tgt_path).extend (a_node)
			end
		end

feature {NONE} -- Implementation

	archetype: ARCHETYPE

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
--| The Original Code is expr_xref_builder.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2008
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
