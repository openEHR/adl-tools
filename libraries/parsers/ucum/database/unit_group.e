note
	component:   "openEHR ADL Tools"
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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class UNIT_GROUP

inherit
	STRING_UTILITIES
		export
			{NONE} all
		redefine
			out
		end

create
	make

feature -- Initialisation

	make(a_file_name:STRING)
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

	Id_section_name:STRING = "identification"
			-- the first section in the file is indicated by "[Identification]"
			-- (case insensitive match)

	Units_section_name:STRING = "units"
			-- the second section in the file is indicated by "[units]

	Id_group_name:STRING = "GROUP_NAME"
			-- tag name for units group name, under identification section of file

feature -- Access

	group_name:STRING
			-- name of this units group

	units: HASH_TABLE[UNIT_DESCRIPTOR, STRING]
			-- unit table, in the form of a series of UNIT_DESCRIPTORs, keyed by unit name

	units_by_symbol: HASH_TABLE[UNIT_DESCRIPTOR, STRING]
			-- unit table, in the form of a series of UNIT_DESCRIPTORs, keyed by unit symbol

	unit(a_name:STRING):UNIT_DESCRIPTOR
			-- unit descriptor for unit `a_name' or else Void
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			Result := units.item(a_name)
		end

	unit_for_symbol(a_symbol:STRING):UNIT_DESCRIPTOR
			-- unit descriptor for unit `a_symbol' or else Void
		require
			Symbol_exists: a_symbol /= Void and then not a_symbol.is_empty
		do
			Result := units_by_symbol.item(a_symbol)
		end

	has_unit(a_name:STRING):BOOLEAN
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			Result := units.has(a_name)
		end

	has_unit_for_symbol(a_symbol:STRING):BOOLEAN
		require
			Symbol_exists: a_symbol /= Void and then not a_symbol.is_empty
		do
			Result := units_by_symbol.has(a_symbol)
		end

	match_length_for_symbol(a_symbol:STRING):INTEGER
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

	out:STRING
		do
			create Result.make(0)
			Result.append (group_name + "%N")
			across units as units_csr loop
				Result.append (indented (units_csr.item.out, "%T") + "%N")
			end
		end

feature {NONE} -- Implementation

	units_file: ODIN_CONFIG_FILE_ACCESS

end

