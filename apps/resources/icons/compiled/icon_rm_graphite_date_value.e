note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_DATE_VALUE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/date_value"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,73,8E,AD) A(FF,BE,AD,9A) A(FF,4E,6D,94) A(FF,77,96,BA) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,67,82,A3) A(FF,53,70,96) A(FF,3E,63,90) 
					A(FF,2D,51,7E) A(FF,5D,76,97) A(FF,56,6B,86) A(FF,4C,66,87) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,4B,5F,77) A(FF,36,57,80) A(FF,40,61,8A) A(FF,8E,9F,B3) A(FF,D2,D5,D8) A(FF,CB,D5,E1) A(FF,FF,FF,FF) A(FF,97,A1,AD) A(FF,48,63,86) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,35,49,62) A(FF,B3,BF,CD) A(FF,F8,F9,FB) 
					A(FF,FE,FE,FE) A(FF,B7,B7,B7) A(FF,D6,D6,D6) A(FF,FF,FF,FF) A(FF,A9,B1,BB) A(FF,39,55,79) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3B,4E,65) A(FF,95,A5,B8) A(FF,FF,FF,FF) A(FF,96,96,96) A(FF,89,89,89) A(FF,77,77,77) A(FF,FF,FF,FF) 
					A(FF,BB,C2,C9) A(FF,3D,57,78) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,4A,5C,70) 
					A(FF,89,99,AE) A(FF,FF,FF,FF) A(FF,E1,E1,E1) A(FF,FF,FF,FF) A(FF,68,68,68) A(FF,FF,FF,FF) A(FF,CC,D1,D7) A(FF,2C,48,6B) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,50,60,74) A(FF,79,8B,A1) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,F3,F3,F3) 
					A(FF,84,84,84) A(FF,FF,FF,FF) A(FF,DC,E0,E3) A(FF,33,4C,6D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,5F,6F,81) A(FF,67,7A,93) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,BD,BD,BD) A(FF,C1,C1,C1) A(FF,FE,FE,FE) A(FF,ED,EE,F0) A(FF,22,3C,5E) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,80,8D,9C) A(FF,55,6B,86) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,79,79,79) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FE) A(FF,26,4B,78) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,9E,A8,B2) A(FF,45,5C,79) A(FF,FF,FF,FF) A(FF,CA,CA,CA) A(FF,90,90,90) A(FF,8A,8A,8A) A(FF,B5,B5,B5) 
					A(FF,AE,BB,CB) A(FF,33,50,72) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) 
					A(FF,32,4C,6B) A(FF,FF,FF,FF) A(FF,C3,C3,C3) A(FF,B1,B0,B0) A(FF,E6,E3,E0) A(FF,D5,DC,E5) A(FF,51,70,96) A(FF,9D,A2,A8) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,27,41,62) A(FF,FF,FF,FF) A(FF,BF,C9,D7) A(FF,7B,94,B4) 
					A(FF,35,56,7E) A(FF,3C,5D,86) A(FF,39,5A,82) A(FF,77,84,94) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,3A,51,6E) A(FF,39,59,82) A(FF,3F,5E,85) A(FF,5C,6A,7B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6B,79,8A) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E5,EC,F2) A(00,00,00,00) A(00,00,00,00) ;
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