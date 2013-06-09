note
	component:   "openEHR ADL Tools"
	description: "Simple statistical data gatherer for any datum X which is counted over a population of artefacts"
	keywords:    "statistics, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class STATISTICAL_DATUM

inherit
	GENERIC_RENDERABLE

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


