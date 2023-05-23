note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_ROLE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/role"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,81,96,B1) A(00,00,00,00) A(4D,63,7A,95) A(80,3C,55,72) A(81,41,54,6A) A(48,65,6F,7C) A(00,00,00,00) 
					A(00,3A,43,4B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,66,93,C9) A(19,4F,72,9D) 
					A(F2,51,79,A9) A(FF,3A,63,95) A(FE,32,55,7F) A(FE,2B,4A,6F) A(FF,1E,34,4F) A(F0,2C,39,47) A(2D,6B,6F,72) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,FF,FF,FF) A(05,FF,FF,FF) A(FC,58,8D,CE) A(FE,59,92,D6) A(FF,5B,93,D6) A(FF,5A,8C,C9) A(FF,3A,5D,87) 
					A(FF,2B,47,6A) A(FE,1F,33,4D) A(FF,1C,25,31) A(42,58,5C,5F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(9C,61,91,CB) A(FE,56,8D,CF) A(FF,59,91,D4) A(FF,68,A0,E2) A(FF,87,BC,FA) A(FF,77,A8,E2) A(FF,38,57,7F) A(FF,24,3C,5A) A(FF,17,26,39) A(FF,16,1A,1F) 
					A(1E,89,90,98) A(00,9E,A4,AB) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FC,5F,91,CC) A(FF,56,8D,CF) A(FF,55,8C,CE) A(FF,5E,94,D5) 
					A(FF,83,B7,F4) A(FF,99,CA,FE) A(FF,65,8F,C2) A(FF,28,43,62) A(FF,1B,2E,44) A(FE,0B,13,1D) A(E0,2E,31,35) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(06,FF,FF,FF) A(FF,50,87,C9) A(FF,52,87,C6) A(FF,52,87,C6) A(FF,54,8A,CA) A(FF,61,95,D4) A(FF,83,B4,EE) A(FF,6F,9B,D0) A(FF,37,58,7E) 
					A(FF,1D,30,48) A(FF,0F,1A,26) A(FF,05,05,06) A(4C,5E,66,70) A(00,8E,97,A3) A(00,00,00,00) A(00,00,00,00) A(11,FF,FF,FF) A(FF,4F,84,C5) A(FF,51,85,C3) 
					A(FF,52,86,C4) A(FF,51,85,C3) A(FF,53,88,C7) A(FF,61,92,CE) A(FF,61,8C,C0) A(FF,3F,64,90) A(FF,1E,32,4B) A(FF,11,1C,2A) A(FE,01,03,05) A(C2,35,39,3D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,5A,8C,C7) A(FF,52,86,C4) A(FF,52,86,C4) A(FF,52,86,C4) A(FF,51,85,C4) A(FF,52,86,C3) 
					A(FF,52,7E,B4) A(FF,3C,60,8B) A(FF,24,3C,58) A(FF,11,1B,29) A(FE,02,04,07) A(FF,20,23,26) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(DC,5E,8E,C7) A(FF,52,85,C3) A(FF,52,86,C4) A(FF,52,86,C4) A(FF,52,86,C3) A(FF,51,85,C2) A(FF,4C,7A,B1) A(FF,3C,61,8E) A(FF,29,43,62) A(FF,0F,19,25) 
					A(FF,02,04,06) A(FF,0D,0D,0D) A(37,84,93,A3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(86,6E,96,C9) A(FE,50,85,C3) A(FF,52,86,C4) A(FF,52,86,C4) 
					A(FF,52,86,C4) A(FF,51,85,C3) A(FF,4C,7B,B4) A(FF,3D,64,92) A(FF,2B,47,68) A(FF,11,1C,29) A(FF,02,03,05) A(FF,04,04,04) A(62,81,8B,97) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(06,FF,FD,F0) A(FF,55,86,C2) A(FF,51,85,C3) A(FF,52,86,C4) A(FF,52,86,C4) A(FF,51,85,C3) A(FF,4E,7D,B6) A(FF,40,68,96) 
					A(FF,2C,48,69) A(FF,13,20,2F) A(FF,03,06,09) A(FF,0A,0A,0B) A(5D,90,9B,A8) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(9A,66,8F,C1) 
					A(FE,50,85,C4) A(FF,51,85,C3) A(FF,51,86,C4) A(FF,52,85,C4) A(FF,4F,7F,B7) A(FF,48,6F,9D) A(FF,33,4E,6F) A(FF,14,20,2F) A(FF,07,0C,12) A(FF,1E,23,2A) 
					A(29,CE,D9,E6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(EC,55,83,B9) A(FE,52,86,C5) A(FF,51,85,C4) A(FF,50,84,C2) 
					A(FF,4F,7E,B4) A(FF,51,76,A1) A(FF,3E,56,74) A(FF,1A,26,34) A(FF,0B,13,1C) A(EF,4E,57,63) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,85,A2,C4) A(1A,AA,B9,CC) A(FC,50,7C,AF) A(FE,4E,80,BC) A(FE,4E,7D,B6) A(FF,4E,78,AA) A(FF,52,73,9A) A(FF,3E,52,6C) A(FF,1C,28,37) 
					A(FF,23,2E,3A) A(48,96,A0,AE) A(00,89,97,A8) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,81,9C,BC) A(09,FF,F7,EE) 
					A(C5,4F,72,99) A(FF,3B,61,8D) A(FF,3D,5E,86) A(FF,38,50,6E) A(FF,27,3C,52) A(FF,2F,3C,4D) A(5A,85,91,9E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,C0,C8,D1) A(00,00,00,00) A(27,93,9D,A6) A(7C,48,5C,75) A(7F,32,49,64) 
					A(6D,5C,6A,7B) A(07,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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