note
	component:   "openEHR ADL Tools"
	description: "Descriptor of an authored archetype in the archetype library."
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_LIB_TEMPLATE

inherit
	ARCH_LIB_AUTHORED_ARCHETYPE
		redefine
			select_archetype, file_mgr, flat_archetype, differential_archetype, serialise_object, persistent_type
		end

create {ARCHETYPE_LIBRARY, ARCHETYPE_LIBRARY_SOURCE}
	make_new_specialised, make

feature -- Artefacts

	differential_archetype: detachable TEMPLATE

	flat_archetype: TEMPLATE
			-- inheritance-flattened form of archetype
		do
			check attached {TEMPLATE} precursor as flat_tpl then
				Result := flat_tpl
			end
		end

	operational_template: OPERATIONAL_TEMPLATE
			-- inheritance-flattened form of archetype
		require
			compilation_state = Cs_validated
		do
			if operational_template_cache = Void or last_include_rm then
				expand (False)
			end
			check attached operational_template_cache as fac then
				Result := fac
			end
		end

	operational_template_with_rm: OPERATIONAL_TEMPLATE
			-- inheritance-flattened form of archetype
		require
			compilation_state = Cs_validated
		do
			if operational_template_cache = Void or not last_include_rm then
				expand (True)
			end
			check attached operational_template_cache as fac then
				Result := fac
			end
		end

	operational_template_serialised (include_rm: BOOLEAN): STRING
			-- The serialised text of the flat form of the archetype
		require
			compilation_state = Cs_validated
		do
			if include_rm then
				Result := adl_2_engine.serialise (operational_template_with_rm, Syntax_type_adl, current_archetype_language)
			else
				Result := adl_2_engine.serialise (operational_template, Syntax_type_adl, current_archetype_language)
			end
		end

feature -- Visualisation

	select_archetype (differential_view, editing_enabled: BOOLEAN): ARCHETYPE
			-- return appropriate differential or flat version of archetype, depending on setting of `differential_view' and `editing_enabled'
		do
			if not editing_enabled then
				if differential_view then
					check attached differential_archetype as da then
						Result := da
					end
				else
					Result := operational_template
				end
			else
				Result := flat_archetype_clone
			end
		end

feature -- File Access

	file_mgr: TEMPLATE_PERSISTENCE_MGR

	clear_overlays
		do
			file_mgr.clear_overlays
		end

	add_overlay (an_ovl_adl_text, an_archetype_id: STRING)
		do
			file_mgr.add_overlay (an_ovl_adl_text, an_archetype_id)
		end

feature {NONE} -- Flattening

	expand (include_rm: BOOLEAN)
			-- expand by substitution of all references with their structures
		local
			opt_generator: TEMPLATE_FLATTENER
		do
			create opt_generator
			opt_generator.execute (if include_rm then flat_archetype_with_rm else flat_archetype end)
			operational_template_cache := opt_generator.opt

			last_include_rm := include_rm
		end

	operational_template_cache: detachable OPERATIONAL_TEMPLATE

feature -- Output

	serialise_object (flat_flag: BOOLEAN; a_format: STRING): STRING
			-- serialise internal structure in a brute-force object way, using
			-- format like ODIN, XML, JSON etc
		local
			dt_arch: DT_CONVERTIBLE
		do
			if flat_flag then
				create {P_OPERATIONAL_TEMPLATE} dt_arch.make (operational_template)
			else
				check attached differential_archetype as da then
					create {like persistent_type} dt_arch.make (da)
				end
			end

			archetype_serialise_engine.set_tree (dt_arch.dt_representation)
			archetype_serialise_engine.serialise (a_format, False, True)
			Result := archetype_serialise_engine.serialised
		end

feature {NONE} -- Output

	persistent_type: P_TEMPLATE
		do
			create Result.make_dt (Void)
		end

end

