note
	component:   "openEHR ADL Tools"
	description : "Term bindings injector"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	TERMINOLOGY_BINDINGS_INJECTOR

inherit
	CLI_COMMAND
		rename
			make as make_cli
		end

create
	make

feature -- Definitions

	Uri_leader: STRING = "http:"

feature -- Initialization

	make (a_term_binding_ns, an_input_file_path, an_output_dir: STRING; report_std_out_agt, report_std_err_agt: PROCEDURE [ANY, TUPLE[STRING]]; an_error_reported_agt: FUNCTION[ANY, TUPLE[], BOOLEAN])
		do
			term_binding_ns := a_term_binding_ns
			input_file_path := an_input_file_path
			make_cli (an_output_dir, report_std_out_agt, report_std_err_agt, an_error_reported_agt)
		end

feature -- Commands

	execute
			-- Inject terminology bindings from a file whose structure is
			-- {archetype_id,node_id,raw_code}
		local
			in_file: PLAIN_TEXT_FILE
			a_line, arch_code, binding_value, term_binding_uri_root: STRING
			strs: LIST[STRING]
			old_term_binding_uri, binding_uri: URI
			diff_arch: AUTHORED_ARCHETYPE
			ara: ARCH_LIB_AUTHORED_ARCHETYPE
		do
			if not error_reported then
				report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_term_bindings_start, <<term_binding_ns, input_file_path>>))

				create in_file.make(input_file_path)

				create last_arch_id.make_empty
				if in_file.exists then
					check attached code_systems.item(term_binding_ns) as uri_root then
						term_binding_uri_root := uri_root
					end
					in_file.open_read
					from until in_file.end_of_file loop
						in_file.read_line
						a_line := in_file.last_string
						if not a_line.is_whitespace then
							-- right adjust in case we are on Linux, and files were
							-- created on Windows, which means they will have a trailing CR
							a_line.right_adjust
							strs := a_line.split (',')

							arch_id := strs.i_th (1)
							if not arch_id.is_equal (last_arch_id) then
								-- save last archetype changes
								save_changes (ara)

								if current_library.has_archetype_with_id (arch_id) and then attached {ARCH_LIB_AUTHORED_ARCHETYPE} current_library.archetype_with_id (arch_id) as arch_desc then
									ara := arch_desc

									if attached {AUTHORED_ARCHETYPE} ara.differential_archetype as da then
										diff_arch := da
									else
										report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_archetype_in_memory_not_found, <<arch_id, current_library_name>>))
									end
								else
									report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_archetype_not_found, <<arch_id, current_library_name>>))
								end
							end

							if attached diff_arch then
								arch_code := strs.i_th (2)
								binding_value := strs.i_th (3)

								-- now process all the codes for this archetype
								if not binding_value.starts_with (Uri_leader) then
									create binding_uri.make_from_string (term_binding_uri_root + binding_value)
								else
									create binding_uri.make_from_string (binding_value)
								end

								if diff_arch.terminology.has_term_binding (term_binding_ns, arch_code) then
									old_term_binding_uri := diff_arch.terminology.term_binding (term_binding_ns, arch_code)
									if not old_term_binding_uri.is_equal(binding_uri) then
										diff_arch.terminology.replace_term_binding (binding_uri, term_binding_ns, arch_code)
										report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_replace_term_binding, <<term_binding_ns,
											old_term_binding_uri.as_string, arch_code, binding_uri.as_string, arch_id>>))
										inject_replace_count := inject_replace_count + 1
										save_required := True
									else
										inject_ignore_count := inject_ignore_count + 1
									end
								elseif diff_arch.terminology.has_code (arch_code) then
									diff_arch.terminology.put_term_binding (binding_uri, term_binding_ns, arch_code)
									inject_new_count := inject_new_count + 1
									save_required := True
								else
									report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_archetype_node_not_found, <<arch_id, arch_code, current_library_name>>))
								end
							end
						end
					end

					save_changes (ara)

					in_file.close

					report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_term_bindings_report, <<inject_new_count.out, term_binding_ns, inject_replace_count.out, arch_count.out, inject_ignore_count.out>>))
				end
			end
		end

feature {NONE} -- Implementation

	save_changes (ara: detachable ARCH_LIB_AUTHORED_ARCHETYPE)
		do
			if save_required and attached ara and then attached ara.differential_archetype then
				ara.save_differential_text
				arch_count := arch_count + 1
				last_arch_id := arch_id
				save_required := False
			end
		end

	arch_count, inject_new_count, inject_replace_count, inject_ignore_count: INTEGER

	last_arch_id: STRING
		attribute
			create Result.make(0)
		end

	arch_id: STRING
		attribute
			create Result.make(0)
		end

	term_binding_ns: STRING
		attribute
			create Result.make(0)
		end

	input_file_path: STRING
		attribute
			create Result.make(0)
		end

	save_required: BOOLEAN

end
