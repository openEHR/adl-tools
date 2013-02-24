note
	component:   "openEHR Archetype Project"
	description: "[
				 One undo/redo object in an undo/redo chain.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class UNDO_REDO_ACTION

create
	make, make_simple

feature -- Initialisation

	make (an_undo_action, an_undo_display_action, a_redo_action, a_redo_display_action: PROCEDURE [ANY, TUPLE])
		do
			undo_action := an_undo_action
			redo_action := a_redo_action
			undo_display_action := an_undo_display_action
			redo_display_action := a_redo_display_action
		end

	make_simple (an_undo_action, a_redo_action: PROCEDURE [ANY, TUPLE])
		do
			undo_action := an_undo_action
			redo_action := a_redo_action
		end

feature -- Access

	undo_action: PROCEDURE [ANY, TUPLE]

	redo_action: PROCEDURE [ANY, TUPLE]

	undo_display_action: detachable PROCEDURE [ANY, TUPLE]

	redo_display_action: detachable PROCEDURE [ANY, TUPLE]

feature -- Commands

	undo
		do
			undo_action.call ([])
			if attached undo_display_action then
				undo_display_action.call ([])
			end
		end

	redo
		do
			redo_action.call ([])
			if attached redo_display_action then
				redo_display_action.call ([])
			end
		end

feature {NONE} -- Implementation

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
--| The Original Code is gui_hash_table.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
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
