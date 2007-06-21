indexing
	component:   "openEHR Reusable Libraries"
	description: "Shared access to a .ini style configuration file."
	keywords:    "config, resources"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_RESOURCES

inherit
	KL_SHARED_FILE_SYSTEM

feature -- Definitions

	Default_windows_temp_dir: STRING is "C:\Temp"

	Default_unix_temp_dir: STRING is "/tmp"

feature -- Initialisation

	initialise_resource_config_file_name(str:STRING) is
		require
			File_name_exists: str /= Void and then not str.is_empty
		do
			resource_config_file_name.append(str)
		ensure
			resource_config_file_name.is_equal(str)
		end

	initialise_default_resource_config_file_name is
			-- initialise resources from default resource file location
		do
			resource_config_file_name.append(default_resource_config_file_full_path)
		end

feature -- Access

	resource_value(a_category, a_resource_name:STRING): STRING is
			-- The value for `a_resource_name', in `a_category', preferably from a command-line option.
		require
			Valid_category: a_category /= Void and then not a_category.is_empty
			Valid_resource_name: a_resource_name /= Void and then not a_resource_name.is_empty
		do
			Result := execution_environment.command_line.separate_word_option_value(a_category + ":" + a_resource_name)
			if Result = Void then
				Result := resource_config_file.resource_value(a_category, a_resource_name)
			end
		ensure
			Result_not_void: Result /= Void
		end

	resource_value_list(a_category, a_resource_name:STRING):ARRAYED_LIST[STRING] is
			-- List of items specified in file setting
			-- of the form of a comma-separated list.
		require
			Valid_category: a_category /= Void and then not a_category.is_empty
			Valid_resource_name: a_resource_name /= Void and then not a_resource_name.is_empty
		do
			Result := resource_config_file.resource_value_list(a_category, a_resource_name)
		end

	resource_category_values(a_category:STRING): HASH_TABLE[STRING,STRING] is
			-- get all name/value pairs in 'a_category'
		require
			Valid_category: a_category /= Void and then not a_category.is_empty
		do
			Result := resource_config_file.resource_category_values(a_category)
		ensure
			Result_not_void: Result /= Void
		end

feature -- Environment

	os_type: STRING is
			-- name of operating system
		once
	   		Result := execution_environment.get("OS")
   			if Result /= Void then
   				Result.to_lower
   			else
   				Result := "unknown"
   			end
   		end

	Global_config_directory: STRING is
			-- location of global configuration files - /etc
		once
			create Result.make(0)
			Result.append(os_directory_separator.out + "etc")
		end

	system_config_file_directory: STRING is
			-- place for config files common to multiple applications
		once
			create Result.make(0)
			Result.append(execution_environment.root_directory_name + "etc")
		end

	system_temp_file_directory: STRING is
			-- Standard place for temporary files.
			-- By default /tmp on unix-like systems and C:\Temp on windows-like systems.
			-- Windows would normally be "C:\Documents and Settings\(user)\Local Settings\Temp".
		once
			Result := execution_environment.get ("TMP")

			if Result = Void or else Result.is_empty then
				Result := execution_environment.get ("TEMP")
			end

			if Result /= Void and then not Result.is_empty then
				Result := (create {WINDOWS_SHORT_PATH}.make (Result)).as_long_path
			else
				if operating_system.is_windows then
					Result := default_windows_temp_dir.twin
				else
					Result := default_unix_temp_dir.twin
				end
			end

			Result.prune_all_trailing (os_directory_separator)
			Result.append_character (os_directory_separator)
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
			ends_with_directory_separator: Result @ Result.count = os_directory_separator
		end

	resource_config_file_name: STRING is
			-- name of configuration file from which settings are read
		once
			create Result.make_empty
		end

	default_global_resource_config_file_full_path: STRING is
			-- full path to default global resource configuration file area
		once
			Result := Global_config_directory.twin
			Result.append(os_directory_separator.out + application_name)
			if Result.has_substring (".exe") then
				Result.replace_substring_all(".exe", ".cfg")
			else
				Result.append(".cfg")
			end
		end

	default_resource_config_file_full_path: STRING is
			-- default full path to resource configuration file; same as
			-- full path to app, but config file has .cfg istead of .exe extension
		once
			Result := application_full_path
			if Result.has_substring (".exe") then
				Result.replace_substring_all(".exe", ".cfg")
			else
				Result.append(".cfg")
			end
		end

	execution_environment: EXECUTION_ENVIRONMENT is
	    once
	        create Result
	    end

	os_directory_separator: CHARACTER is
	    once
			Result := operating_environment.directory_separator
	    end

	application_full_path: STRING is
			-- The full path to the application;
			-- else, if the application is in an Eiffel project's W_code
			-- or F_code directory, a path within the Eiffel project directory.
			-- This must be called before any change_dir calls are made
			-- since there is no easy way to get the startup directory.
		local
			path: KI_PATHNAME
			dir: STRING
		once
			path := file_system.string_to_pathname (file_system.absolute_pathname (execution_environment.command_line.command_name))
			path.set_canonical
	    	Result := file_system.pathname_to_string (path)

			if path.count > 3 then
				dir := path.item (path.count - 1)

				if dir.is_equal ("W_code") or dir.is_equal ("F_code") then
					if path.item (path.count - 3).is_equal ("EIFGENs") then
						dir := file_system.dirname (file_system.dirname (file_system.dirname (file_system.dirname (Result))))
						Result := file_system.pathname (dir, file_system.basename (Result))
					end
				end
			end
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
	    end

	application_startup_directory: STRING is
			-- The directory in which the application is installed;
			-- else, if the application is in an Eiffel project's W_code
			-- or F_code directory, the Eiffel project directory.
			-- This must be called before any change_dir calls are made
			-- since there is no easy way to get the startup directory.
		once
			Result := file_system.dirname (application_full_path)
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

	application_name: STRING is
			-- The name of the application executable, with any leading directory components removed.
	    once
			Result := file_system.basename (application_full_path)
	    end

	current_working_directory: STRING is
		do
			Result := execution_environment.current_working_directory
		end

