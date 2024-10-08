note
	component:   "openEHR ADL Tools"
	description : "[
				   Command-line form of the compiler.
				   
					USAGE:
					   adlc [-q] -s
					   adlc [-q] -L
					   adlc [-q] -D
					   adlc [-q] -X
					   adlc [-q] -b <library> --build
					   adlc [-q] -b <library> -l [<id_pattern>]
					   adlc [-q] -b <library> -d [<id_pattern>]
					   adlc [-q] -b <library> --export [--format <format>] [--flat] [--opts] [--rm_multiplicities] [--output <output_dir>]
					   adlc [-q] -b <library> [-f <format>] --report [-o <output_dir>]
					   adlc [-q] -b <library> --inject_term_bindings <terminology_namespace> -i <terms_file>
					   adlc [-q] -b <library> --export_term_bindings
					   adlc [-q] -b <library> --gen_opts_copy_script --target_repo <tgt_repo_name> --output <output_dir>

					OPTIONS:
					   Options should be prefixed with: '-' or '/'

					   -q --quiet             	: suppress verbose feedback, including configuration information on startup (Optional)
					      --flat              	: use flat form of archetype[s] for actions, e.g. path extraction etc (Optional)
					   -s --show_config       	: show current configuration and defaults

					   -L --list_rms          	: generate list of reference models.
					   -D --display_rms		  	: generate view of reference models user-friendly format
					   -X --export_rms        	: export reference models in all available formats (JSON, ODIN, etc)

					   -l --list_archetypes   	: generate list of archetypes in current library (use for further processing)
					   -d --display_archetypes	: generate list of archetypes in current library in user-friendly format
					   -b --library           	: library to use
					                          	  <library name>: library name
					   -f --format            	: output format for generated files (Optional)
					                          	  <format>: file formats: json|adl|odin|yaml|xml|csv (default = adl or csv)
					      --opts                : generate only operational templates in operations like export
					      --rm_multiplicities   : include RM cardinality and existences to AOM structures in output
					      --cfg               	: output default configuration file location (Optional)
					                          	  <file path>: .cfg file path
					                          	  
					      --build               : build system, OPTs, and reports and generate log to std_out
					   -x --export            	: export matching archetypes in specified format
					   -r --report            	: generate reports in specified format
					   -o --output            	: output directory to write files to; '.' for current directory
					   
					      --inject_term_bindings: read <loinc_file>, which is formatted as {archetype_id,archetype_code,term_code} and 
					                              inject bindings from loinc codes to id-codes
					                            	
					      --export_term_bindings: generate out files named term_bindings-<terminology_namespace>.csv, e.g.
					                              term_bindings-loinc.csv, term_bindings-snomed.csv, term_bindings-ucum.csv, etc

					      --clean_term_bindings : remove term_bindings that don't contain the namespace string under which they are defined,
					                              e.g. if a binding <http://snomed.info...> appears under ["loinc"], remove it  
					   
					   -? --help              	: Display usage information. (Optional)

					NON-SWITCHED ARGUMENTS:
					   <id_pattern>: archetype id regex

				   	(see OPTIONS_PROCESSOR class)
				   ]"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
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

	SHARED_ARCHETYPE_EXPORTER
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_REPORTER
		export
			{NONE} all
		end

	SHARED_CODE_SYSTEMS
		export
			{NONE} all
		end

	ODIN_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Uri_leader: STRING = "http:"

feature -- Initialization

	make
			-- Run application.
		do
			app_root.initialise_shell
			if app_root.shell_initialised then
				opts.execute (agent start)
			else
				report_std_out ("Failed to initialise application shell (app_root.initialise_shell)")
			end
		end

	start
		do
			report_std_out ("Initialising... ")

			if attached opts.cfg_file_path as cfg_file_path then
				app_root.set_custom_config_file_path (cfg_file_path)
			end

			app_root.initialise_cfg
			if app_root.ready_to_initialise_app then
				app_root.initialise_app
				if not app_root.has_errors then
					process_jobs
				else
					report_std_err (app_root.error_strings)
					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_config_file_location, <<app_cfg.file_path>>))
					across bmm_models_access.all_schemas as schemas_csr loop
						if schemas_csr.item.has_errors then
							report_std_err ("******** Schema validation errors for " + schemas_csr.key.as_string_8 + " ********")
							report_std_err (schemas_csr.item.errors.as_string)
						end
					end
				end
			else
				report_std_err (app_root.error_strings)
			end
		end

