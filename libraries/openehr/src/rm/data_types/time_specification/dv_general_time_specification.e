note
	component:   "openEHR ADL Tools"
	
	description: "[
			 Time in the future specified syntactically. The syntax 
			 describes a set of intervals in time, which may or may not be 
			 anchored to fixed points.
			 ]"
	keywords:    "GTS, time specification"

	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_GENERAL_TIME_SPECIFICATION

inherit
	DV_TIME_SPECIFICATION
	
create
	make, make_from_string, make_from_canonical_string

feature -- Initialization
	
	make_from_string(str:STRING)
		do
			-- TO_BE_IMPLEM
		end

	make_from_canonical_string(str:STRING)
		do
			-- TO_BE_IMPLEM
		end

	make(str:STRING)
			-- make from a single string
		do
			-- TO_BE_IMPLEM
		end

feature -- Access

	calendar_alignment: STRING
		do
		end
			
	event_alignment: STRING
		do
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
		end

	institution_specified: BOOLEAN
		do
		end
		
invariant
	Value_valid: value.formalism.is_equal("HL7:GTS")

end


