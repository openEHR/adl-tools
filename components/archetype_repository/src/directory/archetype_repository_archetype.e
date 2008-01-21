indexing
	component:   "openEHR Archetype Project"
	description: "Descriptor of an archetype in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCH_REP_ARCHETYPE

inherit
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

feature -- Initialisation

	make (a_root_path, a_full_path: STRING; an_id: ARCHETYPE_ID; a_repository: ARCHETYPE_REPOSITORY_I)
		require
			Repository_exists: a_repository /= Void
			Root_path_valid: a_repository.is_valid_directory (a_root_path)
			Full_path_valid: a_full_path /= Void and then a_full_path.substring_index (a_root_path, 1) = 1
			Id_valid: an_id /= Void
		do
			id := an_id
			make_adi (a_root_path, a_full_path, a_repository)
			differential_path := full_path.twin
			differential_path.replace_substring (Archetype_source_file_extension, differential_path.count - Archetype_flat_file_extension.count + 1, differential_path.count)
			create compiler_status.make_empty
		end

feature -- Access

	differential_path: STRING
			-- path of differential source file of archetype

	id: ARCHETYPE_ID
			-- Archetype identifier.

	flat_text: STRING
			-- The text of the flat form of the archetype.
		do
			Result := file_repository.text (full_path)
			flat_text_timestamp := file_repository.text_timestamp
		ensure
			Result_exists: Result /= Void
		end

	differential_text: STRING
			-- The text of the archetype source file, i.e. the differential form
		require
			has_differential_file
		do
			Result := file_repository.text (differential_path)
			differential_text_timestamp := file_repository.text_timestamp
		end

	flat_text_timestamp: INTEGER
			-- Date and time at which the archetype flat file was last modified.

	differential_text_timestamp: INTEGER
			-- Date and time at which the archetype source file was last modified.

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

	archetype_lineage: ARRAYED_LIST [ARCH_REP_ARCHETYPE] is
			-- lineage of archetypes from parent to this one, inclusive of the current one.
			-- For non-specialised archetypes, contains just the top-level archetype.
			-- NOTE: in theory this could be precomputed from ARCH_DIRECTORY, but modifications to
			-- the directory structure would mean always recomputing parts of it. This computation
			-- is not particularly expensive anyway...however, the result could be cached on a per-
			-- instance basis to be more efficient
		local
			csr: ARCH_REP_ARCHETYPE
		do
			create Result.make(1)
			from
				csr := Current
			until
				csr = Void
			loop
				Result.put_front (csr)
				csr := csr.specialisation_parent
			end
		end

	ontology_lineage: HASH_TABLE [DIFFERENTIAL_ARCHETYPE_ONTOLOGY, INTEGER]
			-- lineage of ontologies of archetypes from top to this one

	archetype_differential: DIFFERENTIAL_ARCHETYPE
			-- archetype representing differential structure with respect to parent archetype;
			-- if this is a non-specialised archetype, then it is the same as the flat form, else
			-- it is just the differences (like an object-oriented source file for a subclass)

	archetype_flat: FLAT_ARCHETYPE
			-- inheritance-flattened form of archetype

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
			Result_valid: valid_err_type(Result)
		end

feature -- Status Report

	has_differential_file: BOOLEAN is
			-- True if repository has a source-form file for this archetype
		do
			Result := file_repository.is_valid_path (differential_path)
		end

	is_specialised: BOOLEAN is
			-- True if this archetype is a specialisation of another archetype
		do
			Result := id.is_specialised
		end

	is_flat_file_out_of_date: BOOLEAN
			-- Has the flat archetype file changed on disk since last read?
		do
			Result := not is_parsed or file_repository.has_file_changed_on_disk (full_path, flat_text_timestamp)
		end

	is_differential_file_out_of_date: BOOLEAN
			-- Has the differential archetype file changed on disk since last read?
		do
			Result := not is_parsed or file_repository.has_file_changed_on_disk (differential_path, differential_text_timestamp)
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

	has_compiler_status: BOOLEAN is
			-- True if there si any compiler errors or warnings
		do
			Result := not compiler_status.is_empty
		end

