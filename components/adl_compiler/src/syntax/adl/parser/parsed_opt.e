note
	component:   "openEHR ADL Tools"
	description: "Parsed structure for OPERATIONAL_TEMPLATE"
	keywords:    "ADL, parsing, template"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class PARSED_OPT

inherit
	PARSED_AUTHORED_ARCHETYPE
		redefine
			make
		end

create
	make

feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			precursor
			create component_ontologies_text.make (0)
		end

feature -- Parse Output

	component_ontologies_text: STRING

feature -- Modification

	set_component_ontologies_text (a_str: STRING)
		do
			component_ontologies_text := a_str
		end

end
