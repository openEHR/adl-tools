indexing
	component:   "openEHR Archetype Project"
	description: "Descriptor of an archetype in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
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
			if is_specialised then
				Result := "archetype_specialised_" + file_repository.group_id.out
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

	archetype_differential: ARCHETYPE
			-- archetype representing differential structure with respect to parent archetype;
			-- if this is a non-specialised archetype, then it is the same as the flat form, else
			-- it is just the differences (like an object-oriented source file for a subclass)

	archetype_flat: ARCHETYPE
			-- inheritance-flattened form of archetype

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
			-- Has the loaded archetype designated by `full_path' changed on disk since last read?
		do
			Result := not is_parsed or file_repository.has_file_changed_on_disk (full_path, flat_text_timestamp)
		end

	is_parsed: BOOLEAN is
			-- True if archetype has been parsed and loaded in at least flat form
		do
			Result := archetype_flat /= Void
		end

	is_valid: BOOLEAN
			-- True if archetype object created and 'is_valid' True. This can be used to check if the archetype has
			-- actually been compiled and is available in memory. This is useful for specialised archetypes because
			-- you want to know if the parent has been compiled (up the lineage) before you can compile the current
			-- one

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

feature -- Modification

	set_archetype_differential(an_archetype: ARCHETYPE) is
			-- create with a new differential form (i.e. source form) archetype
		require
			Archetype_exists: an_archetype /= Void and then an_archetype.is_differential
		do
			archetype_differential := an_archetype
			if not an_archetype.is_specialised then
				-- FIXME for the moment
				archetype_flat := archetype_differential
			else
				-- FIXME set flat_form to structure generated from differential form in memory
			end

	-- FIXME: the following call yet to be properly implemented
	--		archetype_differential.validate
	--		if archetype_differential.is_valid then
	--			post_info(Current, "parse_archetype", "parse_archetype_i2", <<archetype_differential.archetype_id.as_string>>)
	--			is_valid := True
	--		else
	--			post_error(Current, "parse_archetype", "parse_archetype_e2", <<archetype_differential.archetype_id.as_string, archetype_differential.validator.errors>>)
	--		end
	--		if archetype_differential.validator.has_warnings then
	--			post_warning(Current, "parse_archetype", "parse_archetype_w2", <<archetype_differential.archetype_id.as_string, archetype_differential.validator.warnings>>)
	--		end
		ensure
			Archetype_loaded: archetype_differential /= Void
	--		Archetype_validity: archetype_differential.is_valid implies archetype_flat /= Void
		end

	set_archetype_flat(an_archetype: ARCHETYPE) is
			-- create with a flat form archetype
		require
			Archetype_exists: an_archetype /= Void and then not an_archetype.is_differential
		do
			archetype_flat := an_archetype
			-- FIXME validation is currently done here on flat form; in future has to be done on the differential form,
			-- but requires new validation code to be written. THE FOLLOWING LINES OF CODE WOULD THEN DISAPPEAR - AND THE
			-- EQUIVALENT LINES IN THE make_differential ROUTINE ABOVE WOULD BE UNCOMMENTED, AND EITHER OPY THAT HERE
			-- OR MAKE A NEW ROUTINE THAT VALIDATES THE DIFFERENTIAL FORM, TO BE CALLED BY BOTH make ROUTINES HERE.
			archetype_flat.validate
			if archetype_flat.is_valid then
				post_info(Current, "parse_archetype", "parse_archetype_i2", <<archetype_flat.archetype_id.as_string>>)
				is_valid := True

				-- generate the differential form
				if not an_archetype.is_specialised then
					-- FIXME for the moment; in future needs to be separate instances??
					archetype_differential := archetype_flat
				else -- generate differential form from flat
					-- first make a complete clone of the archetype; could also be done by copy of serialised form and parse
					archetype_differential := archetype_flat.deep_twin
					archetype_differential.convert_to_differential
					post_info (Current, "make_flat", "arch_context_make_flat_i1", Void)
				end
			else
				post_error(Current, "parse_archetype", "parse_archetype_e2", <<archetype_flat.archetype_id.as_string, archetype_flat.validator.errors>>)
			end
			if archetype_flat.validator.has_warnings then
				post_warning(Current, "parse_archetype", "parse_archetype_w2", <<archetype_flat.archetype_id.as_string, archetype_flat.validator.warnings>>)
			end
		ensure
			Archetype_loaded: archetype_flat /= Void
			Archetype_validity: archetype_flat.is_valid implies archetype_differential /= Void
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

	set_specialisation_parent(a_parent: ARCH_REP_ARCHETYPE) is
			-- set `parent'
		require
			Parent_exists: a_parent /= Void
		do
			specialisation_parent := a_parent
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
