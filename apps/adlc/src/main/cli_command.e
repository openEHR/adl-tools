note
	component:   "openEHR ADL Tools"
	description : "Term bindings injector"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class
	CLI_COMMAND

inherit
	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

	SHARED_CODE_SYSTEMS

feature -- Initialization

	make (an_output_dir: STRING; report_std_out_agt, report_std_err_agt: PROCEDURE [ANY, TUPLE[STRING]]; an_error_reported_agt: FUNCTION[ANY, TUPLE[], BOOLEAN])
		do
			std_out_agt := report_std_out_agt
			std_err_agt := report_std_err_agt
			error_reported_agt := an_error_reported_agt

			output_dir := an_output_dir
			if not file_system.is_absolute_pathname (output_dir) then
				output_dir := file_system.pathname (file_system.current_working_directory, output_dir)
			end
			file_system.recursive_create_directory (output_dir)
			if not file_system.directory_exists (output_dir) then
				report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_invalid_output_directory, <<output_dir>>))
			end
		end

feature -- Commands

	execute
		deferred
		end

feature {NONE} -- Implementation

	output_dir: STRING

	report_std_out (str: STRING)
		do
			std_out_agt.call([str])
		end

	report_std_err (str: STRING)
		do
			std_err_agt.call([str])
		end

	error_reported: BOOLEAN
		do
			Result := error_reported_agt.item([])
		end

	std_out_agt: PROCEDURE [ANY, TUPLE[STRING]]

	std_err_agt: PROCEDURE [ANY, TUPLE[STRING]]

	error_reported_agt: FUNCTION [ANY, TUPLE[], BOOLEAN]

end
