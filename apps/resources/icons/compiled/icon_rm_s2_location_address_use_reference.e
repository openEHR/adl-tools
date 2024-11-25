note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_LOCATION_ADDRESS_USE_REFERENCE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/location_address_use_reference"
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
					A(FF,01,34,8D) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6E,88,AA) A(FF,B0,8F,08) A(FF,B0,8F,08) A(FF,B0,8F,08) A(FF,5A,73,97) A(FF,CA,CC,CE) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,B0,8F,08) A(FF,B0,8F,08) 
					A(FF,F2,D9,0A) A(FF,F2,D9,0A) A(FF,F2,D9,0A) A(FF,B0,8F,08) A(FF,73,5D,05) A(FF,98,A0,AA) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,50,6C,91) A(FF,B0,8F,08) A(FF,F0,C2,0A) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,F2,C4,0B) 
					A(FF,E0,B6,0A) A(FF,73,5D,05) A(FF,FF,FC,F2) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,FF,FF,FF) A(FF,73,5D,05) 
					A(FF,E0,B6,0A) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,E0,B6,0A) A(FF,B0,8F,08) A(FF,47,52,63) A(00,00,00,00) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,6E,7F,95) A(FF,E0,B6,0A) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,FF,C9,0E) 
					A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,E0,B6,0A) A(FF,3A,47,50) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,6E,7D,92) A(FF,E0,B6,0A) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,E0,B6,0A) 
					A(FF,43,4F,52) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,80,8C,9C) A(FF,73,5D,05) A(FF,F2,C4,0B) A(FF,FF,C9,0E) 
					A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,E0,B6,0A) A(FF,73,5D,05) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,FF,FF,FF) A(FF,73,5D,05) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,FF,C9,0E) A(FF,FF,C9,0E) A(FF,F2,C4,0B) A(FF,F2,C4,0B) 
					A(FF,F2,C4,0B) A(FF,B0,8F,08) A(FF,61,69,77) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(FF,8A,99,AC) 
					A(FF,73,5D,05) A(FF,E0,B6,0A) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,F2,C4,0B) A(FF,E0,B6,0A) A(FF,B0,8F,08) A(00,00,00,00) A(00,00,00,00) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(FF,93,A1,B6) A(FF,B0,8F,08) A(FF,B0,8F,08) A(FF,E0,B6,0A) 
					A(FF,E0,B6,0A) A(FF,B0,8F,08) A(FF,B0,8F,08) A(FF,E7,E9,ED) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,D7,E2,F2) A(FF,70,86,A6) A(FF,6F,82,9E) A(FF,65,77,93) A(FF,7F,90,A6) A(FF,FF,FF,FF) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
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