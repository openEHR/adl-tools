note
	component:   "openEHR ADL Tools"
	description: "Serialise a C_XXX object structure to any format"
	keywords:    "test, constraint model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_SERIALISER

inherit
	ANY_SERIALISER

	C_VISITOR
		rename
			initialise as initialise_visitor
		end

	BASIC_DEFINITIONS
		export
			{NONE} all
		end

feature -- Initialisation

	initialise (an_archetype: ARCHETYPE; a_lang: STRING)
			-- set ontology required for serialising cADL, and perform basic initialisation
		require
			Language_valid: an_archetype.has_language (a_lang)
		do
			language := a_lang
			initialise_visitor (an_archetype)
			reset
		end

feature {NONE} -- Implementation

	serialise_occurrences (a_node: C_OBJECT; depth: INTEGER)
			-- any positive range
		deferred
		end

	serialise_existence (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- can only  be a range of 0..1 or 1..1
		deferred
		end

	serialise_cardinality (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- includes a range and possibly ordered, unique qualifiers
		deferred
		end

	language: STRING
			-- IETF RFC 5646 language tag; wll be an exact text match
			-- for one of the 'languages' in the archetype
		attribute
			create Result.make_empty
		end

end


