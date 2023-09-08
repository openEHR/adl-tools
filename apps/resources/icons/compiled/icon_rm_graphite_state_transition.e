note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_STATE_TRANSITION

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/state_transition"
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
					A(4A,67,83,A5) A(F1,A4,B5,CA) A(EB,A7,B8,CC) A(EB,A7,B8,CC) A(EB,A7,B8,CC) A(EB,A7,B8,CC) A(EE,8D,9E,B1) A(2D,53,64,79) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(48,65,82,A4) A(FF,C4,CF,DB) A(FE,D6,D5,D3) A(FF,C6,C7,C8) A(FF,A5,AF,BA) 
					A(FF,A6,AF,B9) A(FF,C7,C7,C8) A(FE,D2,D0,CE) A(FF,86,8F,9A) A(2C,54,67,7D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(48,64,82,A4) A(FF,C4,CF,DB) A(FE,C7,C9,CA) A(FF,74,91,B4) A(FF,5C,87,BA) A(FF,59,81,B3) A(FF,4E,77,A8) A(FF,3F,66,97) A(FF,5F,77,92) A(FE,C3,C4,C4) 
					A(FF,85,8E,9A) A(2C,56,68,7D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(48,66,83,A6) A(FF,C4,CF,DB) A(FE,C5,C6,C9) A(FF,57,7E,AD) A(FF,52,79,A8) 
					A(FF,3C,63,91) A(FF,3E,65,93) A(FF,3E,65,93) A(FF,3E,65,93) A(FF,41,68,96) A(FF,34,53,78) A(FE,C0,C0,C0) A(FF,85,8E,9A) A(2D,57,6A,80) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,A3,B2) A(FE,D7,D6,D4) A(FF,5C,79,9D) A(FF,48,70,9F) A(FF,3E,65,93) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) 
					A(FF,3E,65,93) A(FF,3F,65,93) A(FF,47,5C,73) A(FE,D5,D3,D2) A(EE,69,71,7C) A(00,00,00,00) A(00,00,00,00) A(FF,8D,97,A3) A(FF,B5,B8,BC) A(FF,3C,64,94) 
					A(FF,3E,65,93) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,2B,4D,77) A(FF,B2,B2,B3) 
					A(EB,6B,70,78) A(00,00,00,00) A(00,00,00,00) A(FF,8D,97,A3) A(FF,8E,98,A5) A(FF,3E,66,94) A(FF,3E,65,93) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) 
					A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,38,5D,8A) A(FF,85,8B,91) A(EB,6B,70,78) A(00,00,00,00) A(00,00,00,00) A(FF,8D,97,A3) 
					A(FF,8A,94,A0) A(FF,3C,63,91) A(FF,3E,65,93) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) 
					A(FF,37,5C,88) A(FF,85,89,90) A(EB,6B,70,78) A(00,00,00,00) A(00,00,00,00) A(FF,8D,97,A3) A(FF,AD,B0,B5) A(FF,31,56,82) A(FF,3F,66,94) A(FF,3F,66,94) 
					A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,2B,4A,72) A(FF,AA,AB,AD) A(EB,6B,70,78) A(00,00,00,00) 
					A(00,00,00,00) A(FF,87,91,9C) A(FF,D2,D1,D0) A(FF,44,5C,7A) A(FF,3E,65,93) A(FF,3E,65,93) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) A(FF,3F,66,94) 
					A(FF,3E,65,93) A(FF,3F,66,93) A(FF,37,49,60) A(FE,D4,D3,D2) A(F1,67,6C,74) A(00,00,00,00) A(00,00,00,00) A(6A,6C,7D,92) A(FF,99,9D,A2) A(FF,B9,BC,BF) 
					A(FF,30,4E,72) A(FF,3E,65,93) A(FF,3F,66,94) A(FF,3F,65,93) A(FF,3F,66,93) A(FF,3E,65,94) A(FF,40,67,95) A(FF,29,44,62) A(FE,B3,B4,B7) A(FF,80,84,89) 
					A(4A,5D,6A,7B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(6B,6D,7E,93) A(FF,99,9D,A2) A(FF,BB,BE,C1) A(FF,4B,62,7E) A(FF,31,51,78) A(FF,3C,60,8B) 
					A(FF,3E,62,8D) A(FF,36,55,7C) A(FF,44,58,6F) A(FE,B5,B7,B9) A(FF,80,84,89) A(48,5D,6A,7A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(6B,6C,7D,93) A(FF,99,9D,A2) A(FF,D2,D1,D0) A(FF,B8,BC,C2) A(FF,93,9C,A6) A(FF,8F,98,A2) A(FF,B1,B5,B9) A(FE,D3,D2,D1) A(FF,80,84,89) 
					A(48,5C,69,7A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(6A,6C,7D,92) A(FF,84,8D,97) 
					A(FF,87,90,99) A(FF,87,90,99) A(FF,87,90,99) A(FF,87,90,99) A(FF,7B,83,8D) A(48,5A,66,77) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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