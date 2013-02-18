note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_RM_OPENEHR_ITEM_TREE_SLOT

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/openehr/item_tree_slot"
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
					A(FF,01,34,8D) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,E6,E6,E6) A(FF,DF,DF,DF) A(FF,8B,8B,8B) A(FF,6D,6D,6D) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,B8,B8,B8) A(FF,B0,B0,B0) A(FF,90,90,90) A(FF,67,67,67) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,8D,8D,8D) A(FF,A8,A8,A8) A(FF,78,78,78) A(FF,79,79,79) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,93,93,93) A(FF,70,70,70) A(FF,85,85,85) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) 
					A(FF,AC,AC,AC) A(FF,BB,BB,BB) A(FF,80,80,80) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,CC,CC,CC) A(FF,A5,A5,A5) 
					A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A0,A0,A0) A(FF,E6,E6,E6) A(FF,DF,DF,DF) A(FF,8B,8B,8B) A(FF,6D,6D,6D) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,CE,CE,CE) A(FF,96,96,96) A(FF,67,67,67) A(FF,6B,6B,6B) A(FF,6B,6B,6B) A(FF,6B,6B,6B) 
					A(FF,6B,6B,6B) A(FF,92,92,92) A(FF,B8,B8,B8) A(FF,B0,B0,B0) A(FF,90,90,90) A(FF,67,67,67) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,FD,FD,FD) A(FF,90,90,90) A(FF,DE,DE,DE) A(FF,C8,C8,C8) A(FF,C8,C8,C8) A(FF,C8,C8,C8) A(FF,CF,CF,CF) A(FF,7D,7D,7D) A(FF,8D,8D,8D) A(FF,A8,A8,A8) 
					A(FF,78,78,78) A(FF,79,79,79) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,FF,FF,FF) A(FF,9E,9E,9E) A(FF,FF,FF,FF) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E6,E6,E6) A(FF,93,93,93) A(FF,70,70,70) A(FF,85,85,85) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,FF,FF,FF) A(FF,9E,9E,9E) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,FF,FF,FF) A(00,00,00,00) A(FF,D4,D4,D4) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,FF,FF,FF) A(FF,9E,9E,9E) 
					A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,AC,AC,AC) A(FF,BB,BB,BB) A(FF,80,80,80) A(FF,FF,FF,FF) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,FF,FF,FF) A(FF,A0,A0,A0) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,A0,A0,A0) A(FF,E6,E6,E6) A(FF,DF,DF,DF) A(FF,8B,8B,8B) A(FF,6D,6D,6D) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,FF,FF,FF) A(FF,8A,8A,8A) A(FF,55,55,55) A(FF,58,58,58) A(FF,58,58,58) A(FF,58,58,58) A(FF,55,55,55) A(FF,92,92,92) A(FF,B8,B8,B8) A(FF,B0,B0,B0) 
					A(FF,90,90,90) A(FF,67,67,67) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
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