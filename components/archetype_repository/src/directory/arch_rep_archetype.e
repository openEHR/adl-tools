indexing
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
	SHARED_ARCHETYPE_DIRECTORY
		undefine
			is_equal
		end

	ARCH_REP_ITEM
		rename
			make as make_adi
		undefine
			is_equal
		end

	MESSAGE_BILLBOARD
		export
			{NONE} all
		undefine
			is_equal
		end

	COMPILER_ERROR_TYPES
		export
			{NONE} all
		undefine
			is_equal
		end

	COMPARABLE

create
	make

feature {NONE} -- Initialisation

	make (a_root_path, a_full_path: STRING; an_id: !ARCHETYPE_ID; a_repository: ARCHETYPE_REPOSITORY_I)
			-- Create for the archetype with `an_id', stored at `a_full_path', belonging to `a_repository' at `a_root_path'.
		require
			repository_attached: a_repository /= Void
			root_path_valid: a_repository.is_valid_directory (a_root_path)
			full_path_attached: a_full_path /= Void
			full_path_under_root_path: a_full_path.starts_with (a_root_path)
		do
			create compiler_status.make_empty
			create differential_text.make_empty
			create flat_text.make_empty

			id := an_id
			make_adi (a_root_path, a_full_path, a_repository)

			if file_system.has_extension (full_path, archetype_source_file_extension) then
				differential_path := full_path
				flat_path := extension_replaced (full_path, archetype_flat_file_extension)
			else
				differential_path := extension_replaced (full_path, archetype_source_file_extension)
				flat_path := full_path
			end

			-- set status of flat archetype by reading its file for now; can't do this with .adls files
			-- yet because there are versions of the AWB out there that have created .adls files, but
			-- don't put the 'generated' marker in
			if file_repository.is_valid_path (flat_path) then
				flat_generated := has_adl_generated_status(file_repository.first_line (flat_path))
			else
				flat_generated := True
			end
		ensure
			root_path_set: root_path = a_root_path
			full_path_set: full_path = a_full_path
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
			no_compiler_status: compiler_status.is_empty
		end

feature -- Access

	id: !ARCHETYPE_ID
			-- Archetype identifier.

	differential_path: STRING
			-- Path of differential source file of archetype.

	flat_path: STRING
			-- Path of flat file of archetype.

	differential_text: STRING
			-- The text of the archetype source file, i.e. the differential form.

	flat_text: STRING
			-- The text of the flat form of the archetype.

	text_timestamp: INTEGER
			-- Date and time at which the archetype differential or flat file was last modified.

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		do
			if is_valid then
				Result := "archetype_valid_" + file_repository.group_id.out
			elseif is_parsed then
				Result := "archetype_parsed_" + file_repository.group_id.out
			elseif parse_attempted then
				Result := "archetype_parse_failed_" + file_repository.group_id.out
			else
				Result := "archetype_" + file_repository.group_id.out
			end
		end

	specialisation_parent: ARCH_REP_ARCHETYPE
			-- parent descriptor, for specialised archetypes only

	archetype_lineage: !ARRAYED_LIST [ARCH_REP_ARCHETYPE] is
			-- lineage of archetypes from parent to this one, inclusive of the current one.
			-- For non-specialised archetypes, contains just the top-level archetype.
			-- NOTE: in theory this could be precomputed from ARCH_DIRECTORY, but modifications to
			-- the directory structure would mean always recomputing parts of it. This computation
			-- is not particularly expensive anyway...however, the result could be cached on a per-
			-- instance basis to be more efficient
		local
			csr: ARCH_REP_ARCHETYPE
		do
			create Result.make (1)

			from
				csr := Current
			until
				csr = Void
			loop
				Result.put_front (csr)
				csr := csr.specialisation_parent
			end
		ensure
			not_empty: not Result.is_empty
			current_last: Result.last = Current
		end

	ontology_lineage: HASH_TABLE [DIFFERENTIAL_ARCHETYPE_ONTOLOGY, INTEGER]
			-- lineage of ontologies of archetypes from top to this one

	archetype_differential: DIFFERENTIAL_ARCHETYPE
			-- archetype representing differential structure with respect to parent archetype;
			-- if this is a non-specialised archetype, then it is the same as the flat form, else
			-- it is just the differences (like an object-oriented source file for a subclass)

	archetype_flat: FLAT_ARCHETYPE
			-- inheritance-flattened form of archetype

	slot_id_index: HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			-- list of Archetype ids matching slot, keyed by slot path

	used_by_index: ARRAYED_LIST [STRING]
			-- list of archetype_ids corresponding to archetypes that use this archetype

	compiler_status: STRING
			-- errors from last compile attempt; allows redisplay if this archetype is reselected

	compiler_error_type: INTEGER is
			-- generate value from COMPILER_ERROR_TYPES as index for error classification elsewhere
		do
			if is_valid then
				if compiler_status.is_empty then
					Result := Err_type_valid
				else
					Result := Err_type_warning
				end
			elseif is_parsed then
				Result := Err_type_validity_error
			else
				Result := Err_type_parse_error
			end
		ensure
			valid: valid_err_type (Result)
		end

feature -- Status Report

	is_at_path (path: STRING): BOOLEAN
			-- Is `path' the same as either `differential_path' or `flat_path'?
		do
			Result := differential_path.same_string (path) or flat_path.same_string (path)
		end

	has_differential_file: BOOLEAN
			-- Does the repository have a source-form file for this archetype?
		do
			Result := file_repository.is_valid_path (differential_path)
		end

	has_flat_file: BOOLEAN
			-- Does the repository have a flat-form file for this archetype?
		do
			Result := file_repository.is_valid_path (flat_path)
		end

	is_specialised: BOOLEAN is
			-- True if this archetype is a specialisation of another archetype
		do
			Result := id.is_specialised
		end

	is_out_of_date: BOOLEAN
			-- Should this archetype be reparsed?
		do
			Result := file_repository.has_file_changed_on_disk (full_path, text_timestamp) or
				is_specialised and specialisation_parent.is_out_of_date
		end

	parse_attempted: BOOLEAN
			-- True if a parse has been attempted on the currently available copy of this archetype
			-- (should be cleared if file is touched in any way)

	validate_attempted: BOOLEAN
			-- True if semantic validation has been attempted using ARCHETYPE_VALIDATOR

	is_parsed: BOOLEAN is
			-- True if archetype has been parsed and loaded in at least differential form
		do
			Result := archetype_differential /= Void
		end

	is_valid: BOOLEAN
			-- True if archetype object created and 'is_valid' True. This can be used to check if the archetype has
			-- actually been compiled and is available in memory. This is useful for specialised archetypes because
			-- you want to know if the parent has been compiled (up the lineage) before you can compile the current one

	has_compiler_status: BOOLEAN
			-- Does this archetype have any compiler errors or warnings?
		do
			Result := not compiler_status.is_empty
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

	differential_generated: BOOLEAN is
			-- True if the differential form was generated from the flat form
		do
			Result := (archetype_differential /= Void and then archetype_differential.is_generated) or else not flat_generated
		end

	flat_generated: BOOLEAN
			-- True if the flat form was generated from the differential form (this status is taken
			-- from the file)

feature -- Status Setting

	set_parse_attempted
			-- Set `parse_attempted' true.
		do
			if not parse_attempted then
				parse_attempted := True
				archetype_directory.increment_parse_attempted_archetype_count
			end
		end

