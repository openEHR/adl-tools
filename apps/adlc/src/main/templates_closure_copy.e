note
	component:   "openEHR ADL Tools"
	description :"Extract missing LOINC codes and missing value-sets for all templates"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@graphitehealth.io>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024- Graphite Health <http://www.GraphiteHealth.io>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	TEMPLATES_CLOSURE_COPY

inherit
	CLI_COMMAND
		rename
			make as make_cli
		end

create
	make

feature -- Initialization

	make (an_output_dir, a_source_repo, a_target_repo: STRING; report_std_out_agt, report_std_err_agt: PROCEDURE [ANY, TUPLE[STRING]]; an_error_reported_agt: FUNCTION[ANY, TUPLE[], BOOLEAN])
		do
			make_cli (report_std_out_agt, report_std_err_agt, an_error_reported_agt)

			source_repo := a_source_repo

			target_repo := a_target_repo

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
			output_filename, tgt_path, tgt_dirname, str: STRING
		do
			report_std_out ("--------- Generating templates closure copy script " + output_dir + "---------")

			current_library.do_for_all_templates (agent tpl_get_archetype_closure)

			output_filename := file_system.pathname (output_dir, "template_copy_script.sh")
			out_file := file_system.new_output_file (output_filename)

			out_file.open_write

			-- build script
			create str.make_empty
			str.append ("#!/bin/bash%N")
			str.append ("if [ ! -d " + target_repo + " ]; then%N")
			str.append ("    echo %"target repo " + target_repo + " not found; exiting%"%N")
			str.append ("    exit 1%N")
			str.append ("fi%N")

			across path_map as paths_csr loop
				tgt_path := paths_csr.item
				tgt_dirname := file_system.dirname (tgt_path)

				-- don't overwrite existing
				str.append ("if [ ! -f " + tgt_path + " ]; then%N")

				--output a mkdir -p command to make sure target directory exists
				str.append ("    mkdir -p " + tgt_dirname + " && ")

				-- output a copy command of form 'cp source target'
				str.append ("    cp " + paths_csr.key.to_string_8 + " " + tgt_path + "%N")
				str.append ("fi%N")
			end

			-- replace local OS dir sep character with Unix dir separator
			if {OPERATING_ENVIRONMENT}.directory_separator /= {PATH}.unix_separator then
				str.replace_substring_all ({OPERATING_ENVIRONMENT}.directory_separator.out, {PATH}.unix_separator.out)
			end

			out_file.put_string (str)

			out_file.close
		end

feature {NONE} -- Implementation

	output_dir: STRING

	source_repo: STRING
			-- name of source repository

	target_repo: STRING
			-- name of target repository

	path_map: STRING_TABLE[STRING]
			-- table of target path keyed by source path
		attribute
			create Result.make(0)
		end

	arch_list: ARRAYED_LIST[STRING]
			-- list of archetypes processed so far
		attribute
			create Result.make(0)
			Result.compare_objects
		end

	tpl_get_archetype_closure (aci: ARCH_LIB_TEMPLATE)
		do
			if aci.is_valid then
debug ("adlc-tpl")
	report_std_out ("--------- template " + aci.id.as_string + "---------")
end
				add_lineage (aci)
			end
		end

	add_supplier_closure (ala: ARCH_LIB_AUTHORED_ARCHETYPE)
		do
debug ("adlc-tpl")
	report_std_out (indent + "add_supplier_closure - target " + ala.id.as_string)
	inc_indent
end
			across ala.suppliers_index as car_csr loop
				if attached {ARCH_LIB_AUTHORED_ARCHETYPE} car_csr.item as supp_ala then
					add_lineage (supp_ala)
				elseif attached {ARCH_LIB_TEMPLATE_OVERLAY} car_csr.item as ovl and then attached {ARCH_LIB_AUTHORED_ARCHETYPE} ovl.specialisation_parent as supp_ala then
					add_lineage (supp_ala)
				end
			end
debug ("adlc-tpl")
	dec_indent
end
		end

	add_lineage (ala: ARCH_LIB_AUTHORED_ARCHETYPE)
		do
			if not arch_list.has (ala.id.as_string) then
debug ("adlc-tpl")
	inc_indent
	report_std_out (indent + "add_lineage - target " + ala.id.as_string)
end
				add_path_map_entry (ala.file_mgr.source_file_path)
				arch_list.extend (ala.id.as_string)
				add_supplier_closure (ala)

				if ala.is_specialised then
					across ala.ancestors as ancs_csr loop
						if attached {ARCH_LIB_AUTHORED_ARCHETYPE} ancs_csr.item as spec_parent then
debug ("adlc-tpl")
	report_std_out (indent + "add_lineage - ancestor " + spec_parent.id.as_string)
end
							add_path_map_entry (spec_parent.file_mgr.source_file_path)
							arch_list.extend (spec_parent.id.as_string)
							add_supplier_closure (spec_parent)
						end
					end
				end
debug ("adlc-tpl")
	dec_indent
end
			end
		end

	add_path_map_entry (a_src_path: STRING)
		local
			pos: INTEGER
			tail_path: STRING
		do
			pos := a_src_path.substring_index (source_repo, 1)
			if pos > 0 then
				-- generate a relative path below the repo level
				tail_path := a_src_path.substring (pos + source_repo.count, a_src_path.count)
				path_map.put (target_repo + tail_path, source_repo + tail_path)
			else
				report_std_err (get_msg ({ADL_MESSAGES_IDS}.ec_source_path_not_in_source_repo, <<a_src_path, source_repo>>))
			end
		end

	indent: STRING
		attribute
			create Result.make(0)
		end

	inc_indent
		do
			indent.append ("    ")
		end

	dec_indent
		do
			indent.remove_tail (4)
		end

end
