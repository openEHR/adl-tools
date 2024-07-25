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
			validator_reset, select_archetype, select_flattened_archetype,
			file_mgr, flat_archetype, differential_archetype,
			differential_serialised_native, persistent_compact_type,
			signal_from_scratch, clear_cache, validate_closure
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

	flat_archetype: TEMPLATE
			-- inheritance-flattened form of archetype
		do
			check attached {TEMPLATE} precursor as flat_tpl then
				Result := flat_tpl
			end
		end

	opt: OPERATIONAL_TEMPLATE
			-- inheritance-flattened form of archetype
		require
			compilation_state = Cs_validated
		do
			if operational_template_cache = Void then
				operational_template_cache := template_compiled (False)
			end
			check attached operational_template_cache as fac then
				Result := fac
			end
		end

	opt_with_rm: OPERATIONAL_TEMPLATE
			-- inheritance-flattened form of archetype with RM multiplicities
		require
			compilation_state = Cs_validated
		do
			Result := template_compiled (True)
		end

feature -- Visualisation

	select_archetype (differential_view, editing_enabled: BOOLEAN): ARCHETYPE
			-- return appropriate differential or flat version of archetype, depending on setting of
			-- `differential_view' and `editing_enabled'
		do
			if not editing_enabled then
				if differential_view then
					Result := safe_differential_archetype
				else
					Result := opt
				end
			else
				Result := flat_archetype_editable
			end
		end


	select_flattened_archetype: AUTHORED_ARCHETYPE
			-- return fully flattened version of archetype
		do
			Result := opt
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

	save_opt_as (a_full_path, a_format: STRING; include_rm: BOOLEAN)
			-- Save current flat archetype to `a_full_path' in `a_format'.
		require
			Archetype_valid: is_valid
			path_valid: not a_full_path.is_empty
			Serialise_format_valid: has_serialiser_format (a_format)
		do
			if a_format.same_string (Syntax_type_adl) then
				file_mgr.save_as (a_full_path, opt_serialised_native (include_rm))

			elseif has_archetype_native_serialiser_format (a_format) then
				file_mgr.save_as (a_full_path, adl_2_engine.serialise_native (opt, a_format, current_archetype_language))

			else -- must be a DT serialisation format
				file_mgr.save_as (a_full_path, opt_serialised_object (type_marking_on, a_format))
			end
			status := get_msg_line ({GENERAL_MESSAGES_IDS}.ec_file_saved_as_in_format, <<a_full_path, a_format>>)
		end

feature -- Serialisation

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

	opt_serialised_native (include_rm: BOOLEAN): STRING
			-- The serialised text of the flat form of the archetype
		require
			compilation_state = Cs_validated
		do
			if include_rm then
				Result := adl_2_engine.serialise_native (opt_with_rm, Syntax_type_adl, current_archetype_language)
			else
				Result := adl_2_engine.serialise_native (opt, Syntax_type_adl, current_archetype_language)
			end
		end

	opt_serialised_object (type_marking_flag: BOOLEAN; a_format: STRING): STRING
			-- serialise in-memory objects, using a format like ODIN, XML, JSON etc
		local
			dt_arch: DT_CONVERTIBLE
		do
			create {P_OPERATIONAL_TEMPLATE} dt_arch.make (opt)

			dt_object_converter.set_false_booleans_off_option
			archetype_serialise_engine.set_tree (dt_arch.dt_representation)
			archetype_serialise_engine.serialise (a_format, type_marking_flag, True)
			Result := archetype_serialise_engine.serialised
		end

	opt_serialised_object_ejson (type_marking_flag: BOOLEAN; a_format: STRING): STRING
			-- serialise internal structure in a brute-force object way, using
			-- format like ODIN, XML, JSON etc
		local
			dt_arch: DT_CONVERTIBLE
			fac: JSON_SERIALIZATION_FACTORY
			conv: JSON_SERIALIZATION
		do
			create {P_OPERATIONAL_TEMPLATE} dt_arch.make (opt)

			conv := fac.smart_serialization
			conv.set_pretty_printing

			if attached conv.to_json_string (dt_arch) as s then
				Result := s
			else
				Result := "Conversion failed"
			end
		end

feature {NONE} -- Flattening

	template_compiled (include_rm: BOOLEAN): OPERATIONAL_TEMPLATE
			-- expand by substitution of all references with their structures
		local
			opt_generator: TEMPLATE_FLATTENER
		do
			create opt_generator
			opt_generator.execute (flat_archetype_processed (include_rm), include_rm)
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

