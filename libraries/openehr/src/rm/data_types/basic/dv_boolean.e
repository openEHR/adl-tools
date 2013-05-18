note
	component:   "openEHR ADL Tools"
	description: "Items which are truly boolean data, such as true/false or yes/no answers."
	keywords:    "boolean, data"

	requirements:"ISO 18308 TS V1.0 STR ??"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_BOOLEAN

inherit
	DATA_VALUE

create 
	default_create,
	make,
	make_from_canonical_string

feature -- Initialization

	make
		do
			-- nothing special required, since value defaults to False
		ensure
			value_false: value = False
		end

	make_from_string (a_str:STRING)
			-- "True" or "False"
		do
			a_str.to_lower
			if a_str.is_equal("true") then
				set_true
			end
		end
	
	make_from_canonical_string (a_str:STRING)
			-- "<value>True</value>" or "<value>False</value>"
		do
			make_from_string(xml_remove_tags(a_str))
		end
	
feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
			Result := xml_has_tag(str, "value", 1)
		end

feature -- Access

	value: BOOLEAN
			-- Boolean value of this item

feature -- Modify

	set_true
		do
			value := True
		ensure
			value_set: value = True
		end

	set_false
		do
			value := False
		ensure
			value_set: value = False
		end
	
feature -- Output

	as_string: STRING
			-- "True" or "False"
		do
			Result := value.out
		end
	
	as_canonical_string: STRING
			-- <value>: BOOLEAN ("True" or "False")
		do
			Result := "<value>" + as_string + "</value>"
		end
	
end


