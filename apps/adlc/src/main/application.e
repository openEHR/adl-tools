note
	component:   "openEHR ADL Tools"
	description : "[
				   Command-line form of the compiler.
				   
					USAGE:
					   adlc -s [-q]
					   adlc -b <library name> -l [-q]
					   adlc -b <library name> -d [-q]
					   adlc <id_pattern> -b <library name> [--flat] [--cfg <file path>] [-q] [-f <format>] -a <action> [-o <output_dir>]

					OPTIONS:
					   Options should be prefixed with: '-' or '/'

					   -q --quiet             : suppress verbose feedback, including configuration information on startup (Optional)
					      --flat              : use flat form of archetype[s] for actions, e.g. path extraction etc (Optional)
					   -s --show_config       : show current configuration and defaults
					   -l --list_archetypes   : generate list of archetypes in current library (use for further processing)
					   -d --display_archetypes: generate list of archetypes in current library in user-friendly format
					   -b --library           : library to use
					                            <library name>: library name
					   -f --format            : output format for generated files (Optional)
					                            <format>: file formats: json|adl|odin|yaml|xml (default = adl)
					      --cfg               : output default configuration file location (Optional)
					                            <file path>: .cfg file path
					   -a --action            : action to perform
					                            <action>: validate|serialise|serialize|list
					   -o --output            : output directory to write files to; '.' for current directory
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
			aca: ARCH_LIB_ARCHETYPE
			finished: BOOLEAN
			lib_name, full_output_dir, full_path: STRING
		do
			if opts.is_verbose then
				std_out.put_string ("Initialising... %N")
				verbose_output := True
			end
			app_root.initialise_app
			if opts.is_verbose then
				std_err.put_string (app_root.error_strings)
			end
			if not app_root.has_errors then
				archetype_compiler.set_console_update_agent (agent console_update)
				archetype_compiler.set_archetype_visual_update_agent (agent compiler_archetype_gui_update)

				-- now process command line
				if opts.show_config then
					-- location of .cfg file
					std_out.put_string (get_msg (ec_config_file_location, <<app_cfg.file_path>>))

					-- XML rules file
					std_out.put_string (get_msg (ec_xml_rules_file_location, <<xml_rules_file_path>>))

					-- RM schemas info
					std_out.put_string ("%N" + get_text (ec_rm_schemas_info_text))
					across ref_models_access.valid_models as loaded_rms_csr loop
						std_out.put_string ("%T" + loaded_rms_csr.key + "%N")
					end

					-- repository & library info
					std_out.put_string ("%N" + get_text (ec_repos_info_text))
					across archetype_repository_interfaces as rep_interfaces_csr loop
						std_out.put_string ("%T" + rep_interfaces_csr.item.local_directory + "%N")
						across rep_interfaces_csr.item.library_interfaces as lib_interfaces_csr loop
							lib_name := lib_interfaces_csr.item.key
							std_out.put_string ("%T%T" + if lib_name.is_equal (current_library_name) then "* " else "  " end + lib_name + "%N")
						end
					end
				else
					-- process library
					if attached opts.library as att_lib then
						if has_library (att_lib) then
							set_current_library_name (att_lib)
							if opts.is_verbose then
								std_out.put_string ("Using library " + att_lib + "%N")
							end
						else
							std_err.put_string (get_msg (ec_lib_does_not_exist_err, <<att_lib>>))
							finished := True
						end
					end

					if opts.list_archetypes then
						current_library.do_all_semantic (agent node_lister_enter, agent node_lister_exit)

					elseif opts.display_archetypes then
						user_friendly_list_output := True
						std_out.put_string (get_msg (ec_archs_list_text, <<current_library_name>>))
						current_library.do_all_semantic (agent node_lister_enter, agent node_lister_exit)
						std_out.put_string (get_text (ec_archs_list_text_end))

					else
						-- check if valid action specified
						check attached opts.action as a then
							action := a
						end
						if not opts.Actions.has (action) then
							std_err.put_string (get_msg (ec_invalid_action_err, <<action, opts.Actions_string>>))
						else
							if not finished then
								if valid_regex (opts.archetype_id_pattern) then
									-- first try and match the user-provided archetype id pattern to some real arguments
									matched_archetype_ids := current_library.matching_ids (opts.archetype_id_pattern, Void, Void)
									if matched_archetype_ids.is_empty then
										if verbose_output then
											std_err.put_string (get_msg (ec_no_matching_ids_err, <<opts.archetype_id_pattern, current_library_name>>))
										end
									else
										if action.is_equal (opts.List_action) then
											across matched_archetype_ids as arch_ids_csr loop
												std_out.put_string (arch_ids_csr.item + "%N")
											end
										else
											-- record flat option
											use_flat_source := opts.use_flat_source

											-- set output format
											if attached opts.output_format as of then
												if has_serialiser_format (of) then
													output_format := of
												else
													std_err.put_string (get_msg (ec_invalid_serialisation_format_err, <<of, archetype_all_serialiser_formats_string>>))
													finished := True
												end
											end

											-- get output directory option and check if valid
											create full_output_dir.make_empty
											if opts.write_to_file_system and then attached opts.output_dir as att_op_dir then
												if file_system.is_absolute_pathname (att_op_dir) then
													full_output_dir := att_op_dir
												else
													full_output_dir := file_system.pathname (file_system.current_working_directory, att_op_dir)
												end
												file_system.recursive_create_directory (full_output_dir)
												if not file_system.directory_exists (full_output_dir) then
													std_err.put_string (get_msg (ec_invalid_output_directory, <<full_output_dir>>))
													finished := True
												else
													if verbose_output then
														std_out.put_string ("Serialising to " + full_output_dir + "%N")
													end
												end
											end

											-- perform action for all matching archetypes
											if not finished then
												across matched_archetype_ids as arch_ids_csr loop
													if attached {ARCH_LIB_AUTHORED_ARCHETYPE} current_library.archetype_with_id (arch_ids_csr.item) as alaa then

														-- process action
														std_err.put_string ("--------- " + alaa.id.as_string + " ---------%N")
														archetype_compiler.build_lineage (alaa, 0)

														if action.is_equal (opts.Validate_action) then
															-- no need to do anything; gui output agent will generate errors
															-- std_err.put_string (alaa.status)

														elseif action.is_equal (opts.Serialise_action) or action.is_equal (opts.Serialise_action_alt_sp) then
															if alaa.is_valid then
																-- write to file system
																if opts.write_to_file_system then
																	check attached archetype_file_extensions.item (output_format) as file_ext then
																		full_path := file_system.pathname (full_output_dir, arch_ids_csr.item) + "." + file_ext
																	end

																	if use_flat_source then
																		alaa.save_flat_as (full_path, output_format)
																	else
																		alaa.save_differential_as (full_path, output_format)
																	end

																-- write to std out
																else
																	if output_format.same_string (Syntax_type_adl) then
																		if use_flat_source then
																			std_out.put_string (alaa.flat_serialised (False))
																		else
																			std_out.put_string (alaa.differential_serialised)
																		end
																	else
																		std_out.put_string (alaa.serialise_object (use_flat_source, output_format) + "%N")
																	end
																end
															else
																std_err.put_string (get_msg (ec_archetype_not_valid, <<alaa.id.as_string>>))
															end
														else
															std_err.put_string (get_msg (ec_invalid_action_err, <<action, opts.Actions_string>>))
														end
													end
												end
											end
										end
									end
								else
									std_err.put_string (get_msg_line ("regex_e1", <<opts.archetype_id_pattern>>))
								end
							end
						end
					end
				end
			else
				std_err.put_string (app_root.errors.as_string)
				std_err.put_string (app_root.error_strings)
				across ref_models_access.all_schemas as schemas_csr loop
					if schemas_csr.item.has_errors then
						std_err.put_string ("========== Schema validation errors for " + schemas_csr.key + " ===========%N")
						std_err.put_string (schemas_csr.item.errors.as_string)
					end
				end
			end
		end

