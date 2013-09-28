note
	component:   "openEHR ADL Tools"
	description: "Descriptor object for an AOM_PROFILE object."
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PROFILE_DESCRIPTOR

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

feature -- Initialisation

	make (a_path: STRING)
		do
			profile_path := a_path
		end

feature -- Identification

	profile_path: STRING

feature -- Access

	profile: detachable AOM_PROFILE

feature {AOM_PROFILES_ACCESS} -- Commands

	load
			-- load profile into in-memory form
		local
			prf_file: PLAIN_TEXT_FILE
		do
			reset
			profile := Void
			create prf_file.make (profile_path)
			if not prf_file.exists or else not prf_file.is_readable then
				add_error (ec_aom_profile_file_not_valid, <<profile_path>>)
			else
				prf_file.open_read
				prf_file.read_stream (prf_file.count)
				parser.execute (prf_file.last_string, 1)
				if not parser.syntax_error and then attached parser.output as dt_tree then
					if not attached {AOM_PROFILE} dt_tree.as_object_from_string (({AOM_PROFILE}).name, Void) as aom_prf then
						add_error (ec_aom_profile_load_failure_exception, <<profile_path>>)
					elseif dt_object_converter.errors.has_errors then
						add_error (ec_aom_profile_conv_fail_err, <<profile_path, dt_object_converter.errors.as_string>>)
					else
						aom_prf.set_file_path (profile_path)
						profile := aom_prf
						passed := True
					end
				else
					add_error (ec_aom_profile_load_failure, <<profile_path, parser.errors.as_string>>)
				end
				prf_file.close
			end
		ensure
			attached profile or else has_errors
		end

feature -- Validation

	validate
		do
			if attached profile as prf then
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



