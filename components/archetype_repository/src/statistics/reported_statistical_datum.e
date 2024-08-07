note
	component:   "openEHR ADL Tools"
	description: "Extracted form of STATISTICAL_DATUM, suitable for including in report object"
	keywords:    "statistics, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPORTED_STATISTICAL_DATUM

create
	make

feature -- Initialisation

	make (a_name: STRING; a_total, a_min, a_max: INTEGER; an_ave: REAL)
		do
			name := a_name
			total := a_total
			minimum := a_min
			maximum := a_max
			average := an_ave
		end

feature -- Access

	name: STRING
			-- name of this datum

	total: INTEGER
			-- total number of occurrences of this datum across the population

	minimum: INTEGER
			-- minimum non-zero number of occurrences of this datum across the population

	maximum: INTEGER
			-- maximum number of occurrences of this datum across the population

	average: REAL

end


