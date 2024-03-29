note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_PERSON

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/person"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,AE,B1,B4) A(FF,58,58,55) A(FF,44,41,40) A(FF,52,50,51) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,9D,9D,A0) A(FF,52,4E,4B) A(FF,51,4D,49) 
					A(FF,38,34,32) A(FF,19,16,14) A(FF,44,43,42) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,49,47,46) A(FF,47,43,3F) A(FF,3C,3A,39) A(FF,1E,1F,21) A(FF,11,14,17) A(FF,46,2C,1E) A(FF,FF,FF,FF) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3E,3C,3B) 
					A(FF,67,56,47) A(FF,FB,D3,A8) A(FF,E7,B8,89) A(FF,CD,87,4B) A(FF,9F,4B,19) A(FF,96,58,42) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,59,4A,3D) A(FF,7B,5B,3F) A(FF,D3,A0,6F) A(FF,CA,90,5D) A(FF,B1,6B,34) 
					A(FF,9D,4B,1B) A(FF,94,56,3E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,88,70,69) A(FF,A8,58,23) A(FF,B2,6D,35) A(FF,AC,64,2E) A(FF,9D,4D,1C) A(FF,9C,4C,21) A(FF,80,C6,FF) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B3,74,50) A(FF,8A,33,09) 
					A(FF,9B,48,18) A(FF,9C,49,16) A(FF,B1,7C,58) A(FF,AE,78,4E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,EE,9C,41) A(FF,FF,B9,58) A(FF,EA,D4,B4) A(FF,B6,A9,A7) A(FF,5C,5B,C9) A(FF,D2,AF,83) A(FF,9B,45,00) 
					A(FF,AE,84,6B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E3,93,40) A(FF,FE,A8,38) 
					A(FF,F7,B0,53) A(FF,FC,AB,41) A(FF,EE,E5,D5) A(FF,6C,66,CC) A(FF,C4,B1,A6) A(FF,AB,4B,00) A(FF,9C,54,1E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,ED,9E,40) A(FF,FC,A6,39) A(FF,F2,9E,36) A(FF,EC,98,32) A(FF,F9,97,24) A(FF,80,83,D1) 
					A(FF,6E,5E,9F) A(FF,A9,49,00) A(FF,98,50,18) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,ED,ED,EE) A(FF,EA,F7,FF) 
					A(FF,EB,86,17) A(FF,FB,98,23) A(FF,FB,93,19) A(FF,EF,84,0D) A(FF,FA,84,07) A(FF,99,55,45) A(FF,1A,19,94) A(FF,A7,4A,00) A(FF,8D,3D,01) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E5,E5,E6) A(FF,DC,E6,EE) A(FF,E0,6B,00) A(FF,F5,7F,03) A(FF,F5,80,04) A(FF,EA,75,01) 
					A(FF,C2,5D,01) A(FF,CF,62,00) A(FF,2E,21,82) A(FF,92,3E,00) A(FF,8E,54,29) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,D4,DC,E2) A(FF,BD,6B,24) A(FF,D0,66,02) A(FF,CF,65,02) A(FF,CA,61,02) A(FF,B8,57,01) A(FF,96,43,00) A(FF,91,3C,07) A(FF,88,56,30) 
					A(FF,AC,B5,B4) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B7,BE,C2) A(FF,AB,76,4A) 
					A(FF,AA,6A,34) A(FF,A3,60,25) A(FF,A3,68,37) A(FF,99,6B,47) A(FF,9B,93,88) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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