note
	component:   "openEHR ADL Tools"
	description: "[
			 Descriptor for on unit from a unit group table, i.e. a row of values
	             name,property,case_sensitive,case_insensitive,metric,value,definition.
			 Design based on the Unified Code for Units of Measure (UCUM), developed
			 by Gunther Schadow and Clement J. McDonald of The Regenstrief Institute 
			 For Health Care, Indianapolis. Published at http://aurora.rg.iupui.edu/UCUM.
	             ]"
	keywords:    "units, UCUM"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class UNIT_DESCRIPTOR

inherit
	STRING_UTILITIES
		export
			{NONE} all
		redefine
			out
		end

create
	make, make_from_string

feature -- Definitions

	Tokens_expected:INTEGER = 7

	Empty_token:STRING = "-"

feature -- Initialisation

	make(a_group_name, a_name, a_property, a_cs_symbol, a_ci_symbol:STRING;
			a_metric:BOOLEAN; a_value:DOUBLE; a_definition:STRING)
		require
			Group_name_valid: a_group_name /= Void and then not a_group_name.is_empty
			Name_valid: a_name /= Void and then not a_name.is_empty
			Property_valid: a_property /= Void and then not a_property.is_empty
			Case_sens_valid: a_cs_symbol/= Void and then not a_cs_symbol.is_empty
			Case_insens_valid: a_ci_symbol/= Void and then not a_ci_symbol.is_empty
		do
			group_name := a_group_name
			name := a_name
			property := a_property
			cs_symbol := a_cs_symbol
			ci_symbol := a_ci_symbol
			is_metric := a_metric
			value := a_value
			definition := a_definition
		end

	make_from_string(a_group_name, a_str:STRING; delim:CHARACTER)
			-- initialise from  string with fields delimted by `delim'
		require
			Group_name_valid: a_group_name /= Void and then not a_group_name.is_empty
			Str_exists: a_str /= Void and then not a_str.is_empty
		local
			line:TOKEN_STRING
			a_name, a_property, a_cs_symbol, a_ci_symbol, a_definition:STRING
			metric_str, value_str:STRING
			a_metric:BOOLEAN
			a_value:DOUBLE
		do
			create invalid_reason.make(0)

			create line.make(a_str)
			line.set_delimiter(delim)

			-- check nr tokens
			if line.token_count /= Tokens_expected then
				invalid_reason.append(generator + " for " + a_str + ": invalid number tokens ")
				invalid_reason.append_integer(line.token_count)
			else
	 			line.token_start

				-- get name
				a_name := line.token_item
				line.token_forth

				-- get property
				a_property := line.token_item
				line.token_forth

				-- get case-sensitive
				a_cs_symbol:= line.token_item
				line.token_forth

				-- get ci_symbol
				a_ci_symbol:= line.token_item
				line.token_forth

				-- get metric flag
				metric_str := line.token_item
				if metric_str.is_equal("Y") or else metric_str.is_equal("y") then
					a_metric := True
				elseif metric_str.is_equal("N") or else metric_str.is_equal("n") then
					a_metric := False
				else
					invalid_reason.append(generator + " for " + a_name + ": invalid metric setting " + metric_str)
				end
				line.token_forth

				-- get value
				value_str := line.token_item
				if not value_str.is_equal(Empty_token) then
					if value_str.is_double then
						a_value := value_str.to_double
					else
						invalid_reason.append(generator + " for " + a_name + ": invalid value setting " + value_str)
					end
					line.token_forth
				end

				-- get definition
				a_definition := line.token_item
				line.token_forth

				make(a_group_name, a_name, a_property, a_cs_symbol, a_ci_symbol, a_metric, a_value, a_definition)
			end
		end

feature -- Access

	 group_name:STRING
	 		-- group name of unit

	 name:STRING
	 		-- name of unit

	 property:STRING
	 		-- property measured by unit

	 cs_symbol:STRING
	 		-- case-sensitive string rendering of unit name

	 ci_symbol:STRING
	 		-- case-insensitive string rendering of unit name

	 is_metric:BOOLEAN
	 		-- flag indicating whether metric prefixes can be used with unit

	 value:DOUBLE
	 		-- together with definition, the semantic meaning of the unit, in terms of more basic
			-- quantity and units

	 definition:STRING
	 		-- unit part of the semantic definition of unit

feature -- Output

	out:STRING
		do
			create Result.make(0)
			Result.append(name + ", " + property + ", " + cs_symbol+ ", " + ci_symbol+ ", ")
			if is_metric then
				Result.append("(metric)")
			else
				Result.append("(non-metric)")
			end
			Result.append(", " + value.out + ", " + definition.out)
		end

feature -- Error

	invalid_reason:STRING

	is_valid:BOOLEAN
		do
			Result := invalid_reason = Void or else invalid_reason.is_empty
		end

end

