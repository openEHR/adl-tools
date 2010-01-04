note
	component:   "openEHR Archetype Project"
	description: "Descriptor of an archetype in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/components/archetype_repository/src/directory/arch_rep_archetype.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-05-17 15:32:35 +0100 (Sat, 17 May 2008) $"


class ARCH_REP_ARCHETYPE

inherit
	ARCH_REP_COMMON

create
	make

feature {NONE} -- Initialisation

	make (a_root_path, a_full_path: STRING; an_id: attached ARCHETYPE_ID; a_repository: ARCHETYPE_REPOSITORY_I)
			-- Create for the archetype with `an_id', stored at `a_full_path', belonging to `a_repository' at `a_root_path'.
			-- Can be created with a .adl or .adls file name extension
		require
			repository_attached: a_repository /= Void
			root_path_valid: a_repository.is_valid_directory (a_root_path)
			full_path_attached: a_full_path /= Void
			full_path_under_root_path: a_full_path.starts_with (a_root_path)
		do
			create status.make_empty
			create compiler_status.make_empty

			id := an_id
			make_adi (a_root_path, a_full_path, a_repository)

			if file_system.has_extension (full_path, archetype_source_file_extension) then
				differential_path := full_path
				flat_path := extension_replaced (full_path, archetype_flat_file_extension)
				legacy_flat_path := extension_replaced (full_path, archetype_legacy_file_extension)
			else
				differential_path := extension_replaced (full_path, archetype_source_file_extension)
				flat_path := extension_replaced (full_path, archetype_flat_file_extension)
				legacy_flat_path := full_path
			end
		ensure
			root_path_set: root_path = a_root_path
			full_path_set: full_path = a_full_path
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
			no_compiler_status: compiler_status.is_empty
		end

feature -- Access

	id: attached ARCHETYPE_ID
			-- Archetype identifier.

	legacy_flat_path: STRING
			-- Path of legacy flat file of archetype.

	legacy_flat_text: STRING
			-- The text of the legacy archetype, if it exists

	legacy_flat_text_timestamp: INTEGER
			-- Date and time at which the archetype flat file was last modified.

	specialisation_parent: ARCH_REP_ARCHETYPE
			-- parent descriptor, for specialised archetypes only

	archetype_lineage: attached ARRAYED_LIST [ARCH_REP_ARCHETYPE]
			-- lineage of archetypes from parent to this one, inclusive of the current one.
			-- For non-specialised archetypes, contains just the top-level archetype.
			-- FIXME: in theory this could be precomputed from ARCH_DIRECTORY, but modifications to
			-- the directory structure would mean always recomputing parts of it. This computation
			-- is not particularly expensive anyway...however, the result could be cached on a per-
			-- instance basis to be more efficient
		local
			csr: ARCH_REP_ARCHETYPE
		do
			create Result.make (1)
			from csr := Current until csr = Void loop
				Result.put_front (csr)
				csr := csr.specialisation_parent
			end
		ensure
			not_empty: not Result.is_empty
			current_last: Result.last = Current
		end

	ontology_lineage: HASH_TABLE [DIFFERENTIAL_ARCHETYPE_ONTOLOGY, INTEGER]
			-- lineage of ontologies of archetypes from top to this one

	differential_archetype: DIFFERENTIAL_ARCHETYPE
			-- archetype representing differential structure with respect to parent archetype;
			-- if this is a non-specialised archetype, then it is the same as the flat form, else
			-- it is just the differences (like an object-oriented source file for a subclass)

	slot_id_index: HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			-- list of Archetype ids matching slot, keyed by slot path

	used_by_index: ARRAYED_LIST [STRING]
			-- list of archetype_ids corresponding to archetypes that use this archetype

feature -- Status Report - Compilation

	is_at_path (path: STRING): BOOLEAN
			-- Is `path' the same as either `differential_path' or `legacy_flat_path'?
		do
			Result := differential_path.same_string (path) or legacy_flat_path.same_string (path)
		end

	has_legacy_flat_file: BOOLEAN
			-- Does the repository have a legacy flat-form file for this archetype?
		do
			Result := file_repository.is_valid_path (legacy_flat_path)
		end

	is_out_of_date: BOOLEAN
			-- Should this archetype be reparsed due to changes on the file system?
		do
			Result := not parse_attempted or
				is_differential_out_of_date or is_legacy_flat_out_of_date or
				(specialisation_parent /= Void and then specialisation_parent.last_compile_attempt_timestamp > last_compile_attempt_timestamp)
		end

	is_legacy_flat_out_of_date: BOOLEAN
			-- Is flat_archetype out of date with respect to changes on the file system?
		do
			Result := legacy_flat_text_timestamp > 0 and then file_repository.has_file_changed_on_disk (full_path, legacy_flat_text_timestamp)
		end

feature -- Status Report - Semantic

	is_specialised: BOOLEAN
			-- True if this archetype is a specialisation of another archetype
		do
			Result := id.is_specialised
		end

	has_slots: BOOLEAN
			-- Does this archetype have any slots?
		do
			Result := slot_id_index /= Void
		end

	is_used: BOOLEAN
			-- Is this archetype used by any other archetypes (i.e. matches any of their slots)?
		do
			Result := used_by_index /= Void
		end

	differential_generated: BOOLEAN
			-- True if the differential form was generated from the flat form
		do
			Result := differential_archetype /= Void and then differential_archetype.is_generated
		end

	legacy_is_primary: BOOLEAN
			-- True if the flat legacy file is the primary source
		do
			Result := differential_archetype /= Void and differential_generated
		end

feature -- Commands

	parse_differential
			-- Parse and validate `target', in differential form if available, else in flat form.
		local
			legacy_flat_archetype: FLAT_ARCHETYPE
		do
			if not exception_encountered then
				reset
				clear_billboard
				set_parse_attempted

				if has_rm_checker (id.qualified_rm_name) then
					if has_differential_file and not is_legacy_flat_out_of_date then
						post_info (Current, "parse_archetype", "parse_archetype_i3", Void)
						read_differential
						differential_archetype := adl_engine.parse_differential (differential_text)
						if differential_archetype = Void then
							post_error (Current, "parse_archetype", "parse_archetype_e1", <<adl_engine.parse_error_text>>)
							is_valid := False
						else
							post_info (Current, "parse_archetype", "parse_archetype_i1", <<id.as_string>>)
							validate
						end
					else
						read_legacy_flat
						legacy_flat_archetype := adl_engine.parse_flat (legacy_flat_text)
						if legacy_flat_archetype = Void then
							post_error (Current, "parse_archetype", "parse_archetype_e1", <<adl_engine.parse_error_text>>)
							is_valid := False
						else
							post_info (Current, "parse_archetype", "parse_archetype_i1", <<id.as_string>>)
							differential_archetype := legacy_flat_archetype.to_differential
							validate
							-- if differential archetype was generated from an old-style flat, perform path compression
							if is_valid then
								if differential_archetype.is_generated and differential_archetype.is_specialised then
									differential_archetype.convert_to_differential_paths
								end
							end
							legacy_flat_archetype.set_is_valid (is_valid)
						end
					end

					if is_valid then
						-- Make sure that the language is set, and that it is one of the languages in the archetype.
						if (current_language = Void or not differential_archetype.has_language (current_language)) then
							set_current_language (differential_archetype.original_language.code_string)
						end
					end
				else
					post_error (Current, "parse_archetype", "model_access_e7", <<id.qualified_rm_name>>)
				end
			else
				post_error (Current, "parse_archetype", "parse_archetype_e3", Void)
			end

			compiler_status := billboard_content
			clear_billboard
		rescue
			post_error (Current, "parse_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	clean_generated
			-- delete generated file and compiler products; forces next compilation to start from primary expression
		do
			if differential_generated then
				if has_differential_file then
					file_system.delete_file (differential_path)
					status := create_message ("clean_generated_file", <<differential_path>>)
				end
				differential_text := Void
				differential_text_timestamp := 0
			end

			if file_repository.is_valid_path (flat_path) then
				file_system.delete_file (flat_path)
			end
			flat_text_cache := Void
		end

feature {ARCH_DIRECTORY} -- Modification

	set_specialisation_parent (a_parent: ARCH_REP_ARCHETYPE)
			-- set `parent'
		require
			Parent_exists: a_parent /= Void
		do
			specialisation_parent := a_parent
		end

feature {ARCHETYPE_VALIDATOR} -- Modification

	add_slot_ids (a_list: ARRAYED_LIST[STRING]; a_slot_path: STRING)
			-- add list of matching archetypes to ids recorded for slot at a_slot_path
		do
			if slot_id_index = Void then
				create slot_id_index.make (0)
			end
			if not slot_id_index.has (a_slot_path) then
				slot_id_index.put (a_list, a_slot_path)
				a_list.compare_objects
			else
				from a_list.start until a_list.off loop
					if not slot_id_index.item (a_slot_path).has (a_list.item) then
						slot_id_index.item (a_slot_path).extend (a_list.item)
					end
					a_list.forth
				end
			end
		end

	add_used_by_item (an_archetype_id: STRING)
			-- add the id of an archetype that has a slot that matches this archetype, i.e. that 'uses' this archetype
		do
			if used_by_index = Void then
				create used_by_index.make (0)
				used_by_index.compare_objects
			end
			used_by_index.extend (an_archetype_id)
		end

feature -- Factory

	create_new_differential(a_im_originator, a_im_name, a_im_entity, a_primary_language: STRING)
			-- create a new top-level differential archetype and install it into the directory according to its id
		do
			if not exception_encountered then
				create differential_archetype.make_minimal (create {attached ARCHETYPE_ID}.make (a_im_originator, a_im_name, a_im_entity, "UNKNOWN", "draft"), a_primary_language, 0)
				set_current_language (a_primary_language)

				-- FIXME: now add this archetype into the ARCHETYPE_DIRECTORY

				-- set it as the target
			else
				post_error(Current, "create_new_archetype", "create_new_archetype_e1", Void)
			end

			status.wipe_out
			status.append(billboard_content)
			clear_billboard
			exception_encountered := False
		rescue
			post_error(Current, "create_new_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	create_new_specialised_differential(specialised_domain_concept: STRING)
			-- create a new specialised archetype as a child of the target archetype and install it in
			-- the directory
		require
			Concept_valid: specialised_domain_concept /= Void and then not specialised_domain_concept.is_empty
		do
			if not exception_encountered then
				create differential_archetype.make_specialised_child(differential_archetype, specialised_domain_concept)
				-- FIXME: now add this archetype into the ARCHETYPE_DIRECTORY
			else
				post_error(Current, "create_new_specialised_archetype", "create_new_specialised_archetype_e1", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
			exception_encountered := False
		rescue
			post_error(Current, "create_new_specialised_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

feature {NONE} -- Implementation

	create_validator: ARCHETYPE_VALIDATOR is
			-- create the right kind of validator
		do
			create Result.make(Current)
		end

	build_ontology_lineage
		local
			arch_lin: ARRAYED_LIST [ARCH_REP_ARCHETYPE]
		do
			create ontology_lineage.make(1)
			arch_lin := archetype_lineage

			from
				arch_lin.start
			until
				arch_lin.off
			loop
				ontology_lineage.put (arch_lin.item.differential_archetype.ontology, arch_lin.item.differential_archetype.specialisation_depth)
				arch_lin.forth
			end
		end

	read_legacy_flat
			-- Read `legacy_flat_text' and `text_timestamp' from `legacy_flat_path'.
		require
			flat_file_available: has_legacy_flat_file
		do
			file_repository.read_text_from_file (legacy_flat_path)
			legacy_flat_text := file_repository.text
			full_path := legacy_flat_path
			legacy_flat_text_timestamp := file_repository.text_timestamp
		end

	flatten
			-- (re)generate flat-form of this archetype
		local
			arch_flattener: ARCHETYPE_FLATTENER
		do
			if not differential_archetype.is_specialised then
				create arch_flattener.make_non_specialised (differential_archetype)
			else
				create arch_flattener.make_specialised (specialisation_parent.flat_archetype, differential_archetype)
			end
			arch_flattener.flatten
			flat_archetype_cache := arch_flattener.arch_output_flat
			flat_text_cache := Void
		end

invariant
	legacy_flat_text_timestamp_natural: legacy_flat_text_timestamp >= 0
	legacy_flat_path_attached: legacy_flat_path /= Void
	full_is_flat_or_differential: full_path = legacy_flat_path xor full_path = differential_path
	parent_existence: specialisation_parent /= Void implies is_specialised
	parent_validity: specialisation_parent /= Void implies specialisation_parent.id.semantic_id.is_equal (id.semantic_parent_id)
	slot_id_index_valid: slot_id_index /= Void implies not slot_id_index.is_empty
	used_by_index_valid: used_by_index /= Void implies not used_by_index.is_empty

end



--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
