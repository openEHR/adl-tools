note
	component:   "openEHR Archetype Project"
	description: "Common parent of dADL validators; temporary class while dADL1 still exists"
	keywords:    "ADL, dADL"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class DADL_VALIDATOR_PARENT

inherit

	YY_NEW_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		end

	DATE_TIME_ROUTINES
		export
			{NONE} all
		end

	DADL_SCANNER
		rename
			make as make_eiffel_scanner
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

feature -- Initialization

	make
			-- Create a new Eiffel parser.
		deferred
		end

	execute(in_text:STRING; a_source_start_line: INTEGER)
		deferred
		end

feature -- Access

	error_text: STRING

	source_start_line: INTEGER
			-- offset of source in other document, else 0

	output: DT_COMPLEX_OBJECT_NODE
			-- parsed structure

end
