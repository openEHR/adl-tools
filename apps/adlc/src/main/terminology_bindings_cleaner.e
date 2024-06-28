note
	component:   "openEHR ADL Tools"
	description : "Term bindings injector"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@graphitehealth.io>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024- Graphite Health <http://GraphiteHealth.io>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	TERMINOLOGY_BINDINGS_CLEANER

inherit
	CLI_COMMAND

create
	make

feature -- Commands

	execute
			-- Remove terminology bindings that are in the wrong group
		local
			in_file: PLAIN_TEXT_FILE
			a_line, arch_code, binding_value, term_binding_uri_root: STRING
			strs: LIST[STRING]
			old_term_binding_uri, binding_uri: URI
			diff_arch: AUTHORED_ARCHETYPE
			ara: ARCH_LIB_AUTHORED_ARCHETYPE
		do
			current_library.do_all_semantic (agent arch_enter, agent arch_exit)
		end

feature {NONE} -- Implementation

	save_changes (ara: detachable ARCH_LIB_AUTHORED_ARCHETYPE)
		do
			if save_required and attached ara and then attached ara.differential_archetype then

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

	save_required: BOOLEAN

	arch_enter (aci: ARCH_LIB_ITEM)
		local
			terminology: ARCHETYPE_TERMINOLOGY
			namespace: STRING
			delete_keys: ARRAYED_LIST[STRING]
			save_needed: BOOLEAN
		do
			create delete_keys.make (0)
			if attached {ARCH_LIB_AUTHORED_ARCHETYPE} aci as auth_aca and then attached auth_aca.differential_archetype as diff_arch then
				report_std_out ("Checking " + auth_aca.id.as_string + "%N")
				terminology := diff_arch.terminology
				across terminology.term_bindings as term_namespaces_csr loop
					namespace := term_namespaces_csr.key

					delete_keys.wipe_out
					across term_namespaces_csr.item as term_bindings_csr loop
						if not term_bindings_csr.item.as_string.has_substring (namespace) then
							delete_keys.extend (term_bindings_csr.key)
						end
					end

					if not delete_keys.is_empty then
						across delete_keys as delete_key_csr loop
							terminology.remove_term_binding (delete_key_csr.item, namespace)
							report_std_out ("    removed " + delete_key_csr.item + " from " + namespace + " bindings%N")
						end
						save_needed := True
					end
				end
				if save_needed then
					auth_aca.save_differential_text
					report_std_out ("    ----> SAVING " + auth_aca.id.as_string + " %N")
				end
			end
		end

	arch_exit (aci: ARCH_LIB_ITEM)
		do
		end

end
