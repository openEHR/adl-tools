note
	description: "Summary description for {EXPERIMENTAL_APPLICATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPERIMENTAL_APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			io.put_string ("in make now")
			print("in make PRINT")
			app_root.initialise
			perform_parsing
		end
feature		--Access

	app_root: APP_ROOT
	once
		create RESULT
	end
	application: APPLICATION

feature
	perform_parsing
	local
		repository_profiles: attached HASH_TABLE[ARRAYED_LIST[STRING], STRING]
		new_prof: STRING
		archetype_key: STRING
		flattend_archetype : FLAT_ARCHETYPE
		archetype_list: DS_HASH_TABLE [ARCH_REP_ARCHETYPE, STRING]
	do
		app_root.initialise
		print("app_root init call passed")
		if app_root.initialised then
			print("app root inited %N")
			repository_profiles := app_root.repository_profiles
			print("repo profiles count: ")
			io.put_integer (repository_profiles.count)
			from repository_profiles.start until repository_profiles.off loop
						print(repository_profiles.key_for_iteration + "%N")
						repository_profiles.forth
			end
			if app_root.current_repository_profile.is_empty then
				repository_profiles.start
				new_prof := repository_profiles.key_for_iteration
			else
				new_prof := app_root.current_repository_profile
			end
			app_root.set_current_repository_profile (new_prof)

			print ("Populating repository " + app_root.current_repository_profile + "...")
			app_root.use_current_profile
			print ("complete%N")
			app_root.archetype_compiler.set_visual_update_action (agent build_ui_update)
			create archetype_list.make (app_root.arch_dir.archetype_index.count)
			from app_root.arch_dir.archetype_index.start until app_root.arch_dir.archetype_index.off loop
				archetype_list.force (app_root.arch_dir.archetype_index.item (app_root.arch_dir.archetype_index.key_for_iteration), app_root.arch_dir.archetype_index.key_for_iteration)
				app_root.arch_dir.archetype_index.forth
			end
			--from app_root.arch_dir.archetype_index.start until app_root.arch_dir.archetype_index.off loop
			from archetype_list.start until archetype_list.off loop
					archetype_key := archetype_list.key_for_iteration
					print(archetype_key + "%N")
					--set this one selected
					app_root.arch_dir.set_selected_item (app_root.arch_dir.archetype_index.item (archetype_key))
					--build selected one					
					app_root.archetype_compiler.build_lineage (app_root.arch_dir.selected_archetype)
					if app_root.arch_dir.selected_archetype.is_valid then
						flattend_archetype := app_root.arch_dir.selected_archetype.flat_archetype
					else
						flattend_archetype := Void
					end
					archetype_list.forth
			end

		else
			print("app root not inited")
		end

	end

	build_ui_update (ara: ARCH_REP_ARCHETYPE)
			-- Update UI with progress on build.
		do
			print (app_root.archetype_compiler.status)
		end

end
