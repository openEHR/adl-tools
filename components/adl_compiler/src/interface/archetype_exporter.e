note
	component:   "openEHR ADL Tools"
	description: "[
				 Archetype exporter interface. This object knows how to export a system of archetypes
				 found in the current ARCHETYPE_LIBRARY.
				 ]"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_EXPORTER

inherit
	BUILD_MANAGER
		redefine
			valid_setup_args, build_args_type
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

feature {NONE} -- Initialisation

	make
		do
		end

feature {NONE} -- Commands

	do_setup_build (args: like build_args_type)
			-- set up specific build parameters
		do
			export_dir := args.export_dir
			syntax := args.syntax
			export_flat := args.export_flat
			export_with_rm := args.export_with_rm

			artefact_count := current_library.archetype_count
		end

	console_start_progress_message: STRING
		do
			Result := get_msg ({ADL_MESSAGES_IDS}.ec_compiler_export, <<syntax, export_dir>>)
		end

	console_finish_progress_message: STRING
		do
			Result := get_text ({ADL_MESSAGES_IDS}.ec_compiler_finished_export)
		end

	console_interrupted_message: STRING
		do
			Result := get_text ({ADL_MESSAGES_IDS}.ec_compiler_interrupted)
		end

feature {NONE} -- Commands

	do_build_all
			-- Generate `syntax' serialisation of archetypes under `an_export_dir' from all archetypes that have already been built.
		do
			current_library.do_all_archetypes (agent export_archetype)
		end

	valid_setup_args (args: like build_args_type): BOOLEAN
		do
			if not directory_exists (args.export_dir) then
				file_system.recursive_create_directory (args.export_dir)
			end
			Result := has_serialiser_format (args.syntax) and directory_exists (args.export_dir)
		end

feature {NONE} -- Build State

	export_dir: STRING
			-- export directory
		attribute
			create Result.make_empty
		end

	syntax: STRING
			-- syntax to export in
		attribute
			create Result.make_empty
		end

	export_flat: BOOLEAN
		-- true if exporting flat form archetypes

	export_with_rm: BOOLEAN
		-- True if exporting flat form with RM included

feature {NONE} -- Implementation

	export_archetype (ara: ARCH_LIB_ARCHETYPE)
			-- Generate serialised output under `export_dir' from `ara', optionally building it first if necessary.
		local
			filename, exc_trace_str: STRING
			exception_encountered: BOOLEAN
		do
			if not exception_encountered then
				if not is_interrupted then
					if attached {ARCH_LIB_AUTHORED_ARCHETYPE} ara as auth_ara and then auth_ara.is_valid then
						check attached archetype_file_extensions.item (syntax) as ext then
							filename := file_system.pathname (export_dir, ara.id.as_filename) + ext
						end
						if export_flat then
							auth_ara.save_flat_as (filename, syntax)
						else
							auth_ara.save_differential_as (filename, syntax)
						end
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

	build_args_type: TUPLE [export_dir, syntax: STRING; export_flat, export_with_rm: BOOLEAN]
		do
			create Result
		end

end
