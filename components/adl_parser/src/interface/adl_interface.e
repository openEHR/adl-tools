indexing
	component:   "openEHR Archetype Project"
	description: "Service interface to handing ADL files and parsing."
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
			{ANY} language, set_language, set_terminology
		end
	
	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_archetype_serialiser_format, archetype_serialiser_formats
		end
		
	SHARED_DT_SERIALISERS
		export
			{NONE} all
			{ANY} has_dt_serialiser_format
		end
	
	SHARED_CONSTRAINT_MODEL_SERIALISERS
		export
			{NONE} all
			{ANY} has_c_serialiser_format
		end

	SHARED_ASSERTION_SERIALISERS
		export
			{NONE} all
			{ANY} has_assertion_serialiser_format
		end

	SHARED_RESOURCES
		export
			{NONE} all
		end

	MESSAGE_BILLBOARD
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

	make is
		do
			create status.make(0)
			create adl_engine.make
			create file_context.make
			initialise_serialisers
		end
	
feature -- Access
	
	openehr_version: STRING is
			-- version of openEHR implem-dev repository containing
			-- this software
		once
			Result := (create {OPENEHR_VERSION}).version
		end
		
	adl_engine: ADL_ENGINE

	file_context: FILE_CONTEXT
			-- file handling context
		
	working_directory: STRING is
			-- current working directory of application
		do
			Result := file_context.current_directory
		end
		
	status: STRING
			-- status of last operation
			
	serialised_archetype: STRING is
			-- archetype in serialised form, after call to serialise_archetype
		do
			Result := adl_engine.serialised_archetype
		end
			
	archetype: ARCHETYPE is 
		do
			Result := adl_engine.archetype
		end

	ontology: ARCHETYPE_ONTOLOGY is 
		do
			Result := adl_engine.archetype.ontology
		end

feature -- Status Report

	archetype_source_loaded: BOOLEAN is
			-- True if an ADL file has been opened and loaded
		do
			Result := adl_engine.source /= Void
		end

	parse_succeeded: BOOLEAN
			-- True if parse has been successfully executed
			
	save_succeeded: BOOLEAN
			-- True if last save operation was successful

	archetype_available: BOOLEAN is
		do
			Result := adl_engine.archetype_available
		end
		
	archetype_valid: BOOLEAN is
		do
			Result := adl_engine.archetype.is_valid
		end
		
	file_changed_on_disk: BOOLEAN is
			-- True if loaded archetype has changed on disk since last read;
			-- To fix, call resync_file
		do
			Result := file_context.file_changed
		end
		
	exception_encountered: BOOLEAN
			-- True if last operation caused an exception
		
