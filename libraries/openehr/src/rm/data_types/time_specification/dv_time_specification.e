note
	component:   "openEHR ADL Tools"
	
	description: "[
			 Abstract concept of time in the future, specified syntactically.
			 Subtypes define the syntaxes.
			 ]"
	keywords:    "time specification"

	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class DV_TIME_SPECIFICATION

inherit
	DATA_VALUE
	
feature -- Access

	value: DV_PARSABLE
	
	calendar_alignment: STRING
			-- Indicates what prototypical point in the calendar the specification is
			-- aligned to, e.g. “5th of the month”. Empty if not aligned. Extracted 
			-- from the ‘value’ attribute.
		deferred
		end
			
	event_alignment: STRING
			-- Indicates what real-world event the specification is aligned to if any. 
			-- Extracted from the ‘value’ attribute.
		deferred
		end
		
	institution_specified: BOOLEAN
			-- Indicates if the specification is aligned with institution schedules, 
			-- e.g. a hospital nursing changeover or meal serving times. 
			-- Extracted from the ‘value’ attribute.
		deferred
		end
			
feature -- Output

	as_string: STRING
		do
			Result := value.as_string
		ensure then
			Result.is_equal(value.as_string)
		end

	as_canonical_string:STRING
			-- 
		do
			Result := "<value>" + value.as_canonical_string + "</value>"
		end

invariant
	Value_valid: value /= Void

end


