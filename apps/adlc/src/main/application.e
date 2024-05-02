note
	component:   "openEHR ADL Tools"
	description : "[
				   Command-line form of the compiler.
				   
					USAGE:
					   adlc [-q] -s
					   adlc [-q] -L
					   adlc [-q] -D
					   adlc [-q] -X
					   adlc [-q] -b <library name> -l [<id_pattern>]
					   adlc [-q] -b <library name> -d [<id_pattern>]
					   adlc [-q] -b <library name> [-f <format>] --report [-o <output_dir>]
					   adlc [-q] -b <library name> --inject_loinc -i <loinc_file>
					   adlc [-q] -b <library name> [--flat] [--cfg <file path>] [-f <format>] -a <action> [-o <output_dir>] [<id_pattern>]

					OPTIONS:
					   Options should be prefixed with: '-' or '/'

					   -q --quiet             : suppress verbose feedback, including configuration information on startup (Optional)
					      --flat              : use flat form of archetype[s] for actions, e.g. path extraction etc (Optional)
					   -s --show_config       : show current configuration and defaults

					   -L --list_rms          : generate list of reference models.
					   -D --display_rms		  : generate view of reference models user-friendly format
					   -X --export_rms        : export reference models in all available formats (JSON, ODIN, etc)

					   -l --list_archetypes   : generate list of archetypes in current library (use for further processing)
					   -d --display_archetypes: generate list of archetypes in current library in user-friendly format
					   -b --library           : library to use
					                            <library name>: library name
					   -f --format            : output format for generated files (Optional)
					                            <format>: file formats: json|adl|odin|yaml|xml|csv (default = adl or csv)
					      --cfg               : output default configuration file location (Optional)
					                            <file path>: .cfg file path
					   -x --export            : export matching archetypes in specified format
					   -r --report            : generate reports in specified format
					   -o --output            : output directory to write files to; '.' for current directory
					      --inject_loinc      : read <loinc_file>, which is formatted as {archetype_id,id_code,loinc_code} and 
					                            inject bindings from loinc codes to id-codes
					   
					   -? --help              : Display usage information. (Optional)

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

	ODIN_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialization

	make
			-- Run application.
		do
			app_root.initialise_shell
			if app_root.ready_to_initialise_app then
				opts.execute (agent start)
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

	start
		local
			curr_repo, action, report: STRING
			aca: ARCH_LIB_ARCHETYPE
			full_path, schema_file_path, export_dir: STRING
			finished: BOOLEAN
		do
			report_std_out ("Initialising... ")

			app_root.initialise_app

			if not app_root.has_errors then
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
								report_std_out ("--------- Building all ---------")
								archetype_compiler.setup_build ([False])
								archetype_compiler.build_all

								if opts.display_archetypes then
									action_arch_display_library

								elseif opts.export_archetypes then
									export_library

								elseif opts.report then
									generate_library_reports

								elseif opts.inject_loinc_bindings then
									inject_loinc_bindings
								end
							end
						end
					else
						report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_lib_does_not_exist_err, <<att_lib>>))
					end
				end
			else
				report_std_err (app_root.error_strings)
				across bmm_models_access.all_schemas as schemas_csr loop
					if schemas_csr.item.has_errors then
						report_std_err ("========== Schema validation errors for " + schemas_csr.key.as_string_8 + " ===========")
						report_std_err (schemas_csr.item.errors.as_string)
					end
				end
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
				archetype_exporter.setup_build ([full_output_dir, output_format, opts.use_flat_source, opts.include_rm_multiplicities])
				archetype_exporter.build_all
			end
		end

	generate_library_reports
		local
			lib_name, full_output_dir, full_path, schema_file_path, export_dir: STRING
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
		end

	Loinc_uri_root: STRING = "http://loinc.org/"

	inject_loinc_bindings
			-- Inject LOINC bindings from a file whose structure is
			-- {archetype_id,node_id,loinc_code}
		local
			last_arch_id, input_file_path: STRING
			in_file: PLAIN_TEXT_FILE
			a_line, arch_id, id_code, loinc_code: STRING
			strs: LIST[STRING]
			ara: ARCH_LIB_AUTHORED_ARCHETYPE
			old_loinc_binding_uri, binding_uri: URI
			diff_arch: AUTHORED_ARCHETYPE
			arch_count, inject_new_count, inject_replace_count, inject_ignore_count: INTEGER
			save_required: BOOLEAN
		do
			-- OPTION: input file
			create input_file_path.make_empty
			if attached opts.input_file as att_if then
				if file_system.is_absolute_pathname (att_if) then
					input_file_path := att_if
				else
					input_file_path := file_system.pathname (file_system.current_working_directory, att_if)
				end

				if not file_system.file_exists (input_file_path) then
					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_invalid_input_file, <<input_file_path>>))
				end

				report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_loinc_start, <<input_file_path>>))

				create in_file.make(input_file_path)

				create last_arch_id.make_empty
				if in_file.exists then
					in_file.open_read
					from until in_file.end_of_file loop
						in_file.read_line
						a_line := in_file.last_string
						if not a_line.is_whitespace then
							-- right adjust in case we are on Linux, and files were
							-- created on Windows, which means they will have a trailing CR
							a_line.right_adjust
							strs := a_line.split (',')

							arch_id := strs.i_th (1)
							if not arch_id.is_equal (last_arch_id) then
								-- save last archetype changes
								if save_required and attached ara and then attached ara.differential_archetype then
									ara.save_differential_text
									arch_count := arch_count + 1
									last_arch_id := arch_id
									save_required := False
								end

								if current_library.has_archetype_with_id (arch_id) and then attached {ARCH_LIB_AUTHORED_ARCHETYPE} current_library.archetype_with_id (arch_id) as arch_desc then
									ara := arch_desc

									if attached {AUTHORED_ARCHETYPE} ara.differential_archetype as da then
										diff_arch := da
									else
										report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_archetype_in_memory_not_found, <<arch_id, current_library_name>>))
									end
								else
									report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_archetype_not_found, <<arch_id, current_library_name>>))
								end
							end

							if attached diff_arch then
								id_code := strs.i_th (2)
								loinc_code := strs.i_th (3)

								-- now process all the codes for this archetype
								create binding_uri.make_from_string (Loinc_uri_root + loinc_code)
								if diff_arch.terminology.has_term_binding ({OPENEHR_DEFINITIONS}.Loinc_terminology_id, id_code) then
									old_loinc_binding_uri := diff_arch.terminology.term_binding ({OPENEHR_DEFINITIONS}.Loinc_terminology_id, id_code)
									if not old_loinc_binding_uri.is_equal(binding_uri) then
										diff_arch.terminology.replace_term_binding (binding_uri, {OPENEHR_DEFINITIONS}.Loinc_terminology_id, id_code)
										report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_loinc_replace_binding, <<{OPENEHR_DEFINITIONS}.Loinc_terminology_id,
											old_loinc_binding_uri.as_string, id_code, binding_uri.as_string, arch_id>>))
										inject_replace_count := inject_replace_count + 1
										save_required := True
									else
										inject_ignore_count := inject_ignore_count + 1
									end
								elseif diff_arch.terminology.has_id_code (id_code) then
									diff_arch.terminology.put_term_binding (binding_uri, {OPENEHR_DEFINITIONS}.Loinc_terminology_id, id_code)
									inject_new_count := inject_new_count + 1
									save_required := True
								else
									report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_archetype_node_not_found, <<arch_id, id_code, current_library_name>>))
								end
							end
						end
					end

					in_file.close

					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_loinc_report, <<inject_new_count.out, inject_replace_count.out, inject_ignore_count.out, arch_count.out>>))
				end
			end
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

	opts: OPTIONS_PROCESSOR
		once
			create Result.make
			Result.set_is_usage_verbose (True)
			Result.set_is_usage_displayed_on_error (True)
		end

	compiler_archetype_gui_update (ara: ARCH_LIB_ARCHETYPE)
			-- Update UI with progress on build.
		do
			if opts.is_verbose and ara.is_in_terminal_compilation_state and not ara.is_valid then
				std_err.put_string (ara.error_strings)
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

end
