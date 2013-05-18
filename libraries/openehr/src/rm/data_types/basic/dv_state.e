note
	component:   "openEHR ADL Tools"
	description: "[
				 For representing state values which obey a defined state machine, 
				 such as a variable representing the states of an instruction or care process.
				 ]"

	keywords:    "state, data"

	requirements:"ISO 18308 TS V1.0 STR ??"
	design:      "openEHR Data Types Reference Model 1.7"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_STATE

inherit
	DATA_VALUE
		redefine
			default_create
		end

create 
	default_create,
	make,
	make_from_canonical_string
	
feature -- Definitions

	Default_state: STRING = "Unknown"

feature -- Initialization

	default_create
		do
			create value.default_create
		end

	make (a_state: DV_CODED_TEXT)
			-- make from named state
		require
			State_valid: a_state /= Void
		do
			value := a_state
		ensure then
			Value_set: value = a_state
		end
	
	make_from_string (a_str:STRING)
			-- make from canonical string (same as make_from_canonical_string)
		do
			make_from_canonical_string(a_str)
		end

	make_from_canonical_string (a_str:STRING)
			-- <value>
			-- 		<value>xxxx</value>
			-- 		<language>
			-- 				<terminology_id>
			--					<name>string</name>
			-- 					[<version_id>string</version_id>]
			-- 				</terminology_id>
			-- 				<code_string>string</code_string>
			-- 		</language>
			-- 		<charset>
			-- 				<terminology_id>
			--					<name>string</name>
			-- 					[<version_id>string</version_id>]
			-- 				</terminology_id>
			-- 				<code_string>string</code_string>
			-- 		</charset>
			-- 		<defining_code>
			-- 				<terminology_id>
			--					<name>string</name>
			-- 					[<version_id>string</version_id>]
			-- 				</terminology_id>
			-- 				<code_string>string</code_string>
			-- 		</defining_code>
			-- </value>
			-- <is_terminal>boolean</is_terminal>
		do
			create value.make_from_canonical_string(xml_extract_from_tags(a_str, "value", 1))
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
			Result := xml_has_tag(str, "value", 1)
		end

feature -- Access

	value: DV_CODED_TEXT
			-- The state name. State names are determined by a state/event table defined in archetypes
			
	is_terminal: BOOLEAN
			-- True if there are no transitions from this state to any other state

feature -- Output

	as_string: STRING
			-- name of current state
		do
			Result := value.as_string
		ensure then
			Result.is_equal(value.as_string)
		end
	
	as_canonical_string: STRING
			-- <value>value</value>
		do
			Result := "<value>" + value.as_canonical_string + "</value>" + 
					"<is_terminal>" + is_terminal.out + "</is_terminal>"
		end

invariant
	value_exists: value /= Void

end


