indexing
	component:   "openEHR Archetype Project"
	description: "interface class to ADL parser and parse tree"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_ENGINE

inherit
	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all;
			{ANY} archetype_serialiser_formats, has_archetype_serialiser_format
		end
		
	SHARED_ARCHETYPE_CONTEXT
		export
			{NONE} all
		end
		
	SHARED_CONSTRAINT_MODEL_FACTORY
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end

creation
	make

feature -- Initialisation
	
	make is
		do
			create description_context.make
			create definition_context.make
			create invariant_context.make
			create ontology_context.make
		end

feature -- Access

	archetype_id: ARCHETYPE_ID
			-- id of current archetype
			
	parent_archetype_id: ARCHETYPE_ID
			-- id of current archetype parent, if specialised
			
	source: STRING
			-- source of current archetype
			
	archetype: ARCHETYPE
			-- set if parse succeeded or if created new
			
	ontology: ARCHETYPE_ONTOLOGY is
			-- retrieve ontology from current archetype
		require
			archetype_available
		do
			Result := archetype.ontology
		end		

	serialised_archetype: STRING
	
	parse_error_text: STRING
			-- errors of last parse
		
feature -- Status Report

	archetype_available: BOOLEAN is
			-- True if parse failed; call after parse()
		do
			Result := archetype /= Void
		end

feature -- Commands

	create_new_archetype(a_im_originator, a_im_name, a_im_entity, a_primary_language: STRING) is
			-- create a new archetype and throw away previous state
		require
			a_im_originator /= void and then not a_im_originator.is_empty
			a_im_name /= void and then not a_im_name.is_empty
			a_im_entity /= void and then not a_im_entity.is_empty
			Primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
		do
			source := Void
			create archetype.make_minimal(create {ARCHETYPE_ID}.make(a_im_originator, a_im_name, a_im_entity, 
				"UNKNOWN", "draft"), a_primary_language)
			set_language(archetype.ontology.primary_language)
			archetype_id := archetype.archetype_id
		ensure
			Archetype_available: archetype_available and archetype.is_valid
		end

	specialise_archetype(specialised_domain_concept: STRING) is
			-- convert current archetype to specialised version of itself,
			-- supplying a specialised domain concept string to go in the new archetype id
			-- (which is a duplicate of the old one, with this concept string inserted)
		require
			Archetype_available: archetype_available and then archetype.is_valid
			Concept_valid: specialised_domain_concept /= Void and then not specialised_domain_concept.is_empty
		do
			archetype.convert_to_specialised(specialised_domain_concept)
			parent_archetype_id := archetype.parent_archetype_id
		ensure
			Archetype_available: archetype.is_valid
		end
		
	set_archetype_id(an_id: ARCHETYPE_ID) is
			-- set archetype id from GUI
		require
			Id_valid: an_id /= Void
		do
			archetype_id := an_id
		end

	set_parent_archetype_id(an_id: ARCHETYPE_ID) is
			-- set archetype id from GUI
		require
			Id_valid: an_id /= Void
		do
			parent_archetype_id := an_id
		end

	set_source(in_text: STRING) is
			-- set `in_text' as working archetype with id `arch_id'
		require
			Text_valid: in_text /= Void and then not in_text.is_empty
		do
			source := in_text
		end
		
	parse is
			-- parse tree. If successful, `archetype' contains the parse
			-- structure. Then validate the tree
		require
			Source_exists: source /= Void
		local
		      description_error, invariant_error: BOOLEAN
			arch_desc: ARCHETYPE_DESCRIPTION
		do
			archetype := Void
			serialised_archetype := Void

			create adl_parser.make
			adl_parser.execute(source)
			archetype_id := adl_parser.archetype_id -- usually it will have been set
			if adl_parser.syntax_error then
				parse_error_text := adl_parser.error_text
			else
				if adl_parser.parent_archetype_id /= Void then
					parent_archetype_id := adl_parser.parent_archetype_id
				else
					parent_archetype_id := Void
				end						
				if adl_parser.description_text /= Void and then not adl_parser.description_text.is_empty then
					description_context.set_source(adl_parser.description_text, adl_parser.description_text_start_line)
					description_context.parse
					if not description_context.parse_succeeded then
						parse_error_text := description_context.parse_error_text
						description_error := True
					end
				else
					description_context.reset
				end
				if not description_error then
					if description_context.tree /= Void then
						arch_desc ?= description_context.tree.as_object (arch_desc_id)
					end
					definition_context.set_source(adl_parser.definition_text, adl_parser.definition_text_start_line)
					definition_context.parse
					if not definition_context.parse_succeeded then
						parse_error_text := definition_context.parse_error_text
					else
						if adl_parser.invariant_text /= Void and then not adl_parser.invariant_text.is_empty then
							invariant_context.set_source(adl_parser.invariant_text, adl_parser.invariant_text_start_line)
							invariant_context.parse
							if not invariant_context.parse_succeeded then
								parse_error_text := invariant_context.parse_error_text
								invariant_error := True
							end
						else
							invariant_context.reset
						end

						if not invariant_error then
							ontology_context.set_source(adl_parser.ontology_text, adl_parser.ontology_text_start_line)
							ontology_context.parse
							if not ontology_context.parse_succeeded then
							    parse_error_text := ontology_context.parse_error_text
							else
							    create archetype.make(
								    adl_parser.archetype_id,
								    adl_parser.concept,
								    arch_desc,	-- may be Void
								    definition_context.tree,
								    create {ARCHETYPE_ONTOLOGY}.make_from_tree(ontology_context.tree, 
								    	adl_parser.concept)
							    )
							    if adl_parser.parent_archetype_id /= Void then
								    archetype.set_parent_archetype_id(adl_parser.parent_archetype_id)
							    end						
							    if invariant_context.tree /= Void then
								    archetype.set_invariants(invariant_context.tree)
							    end
							    if not archetype.is_valid then
								    parse_error_text := archetype.errors		
							    end
							end
						end
					end
				end
			end
		end
		
	serialise(a_format: STRING) is
			-- serialise current archetype into format
		require
			Format_valid: has_archetype_serialiser_format(a_format)
			Archetype_valid: archetype.is_valid
		do
			synchronise_from_archetype
			description_context.serialise(a_format)
			definition_context.serialise(a_format, ontology)
			
			if archetype.has_invariants then
				invariant_context.serialise(a_format)				
			end
			
			ontology_context.serialise(a_format)
			
			create serialiser_mgr.make(archetype, a_format, ontology)
			serialiser_mgr.serialise(description_context.serialised, 
					definition_context.serialised, 
					invariant_context.serialised,
					ontology_context.serialised)
			serialised_archetype := serialiser_mgr.last_result
		end
		
	synchronise_from_archetype is
			-- synchronise archetype to processing engines
		do
			archetype.synchronise
			
			description_context.set_tree(archetype.description.dt_representation)					
			definition_context.set_tree(archetype.definition)
			if archetype.has_invariants then
				invariant_context.set_tree(archetype.invariants)				
			end
			ontology_context.set_tree(archetype.ontology.representation)
		end
	
feature {NONE} -- Implementation

	adl_parser: ADL_VALIDATOR

	serialiser_mgr: ARCHETYPE_SERIALISER_MGR

	description_context: DADL_ENGINE

	definition_context: CADL_ENGINE

	invariant_context: ASSERTION_ENGINE

	ontology_context: DADL_ENGINE
	
	arch_desc_id: INTEGER is
		once
			Result := dynamic_type(create {ARCHETYPE_DESCRIPTION}.make)
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
--| The Original Code is adl_engine.e.
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
