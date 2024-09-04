note
	component:   "openEHR ADL Tools"
	description: "Options  definitions and processor for adlc command line ADL 1.4/1.5 parser tool."
	keywords:    "UI, resources"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	OPTIONS_PROCESSOR

inherit
	ARGUMENT_SINGLE_PARSER
		rename
			make as make_parser
		export
			{ANY} display_usage
		redefine
			post_process_arguments, switch_groups, initialize_defaults
		end

	SHARED_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	ADL_MESSAGES_IDS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	switches: ARRAYED_LIST [ARGUMENT_SWITCH]
			-- Retrieve a list of switch used for a specific application
		once
			create Result.make (20)

			-- non-argument switches
			Result.extend (create {ARGUMENT_SWITCH}.make (quiet_switch, get_text (ec_adlc_quiet_switch_desc), True, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (flat_switch, get_text (ec_flat_switch_desc), True, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (rm_multiplicities_switch, get_text (ec_rm_multiplicities_switch_desc), True, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (opts_only_switch, get_text (ec_templates_only_switch_desc), True, False))

			Result.extend (create {ARGUMENT_SWITCH}.make (show_config_switch, get_text (ec_show_config_switch_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (list_archetypes_switch, get_text (ec_list_archetypes_switch_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (display_archetypes_switch, get_text (ec_display_archetypes_switch_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (list_rms_switch, get_text (ec_list_rms_switch_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (build_switch, get_text (ec_build_switch_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (report_switch, get_text (ec_report_switch_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (export_switch, get_text (ec_export_switch_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (export_term_bindings_switch, get_text (ec_export_term_bindings_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (clean_term_bindings_switch, get_text (ec_clean_term_bindings_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (gen_opts_copy_script_switch, get_text (ec_gen_opts_copy_script_desc), True, False))

			-- switches with arguments
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (cfg_switch, get_text (ec_cfg_switch_desc), True, False, cfg_switch_arg_name, get_text (ec_cfg_switch_arg_desc), False))

			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (display_rm_switch, get_text (ec_display_rm_switch_desc), False, False, display_rm_switch_arg, get_text (ec_display_rm_switch_arg_desc), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (export_rms_switch, get_text (ec_export_rms_switch_desc), False, False, export_rms_switch_arg, get_text (ec_export_rms_switch_arg_desc), True))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (library_switch, get_text (ec_library_switch_desc), False, False, library_switch_arg, get_text (ec_library_switch_arg_desc), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (format_switch, get_text (ec_format_switch_desc), True, False, format_switch_arg, get_msg (ec_format_switch_arg_desc, <<archetype_all_serialiser_formats_string>>), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (output_dir_switch, get_text (ec_output_dir_switch_desc), False, False, output_dir_switch_arg_name, get_text (ec_output_dir_switch_arg_desc), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (input_file_switch, get_text (ec_input_file_switch_desc), False, False, input_file_switch_arg_name, get_text (ec_input_file_switch_arg_desc), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (inject_term_bindings_switch, get_text (ec_term_bindings_switch_desc), False, False, inject_term_bindings_switch_arg, get_text (ec_term_bindings_switch_arg_desc), False))

			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (opts_copy_target_repo_switch, get_text (ec_opts_copy_target_repo_switch_desc), True, False, opts_copy_target_repo_switch_arg, get_text (ec_opts_copy_target_repo_switch_arg_desc), False))

			-- valid command line configurations

		end

	switch_groups: ARRAYED_LIST [ARGUMENT_GROUP]
			-- <Precursor>
		once
			create Result.make (10)

			-- adlc [--quiet] --show_config
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (show_config_switch)>>, False))

			-- adlc [--quiet] --list_rms
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (list_rms_switch)>>, False))

			-- adlc [--quiet] --display_rms
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (display_rm_switch)>>, False))

			-- adlc [--quiet] --export_rms
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (export_rms_switch)>>, False))

			-- adlc [--quiet] [--cfg <file path>] --library <library name> --list_archetypes [<id_pattern>]
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (library_switch),
															switch_of_name (list_archetypes_switch)>>, True))

			-- adlc [--quiet] [--cfg <file path>] --library <library name> --display_archetypes [<id_pattern>]
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (library_switch),
															switch_of_name (display_archetypes_switch)>>, True))

			-- BUILD system
			-- adlc [--quiet] [--cfg <file path>] --library <library name> --build
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (library_switch),
															switch_of_name (build_switch)>>, False))

			-- EXPORT term bindings
			-- adlc [--quiet] [--cfg <file path>] --library <library name> --export_term_bindings [--output <output_dir>]
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (library_switch),
															switch_of_name (export_term_bindings_switch), switch_of_name (output_dir_switch) >>, False))

			-- CLEAN term bindings
			-- adlc [--quiet] [--cfg <file path>] --library <library name> --clean_term_bindings
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (library_switch),
															switch_of_name (clean_term_bindings_switch)>>, False))

			-- EXPORT
			-- adlc [--quiet] [--cfg <file path>] --library <library name> --export [--format <format>]  [--flat] [--opts] [--rm_multiplicities] [--output <output_dir>] [<id_pattern>]
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (library_switch),
															switch_of_name (export_switch),
															switch_of_name (flat_switch),
															switch_of_name (rm_multiplicities_switch),
															switch_of_name (opts_only_switch),
															switch_of_name (format_switch),
															switch_of_name (output_dir_switch)>>, True))

			-- REPORT
			-- adlc [--quiet] [--cfg <file path>] --library <library name> [--format <format>] --report [--output <output_dir>]
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (library_switch),
															switch_of_name (format_switch),
															switch_of_name (report_switch),
															switch_of_name (output_dir_switch)>>, False))

			-- INJECT Terminology bindings
			-- adlc [--quiet] [--cfg <file path>] --library <library name> --inject_term_bindings --input_file <terms_file>
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (library_switch),
															switch_of_name (inject_term_bindings_switch), switch_of_name (input_file_switch)>>, False))

			-- GENERATE OPTS COPY SCRIPT
			-- adlc [--quiet] [--cfg <file path>] --library <library name> --gen_opts_copy_script --target_repo <tgt_repo_name> [--output <output_dir>]
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch),
															switch_of_name (cfg_switch),
															switch_of_name (library_switch),
															switch_of_name (gen_opts_copy_script_switch),
															switch_of_name (opts_copy_target_repo_switch),
															switch_of_name (output_dir_switch)>>, False))

		end

	quiet_switch: STRING = "q|quiet"
	flat_switch: STRING = "flat"
	rm_multiplicities_switch: STRING = "rm_multiplicities"
	opts_only_switch: STRING = "opts"
	show_config_switch: STRING = "s|show_config"

	list_rms_switch: STRING = "L|list_rms"
	display_rm_switch: STRING = "D|display_rm"
	display_rm_switch_arg: STRING = "reference model name"

	export_rms_switch: STRING = "X|export_rms"
	export_rms_switch_arg: STRING = "export folder path"

	list_archetypes_switch: STRING = "l|list_archetypes"
	display_archetypes_switch: STRING = "d|display_archetypes"

	build_switch: STRING = "build"
	report_switch: STRING = "r|report"
	export_switch: STRING = "x|export"

	gen_opts_copy_script_switch: STRING = "gen_opts_copy_script"
	opts_copy_target_repo_switch: STRING = "target_repo"
	opts_copy_target_repo_switch_arg: STRING = "repo name"

	export_term_bindings_switch: STRING = "export_term_bindings"
	clean_term_bindings_switch: STRING = "clean_term_bindings"

	inject_term_bindings_switch: STRING = "inject_term_bindings"
	inject_term_bindings_switch_arg: STRING = "terminology namespace"

	library_switch: STRING = "b|library"
	library_switch_arg: STRING = "library name"

	format_switch: STRING = "f|format"
	format_switch_arg: STRING = "format"

	cfg_switch: STRING = "cfg"
	cfg_switch_arg_name: STRING = "file path"

	output_dir_switch: STRING = "o|output_dir"
	output_dir_switch_arg_name: STRING = "output directory"

	input_file_switch: STRING = "i|input_file"
	input_file_switch_arg_name: STRING = "input file"

	non_switched_argument_name: STRING = "id_pattern"
			--  <Precursor>

	non_switched_argument_description: STRING
			--  <Precursor>
		once
			Result := get_text (ec_id_pattern_arg_description)
		end

	non_switched_argument_type: STRING
			--  <Precursor>
		once
			Result := get_text (ec_id_pattern_arg_type)
		end

