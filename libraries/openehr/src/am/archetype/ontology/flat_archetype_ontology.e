note
	component:   "openEHR Archetype Project"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"

	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FLAT_ARCHETYPE_ONTOLOGY

inherit
	ARCHETYPE_ONTOLOGY

create
	make

feature -- Modification

	merge (other: FLAT_ARCHETYPE_ONTOLOGY)
			-- append all the codes from the other ontology to this one; used to create the ontology for flat-form archetypes
			-- only languages that exist in the current ontology are merged from `other'
		require
			Other_valid: semantically_conforms_to (other)
		local
			a_lang: STRING
		do
			-- term definitions
			across other.term_definitions as term_defs_csr loop
				a_lang := term_defs_csr.key
				if has_language (a_lang) then
					if not term_definitions.has (a_lang) then
						term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_lang)
					end
					across term_defs_csr.item as lang_terms_csr loop
						if has_term_code (lang_terms_csr.key) then
							replace_term_definition (a_lang, lang_terms_csr.item.deep_twin, False)
						else
							merge_term_definition (a_lang, lang_terms_csr.item.deep_twin)
						end
					end
				end
			end

			-- constraint definitions
			across other.constraint_definitions as constraint_defs_csr loop
				a_lang := constraint_defs_csr.key
				if has_language (a_lang) then
					if not constraint_definitions.has (a_lang) then
						constraint_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_lang)
					end
					across constraint_defs_csr.item as lang_terms_csr loop
						if has_constraint_code (lang_terms_csr.key) then
							replace_constraint_definition (a_lang, lang_terms_csr.item.deep_twin, False)
						else
							merge_constraint_definition (a_lang, lang_terms_csr.item.deep_twin)
						end
					end
				end
			end

			-- terminology bindings; first add the bindings to terminologies that are not there at all
			across other.term_bindings as bindings_csr loop
				across bindings_csr.item as bindings_list_csr loop
					add_term_binding (bindings_list_csr.item.deep_twin, bindings_list_csr.key)
				end
			end

			-- constraint bindings; first add the bindings to terminologies that are not there at all
			across other.constraint_bindings as bindings_csr loop
				across bindings_csr.item as bindings_list_csr loop
					add_constraint_binding (bindings_list_csr.item.deep_twin, bindings_csr.key, bindings_list_csr.key)
				end
			end
		ensure
			-- Terminologies_merged: terminologies_available.is_superset (other.terminologies_available)
		end

feature -- Factory

	to_differential: DIFFERENTIAL_ARCHETYPE_ONTOLOGY
			-- Create a differential version from this flat ontology.
		do
			create Result.make_from_flat (Current)
		end

feature {ARCHETYPE_ONTOLOGY} -- Implementation

	remove_inherited_codes
			-- remove all at- and ac- codes inherited from ancestor archetypes
		local
			rm_term_codes: ARRAYED_LIST[STRING]
			rm_constraint_codes: ARRAYED_LIST[STRING]
		do
			create rm_term_codes.make(0)
			create rm_constraint_codes.make(0)
			across term_codes as term_codes_csr loop
				if specialisation_depth_from_code (term_codes_csr.item) /= specialisation_depth then
					rm_term_codes.extend (term_codes_csr.item)
				end
			end
			across constraint_codes as constraint_codes_csr loop
				if specialisation_depth_from_code (constraint_codes_csr.item) /= specialisation_depth then
					rm_constraint_codes.extend (constraint_codes_csr.item)
				end
			end

			across rm_term_codes as rm_term_codes_csr loop
				remove_term_definition (rm_term_codes_csr.item)
			end
			across rm_constraint_codes as rm_constraint_codes_csr loop
				remove_constraint_definition (rm_constraint_codes_csr.item)
				rm_constraint_codes_csr.forth
			end
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
--| The Original Code is adl_ontology.e.
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
