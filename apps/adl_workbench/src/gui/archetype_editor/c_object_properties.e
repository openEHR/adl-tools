note
	component:   "openEHR ADL Tools"
	description: "Dialog to ask for initial details of a new C_OBJECT node to enable conversion from an RM object node"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	C_OBJECT_PROPERTIES

create
	make

feature {NONE} -- Initialization

	make (an_aom_type, a_rm_type, an_occurrences_default_str: STRING; a_term_definition_required: BOOLEAN)
			-- Make with RM types, constraint type selection and an occurrences constrainer that is used to determine
			-- the possible occurrences in this case
		do
			rm_type := a_rm_type
			aom_type := an_aom_type
			occurrences := an_occurrences_default_str
			create node_id_text.make_from_string ("-")
			create node_id_description.make_from_string ("-")
			term_definition_required := a_term_definition_required
		end

feature -- Access

	rm_type: STRING

	aom_type: STRING

	occurrences: STRING

	ext_ref:  detachable STRING

	path_ref: detachable STRING

	node_id_text: STRING

	node_id_description: STRING

feature -- Status Report

	term_definition_required: BOOLEAN
			-- True if a term definition should be created for the id code

feature -- Modification

	set_rm_type (a_str: STRING)
		do
			rm_type := a_str
		end

	set_aom_type (a_str: STRING)
		do
			aom_type := a_str
		end

	set_occurrences (a_str: STRING)
		do
			occurrences := a_str
		end

	set_node_id_text (a_str: STRING)
		do
			node_id_text := a_str.twin
		end

	set_node_id_description (a_str: STRING)
		do
			node_id_description := a_str.twin
		end

	set_ext_ref (a_str: STRING)
		do
			ext_ref := a_str.twin
		end

	set_path_ref (a_str: STRING)
		do
			path_ref := a_str.twin
		end

	set_term_definition_required
		do
			term_definition_required := True
		end

end


