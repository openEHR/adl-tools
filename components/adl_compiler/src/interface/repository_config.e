note
	component:   "openEHR Archetype Project"
	description: "[
				 Config of one repository profile, i.e. the innermost objects in the following:

				 xxxx = <
					 current_repository = <"CKM">
					 repositories = <
						 ["CKM"] = <
						 	reference_path = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
							work_path = <"">
						 >
						 ["abc"] = <
						 	reference_path = <"C:\\some\\other\\ref\\dir">
							work_path = <"C:\\some\\other\\work\\dir">
						 >
					 >
				 >
				 ]"
	keywords:    "test, dADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class REPOSITORY_CONFIG

create
	make_from_old, make

feature -- Initialisation

	make (a_ref_path: STRING; a_work_path: detachable STRING)
		do
			reference_path := a_ref_path
			if attached a_work_path as wp and then not wp.is_empty then
				work_path := a_work_path
			end
		end

	make_from_old (an_old_config: REPOSITORY_PROFILE)
		do
			reference_path := an_old_config.reference_repository
			if attached an_old_config.work_repository as wr then
				work_path := wr
			end
		end

feature -- Access

	reference_path: STRING
			-- path to reference repository
			-- NOTE: this attribute is used for dADL persistence in the .cfg file
        attribute
            create Result.make_empty
        end

	work_path: detachable STRING
			-- [optional] path to work repository
			-- NOTE: this attribute is used for dADL persistence in the .cfg file

feature -- Status Report

	has_work_path: BOOLEAN
			-- True if there is a work_repository
		do
			Result := attached work_path and then not work_path.is_empty
		end

feature -- Modification

	set_reference_path (a_path: STRING)
			-- Set the path to the reference repository.
		require
			not a_path.is_empty
		do
			reference_path := a_path
		end

	set_work_path (a_path: STRING)
			-- Set the path to the work repository.
		do
			work_path := a_path
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
--| The Original Code is shared_ui_resources.e.
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
