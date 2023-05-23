note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_ENTRY_REFERENCE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/entry_reference"
			make_with_size (16, 16)
			fill_memory
		end

feature {NONE} -- Image data
	
	c_colors_0 (a_ptr: POINTER; a_offset: INTEGER)
			-- Fill `a_ptr' with colors data from `a_offset'.
		external
			"C inline"
		alias
			"{
				{
					#define B(q) #q
					#ifdef EIF_WINDOWS
						#define A(a,r,g,b) B(\x##b\x##g\x##r\x##a)
					#else
						#define A(a,r,g,b) B(\x##r\x##g\x##b\x##a)
					#endif

					char l_data[] =
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) 
					A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,9B,9B,9B) A(FF,D7,D7,D7) A(FF,DD,DD,DD) A(FF,DD,DD,DD) A(FF,DD,DD,DD) A(FF,DD,DD,DD) 
					A(FF,DD,DD,DD) A(FF,DD,DD,DD) A(FF,DF,DF,DF) A(FF,AC,AC,AC) A(FF,66,66,66) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,9C,9C,9C) A(FF,C5,C5,C5) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C6,C6,C6) A(FF,A9,A9,A9) 
					A(FF,66,66,66) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,9C,9C,9C) A(FF,E5,E5,E5) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,F6,F6,F6) A(FF,66,66,66) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,9C,9C,9C) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,66,66,66) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,9C,9C,9C) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,A9,A9,A9) A(FF,66,66,66) A(00,00,00,00) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,9C,9C,9C) A(FF,C5,C5,C5) A(FF,C6,C6,C6) A(FF,C6,C6,C6) A(FF,C6,C6,C6) A(FF,C6,C6,C6) 
					A(FF,C6,C6,C6) A(FF,C6,C6,C6) A(FF,C6,C6,C6) A(FF,A9,A9,A9) A(FF,66,66,66) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,9C,9C,9C) A(FF,C5,C5,C5) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,C6,C6,C6) A(FF,A9,A9,A9) 
					A(FF,66,66,66) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,9C,9C,9C) A(FF,E5,E5,E5) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,C6,C6,C6) A(FF,A9,A9,A9) A(FF,66,66,66) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,9C,9C,9C) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,C6,C6,C6) A(FF,A9,A9,A9) A(FF,66,66,66) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,9C,9C,9C) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,C4,C4,C4) A(FF,AD,AD,AD) A(FF,65,65,65) A(00,00,00,00) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,9C,9C,9C) A(FF,E5,E5,E5) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,EE,EE,EE) A(FF,71,71,71) A(FF,6D,6D,6D) A(FF,87,87,87) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,9E,9E,9E) A(FF,C1,C1,C1) A(FF,C4,C4,C4) A(FF,C4,C4,C4) A(FF,BF,BF,BF) A(FF,9C,9C,9C) A(FF,5F,5F,5F) A(FF,92,92,92) A(FF,E9,E9,E9) A(FF,FF,FF,FF) 
					A(00,00,00,00) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) 
					A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end

	build_colors (a_ptr: POINTER)
			-- Build `colors'
		do
			c_colors_0 (a_ptr, 0)
		end

end