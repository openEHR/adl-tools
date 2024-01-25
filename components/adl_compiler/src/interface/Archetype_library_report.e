note
	component:   "openEHR ADL Tools"
	description: "[
				 Abstract reporter that runs on the current ARCHETYPE_LIBRARY.
				 ]"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@Graphitehealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCHETYPE_LIBRARY_REPORT

inherit
	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

feature -- Definitions

	id: STRING
		deferred
		end

	title: STRING
		deferred
		end

	output_table: HASH_TABLE[TUPLE, STRING]
		once
			create Result.make(0)
		end

feature {NONE} -- Initialisation

	make
		do
		end

feature {ARCHETYPE_REPORTER} -- Processing

	initialise
		do
		end

	finalise
		do
		end

	process_archetype (auth_ara: ARCH_LIB_AUTHORED_ARCHETYPE)
		require
			auth_ara.is_valid
		deferred
		end

end
