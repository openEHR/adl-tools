note
	component:   "openEHR Archetype Project"
	description: "Service interface to handing ADL files and parsing."
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$Source$"
	revision:    "$Revision$"
	last_change: "$Date$"

class ADL_INTERFACE

inherit
	SHARED_CONSTRAINT_MODEL_FACTORY
		export
			{NONE} all
			{ANY} constraint_model_factory
		end
	
	SHARED_ARCHETYPE_CONTEXT
		export
			{NONE} all
			{ANY} language, ontology, set_language, set_terminology
		end
	
	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_archetype_serialiser_format, archetype_serialiser_formats
		end
		
	SHARED_RESOURCES
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end
		
	OG_PATH_TOOLS
		export
			{NONE} all
			{ANY} valid_path_string, path_parse_error
		end

create
	make
	
feature -- Initialisation

	make
		do
			create status.make(0)
			create adl_engine.make
			create file_context.make
		end
	
feature -- Access
	
	adl_engine: ADL_ENGINE

	file_context: FILE_CONTEXT
			-- file handling context
		
	working_directory: STRING
			-- current working directory of application
		do
			Result := file_context.current_directory
		end
		
	status: STRING
			-- status of last operation

	editor_command: STRING
			-- command to launch when edit button pushed
			
feature -- Status Report

	archetype_source_loaded: BOOLEAN
			-- True if an ADL file has been opened and loaded
		do
			Result := adl_engine.source /= Void
		end

	parse_succeeded: BOOLEAN
			-- True if parse has been successfully executed
			
	save_succeeded: BOOLEAN
			-- True if last save operation was successful

	archetype_available: BOOLEAN
		do
			Result := adl_engine.archetype_available
		end
		
	archetype_valid: BOOLEAN
		do
			Result := adl_engine.archetype.is_valid
		end
		
	file_changed_on_disk: BOOLEAN
			-- True if loaded archetype has changed on disk since last read;
			-- To fix, call resync_file
		do
			Result := file_context.file_changed
		end
		
	exception_encountered: BOOLEAN
			-- True if last operation caused an exception
		
feature -- Commands

	set_current_directory (a_dir: STRING)
		require
			a_dir_valid: a_dir /= void and then not a_dir.is_empty
		do
			file_context.set_current_directory(a_dir)
		end
		
	create_new_archetype(a_im_originator, a_im_name, a_im_entity, a_primary_language: STRING)
			-- create a new tree and throw away previous state
		require
			Info_model_originator_valid: a_im_originator /= void and then not a_im_originator.is_empty
			Info_model_name_valid: a_im_name /= void and then not a_im_name.is_empty
			Info_model_entity_valid: a_im_entity /= void and then not a_im_entity.is_empty
			Primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
		do
			if not exception_encountered then
				adl_engine.create_new_archetype(a_im_originator, a_im_name, a_im_entity, a_primary_language)
			else
				status.append("%NSAVE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear")
			end
		rescue
			status.wipe_out
			status.append("Software Exception " + exception.out + " caught; stack:%N")
			status.append(exception_trace)
			exception_encountered := True
			retry
		end
		
	specialise_archetype(specialised_domain_concept: STRING)
			-- convert current archetype to specialised version of itself,
			-- supplying a specialised domain concept string to go in the new archetype id
			-- (which is a duplicate of the old one, with this concept string inserted)
		require
			Archetype_available: archetype_available and then archetype_valid
			Concept_valid: specialised_domain_concept /= Void and then not specialised_domain_concept.is_empty
		do
			if not exception_encountered then
				adl_engine.specialise_archetype(specialised_domain_concept)
			else
				status.append("%NSAVE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear")
			end
		rescue
			status.wipe_out
			status.append("Software Exception " + exception.out + " caught; stack:%N")
			status.append(exception_trace)
			exception_encountered := True
			retry
		end
		
	open_adl_file(file_path: STRING)
		require
			file_path_valid: file_path /= Void and then not file_path.is_empty
		local
			src: STRING
		do
			if not exception_encountered then
				file_context.set_file_details(file_path)
				src := file_context.read_file
				if not file_context.last_op_failed then
					adl_engine.set_source(file_context.read_file)
				else	
					status.append("Error: " + file_context.last_op_fail_reason)
				end
			else
				status.append("%NOPEN FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear")
			end
		ensure
			archetype_source_loaded or else not status.is_empty
		rescue
			status.wipe_out
			status.append("Software Exception " + exception.out + " caught; stack:%N")
			status.append(exception_trace)
			exception_encountered := True
			retry
		end
		
	resync_file
			-- resync from disc
		do
			adl_engine.set_source(file_context.read_file)
		end
		
	save_archetype(file_path, save_format: STRING)
			-- Save ADL file via GUI File save dialog
		require
			archetype_available
			file_path_valid: file_path /= Void and then not file_path.is_empty
			save_format_valid: save_format /= Void and then has_archetype_serialiser_format(save_format)
		do
			if not exception_encountered then
				status.wipe_out
				save_succeeded := False
				if adl_engine.archetype.is_valid then
					adl_engine.serialise(save_format)
					if file_context.file_writable(file_path) then
						file_context.save_file(file_path, adl_engine.serialised_archetype)
						status.append("Serialised: " + save_format + ", " + language + " to file " + file_path + "%N")
						save_succeeded := True
					else
						status.append("Serialise failed - could not write to file " + file_path + "%N")
					end
				else
					status.append("Serialisation failed; archetype not valid: " + adl_engine.archetype.errors + "%N")
				end
			else
				status.append("%NSAVE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear")
			end
		ensure
			save_succeeded or else not status.is_empty
		rescue
			status.wipe_out
			status.append("Software Exception " + exception.out + " caught; stack:%N")
			status.append(exception_trace)
			exception_encountered := True
			retry
		end

	parse_archetype
			-- Called by `select_actions' of `parse'.
		require
			archetype_source_loaded
		do
			if not exception_encountered then
				parse_succeeded := False
				adl_engine.parse
				status.wipe_out
				if not adl_engine.archetype_available then
					status.append(adl_engine.parse_error_text)
					status.append("(Parse failed)%N")
				else
					status.append("Archetype " + adl_engine.archetype_id.as_string + " syntax VALIDATED%N")
					if language = Void then
						set_language(ontology.primary_language)
					end
				
					if ontology.terminologies_available.is_empty then
						clear_terminology
					else
						set_terminology(ontology.terminologies_available.first)
					end
				
					if adl_engine.archetype.is_valid then
						status.append("Archetype " + adl_engine.archetype_id.as_string + " ontology validation PASSED%N")
						parse_succeeded := True
					else
						status.append("Archetype " + adl_engine.archetype_id.as_string + " ontology validation FAILED; reasons:%N")
						status.append(adl_engine.archetype.errors)
					end
					if adl_engine.archetype.has_warnings then
						status.append(adl_engine.archetype.warnings)							
					end
				end
			else
				status.append("%NSAVE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear")
			end
		rescue
			status.wipe_out
			status.append("Software Exception " + exception.out + " caught; stack:%N")
			status.append(exception_trace)
			exception_encountered := True
			retry
		end

	reset
			-- reset after exception encountered
		do
			exception_encountered := False
			status.wipe_out
		ensure
			Exception_cleared: not exception_encountered
			Status_cleared: status.is_empty
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
