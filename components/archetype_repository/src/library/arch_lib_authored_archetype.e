note
	component:   "openEHR ADL Tools"
	description: "Descriptor of an authored archetype in the archetype library."
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_LIB_AUTHORED_ARCHETYPE

inherit
	ARCH_LIB_ARCHETYPE
		redefine
			file_mgr, initialise, post_parse_151_convert, create_compile_actions, compile_rescue, persistent_type,
			differential_archetype
		end

create {ARCHETYPE_LIBRARY, ARCHETYPE_LIBRARY_SOURCE}
	make, make_new, make_new_specialised

feature {NONE} -- Initialisation

	make (a_path: STRING; a_repository: ARCHETYPE_LIBRARY_SOURCE; arch_thumbnail: ARCHETYPE_THUMBNAIL)
			-- Create for the archetype described by `arch_thumbnail', stored at `a_full_path', belonging to `a_repository'.
		require
			Path_valid: not a_path.is_empty
			Valid_id: has_rm_schema_for_archetype_id (arch_thumbnail.archetype_id)
		do
			create status.make_empty
			create last_modify_timestamp.make_from_epoch (0)

			-- basic state
			id := arch_thumbnail.archetype_id
			if arch_thumbnail.is_specialised then
				parent_ref := arch_thumbnail.parent_archetype_id
			end
			compilation_state := Cs_unread

			-- create file workflow state
			if arch_thumbnail.is_legacy then
				create file_mgr.make_legacy (arch_thumbnail, a_path, a_repository)
			else
				create file_mgr.make (arch_thumbnail, a_path, a_repository)
			end
		ensure
			id_set: id = arch_thumbnail.archetype_id
			parent_id_set: arch_thumbnail.is_specialised implies parent_ref = arch_thumbnail.parent_archetype_id
			Compilation_state: compilation_state = Cs_unread
		end

	make_new (an_id: ARCHETYPE_HRID; a_lib_source: ARCHETYPE_LIBRARY_SOURCE; a_directory: STRING)
			-- Create a new archetype with `an_id', belonging to `a_lib_source'.
		require
			Valid_directory: file_system.directory_exists (a_directory)
			Valid_id: has_rm_schema_for_archetype_id (an_id)
		local
			a_diff_arch: attached like differential_archetype
		do
			make_new_any (an_id)
			create file_mgr.make_new_archetype (an_id, a_lib_source, a_directory)

			create a_diff_arch.make_empty_differential (an_id, rm_schema.rm_release, locale_language_short)
			a_diff_arch.set_authoring_default_details (author_name, author_org, Resource_lifecycle_states.first, author_copyright, author_licence)
			differential_archetype := a_diff_arch

			reset
			compilation_state := Cs_validated
			save_differential_text
		ensure
			id_set: id = an_id
			validated: is_valid
			Differential_archetype_is_differential: differential_archetype.is_differential
		end

	make_new_specialised (an_id: ARCHETYPE_HRID; a_parent: ARCHETYPE; a_lib_source: ARCHETYPE_LIBRARY_SOURCE; a_directory: STRING)
			-- Create a new archetype with `an_id' as a child of the archetype with id `a_parent_id', belonging to `a_lib_source'.
		require
			Valid_directory: file_system.directory_exists (a_directory)
			Valid_id: has_rm_schema_for_archetype_id (an_id)
			Valid_parent: a_parent.is_differential
		local
			a_diff_arch: attached like differential_archetype
		do
			make_new_any (an_id)
			create file_mgr.make_new_archetype (an_id, a_lib_source, a_directory)

			create a_diff_arch.make_empty_differential_child (a_parent.specialisation_depth + 1, an_id,
				a_parent.archetype_id.semantic_id, rm_schema.rm_release, locale_language_short)
			a_diff_arch.set_authoring_default_details (author_name, author_org, Resource_lifecycle_states.first, author_copyright, author_licence)
			differential_archetype := a_diff_arch
			parent_ref := a_parent.archetype_id.semantic_id

			reset
			compilation_state := Cs_validated
			save_differential_text
		ensure
			Is_specialised: is_specialised
			Is_archetype: attached {AUTHORED_ARCHETYPE} differential_archetype as auth_diff_arch
		end

	make_new_any (an_id: ARCHETYPE_HRID)
			-- Create a new archetype with `an_id'
		do
			id := an_id
			create status.make_empty
			create last_modify_timestamp.make_from_epoch (0)
			create last_compile_attempt_timestamp.make_now
		end

feature -- Artefacts

	differential_archetype: detachable AUTHORED_ARCHETYPE

feature {ARCH_LIB_ARCHETYPE} -- Compilation

	compile_actions: HASH_TABLE [PROCEDURE [ARCH_LIB_ARCHETYPE, TUPLE], INTEGER]
		once
			Result := create_compile_actions
		end

	create_compile_actions: HASH_TABLE [PROCEDURE [ARCH_LIB_ARCHETYPE, TUPLE], INTEGER]
		do
			Result := precursor
			Result.put (agent {ARCH_LIB_AUTHORED_ARCHETYPE}.parse_legacy, cs_ready_to_parse_legacy)
			Result.replace (agent {ARCH_LIB_AUTHORED_ARCHETYPE}.compile_validate_flat, Cs_validated_phase_2)
		end

	initialise
			-- set compilation state at creation, or if editing occurs
		do
			if file_mgr.is_legacy_out_of_date then
				reset
				compilation_state := Cs_ready_to_parse_legacy
			else
				precursor
			end
		end

	parse_legacy
			-- Parse and validate `target', legacy flat form; save differential file if there was none.
			-- Assume that legacy archetypes have no suppliers, i.e. don't include slot-fillers.
			-- This is safe, since this is an ADL 1.5 only construct
		require
			Compilation_state_valid: compilation_state = cs_ready_to_parse_legacy
			Legacy_file_available: file_mgr.has_legacy_flat_file
		local
			legacy_flat_archetype: attached like differential_archetype
			archetype_comparator: ARCHETYPE_COMPARATOR
			legacy_flat_text, ser_text: STRING
		do
			if is_specialised and not specialisation_parent.is_valid then
				compilation_state := cs_lineage_invalid
				add_error (ec_compile_e1, <<parent_id.physical_id>>)
			else
				clear_cache

				-- perform the parse; this can fail, i.e. no result generated
				check attached file_mgr.legacy_flat_text as lft then
					legacy_flat_text := lft
				end
			 	compilation_state := Cs_parsed
				if attached {like flat_archetype} adl_14_engine.parse (legacy_flat_text, Current) as flat_arch then
					legacy_flat_archetype := flat_arch
					add_info (ec_compile_legacy_i1, <<id.physical_id>>)

					-- perform post-parse processing and then diff conversion
					if  attached specialisation_parent as att_sp then
						-- perform post-parse object structure finalisation
						post_parse_151_convert (flat_arch)

						-- perform standard post-parse processing
						adl_14_engine.post_parse_process (flat_arch, Current)

						-- run the comparator over the legacy flat archetype if specialised; it will mark all
						-- nodes with a local and also rolled up inheritance status
						create archetype_comparator.make (att_sp.flat_archetype, flat_arch)
						archetype_comparator.compare
						archetype_comparator.generate_diff
						archetype_comparator.compress_differential_child
						check attached {like flat_archetype} archetype_comparator.differential_output as att_diff then
							differential_archetype := att_diff
						end

						-- the id may have changed due to conversion processing, which picks up ADL 1.4 revision
						id := differential_archetype.archetype_id

						-- save text to diff file
						ser_text := differential_serialised
						if not ser_text.is_empty then
							save_text_to_differential_file (ser_text)
						end
					else
						-- perform post-parse object structure finalisation
						post_parse_151_convert (flat_arch)

						-- perform standard post-parse processing
						adl_14_engine.post_parse_process (flat_arch, Current)
						flat_arch.set_differential
						flat_arch.set_is_generated
						differential_archetype := flat_arch

						-- the id may have changed due to conversion processing, which picks up ADL 1.4 revision
						id := differential_archetype.archetype_id

						-- save text to diff file
						ser_text := differential_serialised
						if not ser_text.is_empty then
							save_text_to_differential_file (ser_text)
						end
					end
				else
				 	compilation_state := Cs_convert_legacy_failed
				end

				-- pick up all errors & warnings
				merge_errors (adl_14_engine.errors)
				status.prepend (errors.as_string_filtered (True, True, False))
			end
		ensure
			Compilation_state: (<<Cs_parsed, Cs_convert_legacy_failed, Cs_lineage_invalid>>).has (compilation_state)
		end

	compile_validate_flat
		do
			if adl_roundtripping or (file_mgr.has_legacy_flat_file and not has_source_file) then
				save_differential_text
			end
			validate_flat
		end

