note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_CIMI_CLUSTER_REFERENCE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/cimi/cluster_reference"
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
					A(FF,01,34,8D) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,71,A7,E6) A(FF,80,B5,EF) A(FF,50,81,BB) A(FF,36,4B,65) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,50,81,BB) A(FF,55,89,C6) A(FF,4B,79,AF) A(FF,1D,34,50) A(FF,FF,FF,FB) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,39,5A,83) A(FF,48,6F,9D) A(FF,38,57,7C) A(FF,4C,5A,6A) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,97,A5,B6) A(FF,3B,42,4B) A(FF,7C,8A,9B) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,BE,CF,DB) 
					A(FF,6A,74,95) A(FF,89,7B,8F) A(FF,49,58,73) A(FF,FF,FF,FF) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,93,93,93) A(FF,77,77,77) 
					A(FF,FB,FB,FB) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6B,6A,85) A(FF,F6,7F,7B) A(FF,F2,7A,75) A(FF,A2,46,45) A(FF,46,4C,59) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,94,94,94) A(FF,6C,6C,6C) A(FF,4A,4A,4A) A(FF,4D,4D,4D) A(FF,4D,4D,4D) A(FF,4D,4D,4D) 
					A(FF,4D,4D,4D) A(FF,8B,57,5A) A(FF,D3,5F,5C) A(FF,CD,59,56) A(FF,AC,48,44) A(FF,55,42,48) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,B6,B6,B6) A(FF,68,68,68) A(FF,A0,A0,A0) A(FF,90,90,90) A(FF,90,90,90) A(FF,90,90,90) A(FF,97,95,93) A(FF,65,4F,5B) A(FF,A9,45,43) A(FF,BD,58,55) 
					A(FF,8C,3D,3A) A(FF,58,53,5A) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,C4,C4,C4) A(FF,72,72,72) A(FF,EF,EF,EF) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,94,A5,B7) A(FF,71,5F,6E) A(FF,68,41,4A) A(FF,61,59,66) A(FF,B2,C0,CB) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,C4,C4,C4) A(FF,72,72,72) A(FF,EF,EF,EF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,ED,F4,FC) A(00,00,00,00) A(FF,8D,98,A6) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,C4,C4,C4) A(FF,72,72,72) 
					A(FF,EF,EF,EF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,97,A8,C2) A(FF,5F,81,7D) A(FF,5F,81,60) A(FF,4A,61,65) A(FF,B0,B2,BD) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,C4,C4,C4) A(FF,73,73,73) A(FF,EE,EE,EE) A(FF,F0,F0,F0) A(FF,F0,F0,F0) A(FF,F0,F0,F0) 
					A(FF,FF,FF,FF) A(FF,50,6D,67) A(FF,B0,CE,6A) A(FF,A1,BE,62) A(FF,6D,86,37) A(FF,2D,3C,3D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,C6,C6,C6) A(FF,63,63,63) A(FF,3D,3D,3D) A(FF,3F,3F,3F) A(FF,3F,3F,3F) A(FF,3F,3F,3F) A(FF,3D,3D,3D) A(FF,6A,79,53) A(FF,7D,9A,41) A(FF,7F,9B,42) 
					A(FF,68,80,35) A(FF,50,5A,4F) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
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