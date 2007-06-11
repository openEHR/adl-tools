indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Directory representation of a file-system archetype repository.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


deferred class ARCHETYPE_INDEXED_REPOSITORY_I

inherit
	SHARED_ARCHETYPE_CONTEXT
		export
			{NONE} all
			{ANY} current_language, set_current_language
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	MESSAGE_BILLBOARD
		export
			{NONE} all
		end

feature -- Initialisation

	make(a_dir_name: STRING; a_group_id: INTEGER) is
			-- make based on valid directory path
		require
			Dir_name_valid: a_dir_name /= Void and then valid_path(a_dir_name)
		do
			root_path := a_dir_name
			current_group_id := a_group_id
			clear
		end

feature -- Access

	root_path: STRING
			-- path of file-system repository of archetypes

	directory: TWO_WAY_TREE [ARCHETYPE_REPOSITORY_ITEM]
			-- tree-structured directory of folders and archetypes

	source (a_full_path: STRING): STRING is
			-- get source of archetype from repository medium
		require
			path_valid: a_full_path /= Void
		deferred
		ensure
			Result_exists: Result /= Void
		end

	source_timestamp: INTEGER is
			-- modification time of last opened file as an integer, for comparison purposes
		deferred
		end

feature -- Status Report

	valid_path(a_path: STRING): BOOLEAN is
			-- validate path on medium
		require
			a_path /= Void
		deferred
		end

	file_changed_on_disk (a_path: STRING; a_timestamp: INTEGER): BOOLEAN is
			-- True if loaded archetype has changed on disk since last read;
			-- To fix, call resync_file
		deferred
		end

feature -- Commands

	clear is
		do
			current_root_path := root_path
		end

	repopulate is
			-- rebuild directory based on existing paths
		do
			clear
			populate
		end

	populate is
			-- make based on valid directory path
		do
			directory := build_directory(root_path)
		end

	save_as(a_full_path, a_text: STRING) is
			-- save a_text (representing archetype source) to a file
		require
			Text_valid: a_text /= Void and then not a_text.is_empty
			Path_valid: a_full_path /= Void and then valid_path(a_full_path)
		deferred
		end

feature {NONE} -- Implementation

	build_directory(a_dir_name: STRING): TWO_WAY_TREE [ARCHETYPE_REPOSITORY_ITEM] is
			-- build a literal representation of the archetype and folder structure
			-- in the repository path, as a tree; each node carries some meta-data
		require
			Dir_name_valid: a_dir_name /= Void
   		deferred
		end

	current_group_id: INTEGER
			-- id of group currently being populated

	current_root_path: STRING
			-- current path being populated

invariant
	Repository_path_valid: root_path /= Void and then valid_path(root_path)
	Directory_exists: directory /= Void

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
--| The Original Code is adl_node_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
