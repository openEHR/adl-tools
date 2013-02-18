note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_ARCHETYPE_TEMPLATE_VALID_3

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "archetype/template_valid_3"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,28,93,1B) A(FF,29,96,1E) A(FF,28,99,1F) A(FF,29,9C,20) A(FF,FC,FE,FC) 
					A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,FC,FE,FC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,27,90,1A) 
					A(FF,28,93,1B) A(FF,29,96,1E) A(FF,28,99,1F) A(FF,29,9C,20) A(FF,BC,F0,B0) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,40,FF,13) 
					A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,27,90,1A) A(FF,28,93,1B) A(FF,29,96,1E) A(FF,28,99,1F) A(FF,29,9C,20) A(FF,FC,FE,FC) 
					A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,40,FF,13) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FC,FE,FC) A(00,00,00,00) A(FF,27,90,1A) 
					A(FF,28,93,1B) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,40,FF,13) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,40,FF,13) A(FF,40,FF,13) A(00,00,00,00) A(FF,28,93,1B) A(FF,29,96,1E) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,2A,9F,21) 
					A(FF,2B,A2,22) A(FF,9D,E1,8D) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,40,FF,13) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,40,FF,13) A(FF,40,FF,13) A(FF,40,FF,13) 
					A(FF,28,93,1B) A(FF,29,96,1E) A(FF,28,99,1F) A(FF,00,FF,FF) A(FF,2A,9F,21) A(FF,2B,A2,22) A(FF,2D,A5,23) A(FF,9D,E1,8D) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,40,FF,13) A(FF,40,FF,13) A(FF,40,FF,13) A(FF,40,FF,13) A(FF,29,96,1E) A(FF,28,99,1F) A(FF,29,9C,20) A(FF,2A,9F,21) 
					A(FF,2B,A2,22) A(FF,2D,A5,23) A(FF,2E,A8,24) A(FF,FC,FE,FC) A(FF,9D,E1,8D) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,40,FF,13) A(FF,40,FF,13) A(FF,40,FF,13) 
					A(FF,40,FF,13) A(FF,FC,FE,FC) A(FF,28,99,1F) A(FF,29,9C,20) A(FF,2A,9F,21) A(FF,2B,A2,22) A(FF,2D,A5,23) A(FF,2E,A8,24) A(FF,2E,A9,25) A(FF,00,FF,FF) 
					A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,9D,E1,8D) A(FF,40,FF,13) A(FF,40,FF,13) A(FF,40,FF,13) A(FF,9D,E1,8D) A(FF,56,BE,50) A(FF,29,9C,20) A(FF,2A,9F,21) 
					A(FF,2B,A2,22) A(FF,2D,A5,23) A(FF,2E,A8,24) A(FF,2E,A9,25) A(FF,2E,AE,26) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,FC,FE,FC) A(FF,40,FF,13) A(FF,40,FF,13) 
					A(FF,40,FF,13) A(FF,FC,FE,FC) A(FF,56,BE,50) A(FF,5F,BF,59) A(FF,2A,9F,21) A(FF,2B,A2,22) A(FF,2D,A5,23) A(FF,2E,A8,24) A(FF,2E,A9,25) A(FF,2E,AE,26) 
					A(FF,2F,B1,27) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,3D,BA,36) A(FF,42,BE,3A) A(FF,47,BE,40) A(FF,50,BF,49) A(FF,56,BE,50) A(FF,5F,BF,59) A(FF,63,BF,5F) 
					A(FF,2B,A2,22) A(FF,2D,A5,23) A(FF,2E,A8,24) A(FF,2E,A9,25) A(FF,2E,AE,26) A(FF,2F,B1,27) A(FF,34,B4,2C) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,42,BE,3A) 
					A(FF,47,BE,40) A(FF,50,BF,49) A(FF,56,BE,50) A(FF,5F,BF,59) A(FF,63,BF,5F) A(FF,6B,C0,68) A(00,00,00,00) A(FF,2E,A8,24) A(FF,2E,A9,25) A(FF,2E,AE,26) 
					A(FF,2F,B1,27) A(FF,34,B4,2C) A(FF,39,B7,31) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,47,BE,40) A(FF,50,BF,49) A(FF,56,BE,50) A(FF,5F,BF,59) A(FF,63,BF,5F) 
					A(FF,6B,C0,68) A(00,00,00,00) A(00,00,00,00) A(FF,2E,A9,25) A(FF,2E,AE,26) A(FF,2F,B1,27) A(FF,34,B4,2C) A(FF,39,B7,31) A(FF,00,FF,FF) A(FF,00,FF,FF) 
					A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,56,BE,50) A(FF,5F,BF,59) A(FF,63,BF,5F) A(FF,6B,C0,68) A(FF,70,C1,6D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,2F,B1,27) A(FF,34,B4,2C) A(FF,39,B7,31) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,00,FF,FF) A(FF,63,BF,5F) 
					A(FF,6B,C0,68) A(FF,70,C1,6D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,39,B7,31) A(FF,3D,BA,36) A(FF,42,BE,3A) 
					A(FF,47,BE,40) A(FF,50,BF,49) A(FF,56,BE,50) A(FF,5F,BF,59) A(FF,63,BF,5F) A(FF,6B,C0,68) A(FF,70,C1,6D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,47,BE,40) A(FF,50,BF,49) A(FF,56,BE,50) A(FF,5F,BF,59) A(FF,63,BF,5F) 
					A(FF,6B,C0,68) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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