feature -- Commands

	read_differential
			-- Read `differential_text' and `text_timestamp' from `differential_path'.
		require
			differential: has_differential_file
		do
			file_repository.read_text_from_file (differential_path)
			differential_text := file_repository.text
			full_path := differential_path
			text_timestamp := file_repository.text_timestamp
		end

	read_flat
			-- Read `flat_text' and `text_timestamp' from `flat_path'.
		do
			file_repository.read_text_from_file (flat_path)
			flat_text := file_repository.text
			full_path := flat_path
			text_timestamp := file_repository.text_timestamp
		end

	save_differential (a_text: STRING)
			-- save a_text (representing differential archetype) to a file; save to source file path (.adls extension)
		require
			text_attached: a_text /= Void
			text_not_empty: not a_text.is_empty
		do
			differential_text := a_text
			file_repository.save_text_to_file (differential_path, a_text)
			full_path := differential_path
			text_timestamp := file_repository.text_timestamp
		end

	save_flat (a_text: STRING)
			-- save a_text (representing flat archetype) to a file; save to flat file path (.adl extension)
		require
			text_attached: a_text /= Void
			text_not_empty: not a_text.is_empty
		do
			flat_text := a_text
			file_repository.save_text_to_file (flat_path, a_text)
			full_path := flat_path
			text_timestamp := file_repository.text_timestamp
		end

	save_differential_as (a_path, a_text: STRING)
			-- save a_text (representing differential archetype) to a file with source file (.adls) extension
		require
			text_attached: a_text /= Void
			text_not_empty: not a_text.is_empty
			path_valid: is_valid_directory_part (a_path)
		do
			file_repository.save_text_to_file (extension_replaced (a_path, archetype_source_file_extension), a_text)
		end

	save_flat_as (a_path, a_text: STRING)
			-- save a_text (representing flat archetype) to a file with flat file (.adl) extension
		require
			text_attached: a_text /= Void
			text_not_empty: not a_text.is_empty
			path_valid: is_valid_directory_part (a_path)
		do
			file_repository.save_text_to_file (extension_replaced (a_path, archetype_flat_file_extension), a_text)
		end

	validate is
			-- Perform various levels of validation on `archetype_differential'.
		require
			differential_attached: archetype_differential /= Void
		local
			validator: ARCHETYPE_VALIDATOR
		do
			is_valid := False
			create validator.make (Current)
			validator.validate

			if validator.passed then
				post_info (Current, "set_archetype_differential", "parse_archetype_i2", <<id.as_string>>)
			else
				post_error (Current, "set_archetype_differential", "parse_archetype_e2", <<id.as_string, validator.errors>>)
			end

			if validator.has_warnings then
				post_warning (Current, "set_archetype_differential", "parse_archetype_w2", <<id.as_string, validator.warnings>>)
			end

			archetype_differential.set_is_valid (validator.passed)
			validate_attempted := True
			archetype_directory.update_slot_statistics (Current)
			is_valid := validator.passed
		ensure
			validate_attempted
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			if id.is_equal (other.id) then
				Result := full_path < other.full_path
			else
				Result := id < other.id
			end
		end

feature -- Modification

	set_archetype_differential (an_archetype: DIFFERENTIAL_ARCHETYPE) is
			-- create with a new differential form (i.e. source form) archetype
		require
			Archetype_exists: an_archetype /= Void
		local
			arch_flattener: ARCHETYPE_FLATTENER
		do
			archetype_differential := an_archetype
			validate

			-- generate flat form
			if is_valid and archetype_flat = Void then
				if not archetype_differential.is_specialised then
					create archetype_flat.make_from_differential (archetype_differential)
				else
					create arch_flattener.make (specialisation_parent.archetype_flat, archetype_differential)
					arch_flattener.flatten_archetype
					archetype_flat := arch_flattener.arch_output_flat
				end

				-- TODO: Consider setting `flat_text' from serialiser rather than by reading the flat file:
				file_repository.read_text_from_file (flat_path)
				flat_text := file_repository.text
			end
		ensure
			archetype_set: archetype_differential = an_archetype
		end

	set_archetype_flat (an_archetype: FLAT_ARCHETYPE) is
			-- create with a flat form archetype - used for legacy archetypes not yet parsed and
			-- converted to differential form
		require
			Archetype_exists: an_archetype /= Void
		do
			post_info (Current, "set_archetype_flat", "parse_archetype_i2", <<id.as_string>>)
			archetype_flat := an_archetype
			set_archetype_differential (an_archetype.to_differential)
			archetype_flat.rebuild
			archetype_flat.set_is_valid (is_valid)
		ensure
			archetype_set: archetype_flat = an_archetype
		end

	set_specialisation_parent (a_parent: ARCH_REP_ARCHETYPE) is
			-- set `parent'
		require
			Parent_exists: a_parent /= Void
		do
			specialisation_parent := a_parent
		end

	set_compiler_status (str: STRING) is
			-- set `compiler_status'
		require
			String_valid: str /= Void
		do
			compiler_status := str
		end

	clear_compiler_status is
			-- clear `compiler_status'
		do
			compiler_status.wipe_out
		end

	add_slot_ids (a_list: ARRAYED_LIST[STRING]; a_slot_path: STRING) is
			-- add list of matching archetypes to ids recorded for slot at a_slot_path
		do
			if slot_id_index = Void then
				create slot_id_index.make (0)
			end

			if not slot_id_index.has (a_slot_path) then
				slot_id_index.put (a_list, a_slot_path)
				a_list.compare_objects
			else
				from
					a_list.start
				until
					a_list.off
				loop
					if not slot_id_index.item (a_slot_path).has (a_list.item) then
						slot_id_index.item (a_slot_path).extend (a_list.item)
					end

					a_list.forth
				end
			end
		end

	add_used_by_item (an_archetype_id: STRING) is
			-- add the id of an archetype that has a slot that matches this archetype, i.e. that 'uses' this archetype
		do
			if used_by_index = Void then
				create used_by_index.make (0)
				used_by_index.compare_objects
			end

			used_by_index.extend (an_archetype_id)
		end

feature {NONE} -- Implementation

	make_ontological_paths
			-- Make `base_name', `ontological_path' and `ontological_parent_path'.
		local
			pos: INTEGER
			arch_ont_path: STRING
		do
			pos := full_path.last_index_of (os_directory_separator, full_path.count)
			ontological_path := full_path.substring (root_path.count + 1, pos - 1)
			ontological_path.replace_substring_all (os_directory_separator.out, ontological_path_separator)
			ontological_parent_path := ontological_path.twin

			-- generate a semantic path that corresponds to this archetype:
			-- constructed from the relative folder path + the semantic part of the archetype id, with '-' separators
			-- changed to '/' so that the entire path is '/'-separated
			arch_ont_path := id.domain_concept
			arch_ont_path.replace_substring_all (id.section_separator.out, ontological_path_separator)
			ontological_path.append (ontological_path_separator + arch_ont_path)

			-- generate parent ontological path if appropriate
			arch_ont_path := id.domain_concept_base

			if not arch_ont_path.is_empty then
				arch_ont_path.replace_substring_all (id.section_separator.out, ontological_path_separator)
				ontological_parent_path.append (ontological_path_separator + arch_ont_path)
			end

			base_name := id.domain_concept_tail + "(" + id.version_id + ")"
		end

	build_ontology_lineage is
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
				ontology_lineage.put (arch_lin.item.archetype_differential.ontology, arch_lin.item.archetype_differential.specialisation_depth)
				arch_lin.forth
			end
		end

	has_adl_generated_status(str: STRING):BOOLEAN
			-- True if str is in ADL syntax of the first line of an archetype file and contains the
			-- 'generated' flag in the meta-data part. The form of this string should be:
			-- archetype_id (flag; flag; flag...)
			-- FIXME: WARNING this is a hack because we are hard-coding for the 'generated' keyword here,
			-- but currently it is too complicated to extract it from the serialisation objects.
			-- This will be resolved in a few releases when all .adl archetypes are generated from.adls
		require
			str_exists: str /= Void
		local
			lpos, rpos: INTEGER
		do
			lpos := str.index_of('(', 1)
			rpos := str.index_of(')', 1)
			if lpos > 0 and rpos > lpos+1 then
				Result := str.substring (lpos+1, rpos-1).has_substring("generated")
			end
		end

invariant
	compiler_status_attached: compiler_status /= Void
	text_timestamp_natural: text_timestamp >= 0
	differential_text_attached: differential_text /= Void
	flat_text_attached: flat_text /= Void
	differential_path_attached: differential_path /= Void
	flat_path_attached: flat_path /= Void
	full_is_flat_or_differential: full_path = flat_path xor full_path = differential_path
	differential_attached_if_valid: is_valid implies archetype_differential /= Void
	flat_attached_if_valid: is_valid implies archetype_flat /= Void
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
