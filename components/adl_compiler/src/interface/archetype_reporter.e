note
	component:   "openEHR ADL Tools"
	description: "[
				 Archetype reporting interface. This object knows how to generate reports on a system of archetypes
				 found in the current ARCHETYPE_LIBRARY.
				 ]"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_REPORTER

inherit
	BUILD_MANAGER
		redefine
			valid_setup_args, build_args_type, do_finalise_build
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
		undefine
			is_equal
		end

	EXCEPTIONS
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		undefine
			default_create, copy
		end

create
	make

feature -- Definitions

	Report_name: STRING = "Loinc_archetype_id_map"

feature {NONE} -- Initialisation

	make
		do
		end

feature -- Commands

	build_artefact (ara: ARCH_LIB_ARCHETYPE)
		do
			process_archetype (ara)
		end

feature {NONE} -- Commands

	do_setup_build (args: like build_args_type)
			-- set up specific build parameters
		do
			output_dir := args.export_dir
			syntax := args.syntax

			artefact_count := current_library.archetype_count

			across reports as rpts_csr loop
				rpts_csr.item.initialise
			end
		end

	do_finalise_build
		local
			col_vals: STRING
			output_filename: STRING
		do
			across reports as rpts_csr loop
				check attached reporting_file_extensions.item(syntax) as fmt then
					output_filename := file_system.pathname (output_dir, rpts_csr.key) + fmt
				end

				if attached file_system.new_output_file (output_filename) as fd then
					fd.open_write

					-- process rows
					across rpts_csr.item.output_table as row_csr loop
						create col_vals.make_empty
						across row_csr.item as cols_csr loop
							check attached {STRING} cols_csr.item as s then
								col_vals.append (s)
								if not cols_csr.is_last then
									col_vals.append (Csv_default_delimiter)
								end
							end
						end
						fd.put_string (row_csr.key + Csv_default_delimiter + col_vals + "%N")
					end
					fd.close
				end
			end
		end

	console_start_progress_message: STRING
		do
			Result := get_msg ({ADL_MESSAGES_IDS}.ec_compiler_export, <<syntax, output_dir>>)
		end

	console_finish_progress_message: STRING
		do
			Result := get_text ({ADL_MESSAGES_IDS}.ec_compiler_finished_export)
		end

	console_interrupted_message: STRING
		do
			Result := get_text ({ADL_MESSAGES_IDS}.ec_compiler_interrupted)
		end

	do_build_all
			-- Generate `syntax' serialisation of archetypes under `an_export_dir' from all archetypes that have already been built.
		do
			current_library.do_all_archetypes (agent process_archetype)
		end

	valid_setup_args (args: like build_args_type): BOOLEAN
		do
			if not directory_exists (args.export_dir) then
				file_system.recursive_create_directory (args.export_dir)
			end
			Result := reporting_file_extensions.has(args.syntax) and directory_exists (args.export_dir)
		end

feature {NONE} -- Build State

	reports: HASH_TABLE [ARCHETYPE_LIBRARY_REPORT, STRING]
		local
			report1: LOINC_ARCHETYPE_MAP_REPORT
		once
			create Result.make(0)
			create report1.make
			Result.put (report1, report1.title)
		end

	output_dir: STRING
		attribute
			create Result.make_empty
		end

	syntax: STRING
			-- syntax to export in
		attribute
			create Result.make_empty
		end

feature {NONE} -- Implementation

	process_archetype (ara: ARCH_LIB_ARCHETYPE)
			-- Generate serialised output under `output_dir' from `ara', optionally building it first if necessary.
		do
			across reports as rpts_csr loop
				report_process_archetype (rpts_csr.item, ara)
			end
		end

	report_process_archetype (report: ARCHETYPE_LIBRARY_REPORT; ara: ARCH_LIB_ARCHETYPE)
			-- Generate serialised output under `output_dir' from `ara', optionally building it first if necessary.
		local
			exc_trace_str: STRING
			exception_encountered: BOOLEAN
		do
			if not exception_encountered then
				if not is_interrupted then
					if attached {ARCH_LIB_AUTHORED_ARCHETYPE} ara as auth_ara and then auth_ara.is_valid then
						report.process_archetype (auth_ara)
						update_progress
					end
				end
			end
		rescue
			if attached exception_trace as et then
				exc_trace_str := et
			else
				create exc_trace_str.make_from_string ("(Exception trace not available)")
			end
			call_console_update_agent (get_msg ({ADL_MESSAGES_IDS}.ec_export_exception, <<ara.qualified_name, exception.out, exc_trace_str>>))
			exception_encountered := True
			retry
		end

	build_args_type: TUPLE [export_dir, syntax: STRING]
		do
			create Result
		end

end