feature {NONE} -- Compilation

	compile_rescue
		do
			if file_mgr.has_legacy_flat_file and compilation_state = Cs_ready_to_parse then
				clean_generated
				compile_trying_rescue := True
			end
		end

	post_parse_151_convert (an_archetype: like flat_archetype)
		do
			if attached {AUTHORED_ARCHETYPE} an_archetype as auth_arch then
				if version_less_than (auth_arch.adl_version, Adl_id_code_version) then
					adl_2_engine.post_parse_151_convert (auth_arch, Current)
				end
			end
		end

feature -- File Access

	file_mgr: AUTH_ARCH_PERSISTENCE_MGR

	source_file_path: STRING
			-- Path of differential source file of archetype.
		do
			Result := file_mgr.source_file_path
		end

	has_source_file: BOOLEAN
		do
			Result := file_mgr.has_source_file
		end

	save_differential_text
			-- Save converted differential archetype to its file in its source form, even if not compiling
		local
			ftext: STRING
		do
			ftext := differential_serialised
			if ftext.is_empty then
				ftext := source_text
			end
			file_mgr.save_source_text (ftext)
		end

	save_differential_as (a_full_path, a_format: STRING)
			-- Save current source archetype to `a_full_path' in `a_format'.
		require
			Archetype_valid: is_valid
			path_valid: not a_full_path.is_empty
			Serialise_format_valid: has_serialiser_format (a_format)
		do
			if has_archetype_native_serialiser_format (a_format) and attached differential_archetype as da then
				file_mgr.save_as (a_full_path, adl_2_engine.serialise (da, a_format, current_archetype_language))
			else -- must be a DT serialisation format
				file_mgr.save_as (a_full_path, serialise_object (False, a_format))
			end
			status := get_msg_line (ec_file_saved_as_in_format, <<a_full_path, a_format>>)
		end

	save_flat_as (a_full_path, a_format: STRING)
			-- Save current flat archetype to `a_full_path' in `a_format'.
		require
			Archetype_valid: is_valid
			path_valid: not a_full_path.is_empty
			Serialise_format_valid: has_serialiser_format (a_format)
		do
			if a_format.same_string (Syntax_type_adl) then
				file_mgr.save_as (a_full_path, flat_serialised (False))
			elseif has_archetype_native_serialiser_format (a_format) then
				file_mgr.save_as (a_full_path, adl_2_engine.serialise (flat_archetype, a_format, current_archetype_language))
			else -- must be a DT serialisation format
				file_mgr.save_as (a_full_path, serialise_object (True, a_format))
			end
			status := get_msg_line (ec_file_saved_as_in_format, <<a_full_path, a_format>>)
		end

	save_text_to_legacy_file (a_text: STRING)
			-- save `a_text' to the legacy file if it exists
		require
			can_save_to_legacy_file
		do
			file_mgr.save_text_to_legacy_file (a_text)
			signal_source_edited
		end

	save_text_to_differential_file (a_text: STRING)
			-- save `a_text' to the differential file
		do
			file_mgr.save_text_to_differential_file (a_text)
		end

	remove_file
			-- remove the source file from the file system
		do
			file_mgr.remove_source_file
		end

	can_save_to_legacy_file: BOOLEAN
			-- True if legacy file exists and can e written to
		do
			Result := file_mgr.can_save_to_legacy_file
		end

