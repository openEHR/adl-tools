note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_RWE_ID_REF

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/rwe_id_ref"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(06,FF,FF,FF) A(06,FF,FF,FF) A(00,00,00,00) A(00,6D,8B,AF) A(00,00,00,00) A(15,FF,FF,FF) 
					A(14,FF,FF,FF) A(07,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(10,FD,F4,E7) 
					A(FF,42,6A,9A) A(FF,3B,5F,8A) A(0B,FF,FF,F6) A(00,00,00,00) A(C4,4A,6F,9B) A(FF,3D,66,97) A(FF,3E,67,99) A(FF,3E,68,9A) A(FF,4A,71,9E) A(E4,4D,70,9C) 
					A(73,51,6F,95) A(00,00,00,00) A(00,B7,BE,C7) A(00,00,00,00) A(00,00,00,00) A(14,E3,E3,E2) A(FF,3B,62,90) A(FF,34,56,80) A(14,FF,F6,E0) A(00,00,00,00) 
					A(C7,3E,61,8C) A(FF,3E,65,93) A(C4,34,51,73) A(B0,44,62,86) A(D2,42,62,88) A(FF,3B,5F,8A) A(FF,3C,64,93) A(CA,4B,66,87) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(14,E3,E3,E2) A(FF,3B,62,90) A(FF,34,56,80) A(14,FF,F6,E3) A(00,00,00,00) A(C7,3E,62,8C) A(FF,3E,65,93) A(59,35,47,5D) A(00,00,00,00) 
					A(00,00,00,00) A(48,78,8D,A8) A(FF,3B,5F,8A) A(FF,3C,62,91) A(58,40,53,68) A(00,68,71,7A) A(00,00,00,00) A(14,E3,E3,E2) A(FF,3B,62,90) A(FF,34,56,80) 
					A(14,FF,F6,E1) A(00,00,00,00) A(C7,3E,62,8C) A(FF,3E,65,93) A(5C,35,48,5E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(A9,46,65,8A) A(FE,40,67,96) 
					A(B6,3C,57,78) A(00,00,00,00) A(00,00,00,00) A(14,E3,E3,E2) A(FF,3B,62,90) A(FF,34,56,80) A(14,FF,F6,E2) A(00,00,00,00) A(C7,3E,62,8C) A(FF,3E,65,93) 
					A(5C,35,48,5E) A(00,00,00,00) A(00,00,00,00) A(00,B1,BC,C9) A(71,50,6D,90) A(FF,3E,65,93) A(E8,44,5F,81) A(00,00,00,00) A(00,00,00,00) A(14,E3,E3,E2) 
					A(FF,3B,62,90) A(FF,34,56,80) A(14,FF,F6,E2) A(00,00,00,00) A(C7,3E,62,8C) A(FF,3E,65,93) A(5C,35,48,5E) A(00,00,00,00) A(00,00,00,00) A(00,E5,EA,EF) 
					A(6C,54,71,96) A(FF,3D,65,93) A(E8,46,61,82) A(00,00,00,00) A(00,00,00,00) A(14,E3,E3,E1) A(FF,3B,62,90) A(FF,34,56,80) A(14,FF,F6,E2) A(00,00,00,00) 
					A(C7,3E,62,8C) A(FF,3E,65,93) A(5C,35,48,5E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(97,4B,6C,94) A(FF,3F,67,96) A(BF,3C,56,76) A(00,00,00,00) 
					A(00,00,00,00) A(14,E2,E3,E1) A(FF,3C,62,90) A(FF,34,56,80) A(14,FF,F6,E2) A(00,00,00,00) A(C7,3E,62,8C) A(FF,3E,65,93) A(5C,35,48,5E) A(00,00,00,00) 
					A(00,00,00,00) A(05,C1,DE,FA) A(FD,42,68,96) A(FF,3C,63,92) A(79,54,64,76) A(00,00,00,00) A(00,00,00,00) A(14,E2,E3,E1) A(FF,3C,62,90) A(FF,34,56,80) 
					A(14,FF,F6,E2) A(00,00,00,00) A(C7,3E,62,8C) A(FF,3D,64,92) A(AD,51,6D,8F) A(7F,6E,8F,B8) A(92,5A,80,AF) A(FD,49,71,A0) A(FD,3F,66,95) A(EE,3F,58,78) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(15,E0,E2,E1) A(FF,39,5F,8C) A(FF,32,54,7D) A(15,FF,FA,E7) A(00,00,00,00) A(CF,3F,61,89) A(FF,3A,60,8D) 
					A(FF,39,5F,8D) A(FF,39,5F,8C) A(FF,39,5D,88) A(FF,3E,5F,86) A(B8,4A,63,81) A(0D,D5,DB,E2) A(00,73,82,95) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(52,61,79,95) A(57,70,83,9C) A(00,00,00,00) A(00,00,00,00) A(1F,62,7C,9D) A(5D,79,8D,A4) A(5C,78,8C,A5) A(4A,5F,75,92) A(3A,75,8B,A6) A(00,00,00,00) 
					A(00,00,00,00) A(00,A8,B8,CC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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