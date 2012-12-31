note
	description : "[
				   This application simulates what a real application written in C, Java or another langauge might do, 
				   across the language interface. To see a C-language equivalent, go to the directory deployment/C/
				   c_tester_for_adl_compiler.
				   ]"
	date        : "$Date$"
	revision    : "$Revision$"

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
		local
			rep_profiles: REPOSITORY_PROFILE_CONFIG
			new_prof: STRING
		do
			app_root.initialise
			print (billboard.content)
			if rm_schemas_access.found_valid_schemas then
				billboard.clear
				print (get_msg ("cfg_file_path_info", <<app_root.user_config_file_path>>) + "%N")
				print (get_text ("rep_profiles_found_info")  + "%N")
				rep_profiles := app_root.repository_profiles
				if not rep_profiles.is_empty then
					across rep_profiles as profs_csr loop
						print (profs_csr.key + "%N")
					end
					if app_root.repository_profiles.is_empty then
						new_prof := rep_profiles.first_profile
					else
						new_prof := app_root.repository_profiles.current_profile_name
					end
					app_root.repository_profiles.set_current_profile_name (new_prof)

					print (get_text ("rep_populate_progress_info"))
					app_root.use_current_profile (False)

					print (get_text ("rep_populate_progress_info") + "%N")
					app_root.archetype_compiler.set_global_visual_update_action (agent compiler_global_gui_update)
					app_root.archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)
					app_root.archetype_compiler.build_all
				else
					print (get_text ("rep_profiles_not_found_info") + "%N")
				end
			else
				print (get_text ("app_exit_with_errors") + "%N")
			end
		end

	compiler_global_gui_update (msg: attached STRING)
			-- Update UI with progress on build.
		do
			print (msg)
		end

	compiler_archetype_gui_update (msg: attached STRING; ara: ARCH_CAT_ARCHETYPE; depth: INTEGER)
			-- Update UI with progress on build.
		do
			print (msg)
		end

end
