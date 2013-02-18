note
	component:   "openEHR Archetype Project"
	description: "Editor plug-in for ARCH_CAT_ARCHETYPE"
	keywords:    "ADL, archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class GUI_ARCH_CAT_EDITOR_STATE

create
	make

feature -- Initialisation

	make (aca: ARCH_CAT_ARCHETYPE_UI_STATE)
		do
			target := aca
		end

	set_editable (an_undo_redo_chain: UNDO_REDO_CHAIN)
		do
			if not attached editor_context then
				create editor_context.make_editable (target, target.rm_schema, an_undo_redo_chain)
			end
		end

feature -- Access

	target: ARCH_CAT_ARCHETYPE_UI_STATE

	differential_display_context: ARCH_ED_CONTEXT
		do
			if attached differential_display_context_cache as ddcc then
				Result := ddcc
			else
				create Result.make (target, target.rm_schema, True)
				differential_display_context_cache := Result
			end
		end

	flat_display_context: ARCH_ED_CONTEXT
		do
			if attached flat_display_context_cache as fdcc then
				Result := fdcc
			else
				create Result.make (target, target.rm_schema, False)
				flat_display_context_cache := Result
			end
		end

	editor_context: detachable ARCH_ED_CONTEXT

feature -- Commands

	clear
		do
			differential_display_context_cache := Void
			flat_display_context_cache := Void
		end

feature {NONE} -- Implementation


	differential_display_context_cache: detachable ARCH_ED_CONTEXT
			-- differential archetype display context

	flat_display_context_cache: detachable ARCH_ED_CONTEXT
			-- differential archetype display context

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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
