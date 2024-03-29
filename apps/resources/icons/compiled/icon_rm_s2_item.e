note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_ITEM

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/item"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,EF,EF,EF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,EB,EB,EB) A(FF,9E,9E,9E) A(FF,A9,A9,A9) 
					A(FF,7E,7E,7E) A(FF,FC,FC,FC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,E8,E8,E8) A(FF,E8,E8,E8) A(FF,C2,C2,C2) A(FF,70,70,70) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,8C,8C,8C) 
					A(FF,E0,E0,E0) A(FF,FF,FF,FF) A(FF,E0,E0,E0) A(FF,6C,6C,6C) A(FF,FC,FC,FC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,7D,7D,7D) A(FF,C2,C2,C2) A(FF,E0,E0,E0) A(FF,C2,C2,C2) A(FF,79,79,79) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,C8,C8,C8) A(FF,8C,8C,8C) A(FF,73,73,73) A(FF,82,82,82) A(FF,E1,E1,E1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,EB,EB,EB) 
					A(FF,9E,9E,9E) A(FF,A9,A9,A9) A(FF,7E,7E,7E) A(FF,FC,FC,FC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B6,B6,B6) A(FF,9A,9A,9A) 
					A(FF,FB,FB,FB) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,E8,E8,E8) A(FF,E8,E8,E8) A(FF,C2,C2,C2) A(FF,70,70,70) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B7,B7,B7) A(FF,8E,8E,8E) A(FF,6C,6C,6C) A(FF,6F,6F,6F) A(FF,6F,6F,6F) A(FF,6F,6F,6F) 
					A(FF,6F,6F,6F) A(FF,8C,8C,8C) A(FF,E0,E0,E0) A(FF,FF,FF,FF) A(FF,E0,E0,E0) A(FF,6C,6C,6C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,D6,D6,D6) A(FF,8A,8A,8A) A(FF,C3,C3,C3) A(FF,B3,B3,B3) A(FF,B3,B3,B3) A(FF,B3,B3,B3) A(FF,B8,B8,B8) A(FF,7D,7D,7D) A(FF,C2,C2,C2) A(FF,E0,E0,E0) 
					A(FF,C2,C2,C2) A(FF,79,79,79) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E0,E0,E0) A(FF,94,94,94) A(FF,F6,F6,F6) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C8,C8,C8) A(FF,8C,8C,8C) A(FF,73,73,73) A(FF,82,82,82) A(FF,E1,E1,E1) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,E0,E0,E0) A(FF,94,94,94) A(FF,F6,F6,F6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,F8,F8,F8) A(00,00,00,00) A(FF,BC,BC,BC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E0,E0,E0) A(FF,94,94,94) 
					A(FF,F6,F6,F6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,EB,EB,EB) A(FF,9E,9E,9E) A(FF,A9,A9,A9) A(FF,7E,7E,7E) A(FF,FC,FC,FC) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E0,E0,E0) A(FF,95,95,95) A(FF,F6,F6,F6) A(FF,F7,F7,F7) A(FF,F7,F7,F7) A(FF,F7,F7,F7) 
					A(FF,FC,FC,FC) A(FF,96,96,96) A(FF,E8,E8,E8) A(FF,E8,E8,E8) A(FF,C2,C2,C2) A(FF,70,70,70) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,E1,E1,E1) A(FF,85,85,85) A(FF,5F,5F,5F) A(FF,61,61,61) A(FF,61,61,61) A(FF,61,61,61) A(FF,5F,5F,5F) A(FF,8C,8C,8C) A(FF,E0,E0,E0) A(FF,FF,FF,FF) 
					A(FF,E0,E0,E0) A(FF,6C,6C,6C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E5,E5,E5) A(FF,D9,D9,D9) A(FF,DB,DB,DB) A(FF,DB,DB,DB) 
					A(FF,DB,DB,DB) A(FF,DB,DB,DB) A(FF,E5,E5,E5) A(FF,7D,7D,7D) A(FF,C2,C2,C2) A(FF,E0,E0,E0) A(FF,C2,C2,C2) A(FF,79,79,79) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C8,C8,C8) 
					A(FF,8C,8C,8C) A(FF,73,73,73) A(FF,82,82,82) A(FF,E1,E1,E1) A(00,00,00,00) A(00,00,00,00) ;
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