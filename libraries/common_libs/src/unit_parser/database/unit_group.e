indexing
	component:   "openEHR Reusable Libraries"
	description: "[
			 Unit group, designed on the basis of the Unified Code for Units of Measure (UCUM),
	             developed by Gunther Schadow and Clement J. McDonald of The Regenstrief Institute
			 For Health Care, Indianapolis. Published at http://aurora.rg.iupui.edu/UCUM.
			 Contents of table taken from a file of form: 					
				 [identification]	
				 UNIT_GROUP = Systeme International	
				 [units]
				 ;NAME:PROPERTY:CASE_SENSITIVE:CASE_INSENSITIVE:METRIC:VALUE:DEFINITION 
				 ; 
	             ]"
	keywords:    "units, UCUM"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class UNIT_GROUP

inherit
	STRING_UTILITIES
		export
			{NONE} all
		redefine
			out
		end

creation
	make

feature -- Initialisation

	make(a_file_name:STRING) is
		require
			File_name_exists: a_file_name /= Void and then not a_file_name.is_empty
		local
			unit_entries:HASH_TABLE[STRING,STRING]
			ud:UNIT_DESCRIPTOR
		do
			create units_file.make(a_file_name)
			create units.make(0)
			create units_by_symbol.make(0)
			group_name := units_file.resource_value(Id_section_name, Id_group_name)
			unit_entries := units_file.resource_category_values(Units_section_name)
			from unit_entries.start until unit_entries.off loop
				create ud.make_from_string(group_name, unit_entries.item_for_iteration, ':')
				if ud.is_valid then
					units.put(ud, ud.name)
					units_by_symbol.put(ud, ud.cs_symbol)
				else
					-- report error
					io.put_string(generator + " " + group_name + ": error in " + ud.invalid_reason + "%N")
				end
				unit_entries.forth
			end
		end

feature -- Definitions

	Id_section_name:STRING is "identification"
			-- the first section in the file is indicated by "[Identification]" 
			-- (case insensitive match)

	Units_section_name:STRING is "units"
			-- the second section in the file is indicated by "[units]

	Id_group_name:STRING is "GROUP_NAME"
			-- tag name for units group name, under identification section of file

feature -- Access

	group_name:STRING
			-- name of this units group

	units: HASH_TABLE[UNIT_DESCRIPTOR, STRING]
			-- unit table, in the form of a series of UNIT_DESCRIPTORs, keyed by unit name

	units_by_symbol: HASH_TABLE[UNIT_DESCRIPTOR, STRING]
			-- unit table, in the form of a series of UNIT_DESCRIPTORs, keyed by unit symbol

	unit(a_name:STRING):UNIT_DESCRIPTOR is
			-- unit descriptor for unit `a_name' or else Void
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			Result := units.item(a_name)
		end

	unit_for_symbol(a_symbol:STRING):UNIT_DESCRIPTOR is
			-- unit descriptor for unit `a_symbol' or else Void
		require
			Symbol_exists: a_symbol /= Void and then not a_symbol.is_empty
		do
			Result := units_by_symbol.item(a_symbol)
		end

	has_unit(a_name:STRING):BOOLEAN is
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			Result := units.has(a_name)
		end

	has_unit_for_symbol(a_symbol:STRING):BOOLEAN is
		require
			Symbol_exists: a_symbol /= Void and then not a_symbol.is_empty
		do
			Result := units_by_symbol.has(a_symbol)
		end

	match_length_for_symbol(a_symbol:STRING):INTEGER is
		require
			Symbol_exists: a_symbol /= Void and then not a_symbol.is_empty
		do
			if units_by_symbol.has(a_symbol) then
				Result := units_by_symbol.item(a_symbol).cs_symbol.count
			end
		ensure
			Result >= 0
		end

feature -- Output

	out:STRING is
		do
			create Result.make(0)
			Result.append(group_name + "%N")
			from units.start until units.off loop
				Result.append(indented(units.item_for_iteration.out, "%T") + "%N")
				units.forth
			end
		end

feature {NONE} -- Implementation

	units_file:CONFIG_FILE_ACCESS

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
--| The Original Code is unit_group.e.
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
