note
	component:   "openEHR ADL Tools"
	description : "Terminology bindings exporter"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@graphitehealth.io>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024- Graphite Health <http://www.GraphiteHealth.io>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	ARCHETYPE_LIBRARY_STATS_REPORT_BUILDER

inherit
	CLI_COMMAND
		rename
			make as make_cli
		end

create
	make

feature -- Initialization

	make (an_output_dir: STRING; report_std_out_agt, report_std_err_agt: PROCEDURE [ANY, TUPLE[STRING]]; an_error_reported_agt: FUNCTION[ANY, TUPLE[], BOOLEAN])
		do
			make_cli (report_std_out_agt, report_std_err_agt, an_error_reported_agt)

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
			-- export all term bindings into one files per terminology namespace
			-- Each file is a CSV file of the form
			--     archetype_id, archetype_node_id, binding_value
		local
			out_file: KI_TEXT_OUTPUT_FILE
			row_str: STRING
			arch_stats_report: ARCHETYPE_LIBRARY_STATS_REPORT
			arch_lib_stats: ARCHETYPE_LIBRARY_STATISTICS
		do
			report_std_out ("--------- Writing statistical report to " + output_dir + "---------")

			create arch_stats_report.make ("Arch_lib_stats_report")
			arch_stats_report.compilation_statistics.merge (current_library.compilation_statistics)
			across current_library.archetype_statistics as reports_csr loop
				create arch_lib_stats.make (current_library_name, reports_csr.key)
				arch_lib_stats.add_model_statistics (reports_csr.item.archetype_metrics)
				arch_stats_report.add_models_report (arch_lib_stats, reports_csr.key)
			end

			out_file := file_system.new_output_file (file_system.pathname (output_dir, arch_stats_report.id + ".json"))
			out_file.open_write
			output_to_json (arch_stats_report, out_file)
			out_file.close
		end

feature {NONE} -- Commands

	output_dir: STRING

	output_to_json (rpt: REPORT_DATA; fd: KI_TEXT_OUTPUT_FILE)
		local
			fac: JSON_SERIALIZATION_FACTORY
			conv: JSON_SERIALIZATION
		do
			conv := fac.smart_serialization
			conv.set_pretty_printing
			conv.context.serializer_context.set_is_type_name_included (False)

			if attached conv.to_json_string (rpt) as s then
				fd.put_string (s)
			end
		end

end
