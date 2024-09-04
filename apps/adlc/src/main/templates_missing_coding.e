note
	component:   "openEHR ADL Tools"
	description :"Extract missing LOINC codes and missing value-sets for all templates"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@graphitehealth.io>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024- Graphite Health <http://www.GraphiteHealth.io>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	TEMPLATES_MISSING_CODING

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
			output_filename: STRING
			fac: JSON_SERIALIZATION_FACTORY
			conv: JSON_SERIALIZATION
		do
			report_std_out ("--------- Exporting templates missing coding to " + output_dir + "---------")

			current_library.do_for_all_templates (agent tpl_get_missing_codes)

			output_filename := file_system.pathname (output_dir, "Template_missing_codes.json")
			out_file := file_system.new_output_file (output_filename)

			out_file.open_write

			conv := fac.smart_serialization
			conv.set_pretty_printing
			conv.context.serializer_context.set_is_type_name_included (False)

			if attached conv.to_json_string (missing_codes_reports) as s then
				out_file.put_string (s)
			end

			out_file.close

			-- report_std_out ("    Exported " + binding_count.out + " " + namespace + " bindings%N")
		end

feature {NONE} -- Implementation

	output_dir: STRING

	missing_codes_reports: STRING_TABLE [STRING_TABLE [ARCHETYPE_MISSING_CODES_REPORT]]
			-- reports of archetypes missing coding, keyed by template id
		attribute
			create Result.make(0)
		end

	tpl_get_missing_codes (aci: ARCH_LIB_TEMPLATE)
		local
			missing_codes_visitor: MISSING_CODES_VISITOR
			c_iterator: OG_CONTENT_ITERATOR
		do
			if aci.is_valid then
				create missing_codes_visitor
				missing_codes_visitor.initialise (aci.opt)
				create c_iterator.make (aci.opt.definition.representation, missing_codes_visitor)
				c_iterator.do_all
				missing_codes_visitor.finalise

				missing_codes_reports.put (missing_codes_visitor.missing_codes_report, aci.id.as_string)
			end
		end

end
