note
	component:   "openEHR ADL Tools"
	description : "Terminology bindings exporter"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@graphitehealth.io>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024- Graphite Health <http://www.GraphiteHealth.io>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	TERMINOLOGY_BINDINGS_EXPORTER

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
			namespace, output_filename: STRING
			row_str: STRING
			binding_count: INTEGER
		do
			report_std_out ("--------- Exporting terminology bindings to " + output_dir + "---------")

			output_tables.wipe_out

			current_library.do_all_semantic (agent arch_enter, agent arch_exit)

			-- iterate through the output table
			across output_tables as term_namespaces_csr loop
				binding_count := 0
				namespace := term_namespaces_csr.key
				output_filename := file_system.pathname (output_dir, namespace + "_bindings.csv")
				out_file := file_system.new_output_file (output_filename)

				out_file.open_write
				across term_namespaces_csr.item as row_csr loop
					binding_count := binding_count + 1
					create row_str.make_empty
					row_str.append (row_csr.item.arch_id); row_str.append_character (Csv_default_delimiter)
					row_str.append (row_csr.item.id_code); row_str.append_character (Csv_default_delimiter)
					row_str.append (row_csr.item.binding_value + "%N")
					out_file.put_string (row_str)
				end
				out_file.close

				report_std_out ("    Exported terminology " + binding_count.out + " " + namespace + " bindings%N")
			end
		end

feature {NONE} -- Commands

	output_tables: HASH_TABLE [ARRAYED_LIST[TUPLE [arch_id, id_code, binding_value: STRING]], STRING]
		once
			create Result.make(0)
		end

feature {NONE} -- Implementation

	output_dir: STRING

	arch_enter (aci: ARCH_LIB_ITEM)
		local
			terminology: ARCHETYPE_TERMINOLOGY
			namespace: STRING
			out_table: ARRAYED_LIST[TUPLE [arch_id, id_code, binding_value: STRING]]
		do
			if attached {ARCH_LIB_ARCHETYPE} aci as auth_aca then
				if attached auth_aca.differential_archetype as diff_arch then
					terminology := diff_arch.terminology
					across terminology.term_bindings as term_namespaces_csr loop
						namespace := term_namespaces_csr.key
						if not output_tables.has (namespace) then
							create out_table.make(0)
							output_tables.put (out_table, namespace)
						end
						out_table := output_tables.item (namespace)

						-- process bindings for a namespace
						across term_namespaces_csr.item as term_bindings_csr loop
							out_table.extend ([auth_aca.id.as_string, term_bindings_csr.key, term_bindings_csr.item.as_string])
						end
					end
				end
			end
		end

	arch_exit (aci: ARCH_LIB_ITEM)
		do
		end

end
