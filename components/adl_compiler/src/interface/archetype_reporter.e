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

feature -- Access

	reports: HASH_TABLE [ARCHETYPE_LIBRARY_REPORT, STRING]
		local
			report1: LOINC_ARCHETYPE_MAP_REPORT
			report2: ID_CODE_REPORT
			report3: ARCH_ID_TO_TPL_ID_REPORT
			report4: VALUE_SETS_REPORT
		once
			create Result.make(0)

			create report1.make
			Result.put (report1, report1.title)

			create report2.make
			Result.put (report2, report2.title)

			create report3.make
			Result.put (report3, report3.title)

			create report3.make
			Result.put (report3, report3.title)

			create report4.make
			Result.put (report4, report4.title)
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
			if attached text_quoting_agents.item (syntax) as agt then
				text_quote_agent := agt
			end

			artefact_count := current_library.archetype_count

			across reports as rpts_csr loop
				rpts_csr.item.initialise (text_quote_agent)
			end
		end

	do_finalise_build
		local
			col_vals, output_filename, file_ext: STRING
		do
			across reports as rpts_csr loop
				-- use CSV for table
				if not rpts_csr.item.output_table.is_empty then
					file_ext := file_ext_csv
				-- and JSON for tree
				elseif rpts_csr.item.output_tree.is_identified then
					file_ext := {ODIN_DEFINITIONS}.file_ext_json_default
				else
					file_ext := file_ext_csv
				end

				output_filename := file_system.pathname (output_dir, rpts_csr.item.id) + file_ext

				if attached file_system.new_output_file (output_filename) as fd then
					fd.open_write

					-- process to CSV
					if file_ext.is_equal (file_ext_csv) then
						output_to_csv (rpts_csr.item, fd)

					-- process to JSON
					elseif file_ext.is_equal ({ODIN_DEFINITIONS}.file_ext_json_default) then
						output_to_json (rpts_csr.item, fd)
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
		local
			dir: DIRECTORY
		do
			if not directory_exists (args.export_dir) then
				-- TODO: revert when original call no longer causes OS faults
				-- file_system.recursive_create_directory (args.export_dir)
				create dir.make (args.export_dir)
				dir.recursive_create_dir
			end
			Result := reporting_file_extensions.has(args.syntax) and directory_exists (args.export_dir)
		end

feature {NONE} -- Build State

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

	text_quote_agent: FUNCTION [ANY, TUPLE[STRING], STRING]
			-- function to use to quote output format
		attribute
			Result := default_text_quoting_agent
		end

	output_to_csv (rpt: ARCHETYPE_LIBRARY_REPORT; fd: KI_TEXT_OUTPUT_FILE)
		local
			col_vals: STRING
		do
			across rpt.output_table as row_csr loop
				create col_vals.make_empty
				across row_csr.item as cols_csr loop
					check attached {STRING} cols_csr.item as s then
						col_vals.append (s)
						if not cols_csr.is_last then
							col_vals.append_character (Csv_default_delimiter)
						end
					end
				end
				fd.put_string (col_vals + "%N")
			end
		end

	output_to_json (rpt: ARCHETYPE_LIBRARY_REPORT; fd: KI_TEXT_OUTPUT_FILE)
		local
			fac: JSON_SERIALIZATION_FACTORY
			conv: JSON_SERIALIZATION
		do
			conv := fac.smart_serialization
			conv.set_pretty_printing

			if attached conv.to_json_string (rpt.output_tree) as s then
				fd.put_string (s)
			end
		end

end
