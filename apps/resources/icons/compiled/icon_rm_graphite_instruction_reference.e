note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_INSTRUCTION_REFERENCE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/instruction_reference"
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
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,9A,9A,9A) A(FF,67,67,67) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,F6,F6,F6) A(FF,AC,AC,AC) A(00,00,00,00) 
					A(FF,AF,AF,AF) A(FF,8D,8D,8D) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C4,C4,C4) 
					A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,A7,A7,A7) A(FF,70,70,70) A(FF,C3,C3,C3) A(FF,CD,CD,CD) A(FF,91,91,91) A(FF,01,34,8D) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,85,85,85) A(FF,7C,7C,7C) A(00,00,00,00) A(00,00,00,00) A(FF,C8,C8,C8) 
					A(FF,8F,8F,8F) A(FF,6B,6B,6B) A(FF,FF,FF,FF) A(FF,87,87,87) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,AD,AD,AD) A(FF,AD,AD,AD) 
					A(FF,AD,AD,AD) A(FF,8A,8A,8A) A(FF,AC,AC,AC) A(FF,57,57,57) A(00,00,00,00) A(FF,C1,C1,C1) A(FF,90,90,90) A(FF,4E,4E,4E) A(00,00,00,00) A(FF,A0,A0,A0) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,EA,EA,EA) 
					A(FF,80,80,80) A(FF,FF,FF,FF) A(FF,88,88,88) A(FF,76,76,76) A(00,00,00,00) A(FF,AE,AE,AE) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,B4,B4,B4) A(FF,C2,C2,C2) A(FF,FF,FF,FF) A(FF,8C,8C,8C) A(FF,87,87,87) 
					A(00,00,00,00) A(FF,AF,AF,AF) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,A6,A6,A6) A(FF,A6,A6,A6) A(FF,A7,A7,A7) A(FF,7C,7C,7C) 
					A(FF,6C,6C,6C) A(FF,D7,D7,D7) A(00,00,00,00) A(FF,CE,CE,CE) A(FF,96,96,96) A(FF,5C,5C,5C) A(00,00,00,00) A(FF,AB,AB,AB) A(FF,01,34,8D) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,69,69,69) A(FF,C7,C7,C7) A(00,00,00,00) A(00,00,00,00) A(FF,D8,D8,D8) 
					A(FF,94,94,94) A(FF,7A,7A,7A) A(FF,FF,FF,FF) A(FF,99,99,99) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(FF,D5,D5,D5) A(FF,AE,AE,AE) A(FF,62,62,62) A(FF,D3,D3,D3) A(FF,DB,DB,DB) A(FF,98,98,98) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,FF,FF,FF) A(FF,B8,B8,B8) A(FF,80,80,80) A(00,00,00,00) A(FF,C8,C8,C8) A(FF,95,95,95) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,53,53,53) A(FF,FF,FF,FF) A(00,00,00,00) 
					A(FF,B5,B5,B5) A(FF,6A,6A,6A) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
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