feature {NONE} -- Implementation

	matched_archetype_ids: ARRAYED_LIST [STRING]

	opts: OPTIONS_PROCESSOR
		once
			create Result.make
			Result.set_is_usage_verbose (True)
			Result.set_is_usage_displayed_on_error (True)
		end

	console_update (msg: STRING)
			-- Update UI with progress on build.
		do
			if verbose_output then
				std_out.put_string (msg)
			end
		end

	compiler_archetype_gui_update (ara: ARCH_LIB_ARCHETYPE)
			-- Update UI with progress on build.
		do
			if verbose_output or ara.is_in_terminal_compilation_state and then not ara.is_valid then
				std_out.put_string (ara.error_strings)
			end
		end

	spaces: STRING = "                                                                 "

	dashes: STRING = "-----------------------------------------------------------------"

	node_lister_enter (aci: ARCH_LIB_ITEM)
			-- FIXME: at some point, implement a proper graphical tree in character graphics
			-- not using fixed length source strings!
		local
			leader: STRING
		do
			node_depth := node_depth + 1
			if user_friendly_list_output then
				if attached {ARCH_LIB_CLASS} aci as accn and then accn.has_artefacts or else attached {ARCH_LIB_ARCHETYPE} aci then
					create leader.make_empty
					leader := spaces.substring (1, 4 * node_depth)
					leader.append_character ('+')
					leader.append_string ("--")
					leader.append_character (' ')
					std_out.put_string (leader)
					std_out.put_string (aci.name)
					std_out.new_line
				end
			elseif attached {ARCH_LIB_ARCHETYPE} aci then
				std_out.put_string (aci.qualified_key)
				std_out.new_line
			end
		end

	node_lister_exit (aci: ARCH_LIB_ITEM)
		do
			node_depth := node_depth - 1
		end

	node_depth: INTEGER

 	valid_regex (a_regex: STRING): BOOLEAN
 			-- True if `a_regex' is valid according to standard PERL-based regex rules
 		require
 			Regex_valid: not a_regex.is_empty
 		local
 			regex_matcher: RX_PCRE_REGULAR_EXPRESSION
 		do
 			create regex_matcher.make
 			regex_matcher.set_case_insensitive (True)
 			regex_matcher.compile (a_regex)
 			Result := regex_matcher.is_compiled
 		end


end
