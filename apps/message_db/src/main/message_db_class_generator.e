note
	component:   "openEHR Archetype Project"
	description : "[
				   Generator for Eiffel class source text of form

				    class COMPILED_MESSAGE_DB
				    feature -- Access
				    	messages: [HASH_TABLE [STRING, STRING]]
				    		once
				    			create Result.make(0)
				    			Result.put ("text $1 text $2", "CodeA")
				    			Result.put ("text $1 text", "CodeB")
				    			Result.put ("text $1, $2, $3", "CodeC")
				    		end
				    end

				    This class can then be inherited by the class MESSAGE_DB in any app.
				   ]"
	keywords:    "Internationalisation, I18N, Localisation, L10N"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	MESSAGE_DB_CLASS_GENERATOR

create
	make

feature -- Initialization

	make
		do
			create output.make (20000)
		end

feature -- Access

	source_structure: HASH_TABLE [STRING, STRING]
		attribute
			create Result.make (0)
		end

	class_name: STRING = "COMPILED_MESSAGE_DB"

	output: STRING
			-- class text
		attribute
			create Result.make (20000)
		end

feature -- Commands

	generate (a_source_struct: like source_structure)
		do
			source_structure := a_source_struct
			output.wipe_out
			output.append (class_header)
			output.replace_substring_all ("$class_name", class_name)
			output.append (feature_top)
			across source_structure as ss_csr loop
				output.append ("%T%T%Tmessage_table.put (%"" + ss_csr.item + "%", ec_" + ss_csr.key + ")%N")
			end
			output.append (feature_bottom)
			output.append (class_footer)
		end

feature {NONE} -- Boilerplate

	class_header: STRING = "[
note
	component:   "openEHR Archetype Project"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class $class_name

inherit
	COMPILED_MESSAGE_IDS

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	]"

	feature_top: STRING = "[

	make
		do
			precursor

	]"

	feature_bottom: STRING = "[
		end
	]"

	class_footer: STRING = "[
	
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
