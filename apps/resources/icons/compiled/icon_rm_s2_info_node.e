note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_INFO_NODE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/info_node"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(5B,6D,89,AA) A(FF,B0,8F,08) A(FF,B0,8F,08) A(FF,B0,8F,08) A(A5,59,72,97) A(22,CA,CA,CA) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(03,FF,FF,FF) A(FF,B0,8F,08) A(FF,B0,8F,08) 
					A(FF,F2,D9,0A) A(FF,F2,D9,0A) A(FF,F2,D9,0A) A(FF,B0,8F,08) A(FF,73,5D,05) A(56,97,A0,A9) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(91,4F,6B,91) A(FF,B0,8F,08) A(FF,F0,C2,0A) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,F2,C4,0B) 
					A(FF,E0,B6,0A) A(FF,73,5D,05) A(0E,FE,FE,EC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(13,FE,FE,FE) A(FF,73,5D,05) 
					A(FF,E0,B6,0A) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,E0,B6,0A) A(FF,B0,8F,08) A(A7,46,52,63) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(5B,6D,7E,94) A(FF,E0,B6,0A) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,FF,C9,0E) 
					A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,E0,B6,0A) A(EB,39,46,50) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(7F,6E,7C,92) A(FF,E0,B6,0A) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,E0,B6,0A) 
					A(FF,43,4F,52) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(5E,7F,8D,9D) A(FF,73,5D,05) A(FF,F2,C4,0B) A(FF,FF,C9,0E) 
					A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,E0,B6,0A) A(FF,73,5D,05) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(01,FF,FF,FF) A(FF,73,5D,05) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,F2,C4,0B) 
					A(FF,F2,C4,0B) A(FF,B0,8F,08) A(95,61,68,77) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(81,8A,98,AB) 
					A(FF,73,5D,05) A(FF,E0,B6,0A) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,E0,B6,0A) A(FF,B0,8F,08) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(93,93,A1,B6) A(FF,B0,8F,08) A(FF,B0,8F,08) A(FF,E0,B6,0A) 
					A(FF,E0,B6,0A) A(FF,B0,8F,08) A(FF,B0,8F,08) A(20,E7,E7,EF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(23,DA,E1,F0) A(7F,70,86,A6) A(CC,6F,82,9D) A(B7,65,77,92) A(5B,7E,8E,A5) A(03,FF,FF,FF) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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