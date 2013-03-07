note
	component:   "openEHR Archetype Project"
	description : "[
				   Command-line form of the compiler.
				   
					USAGE:
					   adlc.exe [-q] -s
					   adlc.exe [-q] -l
					   adlc.exe [-q] -d
					   adlc.exe <id_pattern> [-q] [-flat] [-cfg <file path>] [-p <profile name>] [-a <action>] [-f <format>]

					OPTIONS:
					   Options should be prefixed with: '-' or '/'

					   -q --quiet             : suppress verbose feedback, including configuration information on startup (Optional)
					      --flat              : use flat form of archetype[s] for actions, e.g. path extraction etc (Optional)
					   -s --show_config       : show current configuration and defaults
					   -l --list_archetypes   : generate list of archetypes in current profile repository (use for further processing)
					   -d --display_archetypes: generate list of archetypes in current profile repository in user-friendly format
					   -f --format            : output format for generated files (Optional)
					                            <format>: file formats: json, adl, dadl, yaml, xml (default = adl)
					      --cfg               : output default configuration file location (Optional)
					                            <file path>: .cfg file path
					   -p --profile           : profile to use (Optional)
					                            <profile name>: profile name
					   -a --action            : action to perform (Optional)
					                            <action>: action: validate | serialise
					   -? --help              : Display usage information. (Optional)

					NON-SWITCHED ARGUMENTS:
					   <id_pattern>: archetype id regex

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

	STRING_UTILITIES
		export
			{NONE} all
		end

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

	user_friendly_list_output: BOOLEAN
			-- true if '-d|--display_archetypes' switch has been selected instead of '-l|--list_archetypes'

feature -- Commands

	start
		local
			curr_prof, action: STRING
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
					io.put_string (get_msg ("config_file_location", <<app_cfg.file_path>>))

					-- RM schemas info
					io.put_string ("%N" + get_text ("rm_schemas_info_text"))
					across rm_schemas_access.valid_top_level_schemas as loaded_schemas_csr loop
						io.put_string ("%T" + loaded_schemas_csr.key + "%N")
					end

					-- repository info
					io.put_string ("%N" + get_text ("profiles_info_text"))
					across repository_profiles as profs_csr loop
						io.put_string ("%T" + profs_csr.key + ": " +  profs_csr.item.reference_repository + "%N")
					end

					io.put_string ("%T" + get_msg ("current_profile_info_text", <<curr_prof>>))

				elseif options_processor.list_archetypes then
					current_arch_cat.do_all_semantic (agent node_lister_enter, agent node_lister_exit)

				elseif options_processor.display_archetypes then
					user_friendly_list_output := True
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
							if valid_regex (options_processor.archetype_id_pattern) then
								-- first try and match the user-provided archetype id pattern to some real arguments
								matched_archetype_ids := current_arch_cat.matching_ids (options_processor.archetype_id_pattern, Void, Void)
								if matched_archetype_ids.is_empty then
									io.put_string (get_msg ("no_matching_ids_err", <<options_processor.archetype_id_pattern, curr_prof>>))
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
													io.put_string (aca.serialise (use_flat_source, output_format) + "%N")
												else
													io.put_string (get_msg ("archetype_not_valid", <<aca.id.as_string>>))
												end
											else
												io.put_string (get_msg ("invalid_action_err", <<action, valid_actions_string>>))
											end
										end
									end
								end
							else
								io.put_string (get_msg_line ("regex_e1", <<options_processor.archetype_id_pattern>>))
							end
						end
					end
				end
			else
				io.put_string (app_root.errors.as_string)
				print (billboard.content)
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
			if attached {ARCH_CAT_CLASS_NODE} aci as accn and then accn.has_artefacts or else attached {ARCH_CAT_ARCHETYPE} aci then
				if user_friendly_list_output then
					create leader.make_empty
					leader := spaces.substring (1, 4 * node_depth)
					leader.append_character ('+')
					leader.append_string ("--")
					leader.append_character (' ')
					io.put_string (leader)
				end
				io.put_string (aci.name)
				io.new_line
			end
		end

	node_lister_exit (aci: ARCH_CAT_ITEM)
		do
			node_depth := node_depth - 1
		end

	node_depth: INTEGER

end
