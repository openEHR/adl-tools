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
			select_archetype, file_mgr, flat_archetype, differential_archetype, differential_serialised,
			serialise_object, select_serialised_archetype, signal_from_scratch, persistent_type, clear_cache
		end

create {ARCHETYPE_LIBRARY, ARCHETYPE_LIBRARY_SOURCE}
	make_new_specialised, make

feature -- Definitions

	Source_template_overlay_divider: IMMUTABLE_STRING_8
		once
			create Result.make_from_string ("-------------------------------------------------------------%N")
		end

	Overlay_differential_not_available: STRING = "Overlay differential_serialised not generated for "

feature -- Artefacts

	differential_archetype: detachable TEMPLATE

	differential_serialised: STRING
			-- serialise differential archetype to its file in its source form, even if not compiling
			-- this might fail because the serialiser might try to do something that an invalid archetype
			-- can't support
		local
			exception_occurred: BOOLEAN
		do
			create Result.make_empty
			if not exception_occurred then
				if attached differential_archetype as da then
					Result := adl_2_engine.serialise (da, Syntax_type_adl, current_archetype_language)

					-- append overlay texts
					across overlays as overlays_csr loop
						Result.append (Source_template_overlay_divider)
						if attached overlays_csr.item.differential_serialised as ovl_str then
							Result.append (ovl_str)
						else
							Result.append (Overlay_differential_not_available + overlays_csr.item.id.physical_id)
						end
					end
				end
			end
		rescue
			exception_occurred := True
		end

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

	signal_from_scratch
			-- signal rebuild from scratch; this rebuilds from existing differential
		do
			precursor
			overlays.wipe_out
		ensure then
			Overlays_cleared: overlays.is_empty
		end

feature -- Visualisation

	select_archetype (differential_view, editing_enabled: BOOLEAN): ARCHETYPE
			-- return appropriate differential or flat version of archetype, depending on setting of `differential_view' and `editing_enabled'
		do
			if not editing_enabled then
				if differential_view then
					Result := safe_differential_archetype
				else
					Result := operational_template
				end
			else
				Result := flat_archetype_editable
			end
		end

	select_serialised_archetype (differential_view, with_rm: BOOLEAN): STRING
			-- return appropriate differential or flat version of archetype, depending on setting of `differential_view' and `with_rm'
		do
			if differential_view then
				Result := differential_serialised
			else
				Result := operational_template_serialised (with_rm)
			end
		end

feature -- File Access

	file_mgr: TEMPLATE_PERSISTENCE_MGR

	clear_overlays
		do
			file_mgr.clear_overlays
			overlays.wipe_out
		end

	add_overlay (an_overlay_descriptor: ARCH_LIB_TEMPLATE_OVERLAY; an_ovl_adl_text, an_archetype_id: STRING)
		do
			overlays.extend (an_overlay_descriptor)
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
				create {like persistent_type} dt_arch.make (safe_differential_archetype)
			end

			archetype_serialise_engine.set_tree (dt_arch.dt_representation)
			archetype_serialise_engine.serialise (a_format, False, True)
			Result := archetype_serialise_engine.serialised
		end

feature {NONE} -- Editing

	clear_cache
		do
			precursor
			operational_template_cache := Void
		end

feature {NONE} -- Output

	persistent_type: P_TEMPLATE
		do
			create Result.make_dt (Void)
		end

feature {NONE} -- Implementation

	overlays: ARRAYED_LIST [ARCH_LIB_TEMPLATE_OVERLAY]
		attribute
			create Result.make (0)
		end

end

