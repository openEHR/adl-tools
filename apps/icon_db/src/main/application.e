note
	component:   "openEHR Project <http://www.openEHR.org>"
	description : "[
				   Icon DB compiler. COnverts a directory of icon files (.png and .ico) of the form:
				   	aaa
						bbb
							icon1.png
							icon2.ico
							icon2.ico
						ccc
							icon4.ico
							icon5.png
					ddd
						icon6.ico
					
					The result is a set of classes containing the icon PIXMAP image data that is used by the class

					USAGE:
					   icondbc.exe [-q] [-s <directory>] [-o <directory>] [-v] [-nologo]

					OPTIONS:
					   Options should be prefixed with: '-' or '/'

					   -q --quiet     : suppress verbose feedback, including configuration
					                    information on startup (Optional)
					   -f --force     : Force generation of classes, overwriting existing files
                					    (default: only generate classes if not already there)
                   						(Optional)
   					   -s --source_dir: source directory (Optional)
					                    <directory>: directory
					   -o --output_dir: output directory (Optional)
					                    <directory>: directory
					   -? --help      : Display usage information. (Optional)
					   -v --version   : Displays version information. (Optional)

  				   ]"
	keywords:    "embedded icons, pixmap"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	APPLICATION

inherit
	SHARED_MESSAGE_DB

	SHARED_RESOURCES

	ANY_VALIDATOR

create
	make

feature -- Definition

	Error_file_extension: STRING = ".txt"

	Default_author: STRING = "Thomas Beale <thomas.beale@oceaninformatics.com>"

	Default_support: STRING = "http://www.openehr.org/issues/browse/AWB"

	Default_copyright: STRING = "Copyright (c) 2013- Ocean Informatics Pty Ltd"

feature -- Initialization

	make
		do
			reset
			options_processor.execute (agent start)
		end

feature -- Access


feature -- Status Report


feature -- Commands

	start
		local
			fd: PLAIN_TEXT_FILE
			icon_class_name: STRING
			icon_class_file_path: STRING
		do
			create icon_source_table.make (options_processor.icon_source_dir, options_processor.is_verbose)

			-- create the individual icon class texts; one class per icon, each containing the RGB data of
			-- the icon and some set up code to create an EV_PIXEL_BUFFER from it
			across icon_source_table.icon_pixmaps as pixmaps_csr loop
				icon_class_name := icon_class_name_from_key (pixmaps_csr.key)
				icon_class_file_path := file_system.pathname (options_processor.output_file_dir, class_file_name (icon_class_name))

				if file_system.file_exists (icon_class_file_path) and not options_processor.force_generation then
					if options_processor.is_verbose then
						io.put_string (get_msg (ec_skip_class_text, <<icon_class_name>>))
					end
				else
					icon_class_generator.setup (pixmaps_csr.item, pixmaps_csr.key)
					icon_class_generator.generate_as_class (icon_class_name)

					create fd.make_open_write (icon_class_file_path)
					fd.put_string (icon_class_generator.output)
					fd.close

					if options_processor.is_verbose then
						io.put_string (get_msg (ec_generate_class_text, <<icon_class_name>>))
					end
				end
				icon_loader_class_generator.add_icon_class_name (icon_class_name, pixmaps_csr.key)
			end

			-- now write the icon_loader class text
			icon_loader_class_generator.generate
			create fd.make_open_write (file_system.pathname (options_processor.output_file_dir, class_file_name (icon_loader_class_generator.class_name)))
			fd.put_string (icon_loader_class_generator.output)
			fd.close

			if options_processor.is_verbose then
				io.put_string ("%N")
				io.put_string (get_msg (ec_generate_class_text, <<icon_loader_class_generator.class_name>>))
			end
		end

	validate
		do

		end

feature {NONE} -- Implementation

	options_processor: OPTIONS_PROCESSOR
		once
			create Result.make
			Result.set_is_usage_displayed_on_error (True)
		end

	icon_class_generator: ICON_CLASS_GENERATOR
		once
			create Result.make (Default_author, Default_support, Default_copyright)
		end

	icon_loader_class_generator: ICON_LOADER_CLASS_GENERATOR
		once
			create Result.make (Default_author, Default_support, Default_copyright)
		end

	icon_source_table: detachable ICON_FILE_TABLE
		note
			option: stable
		attribute
		end

	icon_class_name_from_key (a_key: STRING): STRING
		do
			Result := "ICON_" + a_key
			Result.replace_substring_all ("/", "_")
			Result.replace_substring_all (".", "_")
			Result.to_upper
		end

	class_file_name (a_class_name: STRING): STRING
			-- file name to save class to, usually class_name in lower case
			-- with '.e' appended
		do
			Result := a_class_name.twin
			Result.append (".e")
			Result.to_lower
		end

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
--| The Original Code is shared_ui_resources.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
