note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_EXTRACT

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/extract"
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
					A(FF,9E,AA,B8) A(FF,70,89,A7) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,88,A5) 
					A(FF,7D,8F,A5) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,65,74,85) A(FF,49,74,A6) A(FF,6F,A0,D8) A(FF,6D,9E,D6) 
					A(FF,6D,9E,D6) A(FF,6D,9E,D6) A(FF,6D,9E,D6) A(FF,6D,9E,D6) A(FF,6D,9E,D6) A(FF,66,97,D0) A(FF,3E,4C,5E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,68,76,88) A(FF,47,72,A4) A(FF,68,9A,D6) A(FF,6C,9F,DB) A(FF,6C,9F,DB) A(FF,9E,AA,B8) A(FF,70,89,A7) A(FF,71,89,A5) 
					A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,89,A5) A(FF,71,88,A5) A(FF,7D,8F,A5) A(FF,68,76,88) A(FF,48,73,A5) 
					A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,65,74,85) A(FF,49,74,A6) A(FF,6F,A0,D8) A(FF,6D,9E,D6) A(FF,6D,9E,D6) A(FF,6D,9E,D6) A(FF,6D,9E,D6) 
					A(FF,6D,9E,D6) A(FF,6D,9E,D6) A(FF,66,97,D0) A(FF,3E,4C,5E) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,68,76,88) 
					A(FF,47,72,A4) A(FF,68,9A,D6) A(FF,6C,9F,DB) A(FF,6C,9F,DB) A(FF,6C,9F,DB) A(FF,6C,9F,DB) A(FF,6C,9F,DB) A(FF,6C,9F,DB) A(FF,51,7D,B2) A(FF,41,4E,5F) 
					A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) 
					A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,4F,7A,AF) A(FF,41,4E,5F) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) 
					A(FF,5D,8E,CA) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) 
					A(FF,4F,7A,AF) A(FF,41,4E,5F) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) 
					A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,4F,7A,AF) A(FF,41,4E,5F) A(FF,68,76,88) A(FF,48,73,A5) 
					A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) 
					A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,4F,7A,AF) A(FF,41,4E,5F) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,68,76,88) 
					A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,4F,7A,AF) A(FF,41,4E,5F) 
					A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8D,C9) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) 
					A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,C9) A(FF,4F,7A,AF) A(FF,41,4E,5F) A(FF,68,76,88) A(FF,49,74,A6) A(FF,5B,8C,C4) A(FF,5C,8D,C8) 
					A(FF,5D,8D,C7) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8E,CA) A(FF,5D,8D,CA) A(FF,5C,8E,CA) A(FF,5D,8D,C7) 
					A(FF,53,7E,B1) A(FF,40,4E,5F) A(FF,7A,8A,9D) A(FF,44,5D,7D) A(FF,40,60,87) A(FF,4E,73,9E) A(FF,50,71,98) A(FF,68,76,88) A(FF,48,73,A5) A(FF,5C,8D,CA) 
					A(FF,5D,8E,CA) A(FF,5D,8D,C9) A(FF,5D,8E,CA) A(FF,5D,8D,C5) A(FF,5D,87,B8) A(FF,50,71,97) A(FF,3A,53,70) A(FF,57,65,77) A(00,00,00,00) A(FF,E1,EC,F8) 
					A(FF,71,87,A0) A(FF,6D,7F,95) A(FF,68,78,8C) A(FF,68,76,88) A(FF,49,74,A6) A(FF,5B,8C,C4) A(FF,5C,8D,C8) A(FF,5D,8D,C7) A(FF,5D,8B,BE) A(FF,51,73,9B) 
					A(FF,34,49,63) A(FF,5E,6D,7F) A(FF,9A,A9,BC) A(FF,FE,FE,FE) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,7A,8A,9D) 
					A(FF,44,5D,7D) A(FF,40,60,87) A(FF,4E,73,9E) A(FF,50,71,98) A(FF,34,4C,6A) A(FF,56,65,77) A(FF,B9,C3,CD) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E1,EC,F8) A(FF,71,87,A0) A(FF,6D,7F,95) A(FF,68,78,8C) 
					A(FF,9B,A8,B8) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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