feature -- Status Setting

	set_parse_attempted is
			-- set `parse_attempted'
		do
			parse_attempted := True
		end

feature -- Commands

	save_differential (a_text: STRING)
			-- save a_text (representing differential archetype) to a file; save to source file path (.adls extension)
		require
			Text_valid: a_text /= Void and then not a_text.is_empty
		do
			file_repository.save_text_to_file(differential_path, a_text)
		end

	save_differential_as (a_path, a_text: STRING)
			-- save a_text (representing differential archetype) to a file with source file (.adls) extension
		require
			Text_valid: a_text /= Void and then not a_text.is_empty
			Path_valid: is_valid_directory_part (a_path)
		local
			save_path: STRING
		do
			save_path := a_path.twin
			save_path.replace_substring (Archetype_source_file_extension, save_path.count - Archetype_flat_file_extension.count + 1, save_path.count)

			file_repository.save_text_to_file (save_path, a_text)
		end

	save_flat (a_text: STRING)
			-- save a_text (representing flat archetype) to a file; save to flat file path (.adl extension)
		require
			Text_valid: a_text /= Void and then not a_text.is_empty
		do
			file_repository.save_text_to_file(full_path, a_text)
		end

	save_flat_as (a_path, a_text: STRING)
			-- save a_text (representing flat archetype) to a file with flat file (.adl) extension
		require
			Text_valid: a_text /= Void and then not a_text.is_empty
			Path_valid: is_valid_directory_part (a_path)
		local
			save_path: STRING
		do
			save_path := a_path.twin
			-- FIXME: see if there is an extension; if there is, change it to .adl

			file_repository.save_text_to_file (save_path, a_text)
		end

	validate is
			-- perform various levels validation of differential archetype
		require
			archetype_differential /= Void
		local
			validator: ARCHETYPE_VALIDATOR
		do
			is_valid := False
			create validator.make(Current)
			validator.validate
			is_valid := validator.passed

			if not is_valid then
				post_error(Current, "set_archetype_differential", "parse_archetype_e2", <<id.as_string, validator.errors>>)
			else
				post_info(Current, "set_archetype_differential", "parse_archetype_i2", <<id.as_string>>)
			end
			if validator.has_warnings then
				post_warning(Current, "set_archetype_differential", "parse_archetype_w2", <<id.as_string, validator.warnings>>)
			end

			archetype_differential.set_is_valid(is_valid)
			validate_attempted := True
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

	set_archetype_differential(an_archetype: DIFFERENTIAL_ARCHETYPE) is
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
					archetype_flat := arch_flattener.output
				end
			end
		ensure
			Is_parsed: archetype_differential /= Void
		end

	set_archetype_flat(an_archetype: FLAT_ARCHETYPE) is
			-- create with a flat form archetype - used for legacy archetypes not yet parsed and
			-- converted to differential form
		require
			Archetype_exists: an_archetype /= Void
		do
			post_info(Current, "set_archetype_flat", "parse_archetype_i2", <<id.as_string>>)
			archetype_flat := an_archetype
			set_archetype_differential(an_archetype.to_differential)
			archetype_flat.rebuild
			archetype_flat.set_is_valid (is_valid)
		ensure
			Archetype_flat_set: archetype_flat /= Void
		end

	set_specialisation_parent(a_parent: ARCH_REP_ARCHETYPE) is
			-- set `parent'
		require
			Parent_exists: a_parent /= Void
		do
			specialisation_parent := a_parent
		end

	set_compiler_status(str: STRING) is
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
				ontology_lineage.put(arch_lin.item.archetype_differential.ontology, arch_lin.item.archetype_differential.specialisation_depth)
				arch_lin.forth
			end
		end

invariant
	Parent_existence: specialisation_parent /= Void implies is_specialised
	Parent_validity: specialisation_parent /= Void implies specialisation_parent.id.semantic_id.is_equal(id.semantic_parent_id)

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