feature -- Commands

	set_current_directory (a_dir: STRING) is
		require
			a_dir_valid: a_dir /= void and then not a_dir.is_empty
		do
			file_context.set_current_directory(a_dir)
		end
		
	create_new_archetype(a_im_originator, a_im_name, a_im_entity, a_primary_language: STRING) is
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
				post_error(Current, "create_new_archetype", "create_new_archetype_e1", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
		rescue
			post_error(Current, "create_new_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end
		
	specialise_archetype(specialised_domain_concept: STRING) is
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
				post_error(Current, "specialise_archetype", "specialise_archetype_e1", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
		rescue
			post_error(Current, "specialise_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end
		
	open_adl_file(file_path: STRING) is
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
					post_error(Current, "open_adl_file", "general_error", <<file_context.last_op_fail_reason>>)
				end
			else
				post_error(Current, "open_adl_file", "open_adl_file_e1", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
		ensure
			archetype_source_loaded or else not status.is_empty
		rescue
			post_error(Current, "open_adl_file", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end
		
	resync_file is
			-- resync from disc
		do
			adl_engine.set_source(file_context.read_file)
		end
		
	save_archetype(file_path, save_format: STRING) is
			-- Save ADL file via GUI File save dialog
		require
			archetype_available
			file_path_valid: file_path /= Void and then not file_path.is_empty
			save_format_valid: save_format /= Void and then has_archetype_serialiser_format(save_format)
		do
			if not exception_encountered then
				status.wipe_out
				save_succeeded := False
				if archetype_valid then
					adl_engine.serialise(save_format)
					if file_context.file_writable(file_path) then
						file_context.save_file(file_path, adl_engine.serialised_archetype)
						post_info(Current, "save_archetype", "save_archetype_i1", <<save_format, language, file_path>>)
						save_succeeded := True
					else
						post_error(Current, "save_archetype", "save_archetype_e1", <<file_path>>)
					end
				else
					post_error(Current, "save_archetype", "save_archetype_e2", <<adl_engine.archetype.errors>>)
				end
			else
				post_error(Current, "save_archetype", "save_archetype_e3", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	serialise_archetype(serialise_format: STRING) is
			-- Serialise archetype into string; result available in serialised_archetype
		require
			archetype_available
			serialise_format_valid: serialise_format /= Void and then has_archetype_serialiser_format(serialise_format)
		do
			if not exception_encountered then
				if adl_engine.archetype.is_valid then
					adl_engine.serialise(serialise_format)
				else
					post_error(Current, "serialise_archetype", "serialise_archetype_e1", <<adl_engine.archetype.errors>>)
				end
			else
				post_error(Current, "serialise_archetype", "serialise_archetype_e2", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
		ensure
			serialised_archetype /= Void or else not status.is_empty
		rescue
			post_error(Current, "serialise_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	parse_archetype is
			-- Called by `select_actions' of `parse'.
		require
			archetype_source_loaded
		do
			clear_billboard
			if not exception_encountered then
				parse_succeeded := False
				adl_engine.parse
				if not adl_engine.archetype_available then
					post_error(Current, "parse_archetype", "parse_archetype_e1", <<adl_engine.parse_error_text>>)						
				else
					post_info(Current, "parse_archetype", "parse_archetype_i1", <<adl_engine.archetype_id.as_string>>)						
					
					if language = Void or not ontology.has_language(language) then
						set_language(ontology.primary_language)
					end
				
					if ontology.terminologies_available.is_empty then
						clear_terminology
					else
						set_terminology(ontology.terminologies_available.first)
					end
				
					if adl_engine.archetype.is_valid then
						post_info(Current, "parse_archetype", "parse_archetype_i2", <<adl_engine.archetype_id.as_string>>)						
						parse_succeeded := True
					else
						post_error(Current, "parse_archetype", "parse_archetype_e2", <<adl_engine.archetype_id.as_string, adl_engine.archetype.errors>>)
					end

					if adl_engine.archetype.has_warnings then
						post_warning(Current, "parse_archetype", "general", <<adl_engine.archetype.warnings>>)
					end
				end
			else
				post_error(Current, "parse_archetype", "parse_archetype_e3", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
		rescue
			post_error(Current, "parse_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	set_archetype_readonly is
			-- set readonly flag in archetype to enable optimisations like path extraction
		do
			archetype.set_readonly
		end
		
	reset is
			-- reset after exception encountered
		do
			exception_encountered := False
			status.wipe_out
		ensure
			Exception_cleared: not exception_encountered
			Status_cleared: status.is_empty
		end
		
feature -- External Java Interface

	set_status(a_str: STRING) is
			-- set status from external wrapper
		do
			status := a_str
		end
	
	set_exception_encountered is
			-- 
		do
			exception_encountered := True
		end
		
feature {NONE} -- Implementation

	initialise_serialisers is
		once
			archetype_serialisers.put(create {ADL_SYNTAX_SERIALISER}.make(create {NATIVE_ADL_SERIALISATION_PROFILE}.make("adl")), "adl")
			archetype_serialisers.put(create {ADL_SYNTAX_SERIALISER}.make(create {HTML_ADL_SERIALISATION_PROFILE}.make("html")), "html")
			-- archetype_serialisers.put(create {ADL_TAGGED_SERIALISER}.make(create {XML_ADL_SERIALISATION_PROFILE}.make("xml")), "xml")
			-- archetype_serialisers.put(create {ADL_OWL_SERIALISER}.make(create {OWL_ADL_SERIALISATION_PROFILE}.make("owl")), "owl")

			c_serialisers.put(create {CADL_SYNTAX_SERIALISER}.make(create {NATIVE_CADL_SERIALISATION_PROFILE}.make("adl")), "adl")
			c_serialisers.put(create {CADL_SYNTAX_SERIALISER}.make(create {HTML_CADL_SERIALISATION_PROFILE}.make("html")), "html")
			-- c_serialisers.put(create {CADL_TAGGED_SERIALISER}.make(create {XML_CADL_SERIALISATION_PROFILE}.make("xml")), "xml")
			-- c_serialisers.put(create {CADL_OWL_SERIALISER}.make(create {OWL_CADL_SERIALISATION_PROFILE}.make("owl")), "owl")

			assertion_serialisers.put(create {ASSERTION_SYNTAX_SERIALISER}.make(create {NATIVE_CADL_SERIALISATION_PROFILE}.make("adl")), "adl")
			assertion_serialisers.put(create {ASSERTION_SYNTAX_SERIALISER}.make(create {HTML_CADL_SERIALISATION_PROFILE}.make("html")), "html")
			-- assertion_serialisers.put(create {ASSERTION_TAGGED_SERIALISER}.make(create {XML_CADL_SERIALISATION_PROFILE}.make("xml")), "xml")
			-- assertion_serialisers.put(create {ASSERTION_OWL_SERIALISER}.make(create {OWL_CADL_SERIALISATION_PROFILE}.make("owl")), "owl")

			dt_serialisers.put(create {DADL_SYNTAX_SERIALISER}.make(create {NATIVE_DADL_SERIALISATION_PROFILE}.make("adl")), "adl")
			dt_serialisers.put(create {DADL_SYNTAX_SERIALISER}.make(create {HTML_DADL_SERIALISATION_PROFILE}.make("html")), "html")
			-- dt_serialisers.put(create {DADL_TAGGED_SERIALISER}.make(create {XML_DADL_SERIALISATION_PROFILE}.make("xml")), "xml")
			-- dt_serialisers.put(create {DADL_OWL_SERIALISER}.make(create {OWL_DADL_SERIALISATION_PROFILE}.make("owl")), "owl")
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
