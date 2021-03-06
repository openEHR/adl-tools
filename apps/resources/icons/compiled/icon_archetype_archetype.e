note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_ARCHETYPE_ARCHETYPE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "archetype/archetype"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,79,79,79) A(FF,7B,7B,7B) A(FF,7D,7D,7D) A(FF,7F,7F,7F) A(FF,81,81,81) 
					A(FF,85,85,85) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,77,77,77) 
					A(FF,79,79,79) A(FF,7B,7B,7B) A(FF,7D,7D,7D) A(FF,7F,7F,7F) A(FF,81,81,81) A(FF,85,85,85) A(FF,8A,8A,8A) A(FF,8E,8E,8E) A(FF,92,92,92) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,77,77,77) A(FF,79,79,79) A(FF,7B,7B,7B) A(FF,7D,7D,7D) A(FF,7F,7F,7F) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,8A,8A,8A) A(FF,8E,8E,8E) A(FF,92,92,92) A(FF,96,96,96) A(FF,9A,9A,9A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,77,77,77) 
					A(FF,79,79,79) A(FF,7B,7B,7B) A(FF,7D,7D,7D) A(FF,7F,7F,7F) A(FF,81,81,81) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,8E,8E,8E) A(FF,92,92,92) A(FF,96,96,96) 
					A(FF,9A,9A,9A) A(FF,9F,9F,9F) A(FF,A3,A3,A3) A(00,00,00,00) A(00,00,00,00) A(FF,79,79,79) A(FF,7B,7B,7B) A(FF,7D,7D,7D) A(FF,7F,7F,7F) A(FF,81,81,81) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,96,96,96) A(FF,9A,9A,9A) A(FF,9F,9F,9F) A(FF,A3,A3,A3) A(FF,A7,A7,A7) A(00,00,00,00) 
					A(FF,79,79,79) A(FF,7B,7B,7B) A(FF,7D,7D,7D) A(FF,7F,7F,7F) A(FF,81,81,81) A(FF,85,85,85) A(FF,FF,FF,FF) A(FF,8E,8E,8E) A(FF,92,92,92) A(FF,FF,FF,FF) 
					A(FF,9A,9A,9A) A(FF,9F,9F,9F) A(FF,A3,A3,A3) A(FF,A7,A7,A7) A(FF,AC,AC,AC) A(FF,B0,B0,B0) A(FF,7B,7B,7B) A(FF,7D,7D,7D) A(FF,7F,7F,7F) A(FF,81,81,81) 
					A(FF,85,85,85) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,92,92,92) A(FF,96,96,96) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,A3,A3,A3) A(FF,A7,A7,A7) A(FF,AC,AC,AC) 
					A(FF,B0,B0,B0) A(FF,B4,B4,B4) A(FF,7D,7D,7D) A(FF,7F,7F,7F) A(FF,81,81,81) A(FF,85,85,85) A(FF,8A,8A,8A) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,96,96,96) 
					A(FF,9A,9A,9A) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,A7,A7,A7) A(FF,AC,AC,AC) A(FF,B0,B0,B0) A(FF,B4,B4,B4) A(FF,BA,BA,BA) A(FF,7F,7F,7F) A(FF,81,81,81) 
					A(FF,85,85,85) A(FF,8A,8A,8A) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,B0,B0,B0) A(FF,B4,B4,B4) A(FF,BA,BA,BA) A(FF,C0,C0,C0) A(FF,81,81,81) A(FF,85,85,85) A(FF,8A,8A,8A) A(FF,8E,8E,8E) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,B4,B4,B4) A(FF,BA,BA,BA) A(FF,C0,C0,C0) A(FF,C7,C7,C7) 
					A(FF,85,85,85) A(FF,8A,8A,8A) A(FF,8E,8E,8E) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,9F,9F,9F) A(FF,A3,A3,A3) A(FF,A7,A7,A7) A(FF,AC,AC,AC) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,C0,C0,C0) A(FF,C7,C7,C7) A(FF,CD,CD,CD) A(00,00,00,00) A(FF,8E,8E,8E) A(FF,92,92,92) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,9F,9F,9F) A(FF,A3,A3,A3) A(FF,A7,A7,A7) A(FF,AC,AC,AC) A(FF,B0,B0,B0) A(FF,B4,B4,B4) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,C7,C7,C7) 
					A(FF,CD,CD,CD) A(00,00,00,00) A(00,00,00,00) A(FF,92,92,92) A(FF,96,96,96) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,A3,A3,A3) A(FF,A7,A7,A7) A(FF,AC,AC,AC) 
					A(FF,B0,B0,B0) A(FF,B4,B4,B4) A(FF,BA,BA,BA) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,CD,CD,CD) A(FF,D3,D3,D3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,AC,AC,AC) A(FF,B0,B0,B0) A(FF,B4,B4,B4) A(FF,BA,BA,BA) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A3,A3,A3) A(FF,A7,A7,A7) A(FF,AC,AC,AC) 
					A(FF,B0,B0,B0) A(FF,B4,B4,B4) A(FF,BA,BA,BA) A(FF,C0,C0,C0) A(FF,C7,C7,C7) A(FF,CD,CD,CD) A(FF,D3,D3,D3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B0,B0,B0) A(FF,B4,B4,B4) A(FF,BA,BA,BA) A(FF,C0,C0,C0) A(FF,C7,C7,C7) 
					A(FF,CD,CD,CD) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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