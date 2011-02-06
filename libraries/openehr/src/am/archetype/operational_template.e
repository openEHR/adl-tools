note
	component:   "openEHR Archetype Project"
	description: "Operational template abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OPERATIONAL_TEMPLATE

inherit
	FLAT_ARCHETYPE
		redefine
			make_specialised, synchronise_to_tree, persistent_attributes
		end

create
	make_specialised

feature -- Initialisation

	make_specialised (a_diff: attached DIFFERENTIAL_ARCHETYPE; a_flat_parent: attached FLAT_ARCHETYPE)
		do
			precursor (a_diff, a_flat_parent)
			create artefact_type.make_operational_template
			create component_ontologies.make(0)
		end

feature -- Access

	component_ontologies: attached HASH_TABLE [FLAT_ARCHETYPE_ONTOLOGY, STRING]
			-- Compendium of flattened ontologies of all archetypes/templates used in this
			-- archetype/template, keyed by identifier

feature -- Modification

	add_component_ontology (an_ontology: attached FLAT_ARCHETYPE_ONTOLOGY; an_archetype_id: attached STRING)
		require
			Archetype_id_attached: not an_archetype_id.is_empty
		do
			component_ontologies.put (an_ontology, an_archetype_id)
		end

feature -- Serialisation

	synchronise_to_tree
			-- synchronise object representation of archetype to forms suitable for
			-- serialisation
		do
			precursor
			from component_ontologies.start until component_ontologies.off loop
				component_ontologies.item_for_iteration.synchronise_to_tree
				component_ontologies.forth
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			Result := precursor
			Result.extend ("component_ontologies")
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
--| The Original Code is adl_archetype.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