feature -- Access

	output_format: STRING
		attribute
			create Result.make_from_string (Syntax_type_adl)
		end

feature -- Status Report

	process_all: BOOLEAN
			-- process all archetypes if True

feature -- Commands

	process_jobs
		local
			curr_repo, action, report: STRING
			aca: ARCH_LIB_ARCHETYPE
			full_path, schema_file_path, export_dir: STRING
			finished: BOOLEAN
		do
			-- set some feedback agents in the compiler
			archetype_compiler.set_console_update_agent (agent report_std_out)
			archetype_compiler.set_archetype_visual_update_agent (agent compiler_archetype_gui_update)

			-- process command line
			if opts.show_config then
				action_show_config

			-- List Reference Models
			elseif opts.list_rms then
				action_list_rms

			-- Display a Reference Model
			elseif attached opts.display_rm as rm then
				action_display_rm (rm)

			-- Export Reference Models
			elseif opts.export_rms then
				action_export_rms

			-- otherwise process archetype library
			elseif attached opts.library as att_lib then
				if has_library (att_lib) then
					set_current_library_name (att_lib)
					report_std_out ("Using library " + att_lib)
					build_archetype_id_list

					if not error_reported then
						if opts.list_archetypes then
							action_list_archetype_ids

						-- a build is required
						else
							archetype_compiler.setup_build ([False])
							archetype_compiler.build_all

							if opts.display_archetypes then
								action_arch_display_library

							elseif opts.export_archetypes then
								export_library

							elseif opts.export_term_bindings then
								export_term_bindings

							elseif opts.clean_term_bindings then
								clean_term_bindings

							elseif opts.report then
								generate_library_reports
								extract_templates_missing_coding

							elseif opts.gen_opts_copy_script then
								generate_opts_copy_script

							elseif opts.inject_term_bindings then
								inject_term_bindings

							elseif opts.build then
								-- nothing special yet
							end
						end
					end
				else
					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_lib_does_not_exist_err, <<att_lib>>))
				end

			-- no options present; show help
			else
				opts.display_usage
			end
		end

	action_list_archetype_ids
		do
			buffer.wipe_out
			across matched_archetype_ids as arch_ids_csr loop
				buffer.append (arch_ids_csr.item + "%N")
			end
			std_out.put_string (buffer)
		end

	export_library
		local
			full_output_dir: STRING
		do
			-- OPTION: output format
			if attached opts.output_format as of then
				if has_serialiser_format (of) then
					output_format := of
				else
					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_invalid_serialisation_format_err, <<of, archetype_all_serialiser_formats_string>>))
				end
			end

			-- OPTION: output directory
			create full_output_dir.make_empty
			if opts.write_to_file_system and then attached opts.output_dir as att_op_dir then
				if file_system.is_absolute_pathname (att_op_dir) then
					full_output_dir := att_op_dir
				else
					full_output_dir := file_system.pathname (file_system.current_working_directory, att_op_dir)
				end
				file_system.recursive_create_directory (full_output_dir)
				if not file_system.directory_exists (full_output_dir) then
					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_invalid_output_directory, <<full_output_dir>>))
				end
			end

			-- PROCESS LIBRARY
			if not error_reported then
				report_std_out ("--------- Exporting to " + full_output_dir + "---------")
				archetype_exporter.setup_build ([full_output_dir, output_format, opts.use_flat, opts.include_rm_multiplicities, opts.opts_only])
				archetype_exporter.build_all
			end
		end

	export_term_bindings
			-- export all term bindings into one files per terminology namespace
			-- Each file is a CSV file of the form
			--     archetype_id, archetype_node_id, binding_value
		local
			action: TERMINOLOGY_BINDINGS_EXPORTER
		do
			if opts.write_to_file_system and then attached opts.output_dir as att_op_dir then
				create action.make (att_op_dir, agent report_std_out, agent report_std_err, agent :BOOLEAN do Result := error_reported end)
				action.execute
			else
				report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_output_directory_required_err, <<>>))
			end
		end

	inject_term_bindings
			-- export all term bindings into one files per terminology namespace
			-- Each file is a CSV file of the form
			--     archetype_id, archetype_node_id, binding_value
		local
			action: TERMINOLOGY_BINDINGS_INJECTOR
		do
			if attached opts.input_file as att_in_file then
				if attached opts.term_bindings_namespace as term_ns then
					if code_systems.has (term_ns) then
						create action.make (term_ns, att_in_file, agent report_std_out, agent report_std_err, agent :BOOLEAN do Result := error_reported end)
						action.execute
					else
						report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_terminology_does_not_exist_err, <<term_ns>>))
					end
				else
					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_terminology_namespace_required_err, <<>>))
				end
			else
				report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_input_file_required_err, <<>>))
			end
		end

	extract_templates_missing_coding
			-- export all term bindings into one files per terminology namespace
			-- Each file is a CSV file of the form
			--     archetype_id, archetype_node_id, binding_value
		local
			action: TEMPLATES_MISSING_CODING
		do
			if opts.write_to_file_system and then attached opts.output_dir as att_op_dir then
				create action.make (att_op_dir, agent report_std_out, agent report_std_err, agent :BOOLEAN do Result := error_reported end)
				action.execute
			else
				report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_output_directory_required_err, <<>>))
			end
		end

	generate_opts_copy_script
			-- generate a script to copy valid OPTs and the archetype reachable by direct reference from
			-- their use_reference statements
		local
			action: TEMPLATES_CLOSURE_COPY
		do
			if opts.write_to_file_system and then attached opts.copy_opts_target_repo as repo and then attached opts.output_dir as att_op_dir then
				create action.make (att_op_dir, current_library_name, repo, agent report_std_out, agent report_std_err, agent :BOOLEAN do Result := error_reported end)
				action.execute
			else
				report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_output_directory_required_err, <<>>))
			end
		end

	clean_term_bindings
			-- export all term bindings into one files per terminology namespace
			-- Each file is a CSV file of the form
			--     archetype_id, archetype_node_id, binding_value
		local
			action: TERMINOLOGY_BINDINGS_CLEANER
		do
			create action.make (agent report_std_out, agent report_std_err, agent :BOOLEAN do Result := error_reported end)
			action.execute
		end

	generate_library_reports
		local
			lib_name, full_output_dir, full_path, schema_file_path, export_dir: STRING
			arch_lib_stats_rpt_builder: ARCHETYPE_LIBRARY_STATS_REPORT_BUILDER
		do
			-- OPTION: output format
			if attached opts.output_format as of then
				if report_formats.has (of) then
					output_format := of
				else
					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_invalid_report_format_err, <<of, report_formats_string>>))
				end
			else
				output_format := Syntax_type_csv
			end

			-- OPTION: output directory
			create full_output_dir.make_empty
			if opts.write_to_file_system and then attached opts.output_dir as att_op_dir then
				if file_system.is_absolute_pathname (att_op_dir) then
					full_output_dir := att_op_dir
				else
					full_output_dir := file_system.pathname (file_system.current_working_directory, att_op_dir)
				end
				file_system.recursive_create_directory (full_output_dir)
				if not file_system.directory_exists (full_output_dir) then
					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_invalid_output_directory, <<full_output_dir>>))
				end
			end

			-- PROCESS LIBRARY
			if not error_reported then
				archetype_reporter.setup_build ([full_output_dir, output_format])
				report_std_out ("--------- Generating reports in " + full_output_dir + " ---------")
				archetype_reporter.build_all
			end

			-- PROCESS special reports
			create arch_lib_stats_rpt_builder.make (full_output_dir, agent report_std_out, agent report_std_err, agent :BOOLEAN do Result := error_reported end)
			arch_lib_stats_rpt_builder.execute
		end

