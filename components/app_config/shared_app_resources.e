note
	component:   "openEHR Archetype Project"
	description: "Shared application resources for any ADL application, GUI or non-GUI"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class SHARED_APP_RESOURCES

inherit
	SHARED_RESOURCES

	ARCHETYPE_DEFINITIONS

	SHARED_MESSAGE_DB

	SHARED_MESSAGE_BILLBOARD

feature -- Access

	reference_repository_paths: ARRAYED_LIST[STRING]
			-- path of root of ADL file tree
		do
			Result := resource_value_list("default", "reference_repositories")
			from Result.start until Result.off loop
				Result.replace(substitute_env_vars(Result.item))
				Result.forth
			end
			Result.compare_objects
		ensure
			Result_attached: Result /= Void
			Value_comparison: Result.object_comparison
		end

	reference_repository_path: STRING
			-- path of root of ADL file tree
		do
			Result := substitute_env_vars(resource_value("default", "reference_repository"))
		ensure
			Result /= Void
		end

	work_repository_path: STRING
			-- path of root of ADL file tree
		do
			Result := substitute_env_vars(resource_value("default", "work_repository"))
		ensure
			Result /= Void
		end

	validation_strict: BOOLEAN
			-- Set strict validation on?
		local
			str: STRING
		do
			str := resource_value ("default", "validation_strict")
			if str.is_boolean then
				Result := str.to_boolean
			end
		end

	html_export_directory: attached STRING
			-- Path of directory to which HTML is exported.
		do
			Result := substitute_env_vars (resource_value ("default", "html_export_directory"))
		end

	adl_version_for_flat_output: attached STRING
			-- version of ADL syntax to use for outputting flat archetypes
		do
			Result := substitute_env_vars (resource_value ("default", "adl_version_for_flat_output"))
		end

feature -- Application Switch Setting

	set_reference_repository_path(a_path: STRING)
			-- set reference_repository_path
		require
			a_path_valid: a_path /= Void and then not a_path.is_empty
		do
			set_resource_value("default", "reference_repository", a_path)
		end

	set_reference_repository_paths(a_path_list: ARRAYED_LIST[STRING])
			-- set reference_repository_path(s)
		require
			a_path_list_valid: a_path_list /= Void and then not a_path_list.is_empty
		do
			set_resource_value_list("default", "reference_repositories", a_path_list)
		end

	set_work_repository_path(a_path: STRING)
			-- set work repository_path
		require
			a_path_valid: a_path /= Void
		do
			if not a_path.is_empty then
				set_resource_value("default", "work_repository", a_path)
			else
				remove_resource ("default", "work_repository")
			end
		end

	set_html_export_directory (value: STRING)
			-- Set the path of directory to which HTML is exported.
		require
			value_attached: value /= Void
			value_not_empty: not value.is_empty
		do
			set_resource_value("default", "html_export_directory", value)
		end

	set_adl_version_for_flat_output (value: STRING)
			-- Set version of ADL syntax to use for outputting flat archetypes.
		require
			value_attached: value /= Void
			value_not_empty: not value.is_empty
		do
			set_resource_value("default", "adl_version_for_flat_output", value)
		end

	set_validation_strict (flag: BOOLEAN)
			-- Set flag for strict parser validation
		do
			set_resource_value ("default", "validation_strict", flag.out)
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
