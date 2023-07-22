note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_QUESTIONNAIRE_RESPONSE_REFERENCE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/questionnaire_response_reference"
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
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CA,CA,CA) A(FF,DB,DB,DB) A(FF,C2,C2,C2) A(FF,E1,E1,E1) A(FF,FF,FF,FF) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,B0,B0,B0) A(FF,BE,BE,BE) 
					A(FF,A5,A5,A5) A(FF,A3,A3,A3) A(FF,A2,A2,A2) A(FF,9C,9C,9C) A(FF,9C,9C,9C) A(FF,A9,A9,A9) A(FF,EA,EA,EA) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,F5,F5,F5) A(FF,B0,B0,B0) A(FF,AD,AD,AD) A(FF,E9,E9,E9) A(FF,E4,E4,E4) A(FF,C7,C7,C7) A(FF,B7,B7,B7) A(FF,A8,A8,A8) 
					A(FF,F1,F1,F1) A(FF,99,99,99) A(FF,8D,8D,8D) A(FF,BC,BC,BC) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,B2,B2,B2) A(FF,B7,B7,B7) 
					A(FF,FF,FF,FF) A(FF,F4,F4,F4) A(FF,D3,D3,D3) A(FF,FF,FF,FF) A(FF,F1,F1,F1) A(FF,B2,B2,B2) A(FF,89,89,89) A(FF,FF,FF,FF) A(FF,B2,B2,B2) A(FF,88,88,88) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,B6,B6,B6) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,82,82,82) A(FF,EB,EB,EB) A(FF,CB,CB,CB) 
					A(FF,C4,C4,C4) A(FF,BB,BB,BB) A(FF,6B,6B,6B) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,B6,B6,B6) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,E7,E7,E7) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,75,75,75) A(FF,C3,C3,C3) A(FF,C5,C5,C5) A(FF,C4,C4,C4) A(FF,BC,BC,BC) A(FF,7A,7A,7A) A(FF,F3,F3,F3) 
					A(FF,FF,FF,FF) A(FF,F8,F8,F8) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,7E,7E,7E) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,7F,7F,7F) 
					A(FF,A8,A8,A8) A(FF,C0,C0,C0) A(FF,C3,C3,C3) A(FF,AC,AC,AC) A(FF,3D,3D,3D) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,7D,7D,7D) A(FF,01,34,8D) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,9E,9E,9E) A(FF,77,77,77) A(FF,D0,D0,D0) A(FF,FF,FF,FF) A(FF,7E,7E,7E) A(FF,8E,8E,8E) A(FF,9E,9E,9E) A(FF,65,65,65) 
					A(FF,D4,D4,D4) A(FF,DC,DC,DC) A(FF,7F,7F,7F) A(FF,5C,5C,5C) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,C6,C6,C6) 
					A(FF,84,84,84) A(FF,74,74,74) A(FF,B8,B8,B8) A(FF,92,92,92) A(FF,7F,7F,7F) A(FF,98,98,98) A(FF,8A,8A,8A) A(FF,6F,6F,6F) A(FF,81,81,81) A(FF,FF,FF,FF) 
					A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,A9,A9,A9) A(FF,A8,A8,A8) A(FF,7E,7E,7E) 
					A(FF,7D,7D,7D) A(FF,7E,7E,7E) A(FF,9B,9B,9B) A(FF,CB,CB,CB) A(00,00,00,00) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
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