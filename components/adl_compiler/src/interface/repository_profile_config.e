note
	component:   "openEHR Archetype Project"
	description: "[
				 Helper class for retrieving object structure of repository profiles from .cfg file dADL structure
				 typical example:

				 profile = <
					 current_repository_profile = <"CKM">
					 profiles = <
						 ["CKM"] = <
						 	reference_repository = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
							work_repository = <"">
						 >
						 ["abc"] = <
						 	reference_repository = <"C:\\some\\other\\ref\\dir">
							work_repository = <"C:\\some\\other\\work\\dir">
						 >
					 >
				 >
				 ]"
	keywords:    "test, dADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class REPOSITORY_PROFILE_CONFIG

inherit
	ANY
		redefine
			default_create
		end

create
	make, default_create

feature -- Initialisation

	default_create
		do
			create profiles.make (0)
		end

	make (a_profiles: HASH_TABLE [REPOSITORY_PROFILE, STRING])
		do
			profiles := a_profiles
		end

feature -- Access

	current_profile_name: STRING
			-- name of profile that is currently in use

	current_profile: REPOSITORY_PROFILE
		do
			if not is_empty then
				if not has_profile(current_profile_name) then
					profiles.start
					current_profile_name := profiles.key_for_iteration
				end
				Result := profile(current_profile_name)
			end
		end

	profiles: HASH_TABLE [REPOSITORY_PROFILE, STRING]

	profile (a_profile_name: attached STRING): attached REPOSITORY_PROFILE
		require
			has_profile(a_profile_name)
		do
			Result := profiles.item(a_profile_name)
		end

	current_reference_repository_path: attached STRING
			-- path of root of ADL file tree
		do
			if has_current_profile then
				Result := current_profile.reference_repository
			else
				create Result.make_empty
			end
		end

	current_work_repository_path: attached STRING
			-- path of root of ADL file tree
		do
			if has_current_profile and current_profile.has_work_repository then
				Result := current_profile.work_repository
			else
				create Result.make_empty
			end
		end

	count: INTEGER
		do
			Result := profiles.count
		end

feature -- Status Report

	has_current_profile: BOOLEAN
		do
			Result := current_profile_name /= Void and then not current_profile_name.is_empty
		end

	has_profile (a_profile_name: attached STRING): BOOLEAN
		do
			Result := profiles.has(a_profile_name)
		end

	is_empty: BOOLEAN
			-- True if no profiles
		do
			Result := profiles.is_empty
		end

feature -- Iteration

	start
		do
			profiles.start
		end

	off: BOOLEAN
		do
			Result := profiles.off
		end

	forth
		do
			profiles.forth
		end

	item_for_iteration: REPOSITORY_PROFILE
		do
			Result := profiles.item_for_iteration
		end

	key_for_iteration: STRING
		do
			Result := profiles.key_for_iteration
		end

feature -- Modification

	put_profile (a_profile: attached REPOSITORY_PROFILE; a_profile_name: attached STRING)
			-- put `a_profile', replacing any previous profile of that name
		do
			profiles.force(a_profile, a_profile_name)
			if not has_current_profile then
				current_profile_name := a_profile_name
			end
		end

	remove_profile (a_profile_name: attached STRING)
		require
			has_profile(a_profile_name)
		do
			profiles.remove(a_profile_name)
			if is_empty then
				clear_current_profile
			end
		end

	rename_profile (old_profile_name, new_profile_name: attached STRING)
		require
			has_profile(old_profile_name)
		do
			profiles.replace_key(new_profile_name, old_profile_name)
			if attached current_profile_name and then current_profile_name.is_equal (old_profile_name) then
				current_profile_name := new_profile_name
			end
		end

	set_current_profile_name (a_profile_name: attached STRING)
		require
			has_profile(a_profile_name)
		do
			current_profile_name := a_profile_name
		end

	clear_current_profile
			-- remove the current profile so there is no current profile
		do
			current_profile_name := Void
		end

invariant
--	Valid_current_profile: not is_empty implies has_current_profile

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
