note
	component:   "openEHR ADL Tools"
	description: "Descriptor of template in the archetype library."
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_LIB_TEMPLATE

inherit
	ARCH_LIB_AUTHORED_ARCHETYPE
		redefine
			validator_reset, select_archetype, file_mgr, flat_archetype, differential_archetype,
			differential_serialised_native, persistent_compact_type,
			flat_for_serialisation, select_native_serialised_archetype, signal_from_scratch,
			clear_cache, validate_closure
		end

create {ARCHETYPE_LIBRARY, ARCHETYPE_LIBRARY_SOURCE}
	make_new_specialised, make

feature -- Definitions

	Source_template_overlay_divider: IMMUTABLE_STRING_8 = "-------------------------------------------------------------%N"

	Overlay_differential_not_available: IMMUTABLE_STRING_8 = "Overlay differential_serialised not generated for "

feature -- Initialisation

	validator_reset
			-- initialise reporting variables
		do
			across overlays as ovl_csr loop
				ovl_csr.item.validator_reset
			end
			precursor
		end

feature -- Compilation

	signal_from_scratch
		do
			precursor
			clear_overlays
		end

	clear_overlays
			-- remove all overlays for this template
		do
			across overlays as ovls_csr loop
				current_library.remove_archetype (ovls_csr.item)
			end

			file_mgr.clear_overlays
			overlays.wipe_out
			if attached differential_archetype as tpl then
				tpl.clear_overlays
			end
		ensure
			Overlays_cleared: overlays.is_empty
		end

feature -- Artefacts

	differential_archetype: detachable TEMPLATE

	differential_serialised_native: STRING
			-- serialise differential archetype to its file in its source form, even if not compiling
			-- this might fail because the serialiser might try to do something that an invalid archetype
			-- can't support
		local
			exception_occurred: BOOLEAN
		do
			create Result.make_empty
			if not exception_occurred then
				if attached differential_archetype as da then
					Result := adl_2_engine.serialise_native (da, Syntax_type_adl, current_archetype_language)

					-- append overlay texts
					across overlays as overlays_csr loop
						Result.append (Source_template_overlay_divider)
						if attached overlays_csr.item.differential_serialised_native as ovl_str then
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
			if operational_template_cache = Void then
				operational_template_cache := template_expanded (False)
			end
			check attached operational_template_cache as fac then
				Result := fac
			end
		end

	operational_template_with_rm: OPERATIONAL_TEMPLATE
			-- inheritance-flattened form of archetype with RM multiplicities
		require
			compilation_state = Cs_validated
		do
			Result := template_expanded (True)
		end

	operational_template_serialised (include_rm: BOOLEAN): STRING
			-- The serialised text of the flat form of the archetype
		require
			compilation_state = Cs_validated
		do
			if include_rm then
				Result := adl_2_engine.serialise_native (operational_template_with_rm, Syntax_type_adl, current_archetype_language)
			else
				Result := adl_2_engine.serialise_native (operational_template, Syntax_type_adl, current_archetype_language)
			end
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

	select_native_serialised_archetype (differential_view, with_rm: BOOLEAN): STRING
			-- return appropriate differential or flat version of archetype, depending on setting of `differential_view' and `with_rm'
		do
			if differential_view then
				Result := differential_serialised_native
			else
				Result := operational_template_serialised (with_rm)
			end
		end

feature {ARCH_LIB_ARCHETYPE} -- Compilation

	validate_closure
		do
			-- phase 4: validate flattened archetype with closure
			adl_2_engine.phase_4_validate (Current)
			merge_errors (adl_2_engine.errors)
			if adl_2_engine.validation_passed then
				compilation_state := Cs_validated
				add_info ({ADL_MESSAGES_IDS}.ec_parse_archetype_i2, <<id.physical_id>>)
			else
				compilation_state := Cs_validate_failed
			end
			status.prepend (errors.as_string_filtered (True, True, False))
		end

feature -- File Access

	file_mgr: TEMPLATE_PERSISTENCE_MGR

	add_overlay (an_overlay_descriptor: ARCH_LIB_TEMPLATE_OVERLAY; an_ovl_adl_text, an_archetype_id: STRING)
		do
			overlays.extend (an_overlay_descriptor)
			file_mgr.add_overlay (an_ovl_adl_text, an_archetype_id)
		end

feature {NONE} -- Flattening

	template_expanded (include_rm: BOOLEAN): OPERATIONAL_TEMPLATE
			-- expand by substitution of all references with their structures
		local
			opt_generator: TEMPLATE_FLATTENER
		do
			create opt_generator
			opt_generator.execute (if include_rm then flat_archetype_with_rm else flat_archetype end, include_rm)
			Result := opt_generator.opt
		end

	operational_template_cache: detachable OPERATIONAL_TEMPLATE

feature {NONE} -- Editing

	clear_cache
		do
			precursor
			operational_template_cache := Void
		end

feature {NONE} -- Output

	flat_for_serialisation (flat_flag: BOOLEAN): P_AUTHORED_ARCHETYPE
		do
			if flat_flag then
				create {P_OPERATIONAL_TEMPLATE} Result.make (operational_template)
			else
				create {P_TEMPLATE} Result.make (safe_differential_archetype)
			end
		end

	persistent_compact_type: P_TEMPLATE
		do
			create Result.make_dt (Void)
		end

feature {NONE} -- Implementation

	overlays: ARRAYED_LIST [ARCH_LIB_TEMPLATE_OVERLAY]
		attribute
			create Result.make (0)
		end

end

