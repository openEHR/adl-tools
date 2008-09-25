indexing
	component:   "openEHR Archetype Project"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/libraries/openehr/src/am/archetype/flat_archetype.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-03-12 00:23:45 +0000 (Wed, 12 Mar 2008) $"

class FLAT_ARCHETYPE

inherit
	ARCHETYPE
		redefine
			ontology
		end

create
	make, make_from_differential

create {ARCHETYPE_FLATTENER}
	make_staging

feature -- Initialisation

	make_from_differential (a_diff: DIFFERENTIAL_ARCHETYPE) is
			-- initialise from a differential archetype
		do
			make(a_diff.archetype_id.deep_twin, a_diff.concept.deep_twin,
					a_diff.original_language.code_string, a_diff.description.deep_twin,
					a_diff.definition.deep_twin, a_diff.ontology.to_flat)
			if a_diff.has_invariants then
				invariants := a_diff.invariants.deep_twin
			end
			rebuild
			is_valid := True
			is_generated := True
		ensure
			is_valid: is_valid
			is_generated: is_generated
		end

feature {ARCHETYPE_FLATTENER} -- Initialisation

	make_staging (a_diff: DIFFERENTIAL_ARCHETYPE; a_flat_parent: FLAT_ARCHETYPE) is
			-- initialise from a differential archetype and its flat parent, as preparation
			-- for generating a flat archetype. The items from the differential are used
			-- except for the definition, which is the flat parent version, so that the
			-- differential definition can be overlaid on it by a merging process.
		do
			make(a_diff.archetype_id.deep_twin, a_diff.concept.deep_twin,
					a_diff.original_language.code_string, a_diff.description.deep_twin,
					a_flat_parent.definition.deep_twin, a_diff.ontology.to_flat)
			if a_flat_parent.has_invariants then
				invariants := a_flat_parent.invariants.deep_twin
			end
			rebuild
			is_valid := True
			is_generated := True
		ensure
			is_valid: is_valid
			is_generated: is_generated
		end

feature -- Access

	ontology: !FLAT_ARCHETYPE_ONTOLOGY

feature -- Factory

	to_differential: DIFFERENTIAL_ARCHETYPE
			-- generate differential form of archetype if specialised, to be in differential form by removing inherited parts
		do
			create Result.make_from_flat(Current)
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