feature -- Element Change

	record_resource_request(a_category, a_resource_name:STRING) is
		require
			Valid_category: a_category /= Void and then not a_category.is_empty
			Valid_resource_name: a_resource_name /= Void and then not a_resource_name.is_empty
		local
			res_table:HASH_TABLE[STRING,STRING]
		do
			res_table := resource_config_file.requested_resources.item(a_category)
			if res_table /= Void then
				if not res_table.has(a_resource_name) then
					res_table.put("------", a_resource_name)
				end
			else
				create res_table.make(0)
				res_table.put("-------", a_resource_name)
				resource_config_file.requested_resources.put(res_table, a_category)
			end
		end

	set_resource_value(a_category, a_resource_name, a_value:STRING) is
		require
			Valid_category: a_category /= Void and then not a_category.is_empty
			Valid_resource_name: a_resource_name /= Void and then not a_resource_name.is_empty
			Valid_value: a_value /= Void and then not a_value.is_empty
		do
			resource_config_file.set_resource_value(a_category, a_resource_name, a_value)
		end

	set_resource_value_list(a_category, a_resource_name: STRING; a_value: LIST[STRING]) is
		require
			Valid_category: a_category /= Void and then not a_category.is_empty
			Valid_resource_name: a_resource_name /= Void and then not a_resource_name.is_empty
			Valid_value: a_value /= Void
		do
			resource_config_file.set_resource_value_list(a_category, a_resource_name, a_value)
		end

feature -- Element Removal

	remove_resource(a_category, a_resource_name:STRING) is
			-- remove the resource a_resource_name
		require
			Valid_category: a_category /= Void and then not a_category.is_empty
			Valid_resource_name: a_resource_name /= Void and then not a_resource_name.is_empty
		do
			resource_config_file.remove_resource(a_category, a_resource_name)
		end

feature -- Conversion

	substitute_env_vars(s:STRING): STRING is
			-- expand the environment variables, delimited by a '$' and any
			-- non alphanumeric character except underscore, or end of string,
			-- in the string s
		local
			i, p,q: INTEGER
			var_name, var_val: STRING
			c: CHARACTER
		do
			Result := s.twin
			from
				p := s.index_of('$', 1)
				q := p+1
			until
				p = 0
			loop
				from
					i := q
				until
					i = 0
				loop
					c := s.item(i)
					if (c >= 'a' and c <= 'z') or else
						(c >= 'A' and c <= 'Z') or else
						(c >= '0' and c <= '9') or else
						c = '_' then
						q := q + 1
						i := i + 1
						if i > s.count then
							i := 0
							q := s.count
						end
					else
						i := 0
					end
				end

				var_name := s.substring(p+1, q)
				var_val := execution_environment.get(var_name)
				if var_val /= Void then
					Result.replace_substring_all("$" + var_name, var_val)
				end
				p := s.index_of('$', q)
			end
		end

feature -- Output

	resources_as_list: ARRAYED_LIST[STRING] is
			-- list of resources configured for application, in format:
			--         category        res_name                res_val
		do
			Result := res_to_list(resources)
		ensure
			Result_exists: Result /= Void
		end

	resources_requested_as_list: ARRAYED_LIST[STRING] is
			-- list of resources requested by application, in format:
			--         category        res_name                res_val
		do
			Result := res_to_list(requested_resources)
		ensure
			Result_exists: Result /= Void
		end

feature -- Persistence

	save_resources is
			-- save current resource settings in file
			-- of same name as application, with extnsion '.cfg'
		do
			resource_config_file.write_file
		end

feature {NONE} -- Implementation

	resources: HASH_TABLE[HASH_TABLE[STRING,STRING], STRING] is
		do
			Result := resource_config_file.resources
		end

	requested_resources: HASH_TABLE[HASH_TABLE[STRING,STRING],STRING] is
		do
			Result := resource_config_file.requested_resources
		end

	res_to_list (res: HASH_TABLE[HASH_TABLE[STRING,STRING],STRING]): ARRAYED_LIST[STRING] is
			-- actual resources read in resource file; result in format
			--         category        res_name                res_val
        local
			str:STRING
			resource_list:HASH_TABLE[STRING,STRING]
		do
			create Result.make(0)

			from
				res.start
			until
				res.off
			loop
				resource_list := res.item_for_iteration.twin
				str := res.key_for_iteration.twin
				str.prepend_string("CATEGORY: -------- ")
				str.append(" --------")
				Result.extend(str)

				from
					resource_list.start
				until
					resource_list.off
				loop
					str := "    "
					str.append(resource_list.key_for_iteration)
					str.append(" = ")
					str.append(resource_list.item_for_iteration)
					Result.extend(str)
					resource_list.forth
				end

				res.forth
			end
		ensure
			Result_exists: Result /= Void
		end

feature {NONE} -- Implementation

	resource_config_file: CONFIG_FILE_ACCESS is
		once
			create Result.make(resource_config_file_name)
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
--| The Original Code is shared_resources.e.
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
