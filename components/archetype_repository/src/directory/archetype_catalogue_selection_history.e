note
	component:   "openEHR Archetype Project"
	description: "Specialised form of SELECTION_HISTORY for ARCHETYPE_CATALOGUE"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ARCHETYPE_CATALOGUE_SELECTION_HISTORY

inherit
	SELECTION_HISTORY
		redefine
			selected_item
		end

create
	make

feature -- Access

	selected_item: detachable ARCH_CAT_ITEM
			-- The archetype at `selected_item'.
		do
			if attached {ARCH_CAT_ITEM} precursor as aci then
				Result := aci
			end
		end

	selected_archetype: detachable ARCH_CAT_ARCHETYPE
			-- The archetype at `selected_item'.
		do
			if attached {ARCH_CAT_ARCHETYPE} selected_item as aca then
				Result := aca
			end
		ensure
			consistent_with_history: attached Result implies Result = selected_item
		end

	selected_class: detachable ARCH_CAT_CLASS_NODE
			-- The class node at `selected_item'.
		do
			if attached {ARCH_CAT_CLASS_NODE} selected_item as acc then
				Result := acc
			end
		ensure
			consistent_with_history: attached Result implies Result = selected_item
		end

feature -- Status Report

	has_selected_archetype: BOOLEAN
			-- Has an archetype been selected?
		do
			Result := attached selected_archetype
		end

	has_validated_selected_archetype: BOOLEAN
			-- Has a valid archetype been selected?
		do
			Result := attached selected_archetype and then selected_archetype.is_valid
		end

	has_selected_class: BOOLEAN
			-- Has a class been selected?
		do
			Result := attached selected_class
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
--| The Original Code is archetype_directory.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2008
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
