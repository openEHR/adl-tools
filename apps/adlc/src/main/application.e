note
	component:   "openEHR Archetype Project"
	description : "[
				   Command-line form of the compiler.
				   
				   Command line:
				   	adlc [options] action archetype_id_pattern
				   	
				   Options:
				   	(see OPTIONS_PROCESSOR class)
				   ]"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	APPLICATION

inherit
	SHARED_APP_ROOT

	SHARED_ARCHETYPE_SERIALISERS

create
	make

feature -- Definitions

	Validate_action: STRING = "validate"

	Serialise_action: STRING = "serialise"

	Actions: ARRAYED_LIST [STRING]
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend (Validate_action)
			Result.extend (Serialise_action)
		end

feature -- Initialization

	make
			-- Run application.
		do
			app_root.initialise_shell
			if app_root.ready_to_initialise_app then
				options_processor.execute (agent start)
			end
		end

feature -- Access

	output_format: STRING
		attribute
			create Result.make_from_string (Syntax_type_adl)
		end

feature -- Status Report

	verbose_output: BOOLEAN

	use_flat_source: BOOLEAN

feature -- Commands

	start
		local
			prof_key, curr_prof, action: STRING
			aca: ARCH_CAT_ARCHETYPE
			finished: BOOLEAN
		do
			app_root.initialise_app
			if options_processor.is_verbose then
				print (billboard.content)
				verbose_output := True
			end
			if not app_root.has_errors then
				app_root.archetype_compiler.set_global_visual_update_action (agent compiler_global_gui_update)
				app_root.archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)

				check attached repository_profiles.current_profile_name as cpn then
					curr_prof := cpn
				end

				-- now process command line
				if options_processor.show_config then
					-- location of .cfg file
					io.put_string (get_msg ("config_file_location", <<user_config_file_path>>))

					-- repository info
					io.put_string (get_text ("profiles_info_text") + "%N")
					across repository_profiles as profs_csr loop
						prof_key := profs_csr.key + ": " + spaces.substring (1, spaces.count - profs_csr.key.count - 2)
						io.put_string ("%T" + prof_key +  profs_csr.item.reference_repository + "%N")
					end

					io.put_string (get_msg ("current_profile_info_text", <<curr_prof>>))

					-- RM schemas info
					io.put_string (get_text ("rm_schemas_info_text"))
					across rm_schemas_access.valid_top_level_schemas as loaded_schemas_csr loop
						io.put_string ("%T" + loaded_schemas_csr.key + "%N")
					end

				elseif options_processor.list_archetypes then
					io.put_string (get_msg ("archs_list_text", <<curr_prof>>))
					current_arch_cat.do_all_semantic (agent node_lister_enter, agent node_lister_exit)
					io.put_string (get_text ("archs_list_text_end"))

				else
					-- check if valid action specified
					check attached options_processor.action as a then
						action := a
					end
					if not Actions.has (action) then
						io.put_string (get_msg ("invalid_action_err", <<action, valid_actions_string>>))
					else
						-- see if user wants to change profile
						if attached options_processor.profile as prof then
							if repository_profiles.has_profile (prof) then
								set_current_profile (prof)
							else
								io.put_string (get_msg ("profile_does_not_exist_err", <<prof>>))
								finished := True
							end
						end

						if not finished then
							-- first try and match the user-provided archetype id pattern to some real arguments
							matched_archetype_ids := current_arch_cat.matching_ids (options_processor.archetype_id_pattern, Void, Void)
							if matched_archetype_ids.is_empty then
								io.put_string (get_msg ("no_matching_ids_err", <<options_processor.archetype_id_pattern, curr_prof>>))
								finished := True
							else
								-- record flat option
								use_flat_source := options_processor.use_flat_source

								-- set output format
								if attached options_processor.output_format as of then
									if has_serialiser_format (of) then
										output_format := of
									else
										io.put_string (get_msg ("invalid_serialisation_format_err", <<of, archetype_all_serialiser_formats_string>>))
										finished := True
									end
								end

								-- perform action for all matching archetypes
								if not finished then
									across matched_archetype_ids as arch_ids_csr loop
										check attached current_arch_cat.archetype_index.item (arch_ids_csr.item) as aii then
											aca := aii
										end
										archetype_compiler.build_lineage (aca, 0)

										-- process action
										if action.is_equal (Validate_action) then
											io.put_string (aca.status)

										elseif action.is_equal (Serialise_action) then
											if aca.is_valid then
												io.put_string (aca.serialise (use_flat_source, output_format))
											end
										else
											io.put_string (get_msg ("invalid_action_err", <<action, valid_actions_string>>))
										end
									end
								end
							end
						end
					end
				end
			else
				io.put_string (app_root.errors.as_string)
				print (billboard.content)
				across rm_schemas_access.all_schemas as schemas_csr loop
					io.put_string ("========== Schema validation errors for " + schemas_csr.key + " ===========%N")
					io.put_string (schemas_csr.item.errors.as_string)
				end
			end
		end

feature {NONE} -- Implementation

	matched_archetype_ids: ARRAYED_LIST [STRING]
		attribute
			create Result.make (0)
		end

	valid_actions_string: STRING
		once
			create Result.make_empty
			across Actions as actions_csr loop
				Result.append (actions_csr.item)
				if actions_csr.target_index < Actions.count then
					Result.append (", ")
				end
			end
		end

	options_processor: OPTIONS_PROCESSOR
		once
			create Result.make
			Result.set_is_usage_displayed_on_error (True)
		end

	compiler_global_gui_update (msg: STRING)
			-- Update UI with progress on build.
		do
			if verbose_output then
				print (msg)
			end
		end

	compiler_archetype_gui_update (msg: STRING; ara: ARCH_CAT_ARCHETYPE; depth: INTEGER)
			-- Update UI with progress on build.
		do
			if verbose_output then
				print (msg)
			end
		end

	spaces: STRING = "                                                                 "

	dashes: STRING = "-----------------------------------------------------------------"

	node_lister_enter (aci: ARCH_CAT_ITEM)
			-- FIXME: at some point, implement a proper graphical tree in character graphics
			-- not using fixed length source strings!
		local
			leader: STRING
		do
			node_depth := node_depth + 1
			create leader.make_empty
			leader := spaces.substring (1, 2 * node_depth)
			leader.append_character ('+')
			leader.append_string ("--")
			leader.append_character (' ')
			io.put_string (leader)
			io.put_string (aci.name)
			io.new_line
		end

	node_lister_exit (aci: ARCH_CAT_ITEM)
		do
			node_depth := node_depth - 1
		end

	node_depth: INTEGER

end
