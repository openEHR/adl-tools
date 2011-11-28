note
	description: "Summary description for {REPOSITORY_MANAGER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REPOSITORY_MANAGER
inherit
	SHARED_APP_ROOT
create
	make
feature
	--fields
--	app_root: APP_ROOT
--	once
--		create RESULT
--	end

	initialized:BOOLEAN

feature
	make
	do

		app_root.set_error_db_directory_location (app_root.user_config_file_directory + "\error_db")
		app_root.set_rm_schema_directory_location (app_root.user_config_file_directory + "\rm_schemas")
		configure_archetype_repository
		initialized := true
	end

feature
	--methods
	get_archetype_names: ARRAYED_LIST[STRING]
		-- get an array of archetype names in the repository
		require
			rm_schema_dir_initialized: app_root.rm_schema_directory_location /= Void
			error_db_dir_initialized: app_root.error_db_directory_location /= Void
		local
			names_arrl: ARRAYED_LIST[STRING]
			valid_names_arrl: ARRAYED_LIST[STRING]
			key: STRING
			arch_cat_archetype: ARCH_CAT_ARCHETYPE
			arch_wrapper_test: ARCHETYPE_WRAPPER_GEN
			flattened_archetype: FLAT_ARCHETYPE
		do
--			create names_arr.make (0, app_root.current_arch_cat.archetype_index.count - 1)
			create names_arrl.make (0)

			FROM current_arch_cat.archetype_index.keys.start
			until
				current_arch_cat.archetype_index.keys.off
			loop
				key := current_arch_cat.archetype_index.keys.item_for_iteration
				arch_cat_archetype := current_arch_cat.archetype_index.item (key)

				archetype_compiler.build_lineage (arch_cat_archetype,0) --THE DEPTH ARGUMENT IS RELATED TO FORMATTING OF OUTPUTS

				if arch_cat_archetype.is_valid then
					names_arrl.force (key)
				end

				current_arch_cat.archetype_index.keys.forth
			end

			Result := names_arrl
		end

	compile_and_visit_archetype (p_archetype_name:STRING):CCOMPLEXOBJECT_WRAPPER_GEN
	--compile the archetype, create a wrapper using visitor,  and return the wrapper
	local
		flattened_archetype: FLAT_ARCHETYPE
		visitor_iterator: C_VISITOR_ITERATOR
		test_visitor: BOSPHORUS_PB_VISITOR
		root_obj: CCOMPLEXOBJECT_WRAPPER_GEN
	do
--		io.put_string ("compiling and using archetype: " + p_archetype_name + "%N")
--		app_root.current_arch_cat.set_selected_item (app_root.current_arch_cat.archetype_index.item (p_archetype_name))
		app_root.archetype_compiler.build_lineage (app_root.current_arch_cat.archetype_index.item (p_archetype_name), 0) --TODO: TALK TO THOMAS BEALE: WHAT IS THE RIGHT VALUE OF THE DEPTH PARAMATER HERE?
		if app_root.current_arch_cat.archetype_index.item (p_archetype_name).is_valid then
			flattened_archetype := app_root.current_arch_cat.archetype_index.item (p_archetype_name).flat_archetype
			if flattened_archetype /= Void then
				create test_visitor.make(current)
				create visitor_iterator.make (flattened_archetype.definition, test_visitor)
				visitor_iterator.do_all
			end

			root_obj := test_visitor.root
			root_obj.set_is_root_object (true)
			Result := root_obj

		else
--			io.put_string ("Archetype: " + p_archetype_name + " is not valid%N")
		end
	end

	get_archetype_wrapper (p_archetype_name:STRING):ARCHETYPE_WRAPPER_GEN
	--compile the archetype, create a wrapper using visitor,  and return the wrapper
	local
		flattened_archetype: FLAT_ARCHETYPE
		visitor_iterator: C_VISITOR_ITERATOR
		test_visitor: BOSPHORUS_PB_VISITOR
		arch_wrapper_generator: ARCHETYPE_WRAPPER_GENERATOR
		arch_cat_archetype: ARCH_CAT_ARCHETYPE
	do
--		io.put_string ("compiling and using archetype: " + p_archetype_name + "%N")
		--app_root.arch_dir.set_selected_item (app_root.arch_dir.archetype_index.item (p_archetype_name))
		arch_cat_archetype := current_arch_cat.archetype_index.item (p_archetype_name)
--		current_arch_cat.set_selected_item (arch_cat_archetype)
		archetype_compiler.build_lineage (arch_cat_archetype,0) --THE DEPTH ARGUMENT IS RELATED TO FORMATTING OF OUTPUTS
		if arch_cat_archetype.is_valid then
			flattened_archetype := arch_cat_archetype.flat_archetype_with_rm
			if flattened_archetype /= Void then
				create arch_wrapper_generator.make (flattened_archetype)
				arch_wrapper_generator.fill_archetype_wrapper
				create test_visitor.make_with_root_ccomplexobj_wrapper (current,arch_wrapper_generator.get_archetype_definition_wrapper)
				create visitor_iterator.make (flattened_archetype.definition, test_visitor)
				visitor_iterator.do_all
				Result := arch_wrapper_generator.get_archetype_wrapper
			end
		else
			io.put_string ("Archetype: " + p_archetype_name + " is not valid%N")
		end
	end

	set_error_db_dir_location (p_path:STRING)
	do
		app_root.set_error_db_directory_location (p_path)
	end

	set_rm_schema_dir_location (p_path:STRING)
	do
		app_root.set_rm_schema_directory_location (p_path)
	end

	configure_archetype_repository
		require
			rm_schema_dir_initialized: app_root.rm_schema_directory_location /= Void
			error_db_dir_initialized: app_root.error_db_directory_location /= Void
		do
			app_root.initialise
			app_root.set_rm_flattening_on (true)
			set_repository_profile
			app_root.use_current_profile(false)
		end

	set_repository_profile
		--assign one of the available profiles as the repository profile to use
		local
--			repository_profiles: attached HASH_TABLE[ARRAYED_LIST[STRING], STRING]
			rep_profiles: REPOSITORY_PROFILE_CONFIG
			new_prof: STRING
		do
			rep_profiles := app_root.repository_profiles
			print("repo profiles count: ")
			io.put_integer (repository_profiles.count)
			from rep_profiles.start until rep_profiles.off loop
						print(rep_profiles.key_for_iteration + "%N")
						rep_profiles.forth
			end
			set_current_profile ("CKM")

		end

end
