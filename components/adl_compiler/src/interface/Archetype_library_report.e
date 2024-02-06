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

	Text_field_delimiter: STRING = "/"

feature -- Access

	id: STRING
		deferred
		end

	title: STRING
		deferred
		end

	output_table: ARRAYED_LIST[TUPLE]
		once
			create Result.make(0)
		end

	output_tree: REPORT_DATA
		once
			create Result
		end

feature {NONE} -- Initialisation

	make
		do
		end

feature {ARCHETYPE_REPORTER} -- Processing

	initialise (a_text_quote_agent: like text_quote_agent)
		do
			output_table.wipe_out
			text_quote_agent := a_text_quote_agent
		end

	finalise
		do
		end

	process_archetype (auth_ara: ARCH_LIB_AUTHORED_ARCHETYPE)
		require
			auth_ara.is_valid
		deferred
		end

feature {NONE}

	text_quote_agent: FUNCTION [ANY, TUPLE[STRING], STRING]
			-- function to use to quote output format
		attribute
			Result := default_text_quoting_agent
		end

end
