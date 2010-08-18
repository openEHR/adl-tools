note
	component:   "openEHR Archetype Project"
	description: "[
				 Interface class for ontologies in an archetype specialisation lineage. This is used
				 by other classes such as the serialisation class in order to serialise archetypes, 
				 providing access to the ontologies of the current archetype and all parents. This is 
				 needed because archetype terms from parent archetypes can be mentioned in any child.
				 ]"
	keywords:    "archetype, ontology, specialisation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_LINEAGE_ONTOLOGY

inherit
	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} valid_concept_code
		undefine
			default_create
		end

create
	make

feature -- Initialisation

	make(an_ontology: ARCHETYPE_ONTOLOGY)
			-- make with the ontology of the current archetype (add parents later)
		require
			an_ontology /= Void and then an_ontology.is_differential
		do
			create ontologies.make(0)
			ontologies.put(an_ontology, an_ontology.specialisation_level)
		end

feature -- Access

	has_ontology(an_ontology: ARCHETYPE_ONTOLOGY): BOOLEAN
			-- check if the ontology object has already been added to the lineage
		require
			Ontology_valid: an_ontology /= Void
		do
			Result := ontologies.has_item(an_ontology)
		end

	has_specialisation_level(a_level: INTEGER): BOOLEAN
			-- check if the specialisation level is known in this ontology object
		require
			a_level >= 0
		do
			Result := ontologies.has(a_level)
		end

feature -- Modification

	add_ontology(an_ontology: ARCHETYPE_ONTOLOGY)
			-- add an ontology that is from a parent archetype of the original ontology used in make()
		require
			Ontology_valid: an_ontology /= Void and then an_ontology.is_differential
				and then not has_ontology(an_ontology) 
				and then not has_specialisation_level(an_ontology.specialisation_level)
		do
			ontologies.put(an_ontology, an_ontology.specialisation_level)
		end

feature {NONE} -- Implementation

	ontologies: HASH_TABLE [ARCHETYPE_ONTOLOGY, INTEGER]

invariant
	Ontologies_valid: ontologies /= Void

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
--| The Original Code is archetype_lineage_ontology.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
