note
	component:   "openEHR ADL Tools"
	description: "[
				 Access object for archetype repository. A 'repository' is assumed to contain one
				 or more 'libraries' where a 'library' is a logical collection of archetypes.

				 At the root of the repository will be a file whose name is
				 ]"
	keywords:    "ADL, archetype, repository"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_REPOSITORY_ACCESS

inherit
	ANY_VALIDATOR

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		end

	ADL_COMPILED_MESSAGE_IDS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	rep_file_name: STRING = "_repo.idx"
			-- name of definition file at root point of repository

feature -- Initialisation

	make (a_dir: STRING)
		do
			rep_directory := a_dir
			rep_file_path := a_dir + xxxx + rep_file_name
		end

feature -- Access

	rep_directory: STRING
			-- repository root directory

	rep_file_path: STRING
			-- path to file

	repository: detachable ARCHETYPE_REPOSITORY_DEFINITION

--	libraries: HASH_TABLE [ARCHETYPE_LIBRARY_DEFINITION, STRING]
			-- list of libraries under this repository

feature {ARCHETYPE_REPOSITORY_ACCESS} -- Commands

	load
			-- load resource into in-memory form
		local
			rep_file: PLAIN_TEXT_FILE
		do
			reset
			repository := Void
			create rep_file.make (rep_file_path)
			if not rep_file.exists or else not rep_file.is_readable then
				add_error (ec_arch_repository_file_not_valid, <<path>>)
			else
				rep_file.open_read
				rep_file.read_stream (rep_file.count)
				parser.execute (rep_file.last_string, 1)
				if not parser.syntax_error and then attached parser.output as dt_tree then
					if not attached {ARCHETYPE_REPOSITORY_DEFINITION} dt_tree.as_object_from_string (({ARCHETYPE_REPOSITORY_DEFINITION}).name, Void) as arch_rep then
						add_error (ec_arch_repository_load_failure_exception, <<path>>)
					elseif dt_object_converter.errors.has_errors then
						add_error (ec_arch_repository_conv_fail_err, <<path, dt_object_converter.errors.as_string>>)
					else
						arch_rep.set_file_path (path)
						repository := arch_rep
						passed := True
					end
				else
					add_error (ec_arch_rep_load_failure, <<path, parser.errors.as_string>>)
				end
				rep_file.close
			end
		ensure
			attached repository or else has_errors
		end

feature -- Validation

	validate
		do
			if attached repository as prf then
				if prf.ready_to_validate then
					prf.validate
				end
				merge_errors (prf.errors)
			end
		end

feature {NONE} -- Implementation

	parser: ODIN_PARSER
		once
			create Result.make
		end

end



