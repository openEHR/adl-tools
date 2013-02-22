note
	component:   "openEHR Archetype Project"
	description: "Version of ARCH_CAT_ARCHETYPE with additional GUI tool state"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

class ARCH_CAT_ARCHETYPE_UI_STATE

inherit
	ARCH_CAT_ARCHETYPE
		redefine
			clear_cache, signal_from_scratch
		end

create
	make, make_legacy, make_new_archetype, make_new_specialised_archetype

feature -- Status Report

	has_gui_context: BOOLEAN
		do
			Result := attached gui_context
		end

feature -- Modification

	set_gui_context (a_context: GUI_ARCH_CAT_EDITOR_STATE)
		do
			gui_context := a_context
		end

feature -- Compilation

	signal_from_scratch
			-- signal rebuild from scratch; this rebuilds from existing differential; it only uses legacy if no
			-- differential yet available. This is because changes in legacy will be detected independently
		do
			precursor
			gui_context := Void
		end

feature -- Access

	gui_context: detachable GUI_ARCH_CAT_EDITOR_STATE

	flat_archetype_clone: FLAT_ARCHETYPE
			-- produce a clone of the current `flat_archetype'
		do
			if not attached flat_archetype_clone_cache then
				create flat_archetype_clone_cache.make_from_other (flat_archetype)
			end
			Result := flat_archetype_clone_cache
		end

	commit
			-- commit modified flat clone to archetype
		do
			-- do something with previous version of archetype

			-- do diff on flat_archetype_clone
			differential_archetype := flat_archetype_clone.to_differential
			differential_archetype.clear_is_generated
			save_differential
			create last_modify_timestamp.make_now

			-- regenerate flat form
			flatten (False)

			-- set revision appropriately
		ensure
			Differential_is_primary: not differential_generated and not differential_archetype.is_generated
		end

feature {NONE} -- Implementation

	flat_archetype_clone_cache: FLAT_ARCHETYPE

	clear_cache
		do
			precursor
			flat_archetype_clone_cache := Void
			if has_gui_context then
				gui_context.clear
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
