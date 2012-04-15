note
	component:   "openEHR Archetype Project"
	description: "Editor for description controls in ADL workbench"
	keywords:    "UI, description"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_DESCRIPTION_EDITOR

inherit
	GUI_DESCRIPTION_CONTROLS
--		redefine
--			can_edit, enable_edit,
--			auth_orig_auth_mlist, trans_author_mlist, trans_other_details_mlist,
--			resource_orig_res_mlist, auth_contrib_list, keywords_list
--		end

create
	make

feature -- Status Report

--	can_edit: BOOLEAN
--		do
--			Result := True
--		end

feature -- Commands

--	enable_edit
--			-- enable editing
--		local
--			root_win: EV_WINDOW
--		do
--			precursor
--			status_text.enable_edit
--			original_language_text.enable_edit
--			trans_accreditation_text.enable_edit
--			copyright_text.enable_edit
--			purpose_text.enable_edit
--			use_text.enable_edit
--			misuse_text.enable_edit
--			resource_package_text.enable_edit

--			root_win := proximate_ev_window (ev_root_container)
--			auth_orig_auth_mlist.enable_editing (root_win)
--			auth_orig_auth_mlist.set_all_columns_editable

--			trans_author_mlist.enable_editing (root_win)
--			trans_author_mlist.set_all_columns_editable

--			trans_other_details_mlist.enable_editing (root_win)
--			trans_other_details_mlist.set_all_columns_editable

--			resource_orig_res_mlist.enable_editing (root_win)
--			resource_orig_res_mlist.set_all_columns_editable

--			auth_contrib_list.enable_editing (root_win)
--			auth_contrib_list.set_all_columns_editable

--			keywords_list.enable_editing (root_win)
--			keywords_list.set_all_columns_editable
--		end

feature -- Events

feature {NONE} -- Implementation

--	auth_orig_auth_mlist, trans_author_mlist, trans_other_details_mlist, resource_orig_res_mlist: EV_MULTI_COLUMN_LIST_EDITABLE

--	auth_contrib_list, keywords_list: EV_MULTI_COLUMN_LIST_EDITABLE

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
--| The Original Code is adl_ontology_controls.e.
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