feature {NONE} -- Commands

	build_archetype_id_list
			-- if there is an archetype_id pattern use it, else default to all
		do
			if not opts.archetype_id_pattern.is_empty then
				if valid_regex (opts.archetype_id_pattern) then
					matched_archetype_ids := current_library.matching_ids (opts.archetype_id_pattern, Void, Void)
					if matched_archetype_ids.is_empty then
						report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_no_matching_ids_err, <<opts.archetype_id_pattern, current_library_name>>))
					end
				else
					report_std_err (get_msg_line ("regex_e1", <<opts.archetype_id_pattern>>))
				end
			else
				matched_archetype_ids := current_library.matching_ids (match_all_regex, Void, Void)
				process_all := True
			end
		end

	action_show_config
		local
			lib_name: STRING
		do
			buffer.wipe_out

			-- location of .cfg file
			buffer.append (get_msg ({ADL_MESSAGES_IDS}.ec_config_file_location, <<app_cfg.file_path>>))

			-- XML rules file
			buffer.append (get_msg ({ADL_MESSAGES_IDS}.ec_xml_rules_file_location, <<xml_rules_file_path>>))

			-- AOM profiles file
			buffer.append (get_msg ({ADL_MESSAGES_IDS}.ec_aom_profiles_location, <<aom_profile_directory>>))

			-- terminology file
			buffer.append (get_msg ({ADL_MESSAGES_IDS}.ec_terminology_location, <<terminology_directory>>))


			-- RM schemas info
			buffer.append ("%N" + get_text ({ADL_MESSAGES_IDS}.ec_rm_schemas_info_text))
			across bmm_models_access.bmm_models as loaded_rms_csr loop
				buffer.append ("%T" + loaded_rms_csr.key.as_string_8 + "%N")
			end

			-- repository & library info
			buffer.append ("%N" + get_text ({ADL_MESSAGES_IDS}.ec_repos_info_text))
			across archetype_repository_interfaces as rep_interfaces_csr loop
				buffer.append ("%T" + rep_interfaces_csr.item.local_directory + "%N")
				across rep_interfaces_csr.item.library_interfaces as lib_interfaces_csr loop
					lib_name := lib_interfaces_csr.item.key
					buffer.append ("%T%T" + if lib_name.is_equal (current_library_name) then "* " else "  " end + lib_name + "%N")
				end
			end

			std_out.put_string (buffer)
		end

	action_list_rms
		do
			across bmm_models_access.bmm_models as loaded_rms_csr loop
				std_out.put_string (loaded_rms_csr.key.as_string_8 + "%N")
			end
		end

	action_display_rm (an_rm: STRING)
		do
			buffer.wipe_out
			if bmm_models_access.bmm_models.has (an_rm) and then attached bmm_models_access.bmm_models.item (an_rm) as att_rm then
				populate_rm (att_rm)
			end
			std_out.put_string (buffer)
		end

	action_export_rms
		local
			use_schema_dir: BOOLEAN
			lib_name, full_output_dir, full_path, schema_file_path, export_dir: STRING
		do
			create export_dir.make_empty
			if attached opts.rm_export_directory as xd then
				export_dir := xd
				if not file_system.directory_exists (export_dir) then
					report_std_err (get_msg ({GENERAL_MESSAGES_IDS}.ec_directory_does_not_exist, <<export_dir>>))
				end
			else
				use_schema_dir := True
			end

			if not error_reported then
				across bmm_models_access.all_schemas as schemas_csr loop
					if schemas_csr.item.is_top_level then
						across odin_serialiser_file_extensions as fmt_csr loop
							-- construct the path part, including a /fmt at the end, e.g. /json etc
							schema_file_path := file_system.pathname (if use_schema_dir then file_system.dirname (schemas_csr.item.schema_path) else export_dir end, fmt_csr.key)

							-- now add the file name with an extension of the form .bmm.<fmt> e.g. .bmm.json to show it is a <fmt>
							-- serialisation of a BMM schema
							schema_file_path := file_system.pathname (schema_file_path, schemas_csr.key.as_string_8 + {BMM_DEFINITIONS}.bmm2_schema_file_extension + fmt_csr.item)

							report_std_out ("exported " + schemas_csr.key.as_string_8 + " in format " + fmt_csr.key + " to file " + schema_file_path)

							schemas_csr.item.export_schema (fmt_csr.key, schema_file_path)
						end
					end
				end
			end
		end

