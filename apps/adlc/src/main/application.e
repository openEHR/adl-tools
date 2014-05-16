note
	component:   "openEHR ADL Tools"
	description : "[
				   Command-line form of the compiler.
				   
					USAGE:
					   adlc -s [-q]
					   adlc -r <repository name> -l [-q]
					   adlc -r <repository name> -d [-q]
					   adlc <id_pattern> -r <repository name> [-flat] [-cfg <file path>] [-q] [-f <format>] -a <action>

					OPTIONS:
					   Options should be prefixed with: '-' or '/'

					   -q --quiet             : suppress verbose feedback, including configuration information on startup (Optional)
					      --flat              : use flat form of archetype[s] for actions, e.g. path extraction etc (Optional)
					   -s --show_config       : show current configuration and defaults
					   -l --list_archetypes   : generate list of archetypes in current repository (use for further processing)
					   -d --display_archetypes: generate list of archetypes in current repository in user-friendly format
					   -r --repository        : repository to use
					                            <repository name>: repository name
					   -f --format            : output format for generated files (Optional)
					                            <format>: file formats: json|adl|odin|yaml|xml (default = adl)
					      --cfg               : output default configuration file location (Optional)
					                            <file path>: .cfg file path
					   -a --action            : action to perform
					                            <action>: validate|serialise|serialize|list
					   -? --help              : Display usage information. (Optional)

					NON-SWITCHED ARGUMENTS:
					   <id_pattern>: archetype id regex

				   	(see OPTIONS_PROCESSOR class)
				   ]"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	APPLICATION

inherit
	SHARED_APP_ROOT

	STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		end

create
	make

feature -- Initialization

	make
			-- Run application.
		do
			create output_format.make_from_string (Syntax_type_adl)
			create matched_archetype_ids.make (0)

			app_root.initialise_shell
			if app_root.ready_to_initialise_app then
				opts.execute (agent start)
			end
		end

feature -- Access

	output_format: STRING

feature -- Status Report

	verbose_output: BOOLEAN

	use_flat_source: BOOLEAN

	user_friendly_list_output: BOOLEAN
			-- true if '-d|--display_archetypes' switch has been selected instead of '-l|--list_archetypes'

feature -- Commands

	start
		local
			curr_repo, action: STRING
			aca: ARCH_CAT_ARCHETYPE
			finished: BOOLEAN
		do
			app_root.initialise_app
			if opts.is_verbose then
				print (app_root.error_strings)
				verbose_output := True
			end
			if not app_root.has_errors then
				archetype_compiler.set_global_visual_update_action (agent compiler_global_gui_update)
				archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)

				check attached repository_config_table.current_repository_name as cpn then
					curr_repo := cpn
				end

				-- now process command line
				if opts.show_config then
					-- location of .cfg file
					io.put_string (get_msg (ec_config_file_location, <<app_cfg.file_path>>))

					-- RM schemas info
					io.put_string ("%N" + get_text (ec_rm_schemas_info_text))
					across rm_schemas_access.valid_top_level_schemas as loaded_schemas_csr loop
						io.put_string ("%T" + loaded_schemas_csr.key + "%N")
					end

					-- repository info
					io.put_string ("%N" + get_text (ec_repos_info_text))
					across repository_config_table as repos_csr loop
						io.put_string ("%T" + repos_csr.key + ": " +  repos_csr.item.reference_path + "%N")
					end

				else
					-- process repository
					if attached opts.repository as repo then
						if repository_config_table.has_repository (repo) then
							set_current_repository (repo)
							check attached repository_config_table.current_repository_name as cp then
								curr_repo := cp
							end
						else
							io.put_string (get_msg (ec_repo_does_not_exist_err, <<repo>>))
							finished := True
						end
					end

					if opts.list_archetypes then
						current_arch_cat.do_all_semantic (agent node_lister_enter, agent node_lister_exit)

					elseif opts.display_archetypes then
						user_friendly_list_output := True
						io.put_string (get_msg (ec_archs_list_text, <<curr_repo>>))
						current_arch_cat.do_all_semantic (agent node_lister_enter, agent node_lister_exit)
						io.put_string (get_text (ec_archs_list_text_end))

					else
						-- check if valid action specified
						check attached opts.action as a then
							action := a
						end
						if not opts.Actions.has (action) then
							io.put_string (get_msg (ec_invalid_action_err, <<action, opts.Actions_string>>))
						else
							if not finished then
								if valid_regex (opts.archetype_id_pattern) then
									-- first try and match the user-provided archetype id pattern to some real arguments
									matched_archetype_ids := current_arch_cat.matching_ids (opts.archetype_id_pattern, Void, Void)
									if matched_archetype_ids.is_empty then
										if verbose_output then
											io.put_string (get_msg (ec_no_matching_ids_err, <<opts.archetype_id_pattern, curr_repo>>))
										end
									else
										if action.is_equal (opts.List_action) then
											across matched_archetype_ids as arch_ids_csr loop
												io.put_string (arch_ids_csr.item + "%N")
											end
										else
											-- record flat option
											use_flat_source := opts.use_flat_source

											-- set output format
											if attached opts.output_format as of then
												if has_serialiser_format (of) then
													output_format := of
												else
													io.put_string (get_msg (ec_invalid_serialisation_format_err, <<of, archetype_all_serialiser_formats_string>>))
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
													if action.is_equal (opts.Validate_action) then
														io.put_string (aca.status)

													elseif action.is_equal (opts.Serialise_action) or action.is_equal (opts.Serialise_action_alt_sp) then
														if aca.is_valid then
															io.put_string (aca.serialise_object (use_flat_source, output_format) + "%N")
														else
															io.put_string (get_msg (ec_archetype_not_valid, <<aca.id.as_string>>))
														end
													else
														io.put_string (get_msg (ec_invalid_action_err, <<action, opts.Actions_string>>))
													end
												end
											end
										end
									end
								else
									io.put_string (get_msg_line ("regex_e1", <<opts.archetype_id_pattern>>))
								end
							end
						end
					end
				end
			else
				io.put_string (app_root.errors.as_string)
				print (app_root.error_strings)
				across rm_schemas_access.all_schemas as schemas_csr loop
					if schemas_csr.item.has_errors then
						io.put_string ("========== Schema validation errors for " + schemas_csr.key + " ===========%N")
						io.put_string (schemas_csr.item.errors.as_string)
					end
				end
			end
		end

feature {NONE} -- Implementation

	matched_archetype_ids: ARRAYED_LIST [STRING]

	opts: OPTIONS_PROCESSOR
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
			if verbose_output or ara.is_in_terminal_compilation_state and then not ara.is_valid then
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
			if user_friendly_list_output then
				if attached {ARCH_CAT_CLASS_NODE} aci as accn and then accn.has_artefacts or else attached {ARCH_CAT_ARCHETYPE} aci then
					create leader.make_empty
					leader := spaces.substring (1, 4 * node_depth)
					leader.append_character ('+')
					leader.append_string ("--")
					leader.append_character (' ')
					io.put_string (leader)
					io.put_string (aci.name)
					io.new_line
				end
			elseif attached {ARCH_CAT_ARCHETYPE} aci then
				io.put_string (aci.qualified_key)
				io.new_line
			end
		end

	node_lister_exit (aci: ARCH_CAT_ITEM)
		do
			node_depth := node_depth - 1
		end

	node_depth: INTEGER

end
