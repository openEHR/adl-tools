note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_INTERVAL_QUANTITY

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/interval_quantity"
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
					A(00,00,00,00) A(00,79,9B,C4) A(00,00,00,00) A(0C,FF,FF,FF) A(01,FF,FF,FF) A(00,00,00,00) A(00,7C,8C,A0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,90,A6,C1) A(17,9A,B3,D4) A(E0,4F,75,A3) A(FF,46,68,92) 
					A(FF,40,63,8D) A(AB,47,66,8B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(C2,4B,70,9B) A(C3,44,5B,78) A(00,00,00,00) A(17,CF,D9,EA) A(FF,39,5D,87) A(55,42,52,67) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,48,6A,93) 
					A(5D,4A,59,6B) A(00,AD,B4,BE) A(00,00,00,00) A(CE,46,69,92) A(8A,3A,51,6C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,49,6A,92) A(5C,3D,4E,63) A(00,89,93,9E) A(00,00,00,00) A(D7,45,69,95) 
					A(81,3C,51,6A) A(00,E1,E2,E2) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(C2,49,67,8C) A(D4,41,60,85) A(19,8B,A7,C8) A(55,75,99,C7) A(FF,39,5C,85) A(31,6A,74,7F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(4F,5A,68,7D) A(7F,36,40,50) A(75,53,60,71) A(00,00,00,00) A(00,92,A2,B6) A(13,90,A4,C0) A(BF,47,64,88) A(F8,3C,5E,89) 
					A(E0,49,67,8B) A(FF,3B,5C,83) A(6F,5C,7A,9E) A(00,00,00,00) A(00,00,00,00) A(75,4D,5B,6F) A(7F,35,40,50) A(3F,64,71,83) A(9F,5B,7E,A8) A(FF,47,6E,9C) 
					A(EB,4F,66,83) A(00,00,00,00) A(00,00,00,00) A(00,AA,BC,D2) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(34,65,7E,9B) A(DF,40,5D,80) A(0F,FF,FF,F4) 
					A(00,00,00,00) A(EB,5E,82,AF) A(FF,38,5C,86) A(7F,57,6B,83) A(9F,5A,7C,A4) A(FF,52,7A,A9) A(EC,51,68,84) A(09,FF,FF,FF) A(14,FF,FF,F2) A(14,FF,FF,F2) 
					A(14,FF,FF,F2) A(14,FF,FF,F2) A(14,FF,FF,F2) A(14,FF,FF,F1) A(0A,FF,FF,FF) A(13,FF,FE,F0) A(09,FF,FF,FF) A(EC,62,86,B1) A(FF,3F,63,8F) A(7F,57,6B,82) 
					A(9F,5A,7C,A4) A(FF,52,7A,A9) A(FF,41,5C,7F) A(FF,54,7E,AF) A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7C,AD) 
					A(FF,54,7C,AD) A(FF,54,7D,AE) A(FF,35,55,7D) A(FF,6B,8A,B1) A(FF,3F,63,8F) A(7F,57,6B,82) A(9F,5A,7C,A4) A(FF,52,7A,A9) A(FF,3C,57,78) A(FF,38,59,82) 
					A(FF,38,59,82) A(FF,38,59,82) A(FF,38,59,82) A(FF,38,59,82) A(FF,38,59,82) A(FF,38,59,82) A(FF,38,59,82) A(FF,38,5A,82) A(FF,24,3E,5E) A(FF,6B,8B,B2) 
					A(FF,3F,63,8F) A(7F,57,6B,82) A(9F,5A,7C,A4) A(FF,52,7A,A9) A(F2,4C,63,80) A(54,76,87,9B) A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,9A) 
					A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,99) A(54,74,84,97) A(F2,65,88,B2) A(FF,3F,63,8F) A(7F,57,6B,82) A(9F,5B,7D,A6) A(FF,51,79,A9) 
					A(EB,50,67,83) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(EB,62,86,B2) A(FF,3F,63,8F) A(7F,57,6B,82) A(66,61,7A,98) A(A3,45,5E,7D) A(96,5D,72,8C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(96,55,6D,8D) A(A3,45,5E,7E) A(51,69,7C,94) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,B0,B8,C3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,9D,A8,B6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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