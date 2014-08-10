note
	component:   "openEHR ADL Tools"
	description: "[
				   This application simulates what a real application written in C, Java or another langauge might do, 
				   across the language interface. To see a C-language equivalent, go to the directory deployment/C/
				   c_tester_for_adl_compiler.
				   ]"
	keywords:    "compiler, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	APPLICATION

inherit
	ARGUMENTS

	SHARED_APP_ROOT

create
	make

feature -- Initialization

	make
			-- Run application.
		do
			app_root.initialise_shell
			if app_root.ready_to_initialise_app then
				main
			end
		end

	main
		do
			app_root.initialise_app
			if not app_root.has_errors then
				if rm_schemas_access.found_valid_schemas then
					print (get_msg (ec_cfg_file_path_info, <<app_root.user_config_file_path>>) + "%N")
					print (get_text (ec_repos_found_info)  + "%N")
					if not app_root.repositories_table.is_empty then
						-- now choose a library to start with
						if not archetype_library_interfaces.is_empty then
							if not has_current_library then
								set_current_library_name (archetype_library_interfaces.keys.first)
							end
							print (get_text (ec_rep_populate_progress_info))
							use_current_library (False)

							print (get_text (ec_rep_populate_progress_info) + "%N")
							app_root.archetype_compiler.set_global_visual_update_action (agent compiler_global_gui_update)
							app_root.archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)
							app_root.archetype_compiler.build_all
						else
							print (get_text (ec_libs_not_found_info) + "%N")
						end
					else
						print (get_text (ec_repos_not_found_info) + "%N")
					end
				else
					print (get_text (ec_app_exit_with_errors) + "%N")
				end
			else
				io.put_string (app_root.errors.as_string)
				print (app_root.error_strings)
				print (rm_schemas_access.error_strings)
			end
		end

	compiler_global_gui_update (msg: STRING)
			-- Update UI with progress on build.
		do
			print (msg)
		end

	compiler_archetype_gui_update (msg: STRING; ara: ARCH_LIB_ARCHETYPE; depth: INTEGER)
			-- Update UI with progress on build.
		do
			print (msg)
		end

end
