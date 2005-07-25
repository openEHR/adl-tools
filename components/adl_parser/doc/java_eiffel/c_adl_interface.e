indexing
	component:   "openEHR Archetype Project"
	description: "C wrapper for ADL_INTERFACE"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$Source$"
	revision:    "$Revision$"
	last_change: "$Date$"

class C_ADL_INTERFACE

inherit
	ANY
		export
			{NONE} all
		end
	
create
	make
	
feature -- Initialisation

	make is
		do
		end

feature -- Access
	
	status: POINTER is 
			-- status of last operation
		local
			obj: ANY
		do
			obj := impl.status.to_c
			Result := $obj
		end		
		
	serialised_archetype: POINTER is
			-- call after loading and parsing, if no errors encountered
			-- require
			--  archetype_available
		local
			obj: ANY
		do
			obj := impl.adl_engine.serialised_archetype.to_c
			Result := $obj
		end

feature -- Status Report

	archetype_source_loaded: BOOLEAN is
			-- True if an ADL file has been opened and loaded
		do
			Result := impl.archetype_source_loaded
		end

	parse_succeeded: BOOLEAN is
			-- True if parse has been successfully executed
		do
			Result := impl.parse_succeeded
		end
			
	save_succeeded: BOOLEAN is
			-- True if last save operation was successful
		do
			Result := impl.save_succeeded
		end

	archetype_available: BOOLEAN is
		do
			Result := impl.archetype_available
		end
		
	archetype_valid: BOOLEAN is
		do
			Result := impl.archetype_valid
		end
		
	file_changed_on_disk: BOOLEAN is
			-- True if loaded archetype has changed on disk since last read;
			-- To fix, call resync_file
		do
			Result := impl.file_changed_on_disk
		end
		
	exception_encountered: BOOLEAN is
			-- True if last operation caused an exception
		do
			Result := impl.exception_encountered
		end
		
	has_archetype_serialiser_format(a_format: POINTER): BOOLEAN is
			-- True if a_format known
			-- REQUIRE
			-- 	a_format /= void
		local
			c_a_format: EIF_C_STRING
		do
			create c_a_format.make_by_pointer (a_format)
			Result := impl.has_archetype_serialiser_format(c_a_format.string)
		end

feature -- Commands

	set_current_directory (a_dir: POINTER) is
			-- REQUIRE
			-- a_dir_valid: a_dir /= void and then not a_dir.is_empty
		local
			c_a_dir: EIF_C_STRING
		do
			create c_a_dir.make_by_pointer (a_dir)
			impl.set_current_directory (c_a_dir.string)
		end
		
	create_new_archetype(a_im_originator, a_im_name, a_im_entity, a_primary_language: POINTER) is
			-- create a new tree and throw away previous state
			-- REQUIRE
			--  info_model_originator_valid: a_im_originator /= void and then not a_im_originator.is_empty
			--  info_model_name_valid: a_im_name /= void and then not a_im_name.is_empty
			--  info_model_entity_valid: a_im_entity /= void and then not a_im_entity.is_empty
			--  primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
		local
			c_a_im_originator, c_a_im_name, c_a_im_entity, c_a_primary_language: EIF_C_STRING
		do
			create c_a_im_originator.make_by_pointer (a_im_originator)
			create c_a_im_name.make_by_pointer (a_im_name)
			create c_a_im_entity.make_by_pointer (a_im_entity)
			create c_a_primary_language.make_by_pointer (a_primary_language)
			impl.create_new_archetype(c_a_im_originator.string, 
					c_a_im_name.string, 
					c_a_im_entity.string, 
					c_a_primary_language.string)
		end
		
	specialise_archetype(specialised_domain_concept: POINTER) is
			-- convert current archetype to specialised version of itself,
			-- supplying a specialised domain concept string to go in the new archetype id
			-- (which is a duplicate of the old one, with this concept string inserted)
			-- REQUIRE
			--  Archetype_available: archetype_available and then archetype_valid
			--  Concept_valid: specialised_domain_concept /= Void and then not 
			--					specialised_domain_concept.is_empty
		local
			c_specialised_domain_concept: EIF_C_STRING
		do
			create c_specialised_domain_concept.make_by_pointer (specialised_domain_concept)
			impl.specialise_archetype(c_specialised_domain_concept.string)
		end
		
	open_adl_file(file_path: POINTER) is
			-- REQUIRE
			--	file_path_valid: file_path /= Void and then not file_path.is_empty
		local
			c_file_path: EIF_C_STRING
		do
			create c_file_path.make_by_pointer (file_path)
			
			io.put_string("Entered C_ADL_INTERFACE.open_adl_file%N")
			impl.open_adl_file(c_file_path.string)
			io.put_string("Exited C_ADL_INTERFACE.open_adl_file%N")
		end
		
	resync_file is
			-- resync from disc
		do
			impl.resync_file
		end
		
	save_archetype(file_path, save_format: POINTER) is
			-- Save ADL file via GUI File save dialog
			-- REQUIRE
			-- 	archetype_available
			-- 	file_path_valid: file_path /= Void and then not file_path.is_empty
			--  save_format_valid: save_format /= Void and then has_archetype_serialiser_format(save_format)
		local
			c_file_path, c_save_format: EIF_C_STRING
		do
			create c_file_path.make_by_pointer (file_path)
			create c_save_format.make_by_pointer (save_format)
			
			impl.save_archetype(c_file_path.string, c_save_format.string)
		end

	parse_archetype is
			-- Called by `select_actions' of `parse'.
		require
			archetype_source_loaded
		do
			impl.parse_archetype
		end

	reset is
			-- reset after exception encountered
		do
			impl.reset
		end
	
feature {NONE} -- Implementation

	impl: ADL_INTERFACE is 
		once
			create Result.make			
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
--| The Original Code is adl_interface.e.
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
