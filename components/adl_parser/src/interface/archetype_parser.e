note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype parser. This object can parse single archetypes. It is used by the 
				 ARCHETYPE_COMPILER to perform a system-wide or partial system compilation of
				 archetypes found in the ARCHETYPE_DIRECTORY. It can be driven in an ad hoc fashion, 
				 as by the Archetype Editor. For the target archetype, it can then be used to:
				 	- parse (single archetype), 
				 	- save (serialise back to ADL), 
				 	- save-as (serialise to another format).
				 ]"
	keywords:    "parser, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_PARSER

inherit
	SHARED_ADL_APPLICATION

	SHARED_KNOWLEDGE_REPOSITORY

	SHARED_SOURCE_REPOSITORIES

	SHARED_ARCHETYPE_SERIALISERS

	SHARED_ARCHETYPE_COMPILER

	SHARED_ADL_ENGINE

	SHARED_C_FACTORY

	SHARED_MESSAGE_BILLBOARD

create
	make

feature -- Initialisation

	make
		do
			adl_application.initialise

			if attached {ANY} adl_engine as hack_to_initialise_adl_engine then
				hack_to_initialise_adl_engine.do_nothing
			end
		end

feature -- Definitions

	openehr_version: STRING
			-- version of openEHR implem-dev repository containing
			-- this software
		once
			Result := (create {OPENEHR_VERSION}).last_changed
		end

feature -- Access

	selected_archetype: ARCH_REP_ARCHETYPE
			-- The archetype currently selected in the archetype directory.
		do
			Result := arch_dir.selected_archetype
		end

	flat_archetype: FLAT_ARCHETYPE
			-- The flattened form the archetype currently selected in the archetype directory.
		do
			if attached selected_archetype then
				Result := selected_archetype.flat_archetype
			end
		end

	serialised_archetype (format: attached STRING): attached STRING
			-- Serialisation of the current archetype into `format'.
		do
			if attached flat_archetype then
				Result := adl_engine.serialise (flat_archetype, format)
			else
				Result.make_empty
			end
		end

feature -- Factory

	create_new_archetype (id: attached ARCHETYPE_ID; primary_language: attached STRING)
			-- Create a new top-level archetype and install it into the directory.
		require
			primary_language_not_empty: not primary_language.is_empty
		local
			arch: ARCH_REP_ARCHETYPE
		do
			set_current_language (primary_language)
			create arch.make_new (id, source_repositories.adhoc_source_repository, {ARTEFACT_TYPE}.archetype, primary_language)
			arch_dir.set_selected_item (arch)
		ensure
			language_set: current_language.same_string (primary_language)
			flat_archetype_attached: attached flat_archetype
			flat_archetype_changed: flat_archetype /= old flat_archetype
			id_set: flat_archetype.archetype_id.is_equal (id)
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
--| The Original Code is archetype_parser.e.
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
