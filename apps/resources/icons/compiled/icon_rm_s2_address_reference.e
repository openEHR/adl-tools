note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_ADDRESS_REFERENCE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/address_reference"
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
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) 
					A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A9,A9,A9) A(FF,C1,C1,C1) A(FF,96,96,96) 
					A(FF,91,91,91) A(FF,74,74,74) A(FF,F8,F8,F8) A(FF,FF,FF,FF) A(FF,B7,B7,B7) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(FF,81,81,81) A(FF,C0,C0,C0) A(FF,94,94,94) A(FF,91,91,91) A(FF,90,90,90) A(FF,90,90,90) A(FF,73,73,73) A(FF,FF,FF,FF) 
					A(FF,B9,B9,B9) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,C0,C0,C0) A(FF,C3,C3,C3) A(FF,91,91,91) 
					A(FF,91,91,91) A(FF,91,91,91) A(FF,90,90,90) A(FF,90,90,90) A(FF,90,90,90) A(FF,72,72,72) A(FF,94,94,94) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,99,99,99) A(FF,C2,C2,C2) A(FF,90,90,90) A(FF,91,91,91) A(FF,91,91,91) A(FF,91,91,91) A(FF,91,91,91) A(FF,90,90,90) 
					A(FF,90,90,90) A(FF,91,91,91) A(FF,7D,7D,7D) A(FF,77,77,77) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,C2,C2,C2) A(FF,90,90,90) 
					A(FF,93,93,93) A(FF,93,93,93) A(FF,93,93,93) A(FF,93,93,93) A(FF,93,93,93) A(FF,93,93,93) A(FF,93,93,93) A(FF,93,93,93) A(FF,93,93,93) A(FF,7F,7F,7F) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,93,93,93) A(FF,B2,B2,B2) A(FF,B2,B2,B2) A(FF,B2,B2,B2) A(FF,B2,B2,B2) A(FF,B2,B2,B2) 
					A(FF,B2,B2,B2) A(FF,B2,B2,B2) A(FF,B2,B2,B2) A(FF,B2,B2,B2) A(FF,B5,B5,B5) A(FF,83,83,83) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,EB,EB,EB) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,95,95,95) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,E9,E9,E9) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,97,97,97) A(FF,01,34,8D) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,E9,E9,E9) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,EE,EE,EE) A(FF,EB,EB,EB) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,97,97,97) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,E9,E9,E9) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FA,FA,FA) A(FF,9E,9E,9E) A(FF,91,91,91) A(FF,EB,EB,EB) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,97,97,97) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,E9,E9,E9) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FE,FE,FE) A(FF,88,88,88) 
					A(FF,7A,7A,7A) A(FF,EF,EF,EF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,97,97,97) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,E9,E9,E9) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FE,FE,FE) A(FF,88,88,88) A(FF,79,79,79) A(FF,F0,F0,F0) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,97,97,97) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
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