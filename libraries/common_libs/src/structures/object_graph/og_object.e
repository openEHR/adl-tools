note
	component:   "openEHR Archetype Project"
	description: "[
				 Any OBJECT node in object parse tree, including real OBJECTs,
				 simple OBJECTs, real OBJECT 'use' references, and OBJECTs
				 which represent constraints on other archetypes.
				 ]"
	keywords:    "object graph, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

deferred class OG_OBJECT

inherit
	OG_ITEM
		redefine
			parent
		end

feature -- Initialisation

	make_anonymous
			-- make an anonymous node with optional content item
		do
			make (Anonymous_node_id)
		end

feature -- Access

	parent: detachable OG_ATTRIBUTE_NODE

feature -- Status Report

	is_object_node: BOOLEAN = True

	is_addressable: BOOLEAN
			-- True if this node has a proper node_id
			-- node_id must not be something like "unknown" or "unknown_1", "unknown_2" etc
		do
			Result := not node_id.starts_with (Anonymous_node_id)
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
