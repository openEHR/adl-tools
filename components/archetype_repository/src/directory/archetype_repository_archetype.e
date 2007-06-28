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


class ARCHETYPE_REPOSITORY_ARCHETYPE

inherit
	ARCHETYPE_REPOSITORY_ITEM
		rename
			make as make_adi
		undefine
			is_equal
		end

	COMPARABLE

create
	make

feature -- Initialisation

	make (a_root_path, a_full_path: STRING; an_id: ARCHETYPE_ID; is_specialised_flag: BOOLEAN; a_repository: ARCHETYPE_REPOSITORY_I)
		require
			Repository_exists: a_repository /= Void
			Root_path_valid: a_repository.is_valid_path (a_root_path)
			Full_path_valid: a_full_path /= Void and then a_full_path.substring_index (a_root_path, 1) = 1
			Id_valid: an_id /= Void
		do
			id := an_id
			is_specialised := is_specialised_flag
			make_adi (a_root_path, a_full_path, a_repository)
		end

feature -- Access

	id: ARCHETYPE_ID
			-- Archetype identifier.

	source: STRING
			-- The source text of the archetype.
		do
			Result := repository.source (full_path)
			source_timestamp := repository.source_timestamp
		end

	source_timestamp: INTEGER
			-- Date and time at which the archetype file was last modified.

	compilation_context: ARCHETYPE_CONTEXT
			-- Context object for compilation activities.

	archetype: ARCHETYPE
			-- Differential form of currently compiled archetype.
		do
			Result := compilation_context.differential
		end

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		do
			if id.is_specialised then
				Result := "archetype_specialised_" + repository.group_id.out
			else
				Result := "archetype_" + repository.group_id.out
			end
		end

feature -- Status Report

	is_specialised: BOOLEAN
			-- True if this archetype is a specialisation of another archetype

	file_changed_on_disk: BOOLEAN
			-- Has the loaded archetype designated by `path' changed on disk since last read?
		do
			Result := repository.has_file_changed_on_disk (full_path, source_timestamp)
		end

feature -- Commands

	save (a_text: STRING)
			-- save a_text (representing archetype source) to archetype source file
		require
			Text_valid: a_text /= Void and then not a_text.is_empty
		do
			repository.save_as(full_path, a_text)
		end

	save_as (a_full_path, a_text: STRING)
			-- save a_text (representing archetype source) to archetype source file
		require
			Text_valid: a_text /= Void and then not a_text.is_empty
			Path_valid: is_valid_directory_part (a_full_path)
		do
			repository.save_as (a_full_path, a_text)
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
			Result := id < other.id
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
