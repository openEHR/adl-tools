indexing
	component:   "openEHR Archetype Project"
	description: "[
				 File-system adhoc repository of archetypes - where archetypes are not arranged as a tree
				 but may appear anywhere. Items are added to the repository by the user, not by an automatic
				 scan of a directory tree.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCHETYPE_ADHOC_FILE_REPOSITORY

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make is
			-- create with a sensible work path
		do
			work_path := system_temp_file_directory.twin
			create directory.make (0)
		end

feature -- Access

	work_path: STRING
			-- current work path on file system, normally used to tell GUI or other
			-- file searching method where to start looking

	directory: DS_HASH_TABLE [ARCHETYPE_REPOSITORY_ARCHETYPE, STRING]
			-- the directory of archetypes added to this adhoc repository
			-- as a list of descriptors keyed by full path

	file_context: FILE_CONTEXT
			-- access to file system

	source (an_arch_desc: ARCHETYPE_REPOSITORY_ARCHETYPE): STRING is
			-- get source of archetype from repository medium
		do
			file_context.set_target (an_arch_desc.full_path)
			file_context.read_file
			Result := file_context.file_content
		end

feature -- Status Report

	valid_path(a_path: STRING): BOOLEAN is
			-- validate path on medium
		do
			Result := (create {DIRECTORY}.make(a_path)).exists
		end

feature -- Modification

	set_work_path (a_work_path: STRING) is
			-- make with root path of file system
		require
			root_valid: a_work_path /= Void and then valid_path(a_work_path)
		do
			work_path := a_work_path
		end

	add_item (a_full_path: STRING) is
			-- add an archetype to this repository
		require
			Path_valid: a_full_path /= Void and then valid_path(a_full_path)
		do
			-- TODO: implement this routine :-
			-- create an ARCHETYPE_REPOSITORY_ARCHETYPE, include
			-- empty ontological paths, since the latter are unknown
			-- for archetypes found in ad hoc places like c:\temp, /tmp etc
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
