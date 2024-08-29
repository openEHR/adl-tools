note
	component:   "openEHR ADL Tools"
	description: "Record missing codes for a templated archetype"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024 Graphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_MISSING_CODES_REPORT

create
	make

feature -- Initialisation

	make (source: ARCHETYPE_MISSING_CODES)
		do
			archetype_id := source.archetype_id
			missing_id_code_bindings := source.missing_id_code_bindings
			missing_value_sets := source.missing_value_sets
		end

feature -- Access

	archetype_id: STRING

	missing_id_code_bindings: STRING_TABLE [STRING]
			-- nodes with missing id-code bindings, keyed by id-code

	missing_value_sets: STRING_TABLE [TUPLE [c_terminology_node_ac_code: STRING; value_set: detachable ARRAYED_LIST[STRING]]]
			-- coded nodes with missing value-set bindings, keyed by id-code of owning object

end