feature {MAIN_WINDOW} -- File Access

	clean_generated
			-- delete generated file and compiler products; forces next compilation to start from primary expression
		do
			file_mgr.clean_generated
			signal_from_scratch
			status.append (file_mgr.status)
		ensure
			Reset_if_source_generated: file_mgr.is_source_generated implies (differential_archetype = Void and compilation_state = Cs_unread)
		end

feature {GUI_TEST_TOOL} -- File Access

	save_differential_compiled
			-- save validated differential archetype in fast-retrieve form (ODIN)
		require
			Archetype_valid: is_valid
		do
			file_mgr.save_differential_compiled (serialise_object (False, Syntax_type_odin))
		end

	compiled_differential: STRING
		do
			create Result.make_empty
			if attached file_mgr.compiled_differential as odin_text then
				-- parse the ODIN to DT then materialise to AOM
				archetype_serialise_engine.set_source (odin_text, 1)
				archetype_serialise_engine.parse
				if archetype_serialise_engine.parse_succeeded and attached archetype_serialise_engine.tree as att_tree then
					if attached {like persistent_type} att_tree.as_object (({like persistent_type}).type_id, <<>>) as p_archetype then
						if attached {like differential_archetype} p_archetype.create_archetype as an_arch then
							-- serialise into normal ADL format
							Result := adl_2_engine.serialise (an_arch, Syntax_type_adl, current_archetype_language)
						end
					end
				end
			end
		end

feature -- Editing

	commit
			-- commit modified flat clone to archetype as new differential
		local
			archetype_comparator: ARCHETYPE_COMPARATOR
		do
			-- do something with previous version of archetype

			-- do diff on flat_archetype_clone
			if attached specialisation_parent as parent_aca then
				create archetype_comparator.make_create_differential (parent_aca.flat_archetype, flat_archetype_clone)
				check attached {like flat_archetype} archetype_comparator.differential_output as diff_out then
					differential_archetype := diff_out
				end
			else
				differential_archetype := flat_archetype_clone
				differential_archetype.set_differential
			end

			differential_archetype.clear_is_generated
			file_mgr.set_is_source_generated (False)
			editor_state.on_commit
			save_differential_text
			create last_modify_timestamp.make_now

			-- regenerate flat form
			flatten (False)

			-- set revision appropriately
		ensure then
			Differential_is_primary: not file_mgr.is_source_generated and not differential_archetype.is_generated
		end

feature {NONE} -- Output

	persistent_type: P_AUTHORED_ARCHETYPE
		do
			create Result.make_dt (Void)
		end

end

