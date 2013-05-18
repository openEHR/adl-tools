note
	component:   "openEHR ADL Tools"
	description: "[
			 Descriptor for metic prefix.
			 Design based on the Unified Code for Units of Measure (UCUM), developed
			 by Gunther Schadow and Clement J. McDonald of The Regenstrief Institute
			 For Health Care, Indianapolis. Published at http://aurora.rg.iupui.edu/UCUM.
			 ]"
	keywords:    "units, UCUM"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class PREFIX_DESCRIPTOR

inherit
	ANY
		redefine
			out
		end

create
	make, make_from_string

feature -- Definitions

	Tokens_expected:INTEGER = 4

feature -- Initialisation

	make(a_name, a_case_sensitive, a_case_insensitive:STRING; a_value:DOUBLE)
		require
			Name_valid: a_name /= Void and then not a_name.is_empty
			Case_sens_valid: a_case_sensitive /= Void and then not a_case_sensitive.is_empty
			Case_insens_valid: a_case_insensitive /= Void and then not a_case_insensitive.is_empty
		do
			name := a_name
			case_sensitive := a_case_sensitive
			case_insensitive := a_case_insensitive
			value := a_value
		end

	make_from_string(a_str:STRING; delim:CHARACTER)
			-- initialise from  string with fields delimted by `delim'
		require
			Str_exists: a_str /= Void and then not a_str.is_empty
		local
			line:TOKEN_STRING
			a_name, a_case_sensitive, a_case_insensitive:STRING
			value_str:STRING
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

				-- get case-sensitive
				a_case_sensitive := line.token_item
				line.token_forth

				-- get case_insensitive
				a_case_insensitive := line.token_item
				line.token_forth

				-- get value
				value_str := line.token_item
				if value_str.is_double then
					a_value := value_str.to_double
				else
					invalid_reason.append(generator + " for " + a_name + ": invalid value setting ")
					invalid_reason.append(value_str)
				end
				line.token_forth

				make(a_name, a_case_sensitive, a_case_insensitive, a_value)
			end
		end

feature -- Access

	 name:STRING
	 		-- name of prefix

	 case_sensitive:STRING
	 		-- case-sensitive string rendering of prefix name

	 case_insensitive:STRING
	 		-- case-insensitive string rendering of prefix name

	 value:DOUBLE
	 		-- meaning of the prefix

feature -- Output

	out:STRING
		do
			create Result.make(0)
			Result.append(name + ", " + case_sensitive + ", " + case_insensitive + ", " + value.out)
		end

feature -- Error

	invalid_reason:STRING

	is_valid:BOOLEAN
		do
			Result := invalid_reason = Void or else invalid_reason.is_empty
		end

end

