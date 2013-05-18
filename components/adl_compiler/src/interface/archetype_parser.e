note
	component:   "openEHR ADL Tools"
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
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_PARSER

inherit
	SHARED_APP_ROOT

	SHARED_ADL_ENGINE

	SHARED_C_FACTORY

feature -- Definitions

	openehr_version: STRING
			-- version of openEHR implem-dev repository containing
			-- this software
		once
			Result := (create {OPENEHR_VERSION}).last_changed
		end

feature -- Access

	selected_archetype: ARCH_CAT_ARCHETYPE
			-- The archetype currently selected in the archetype directory.
		do
			Result := current_arch_cat.selected_archetype
		end

	differential_archetype: DIFFERENTIAL_ARCHETYPE
			-- The differential form the archetype currently selected in the archetype directory.
		do
			if attached selected_archetype then
				Result := selected_archetype.differential_archetype
			end
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
				Result := adl15_engine.serialise (flat_archetype, format, app_root.current_language)
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
			aca: ARCH_CAT_ARCHETYPE
		do
			create aca.make_new_archetype (id, source_repositories.adhoc_source_repository, {ARTEFACT_TYPE}.archetype)
			current_arch_cat.set_selected_item (aca)
		ensure
			archetype_attached: attached selected_archetype
			archetype_changed: selected_archetype /= old selected_archetype
			id_set: selected_archetype.id.is_equal (id)
		end

end



