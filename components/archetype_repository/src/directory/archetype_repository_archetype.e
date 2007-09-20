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

	COMPARABLE

create
	make

feature -- Initialisation

	make (a_root_path, a_full_path: STRING; an_id: ARCHETYPE_ID; a_repository: ARCHETYPE_REPOSITORY_I)
		require
			Repository_exists: a_repository /= Void
			Root_path_valid: a_repository.is_valid_path (a_root_path)
			Full_path_valid: a_full_path /= Void and then a_full_path.substring_index (a_root_path, 1) = 1
			Id_valid: an_id /= Void
		do
			id := an_id
			make_adi (a_root_path, a_full_path, a_repository)
		end

feature -- Access

	id: ARCHETYPE_ID
			-- Archetype identifier.

	source: STRING
			-- The source text of the archetype.
		do
			Result := source_repository.source (full_path)
			source_timestamp := source_repository.source_timestamp
		end

	source_timestamp: INTEGER
			-- Date and time at which the archetype file was last modified.

	compilation_context: ARCH_CONTEXT
			-- Context object for compilation activities.

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		do
			if is_specialised then
				Result := "archetype_specialised_" + source_repository.group_id.out
			else
				Result := "archetype_" + source_repository.group_id.out
			end
		end

	specialisation_parent: ARCH_REP_ARCHETYPE
			-- parent descriptor, for specialised archetypes only

feature -- Status Report

	is_specialised: BOOLEAN is
			-- True if this archetype is a specialisation of another archetype
		do
			Result := id.is_specialised
		end

	is_out_of_date: BOOLEAN
			-- Has the loaded archetype designated by `path' changed on disk since last read?
		do
			Result := compilation_context = Void or source_repository.has_file_changed_on_disk (full_path, source_timestamp)
		end

feature -- Commands

	save (a_text: STRING)
			-- save a_text (representing archetype source) to archetype source file
		require
			Text_valid: a_text /= Void and then not a_text.is_empty
		do
			source_repository.save_as(full_path, a_text)
		end

	save_as (a_full_path, a_text: STRING)
			-- save a_text (representing archetype source) to archetype source file
		require
			Text_valid: a_text /= Void and then not a_text.is_empty
			Path_valid: is_valid_directory_part (a_full_path)
		do
			source_repository.save_as (a_full_path, a_text)
		end

	set_compilation_context (a_source_archetype: ARCHETYPE)
			-- create compilation context object with a_source_archetype, which is
			-- an archetype in differential (source) form (cf flattened)
		require
			a_source_archetype /= Void
		do
			create compilation_context.make(a_source_archetype)
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