feature {NONE} -- Initialization

	make
			-- Initialize argument parser
		do
			make_parser (True, False)
		end

	initialize_defaults
		do
			precursor
			is_using_builtin_switches := False
		end

	post_process_arguments
		do
			Precursor
			if is_successful then
				is_verbose := not has_option (quiet_switch)
				use_flat := has_option (flat_switch)
				include_rm_multiplicities := has_option (rm_multiplicities_switch)
				opts_only := has_option (opts_only_switch)

				show_config := has_option (show_config_switch)
				list_archetypes := has_option (list_archetypes_switch)
				display_archetypes := has_option (display_archetypes_switch)
				list_rms := has_option (list_rms_switch)
				export_rms := has_option (export_rms_switch)
				write_to_file_system := has_option (output_dir_switch)
				build := has_option (build_switch)
				report := has_option (report_switch)
				export_archetypes := has_option (export_switch)
				export_term_bindings := has_option (export_term_bindings_switch)
				clean_term_bindings := has_option (clean_term_bindings_switch)
				inject_term_bindings := has_option (inject_term_bindings_switch)

				gen_opts_copy_script := has_option (gen_opts_copy_script_switch)
			end
		end

feature -- Access

	output_format: detachable STRING
			-- name of output format
		require
			is_successful: is_successful
		once
			if has_option (format_switch) and then attached option_of_name (format_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	cfg_file_path: detachable STRING
			-- path to .cfg file
		require
			is_successful: is_successful
		once
			if has_option (cfg_switch) and then attached option_of_name (cfg_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	display_rm: detachable STRING
			-- name of reference model to display with -R switch
		require
			is_successful: is_successful
		once
			if has_option (display_rm_switch) and then attached option_of_name (display_rm_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	rm_export_directory: detachable STRING
			-- folder to write exported BMM models to
		require
			is_successful: is_successful
		once
			if has_option (export_rms_switch) and then attached option_of_name (export_rms_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	library: detachable STRING
			-- name of library
		require
			is_successful: is_successful
		once
			if has_option (library_switch) and then attached option_of_name (library_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	output_dir: detachable STRING
			-- output directory to write files to
		require
			is_successful: is_successful
		once
			if has_option (output_dir_switch) and then attached option_of_name (output_dir_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	input_file: detachable STRING
			-- input file to read from
		require
			is_successful: is_successful
		once
			if has_option (input_file_switch) and then attached option_of_name (input_file_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	term_bindings_namespace: detachable STRING
			-- terminology to add bindings for
		require
			is_successful: is_successful
		once
			if has_option (inject_term_bindings_switch) and then attached option_of_name (inject_term_bindings_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	archetype_id_pattern: STRING
		do
			if has_non_switched_argument then
				Result := value
			else
				create Result.make_empty
			end
		end

	copy_opts_target_repo: detachable STRING
			-- target repo for gen copy OPTs script operation
		require
			is_successful: is_successful
		once
			if has_option (gen_opts_copy_script_switch) and then attached option_of_name (opts_copy_target_repo_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

feature -- Status Report

	is_verbose: BOOLEAN

	use_flat: BOOLEAN

	include_rm_multiplicities: BOOLEAN

	opts_only: BOOLEAN

	show_config: BOOLEAN

	list_archetypes: BOOLEAN

	display_archetypes: BOOLEAN

	list_rms: BOOLEAN

	export_rms: BOOLEAN

	write_to_file_system: BOOLEAN

	build: BOOLEAN

	report: BOOLEAN

	inject_term_bindings: BOOLEAN

	export_archetypes: BOOLEAN

	export_term_bindings: BOOLEAN

	clean_term_bindings: BOOLEAN

	gen_opts_copy_script: BOOLEAN

feature {NONE} -- Usage

	copyright: STRING = "Copyright (c) 2012- openEHR International"
			--  <Precursor>

	name: STRING
			--  <Precursor>
		once
			Result := application_name
		end

	version: STRING
			--  <Precursor>
		once
			Result := (create {OPENEHR_VERSION}).out
		end

end

