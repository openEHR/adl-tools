note
	component:   "openEHR Archetype Project"
	description: "Specialised form of SELECTION_HISTORY for ARCHETYPE_CATALOGUE"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCHETYPE_CATALOGUE_SELECTION_HISTORY

inherit
	SELECTION_HISTORY
		redefine
			selected_item
		end

create
	make

feature -- Access

	selected_item: ARCH_CAT_ITEM
			-- The archetype at `selected_item'.
		do
			Result ?= precursor
		end

	selected_archetype: ARCH_CAT_ARCHETYPE
			-- The archetype at `selected_item'.
		do
			Result ?= selected_item
		ensure
			consistent_with_history: attached Result implies Result = selected_item
		end

	selected_class: ARCH_CAT_MODEL_NODE
			-- The model node at `selected_item'.
		do
			Result ?= selected_item
			if attached Result and not Result.is_class then
				Result := Void
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
