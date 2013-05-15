note
	component:   "openEHR Archetype Project"
	description: "Simple statistical data gatherer for any datum X which is counted over a population of artefacts"
	keywords:    "statistics, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class STATISTICAL_DATUM

--inherit
--	GENERIC_RENDERABLE

create
	make

feature -- Initialisation

	make (a_name: STRING)
		do
			name := a_name
		end

feature -- Access

	name: STRING
			-- name of this datum

	population: INTEGER
			-- population of artefacts over which measured

	total: INTEGER
			-- total number of occurrences of this datum across the population

	minimum: INTEGER
			-- minimum non-zero number of occurrences of this datum across the population

	maximum: INTEGER
			-- maximum number of occurrences of this datum across the population

	average: REAL
		do
			if is_populated then
				Result := (total / population).truncated_to_integer
			end
		end

	as_vector: LIST [ANY]
			-- vector representation for use with generic screen populating methods
		do
			create {ARRAYED_LIST [ANY]} Result.make(0)
			Result.extend (total)
			Result.extend (minimum)
			Result.extend (maximum)
			Result.extend (average)
		end

feature -- Status Report

	is_populated: BOOLEAN
		do
			Result := population > 0
		end

feature -- Modification

	update (a_total: INTEGER)
		do
			population := population + 1
			total := total + a_total
			if minimum = 0 then
				minimum := a_total
			else
				minimum := minimum.min (a_total)
			end
			maximum := maximum.max (a_total)
		end

	merge (other: like Current)
		do
			population := population + other.population
			total := total + other.total
			if minimum > 0 and other.minimum > 0 then
				minimum := minimum.min (other.minimum)
			end
			maximum := maximum.max (other.maximum)
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
--| The Original Code is archetype_phase_2_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007-2011
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
