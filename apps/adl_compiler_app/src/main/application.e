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
			rep_profiles: attached REPOSITORY_PROFILE_CONFIG
			new_prof: STRING
		do
			app_root.initialise
--			print("Config file path: " + app_root.user_config_file_path + "%N")
			if app_root.initialised then
				print("APP_ROOT initialisation succeeded; repository profiles available:%N")
				rep_profiles := app_root.repository_profiles
				if not rep_profiles.is_empty then
					from rep_profiles.start until rep_profiles.off loop
						print(rep_profiles.key_for_iteration + "%N")
						rep_profiles.forth
					end
					if app_root.repository_profiles.is_empty then
						rep_profiles.start
						new_prof := rep_profiles.key_for_iteration
					else
						new_prof := app_root.repository_profiles.current_profile_name
					end
					app_root.repository_profiles.set_current_profile_name (new_prof)

					print ("Populating repository " + app_root.repository_profiles.current_profile_name + "...")
					app_root.use_current_profile(False)
					print ("complete%N")

					print("Doing complete build on current profile%N")
					app_root.archetype_compiler.set_global_visual_update_action (agent compiler_global_gui_update)
					app_root.archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)
					app_root.archetype_compiler.build_all
				else
					print("No repository profiles found; add entries to .cfg file for current_repository_profile and [profiles] section%N")
				end
			else
				print("APP_ROOT initialisation failed%N")
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
