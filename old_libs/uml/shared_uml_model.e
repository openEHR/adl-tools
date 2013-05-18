note
	component:   "openEHR Resuable Library Project"
	description: "Shared UML model"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"


class SHARED_UML_MODEL
		
inherit
	SHARED_SERIALISER_ENV
		export
			{NONE} all
		end

feature -- Access

	model: UML_MODEL
		once
			create Result.make
		end

	classes: HASH_TABLE [UML_CLASS, STRING]
			-- hash of UML classes keyed by name
		once
			create Result.make(0)
		end
		
	has_class(a_name: STRING): BOOLEAN
			-- has class already been created?
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
		do
			Result := classes.has(a_name)
		end
		
	class_for_name(a_name: STRING): UML_CLASS
			-- has class already been created?
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
		do
			Result := classes.item(a_name)
		end

	put_class(a_class: UML_CLASS)
			-- add class to index
		require
			a_class_exists: a_class /= Void
		do
			classes.put(a_class, a_class.name)
		end
		
feature -- Conversion

	convert_to_standard_name(a_name: STRING): STRING
			-- convert to form ClassName
		local
			i: INTEGER
		do
			create Result.make(0)
			
			-- convert all '_' with a following char to upper case of that char
			from i := 1 until i > a_name.count loop
				if a_name.item(i) /= '_' then
					Result.append_character(a_name.item(i).as_lower)
				else
					if i < a_name.count then
						i := i + 1
						Result.append_character(a_name.item(i).as_upper)
					end
				end
				i := i + 1
			end
		end

	convert_to_class_name(a_name: STRING): STRING
			-- convert to form ClassName
		do
			Result := convert_to_standard_name(a_name)
			Result.replace_substring(Result.item(1).as_upper.out, 1, 1)
		end

feature {NONE} -- Implementation

	indent: STRING
			-- debug indent string
		once
			create Result.make(0)
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
--| The Original Code is uml_class.e.
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
