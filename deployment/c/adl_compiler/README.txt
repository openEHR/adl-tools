--
--	component:   "openEHR Archetype Project"
--	keywords:    "C wrapper"
--	author:      "Thomas Beale"
--	support:     "Ocean Informatics <support@OceanInformatics.com>"
--	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
--	license:     "See notice at bottom of class"
--
--	file:        "$URL$"
--	revision:    "$LastChangedRevision$"
--	last_change: "$LastChangedDate$"
--

	This Eiffel build is configured to create a linkable library of 
	the ADL compiler for use in other language environments. The root class
	is APP_ROOT, from the archetype_compiler component.
	
	It should be finalised in the normal way. The libraries can be generated 
	by then doing:

		cd EIFGENs/adl_compiler/F_code
		make cecil 			# nmake on Windows VC++

	This generates a statically linkable library, i.e. a .lib for Windows or
	a .a for Unix / Mac. 

	A dynamically linked library can be generated with the alternative make 
	command:

		make dynamic_cecil 			# nmake on Windows VC++

	This will generate a .dll for Windows, or a .so for Unix/Mac

	The resulting static library can be tested by the simple C language 
	project found in the sibling directory to this project, named
	c_test_for_adl_compiler. 

