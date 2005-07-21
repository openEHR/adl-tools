indexing
	component:   "openEHR Archetype Project"
	description: "[
			 C wrapper for ADL_INTERFACE. In this wrapper, the following
			 transformations are made:
			 	- incoming C String arguments are converted to Eiffel Strings
			 	- C String return values are converted from Eiffel STRINGs to C Strings
				- all arguments and return values of complex object types (i.e. types other 
				  than String, Integer, Boolean, Real, Char) are replaced by Integer handles,
				  which are keys to the objects maintained in the single instance of this 
				  class.
			 ]"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ADL_INTERFACE

inherit
	C_ADL_FACTORY
		rename
			make as make_factory
		undefine
			default_rescue
		end

	C_ARCHETYPE
		undefine
			default_rescue
		end
		
	C_ARCHETYPE_ONTOLOGY
		undefine
			default_rescue
		end

	SHARED_ADL_INTERFACE
		export
			{NONE} all
		undefine
			default_rescue
		end
	
	EXCEPTIONS
		export
			{NONE} all
		redefine
			default_rescue
		end
		
	MEMORY
		export
			{NONE} all
		redefine
			default_rescue
		end
		
create
	make

feature -- Initialisation

	make is
			-- create new C ADL Interface
		do
			make_factory
		end
	
feature -- Exception Handling

	default_rescue is
			-- clean up after failed call
		do
			adl_interface.set_status("Software Exception " + exception.out + " caught; stack:%N" + exception_trace)
			adl_interface.set_exception_encountered
		end
		
feature -- Access
	
	status: POINTER is 
			-- status of last operation
		local
			obj: ANY
		do
			obj := adl_interface.status.to_c
			Result := $obj
		end		
		
	serialised_archetype: POINTER is
			-- call after loading and parsing, if no errors encountered
			-- REQUIRE
			--  archetype_available
		local
			obj: ANY
		do
			obj := adl_interface.serialised_archetype.to_c
			Result := $obj
		end

	openehr_version: POINTER is 
			-- openehr version information
		local
			obj: ANY
		do
			obj := adl_interface.openehr_version.to_c
			Result := $obj
		end		
		
feature -- Status Report

	archetype_source_loaded: BOOLEAN is
			-- True if an ADL file has been opened and loaded
		do
			Result := adl_interface.archetype_source_loaded
		end

	parse_succeeded: BOOLEAN is
			-- True if parse has been successfully executed
		do
			Result := adl_interface.parse_succeeded
		end
			
	save_succeeded: BOOLEAN is
			-- True if last save operation was successful
		do
			Result := adl_interface.save_succeeded
		end

	archetype_available: BOOLEAN is
		do
			Result := adl_interface.archetype_available
		end
		
	archetype_valid: BOOLEAN is
		do
			Result := adl_interface.archetype_valid
		end
		
	file_changed_on_disk: BOOLEAN is
			-- True if loaded archetype has changed on disk since last read;
			-- To fix, call resync_file
		do
			Result := adl_interface.file_changed_on_disk
		end
		
	exception_encountered: BOOLEAN is
			-- True if last operation caused an exception
		do
			Result := adl_interface.exception_encountered
		end
		
	has_archetype_serialiser_format(a_format: POINTER): BOOLEAN is
			-- True if a_format known
			-- REQUIRE
			-- 	a_format /= void
		local
			c_a_format: C_STRING
		do
			create c_a_format.make_by_pointer (a_format)
			Result := adl_interface.has_archetype_serialiser_format(c_a_format.string)
		end

feature -- Commands

	set_current_directory (a_dir: POINTER) is
			-- REQUIRE
			-- a_dir_valid: a_dir /= void and then not a_dir.is_empty
		local
			c_a_dir: C_STRING
		do
			create c_a_dir.make_by_pointer (a_dir)
			adl_interface.set_current_directory (c_a_dir.string)
		end
		
	create_new_archetype(a_im_originator, a_im_name, a_im_entity, a_primary_language: POINTER) is
			-- create a new tree and throw away previous state
			-- REQUIRE
			--  info_model_originator_valid: a_im_originator /= void and then not a_im_originator.is_empty
			--  info_model_name_valid: a_im_name /= void and then not a_im_name.is_empty
			--  info_model_entity_valid: a_im_entity /= void and then not a_im_entity.is_empty
			--  primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
		local
			c_a_im_originator, c_a_im_name, c_a_im_entity, c_a_primary_language: C_STRING
		do
			create c_a_im_originator.make_by_pointer (a_im_originator)
			create c_a_im_name.make_by_pointer (a_im_name)
			create c_a_im_entity.make_by_pointer (a_im_entity)
			create c_a_primary_language.make_by_pointer (a_primary_language)
			adl_interface.create_new_archetype(c_a_im_originator.string, 
									c_a_im_name.string, 
									c_a_im_entity.string, 
									c_a_primary_language.string)

			-- put newly created objects into shared object cache for acces from other side of C interface
			set_archetype_definition_handle(adl_objects.new_handle)
			put_c_complex_object(adl_interface.adl_engine.archetype.definition, adl_objects.archetype_definition_handle)
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
			c_specialised_domain_concept: C_STRING
		do
			create c_specialised_domain_concept.make_by_pointer (specialised_domain_concept)
			adl_interface.specialise_archetype(c_specialised_domain_concept.string)
		end
		
	open_adl_file(file_path: POINTER) is
			-- REQUIRE
			--	file_path_valid: file_path /= Void and then not file_path.is_empty
		local
			c_file_path: C_STRING
		do
			create c_file_path.make_by_pointer (file_path)
			
			adl_interface.open_adl_file(c_file_path.string)
		end
		
	resync_file is
			-- resync from disc
		do
			adl_interface.resync_file
		end
		
	save_archetype(file_path, save_format: POINTER) is
			-- Save ADL file via GUI File save dialog
			-- REQUIRE
			-- 	archetype_available
			-- 	file_path_valid: file_path /= Void and then not file_path.is_empty
			--  save_format_valid: save_format /= Void and then has_archetype_serialiser_format(save_format)
		local
			c_file_path, c_save_format: C_STRING
		do
			create c_file_path.make_by_pointer (file_path)
			create c_save_format.make_by_pointer (save_format)
			
			adl_interface.save_archetype(c_file_path.string, c_save_format.string)
		end

	serialise_archetype(serialise_format: POINTER) is
			-- Serialise archetype into string; result available in serialised_archetype
			-- REQUIRE
			-- archetype_available
			-- serialise_format_valid: serialise_format /= Void and then has_archetype_serialiser_format(serialise_format)
		local
			c_serialise_format: C_STRING
		do
			create c_serialise_format.make_by_pointer (serialise_format)
			adl_interface.serialise_archetype(c_serialise_format.string)
		end

	parse_archetype is
			-- Called by `select_actions' of `parse'.
		require
			archetype_source_loaded
		do
			adl_interface.parse_archetype

			-- put newly created objects into shared object cache for acces from other side of C interface
			if parse_succeeded then				
				set_archetype_definition_handle(adl_objects.new_handle)
				put_c_complex_object(adl_interface.adl_engine.archetype.definition, adl_objects.archetype_definition_handle)
			end
		end

	reset is
			-- reset after exception encountered
		do
			adl_interface.reset
			adl_objects.make
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
