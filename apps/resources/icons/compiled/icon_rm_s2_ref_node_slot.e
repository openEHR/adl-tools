note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_REF_NODE_SLOT

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/ref_node_slot"
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
					A(FF,01,34,8D) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C9,C9,C9) A(FF,A7,A7,A7) A(FF,BF,BF,BF) A(FF,A2,A2,A2) A(FF,AC,AC,AC) A(FF,FF,FF,FF) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,C9,C9,C9) 
					A(FF,BC,BC,BC) A(FF,FF,FF,FF) A(FF,F4,F4,F4) A(FF,D4,D4,D4) A(FF,A7,A7,A7) A(FF,81,81,81) A(FF,E9,E9,E9) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(FF,A1,A1,A1) A(FF,BD,BD,BD) A(FF,F2,F2,F2) A(FF,BA,BA,BA) A(FF,AB,AB,AB) A(FF,AD,AD,AD) 
					A(FF,B1,B1,B1) A(FF,9D,9D,9D) A(FF,6D,6D,6D) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,FF,FF,FF) 
					A(FF,8F,8F,8F) A(FF,CF,CF,CF) A(FF,AC,AC,AC) A(FF,AA,AA,AA) A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AA,AA,AA) A(FF,A6,A6,A6) A(FF,81,81,81) A(FF,7A,7A,7A) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,BA,BA,BA) A(FF,8F,8F,8F) A(FF,B2,B2,B2) A(FF,AA,AA,AA) A(FF,AB,AB,AB) 
					A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AA,AA,AA) A(FF,8E,8E,8E) A(FF,65,65,65) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(FF,B8,B8,B8) A(FF,88,88,88) A(FF,AA,AA,AA) A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AB,AB,AB) 
					A(FF,8F,8F,8F) A(FF,6E,6E,6E) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,CD,CD,CD) A(FF,76,76,76) A(FF,A5,A5,A5) 
					A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AA,AA,AA) A(FF,A9,A9,A9) A(FF,82,82,82) A(FF,69,69,69) A(00,00,00,00) A(00,00,00,00) 
					A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,76,76,76) A(FF,93,93,93) A(FF,A9,A9,A9) A(FF,AB,AB,AB) A(FF,AB,AB,AB) A(FF,AA,AA,AA) 
					A(FF,AB,AB,AB) A(FF,9E,9E,9E) A(FF,5D,5D,5D) A(FF,9B,9B,9B) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) 
					A(FF,E0,E0,E0) A(FF,6C,6C,6C) A(FF,91,91,91) A(FF,A5,A5,A5) A(FF,AA,AA,AA) A(FF,AB,AB,AB) A(FF,A7,A7,A7) A(FF,7B,7B,7B) A(FF,6A,6A,6A) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,ED,ED,ED) A(FF,83,83,83) A(FF,72,72,72) 
					A(FF,87,87,87) A(FF,88,88,88) A(FF,62,62,62) A(FF,7C,7C,7C) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,C7,C7,C7) A(FF,C1,C1,C1) A(FF,B2,B2,B2) A(FF,D3,D3,D3) A(FF,FF,FF,FF) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) 
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