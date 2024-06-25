note
	component:   "openEHR ADL Tools"
	description : "Static copy of code systems."
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024-  Graphite Health <http://www.GraphiteHealth.io>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	SHARED_CODE_SYSTEMS

feature -- Access

	code_systems: HASH_TABLE[STRING, STRING]
			-- TODO: for now, a static copy of the file
		once
			create Result.make(0)
			Result.put ("http://loinc.org/",          "loinc")
			Result.put ("http://snomed.info/id/",     "snomed")
			Result.put ("http://s2health.org/id/",    "s2")
			Result.put ("http://openehr.org/id/",     "openehr")
			Result.put ("http://ucum.org/id/",        "ucum")
			Result.put ("http://www.nlm.nih.gov/research/umls/rxnorm/",     "rxnorm")
		end

end
