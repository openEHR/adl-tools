note
	support:     "http://www.openehr.org/issues/browse/AWB"
	description : "[
				   Generator for Eiffel class source text of form

				    class ICON_XXX
				    feature -- Access

				    This class can then be inherited by the class MESSAGE_DB in any app.
				   ]"
	keywords:    "embedded icons, pixmaps, class generation"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	ICON_CLASS_GENERATOR

inherit
	ANY_CLASS_GENERATOR
		redefine
			make
		end

create
	make

feature -- Definitions

	Line_max_length: INTEGER = 10

	Pixels_fitting_into_32k_string: INTEGER = 400
			-- Eiffel Language have manifest string limitation which is 32k.
			-- We can't generated c external features as long as we want.
			-- Hope the limitation can be removed in the future. (2007-Aug-22)

	Default_class_name: STRING = "ICON_"

feature -- Initialization

	make (an_author_note, a_support_note, a_copyright_note: STRING)
		do
			precursor (an_author_note, a_support_note, a_copyright_note)
			create rgb_map.make (0)
			create key.make_empty
		end

feature -- Access

	key: STRING

	source_pixmap: detachable EV_PIXEL_BUFFER
		note
			option: stable
		attribute
		end

feature -- Commands

	setup (a_source_pixmap: attached like source_pixmap; a_key: STRING)
		do
			source_pixmap := a_source_pixmap
			build_rgb_map
			key := a_key
		end

feature {NONE} -- Implementation

	generate_body
			-- generate the main class body; called by `generate' and `generate_as_class'
		do
			-- adjust initialisation section - add code to make routine
			output.replace_substring_all ("$WIDTH", source_pixmap.width.out)
			output.replace_substring_all ("$HEIGHT", source_pixmap.height.out)
			output.replace_substring_all ("$KEY", key)

			-- C external data code
			output.append (build_c_external_data_code)
			output.append ("%N")

			-- colours code
			output.append (build_colors_code)
			output.append ("%N")
		end

	rgb_map: ARRAYED_LIST [ARRAYED_LIST [NATURAL_32]]
			-- 2-D map of RGB values taken from `source_pixmap'

	build_rgb_map
			-- Build rgb map of icon
		local
			i, j: INTEGER
			rgb_row : ARRAYED_LIST [NATURAL_32]
			px_iterator: EV_PIXEL_BUFFER_ITERATOR
		do
			create rgb_map.make (source_pixmap.width)
			source_pixmap.lock
			px_iterator := source_pixmap.pixel_iterator
			px_iterator.start
			from i := 1 until i > source_pixmap.height loop
				create rgb_row.make (source_pixmap.width)
				rgb_map.extend (rgb_row)
				from j := 1 until j > source_pixmap.width loop
					rgb_row.extend (px_iterator.item.rgba_value)
					px_iterator.forth
					j := j + 1
				end
				i := i + 1
			end
			source_pixmap.unlock
		end

	build_c_external_data_code: STRING
			-- Builde C external features where we store all image raw data.
			-- We use C char array to store image data. If we use C uint32 array, on Windows the
			-- final compiled exe size will be 3 times bigger when using Microsoft C compiler.
			-- However, on Linux there is no size differences between using C char array and C uint32
			-- array.
			-- There is big edian difference bewteen the case when using C char array and the case when
			-- using C unint32 array.
		local
			l_feature_count, l_offset: INTEGER
			px_iterator: EV_PIXEL_BUFFER_ITERATOR
			l_pixel: EV_PIXEL_BUFFER_PIXEL
			feat_top: STRING
		do
			source_pixmap.lock
			px_iterator := source_pixmap.pixel_iterator
			px_iterator.start
			c_external_data_features_required := source_pixmap.width * source_pixmap.height // Pixels_fitting_into_32k_string + 1
			create Result.make_empty

			-- output 'feature' line
			Result.append (feature_image_data)

			-- this loop generates one or more features, each containing a rather large manifest string. If the
			-- string is > 32k, more features will be generated
			-- TODO: determine if this 32k limit still applies; if not, get rid of this loop?
			from until l_feature_count >= c_external_data_features_required loop
				if px_iterator.after then
					c_external_data_features_required := c_external_data_features_required - 1
				else
					feat_top := c_colors_feature_top.twin
					feat_top.replace_substring_all ("$FEATURE_COUNT", l_feature_count.out)
					Result.append (feat_top)

					from l_offset := 0 until l_offset >= Pixels_fitting_into_32k_string or px_iterator.after loop
						l_pixel := px_iterator.item
						if l_offset \\ Line_max_length = 0 then
							Result.append ("%N%T%T%T%T%T")
						end

						Result.append ("A(" + l_pixel.alpha.to_hex_string + "," + l_pixel.red.to_hex_string + "," + l_pixel.green.to_hex_string + "," + l_pixel.blue.to_hex_string + ") ")

						px_iterator.forth
						l_offset := l_offset + 1
					end

					Result.append (";%N")

					-- `sizeof l_data' should minus one sice there is additional `0' added by C compiler automatically.
					Result.append (c_colors_feature_bottom)
					l_feature_count := l_feature_count + 1
				end
			end
		end

	c_external_data_features_required: INTEGER

	build_colors_code: STRING
			-- Build colors creating code.
			-- Use array instead of tuple to store colors do create Result.make_empty
		local
			i: INTEGER
		do
			create Result.make (200)
			Result.append (build_colors_feature_top)
			from until i >= c_external_data_features_required loop
				Result.append (("%T%T%Tc_colors_" + i.out + " (a_ptr, " + (i * Pixels_fitting_into_32k_string).out + ")%N"))
				i := i + 1
			end
			Result.append (build_colors_feature_bottom)
		end

feature {NONE} -- Boilerplate

	class_inherit_clause: STRING = "[
inherit
	ICON_SOURCE

	]"

	class_create_clause: STRING = "[
create
	make

	]"

	class_initialisation: STRING = "[
feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "$KEY"
			make_with_size ($WIDTH, $HEIGHT)
			fill_memory
		end

	]"

	feature_image_data: STRING = "[
feature {NONE} -- Image data

	]"

	c_colors_feature_top: STRING = "[
	
	c_colors_$FEATURE_COUNT (a_ptr: POINTER; a_offset: INTEGER)
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
	]"

	c_colors_feature_bottom: STRING = "[
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end

	]"

	build_colors_feature_top: STRING = "[
	build_colors (a_ptr: POINTER)
			-- Build `colors'
		do

	]"

	build_colors_feature_bottom: STRING = "[
		end

	]"

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is icon_class_generator.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2013-
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
