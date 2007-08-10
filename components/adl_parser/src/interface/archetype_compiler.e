indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype compiler interface. This object is targetted to archetypes found in the 
				 ARCHETYPE_DIRECTORY, and can then be used to parse (single archetype), compile
				 (archetype lineage), save (serialise back to ADL), and save-as (serialise to
				 another format).
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_COMPILER

inherit
	SHARED_ARCHETYPE_DIRECTORY

	SHARED_C_FACTORY
		export
			{NONE} all
			{ANY} constraint_model_factory
		end

	SHARED_APPLICATION_CONTEXT
		export
			{NONE} all
			{ANY} current_language, set_current_language
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

	SHARED_C_SERIALISERS
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

create
	make

feature -- Initialisation

	make is
		do
			create status.make(0)
			create adl_engine.make
			initialise_serialisers
		end

feature -- Definitions

	openehr_version: STRING is
			-- version of openEHR implem-dev repository containing
			-- this software
		once
			Result := (create {OPENEHR_VERSION}).version
		end

feature -- Access

	target: ARCH_REP_ARCHETYPE
			-- archetype currently being processed by this instance of the compiler

	source: STRING is
			-- source of current archetype
		do
			Result := target.source
		end

	archetype: ARCHETYPE is
			-- Differential form of currently compiled archetype.
		do
			Result := target.compilation_context.archetype
		end

	serialised_archetype: STRING
			-- archetype in serialised form, after call to serialise_archetype

	status: STRING
			-- status of last operation

feature -- Status Report

	archetype_parsed: BOOLEAN
			-- Has the archetype been parsed into an ARCHETYPE structure?
		do
			Result := target.compilation_context /= Void
		end

	archetype_valid: BOOLEAN
			-- Has the archetype been parsed into an ARCHETYPE structure and then validated?
		do
			Result := target.compilation_context /= Void and then target.compilation_context.is_valid
		end

	save_succeeded: BOOLEAN
			-- True if last save operation was successful

	exception_encountered: BOOLEAN
			-- True if last operation caused an exception

	has_target: BOOLEAN is
			-- True if the compiler has been set to a target archetype descriptor in the ARCHETYPE_DIRECTORY
		do
			Result := target /= Void
		end

feature -- Modification

	set_target (ara: ARCH_REP_ARCHETYPE) is
			-- set target of the compiler to designated archetype
		require
			descriptor_exists: ara /= Void
		do
			reset
			target := ara
		ensure
			has_target
		end

	set_target_to_selected is
			-- set target of the compiler to archetype currently selected in archetype_directory
		require
			archetype_available: archetype_directory.has_selected_archetype_descriptor
		do
			set_target(archetype_directory.selected_descriptor)
		ensure
			has_target
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

feature -- Commands

	parse_archetype is
			-- parse the target archetype of this compiler
		require
			Has_target: has_target
		local
			an_archetype: ARCHETYPE
		do
			if not exception_encountered then
				clear_billboard
				if target.is_out_of_date then
					an_archetype := adl_engine.parse(target.source)
					if an_archetype = Void then
						post_error(Current, "parse_archetype", "parse_archetype_e1", <<adl_engine.parse_error_text>>)
					else
						post_info(Current, "parse_archetype", "parse_archetype_i1", <<target.id.as_string>>)

						-- put the archetype into the its directory node; note that this runs its validator(s) and further
						-- errors and warnings are reported on the billboard
						target.set_compilation_context(an_archetype)
					end
				end

				-- make sure that the language is set, and that it is one of the languages in the archetype
				if current_language = Void or not archetype.has_language (current_language) then
					set_current_language(archetype.original_language.code_string)
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

	create_new_archetype(a_im_originator, a_im_name, a_im_entity, a_primary_language: STRING) is
			-- create a new top-level archetype and install it into the directory according to its id
		require
			Info_model_originator_valid: a_im_originator /= void and then not a_im_originator.is_empty
			Info_model_name_valid: a_im_name /= void and then not a_im_name.is_empty
			Info_model_entity_valid: a_im_entity /= void and then not a_im_entity.is_empty
			Primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
		local
			an_archetype: ARCHETYPE
		do
			if not exception_encountered then
				create an_archetype.make_minimal(create {ARCHETYPE_ID}.make(a_im_originator, a_im_name, a_im_entity,
					"UNKNOWN", "draft"), a_primary_language, 0)

				set_current_language(a_primary_language)

				-- FIXME: now add this archetype into the ARCHETYPE_DIRECTORY

				-- set it as the target
			else
				post_error(Current, "create_new_archetype", "create_new_archetype_e1", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
		ensure
			-- FIXME: make the new archetype the target??
		rescue
			post_error(Current, "create_new_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	create_new_specialised_archetype(specialised_domain_concept: STRING) is
			-- create a new specialised archetype as a child of the target archetype and install it in
			-- the directory
		require
			Has_target: has_target
			Concept_valid: specialised_domain_concept /= Void and then not specialised_domain_concept.is_empty
		local
			an_archetype: ARCHETYPE
		do
			if not exception_encountered then
				create an_archetype.make_specialised_child(archetype, specialised_domain_concept)

				-- FIXME: now add this archetype into the ARCHETYPE_DIRECTORY
			else
				post_error(Current, "create_new_specialised_archetype", "create_new_specialised_archetype_e1", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
		rescue
			post_error(Current, "create_new_specialised_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	save_archetype is
			-- Save current target archetype to its file
		require
			Has_target: has_target
		do
			if not exception_encountered then
				status.wipe_out
				save_succeeded := False
				if archetype_valid then
					serialised_archetype := adl_engine.serialise(archetype, "adl")
					target.save (serialised_archetype)
					save_succeeded := True
				else
					post_error(Current, "save_archetype", "save_archetype_e2", Void)
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

	save_archetype_as(a_full_path: STRING; serialise_format: STRING) is
			-- Save current target archetype to `file_path' in `serialise_format'.
		require
			Has_target: has_target
			path_valid: a_full_path /= Void and then not a_full_path.is_empty
			Serialise_format_valid: serialise_format /= Void and then has_archetype_serialiser_format(serialise_format)
		do
			if not exception_encountered then
				status.wipe_out
				save_succeeded := False
				if archetype_valid then
					serialised_archetype := adl_engine.serialise(archetype, serialise_format)
					save_succeeded := True
					target.save_as (a_full_path, serialised_archetype)
				else
					post_error(Current, "save_archetype", "save_archetype_e2", Void)
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
			-- Serialise archetype into string; result available in `serialised_archetype'
		require
			Has_target: has_target and archetype_valid
			Serialise_format_valid: serialise_format /= Void and then has_archetype_serialiser_format(serialise_format)
		do
			if not exception_encountered then
				serialised_archetype := adl_engine.serialise(archetype, serialise_format)
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

	adl_engine: ADL_ENGINE

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
