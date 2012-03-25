note
	component:   "openEHR Archetype Project"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FLAT_ARCHETYPE

inherit
	ARCHETYPE
		redefine
			ontology
		end

create
	make, make_non_specialised, make_all

create {ARCHETYPE_FLATTENER}
	make_specialised

feature -- Initialisation

	make_non_specialised (a_diff: DIFFERENTIAL_ARCHETYPE)
			-- initialise from a differential archetype
		do
			make(a_diff.artefact_type.deep_twin, a_diff.archetype_id.deep_twin,
					a_diff.original_language.deep_twin,
					a_diff.description.deep_twin,
					a_diff.definition.deep_twin, a_diff.ontology.to_flat)
			if a_diff.has_translations then
				translations := a_diff.translations.deep_twin
			end
			if a_diff.has_invariants then
				invariants := a_diff.invariants.deep_twin
			end
			if a_diff.has_annotations then
				annotations := a_diff.annotations.deep_twin
			end
			rebuild
			is_valid := True
			is_generated := True
		ensure
			is_valid: is_valid
			is_generated: is_generated
		end

feature {ARCHETYPE_FLATTENER} -- Initialisation

	make_specialised (a_diff: DIFFERENTIAL_ARCHETYPE; a_flat_parent: FLAT_ARCHETYPE)
			-- initialise from a differential archetype and its flat parent, as preparation
			-- for generating a flat archetype. The items from the differential are used
			-- except for the definition, invariants and annotations, which are the flat parent versions, so that the
			-- differential definition can be overlaid on it by a merging process. The ontology
			-- is converted to a form ready for overlaying as well.
		do
			make (a_diff.artefact_type.deep_twin, a_diff.archetype_id.deep_twin,
					a_diff.original_language.deep_twin,
					a_diff.description.deep_twin,
					a_flat_parent.definition.deep_twin,
					a_diff.ontology.to_flat)
			if a_diff.has_translations then
				translations := a_diff.translations.deep_twin
			end
			if a_flat_parent.has_invariants then
				invariants := a_flat_parent.invariants.deep_twin
			end
			if a_flat_parent.has_annotations then
				annotations := a_flat_parent.annotations.deep_twin
			end
			rebuild
			is_valid := True
			is_generated := True
		ensure
			is_valid: is_valid
			is_generated: is_generated
		end

feature -- Access

	ontology: attached FLAT_ARCHETYPE_ONTOLOGY

feature -- Factory

	to_differential: DIFFERENTIAL_ARCHETYPE
			-- generate differential form of archetype if specialised, to be in differential form by removing inherited parts
		do
			create Result.make_from_flat (Current)
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