feature -- Archetype actions

	action_arch_display_library
		do
			buffer.wipe_out
			buffer.append (get_msg ({ADL_MESSAGES_IDS}.ec_archs_list_text, <<current_library_name>>))
			current_library.do_all_semantic (agent node_lister_enter, agent node_lister_exit)
			buffer.append (get_text ({ADL_MESSAGES_IDS}.ec_archs_list_text_end))
			std_out.put_string (buffer)
		end

feature {NONE} -- Implementation

	match_all_regex: STRING = ".*"

	report_std_out (str: STRING)
		do
			if opts.is_verbose then
				std_out.put_string (str)
				std_out.new_line
			end
		end

	report_std_err (str: STRING)
		do
			std_err.put_string (str)
			std_err.new_line
			error_reported := True
		end

	matched_archetype_ids: ARRAYED_LIST [STRING]
		attribute
			create Result.make (500)
		end

	compiler_archetype_gui_update (ara: ARCH_LIB_ARCHETYPE)
			-- Update UI with progress on build.
		do
			if opts.is_verbose and ara.is_in_terminal_compilation_state and not ara.is_valid then
				std_err.put_string ("---- " + ara.id.as_string + " ----%N")
				std_err.put_string (ara.errors.as_string_filtered (True, False, False))
			end
		end

	spaces: STRING = "                                                                 "

	dashes: STRING = "-----------------------------------------------------------------"

	node_lister_enter (aci: ARCH_LIB_ITEM)
			-- FIXME: at some point, implement a proper graphical tree in character graphics
			-- not using fixed length source strings!
		local
			id_str, src: STRING
		do
			node_depth := node_depth + 1
			if attached {ARCH_LIB_CLASS} aci as accn and then accn.has_artefacts or else attached {ARCH_LIB_ARCHETYPE} aci then
				buffer.append (spaces.substring (1, 4 * node_depth) + "+-- ")

				-- here we want to determine if we have a 'reference archetype', which is occurs in
				-- some archetype libraries. A reference archetype is considered to be like a class
				-- in the reference model, so we want to output it in upper case, in the same way
				-- the ADL Workbench does.
				if attached {ARCH_LIB_AUTHORED_ARCHETYPE} aci as auth_aca then
					-- generate source text, this will set the 'reference_archetype'
					-- flag in the archetype descriptor
					src := auth_aca.file_mgr.source_text
					if auth_aca.file_mgr.is_reference_archetype then
						id_str := aci.name.as_upper
					else
						id_str := aci.name
					end
				else
					id_str := aci.name
				end
				buffer.append (id_str + "%N")
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

	populate_rm (an_rm: BMM_MODEL)
		do
			across an_rm.packages as pkgs_csr loop
 				populate_rm_packages (pkgs_csr.item)
			end
		end

	populate_rm_packages (a_pkg: BMM_PACKAGE)
		do
			buffer.append (spaces.substring (1, 4 * rm_depth) + a_pkg.name + "%N")

			rm_depth := rm_depth + 1

			-- do the classes
			across a_pkg.classes as classes_csr loop
 				-- only do top classes in each package; if this class has an ancestor in the same package,
 				-- don't do this class, it will get taken care of via the parent
 				if not across classes_csr.item.ancestors as anc_csr some anc_csr.item.defining_class.package = a_pkg end then
	 				populate_rm_classes (classes_csr.item)
	 			end
			end

			-- do the child packages
			across a_pkg.packages as pkgs_csr loop
 				populate_rm_packages (pkgs_csr.item)
			end

			rm_depth := rm_depth - 1
		end

	populate_rm_classes (a_class_def: BMM_CLASS)
		do
			buffer.append (spaces.substring (1, 4 * rm_depth) + a_class_def.type.type_signature + "%N")

			-- do any descendants in same package
			rm_depth := rm_depth + 1
			across a_class_def.immediate_descendants as imm_descs_csr loop
				if imm_descs_csr.item.package_path.same_string (a_class_def.package_path) then
					populate_rm_classes (imm_descs_csr.item)
				end
			end
			rm_depth := rm_depth - 1
		end

	rm_depth: INTEGER

	buffer: STRING
		attribute
			create Result.make (50000)
		end

	error_reported: BOOLEAN


	opts: OPTIONS_PROCESSOR
		once
			create Result.make
			Result.set_is_usage_verbose (True)
			Result.set_is_usage_displayed_on_error (True)
		end

end
