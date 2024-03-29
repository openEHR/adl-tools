note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_TIME_VALUE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/time_value"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,9A,9A,9A) A(00,00,00,00) A(00,00,00,00) A(2D,9F,9F,9F) A(2C,A8,A8,A8) A(00,00,00,00) 
					A(00,00,00,00) A(00,B0,B0,B0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(48,9B,9B,9B) A(CD,91,91,91) A(FF,8C,8C,8C) A(FF,8C,8C,8C) A(FF,8A,8A,8A) A(FF,84,84,84) A(C8,82,82,82) A(3E,90,90,90) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,FF,FF,FF) A(00,00,00,00) A(B3,90,90,90) A(FF,8C,8C,8C) A(FE,74,74,74) A(FF,88,88,88) A(FF,A7,A7,A7) 
					A(FF,A7,A7,A7) A(FE,89,89,89) A(FF,7C,7C,7C) A(FF,80,80,80) A(98,73,73,73) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(B0,8B,8B,8B) A(FF,8D,8D,8D) A(FE,71,71,71) A(FF,E2,E2,E2) A(FF,FF,FF,FF) A(FF,C5,C5,C5) A(FF,F8,F8,F8) A(FF,FF,FF,FF) A(FF,E0,E0,E0) A(FF,7D,7D,7D) 
					A(FF,87,87,87) A(8B,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,95,95,95) A(45,87,87,87) A(FF,89,89,89) A(FE,6A,6A,6A) A(FF,FF,FF,FF) A(FF,FE,FE,FE) 
					A(FF,FE,FE,FE) A(FF,AA,AA,AA) A(FF,F1,F1,F1) A(FF,FE,FE,FE) A(FF,FE,FE,FE) A(FF,FC,FC,FC) A(FF,79,79,79) A(FF,7A,7A,7A) A(1E,3E,3E,3E) A(00,9D,9D,9D) 
					A(00,00,00,00) A(CD,81,81,81) A(FE,6F,6F,6F) A(FF,DB,DB,DB) A(FF,FE,FE,FE) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,AA,AA,AA) A(FF,F1,F1,F1) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FE,FE,FE) A(FF,CD,CD,CD) A(FE,86,86,86) A(A2,57,57,57) A(00,00,00,00) A(00,00,00,00) A(FF,7D,7D,7D) A(FF,71,71,71) A(FF,FF,FF,FF) 
					A(FF,FE,FE,FE) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,AA,AA,AA) A(FF,F1,F1,F1) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,73,73,73) 
					A(FF,69,69,69) A(00,00,00,00) A(32,9D,9D,9D) A(FF,82,82,82) A(FF,90,90,90) A(FF,F0,F3,F7) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FE,FE,FE) A(FF,AB,AF,AF) 
					A(FF,CB,CB,CB) A(FF,D7,D7,D7) A(FF,E0,E0,E0) A(FF,FF,FF,FF) A(FF,F2,F5,F9) A(FF,93,93,92) A(FF,66,66,66) A(06,FF,FF,FF) A(33,94,94,94) A(FF,82,82,82) 
					A(FF,95,94,93) A(FF,C1,CD,DB) A(FF,FC,FD,FD) A(FF,FF,FE,FE) A(FF,FF,FF,FF) A(FF,D0,97,97) A(FF,C5,C8,C8) A(FF,C5,C5,C5) A(FF,D3,D3,D3) A(FF,FF,FF,FF) 
					A(FF,C1,CE,DC) A(FF,9A,99,97) A(FF,63,63,63) A(0C,FF,FF,FF) A(00,00,00,00) A(FF,79,79,79) A(FF,73,73,73) A(FF,FF,FF,FF) A(FF,FF,FE,FE) A(FF,FF,FF,FF) 
					A(FF,D0,8E,8E) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FE,78,78,78) A(FF,6B,6B,6B) A(00,00,00,00) 
					A(00,00,00,00) A(CD,77,77,77) A(FE,75,75,75) A(FF,DA,DA,DA) A(FF,FE,FF,FF) A(FF,D1,8F,8F) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FE,FE,FE) A(FF,D3,D3,D3) A(FE,8A,8A,8A) A(B3,62,62,62) A(00,00,00,00) A(00,93,93,93) A(4C,7F,7F,7F) A(FF,81,81,81) A(FE,75,75,75) 
					A(FF,F1,D7,D7) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FE) A(FF,FE,FE,FE) A(FF,FE,FE,FE) A(FF,F9,F9,F9) A(FF,88,88,88) A(FF,72,72,72) 
					A(2F,88,88,88) A(00,FA,FA,FA) A(00,00,00,00) A(00,00,00,00) A(B4,7D,7D,7D) A(FF,89,89,89) A(FE,7C,7C,7C) A(FF,E2,E2,E2) A(FF,FF,FF,FF) A(FF,EE,F1,F5) 
					A(FF,BF,CB,DA) A(FF,FF,FF,FF) A(FF,E0,E0,E0) A(FF,8F,8F,8F) A(FF,81,81,81) A(91,69,69,69) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(AF,80,80,80) A(FF,80,80,80) A(FE,7F,7F,7F) A(FF,8F,8F,8F) A(FF,B1,B1,B0) A(FF,B6,B5,B4) A(FE,94,94,94) A(FE,8A,8A,8A) A(FF,78,78,78) 
					A(A3,74,74,74) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(48,97,97,97) A(CD,80,80,80) 
					A(FF,80,80,80) A(FF,7A,7A,7A) A(FF,7A,7A,7A) A(FF,7A,7A,7A) A(C3,75,75,75) A(39,85,85,85) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,B6,B6,B6) A(00,00,00,00) A(00,00,00,00) A(2E,CE,CE,CE) A(23,BD,BD,BD) A(00,00,00,00) 
					A(00,00,00,00) A(00,BC,BC,BC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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