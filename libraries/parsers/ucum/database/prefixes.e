note
	component:   "openEHR ADL Tools"
	description: "[
				 Metric prefixes table, designed on the basis of the Unified Code for Units of
		             Measure (UCUM), developed by Gunther Schadow and Clement J. McDonald of The
				 Regenstrief Institute For Health Care, Indianapolis.
				 Published at http://aurora.rg.iupui.edu/UCUM.
				 Contents of table taken from a file of form: 
					 [prefixes]	
					 ;NAME:CASE_SENSITIVE:CASE_INSENSITIVE:VALUE
					 ;
	             ]"
	keywords:    "metric, units, UCUM"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class PREFIXES

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
			File_name_exists: not a_file_name.is_empty
		local
			entries:HASH_TABLE[STRING,STRING]
			pd:PREFIX_DESCRIPTOR
		do
			create prefixes_file.make(a_file_name)
			create prefixes.make(0)
			create prefixes_by_symbol.make(0)

			entries := prefixes_file.resource_category_values (Prefixes_section_name)
			from entries.start until entries.off loop
				create pd.make_from_string(entries.item_for_iteration, ':')
				if pd.is_valid then
					prefixes.put(pd, pd.name)
					prefixes_by_symbol.put(pd, pd.case_sensitive)
				else
					io.put_string(generator + ": error reading in prefix descriptors; " + pd.invalid_reason + "%N")
				end
				entries.forth
			end
		end

feature -- Definitions

	Prefixes_section_name:STRING = "prefixes"
			-- the main section in the file is indicated by "[prefixes]

feature -- Access

	prefixes: HASH_TABLE[PREFIX_DESCRIPTOR, STRING]
			-- prefix table, in the form of a series of PREFIX_DESCRIPTORs, keyed by prefix name

	prefixes_by_symbol: HASH_TABLE[PREFIX_DESCRIPTOR, STRING]
			-- prefix table, in the form of a series of PREFIX_DESCRIPTORs, keyed by prefix symbol

	prefix_with_name(a_name:STRING):PREFIX_DESCRIPTOR
		require
			Name_exists: has_prefix(a_name)
		do
			Result := prefixes.item(a_name)
		end

	has_prefix(a_name:STRING):BOOLEAN
		require
			Name_exists: not a_name.is_empty
		do
			Result := prefixes.has(a_name)
		end

	has_prefix_symbol(a_symbol:STRING):BOOLEAN
		require
			Symbol_exists: not a_symbol.is_empty
		do
			Result := prefixes_by_symbol.has(a_symbol)
		end

feature -- Output

	out:STRING
		do
			create Result.make(0)
			from prefixes.start until prefixes.off loop
				Result.append(indented(prefixes.item_for_iteration.out, "%T") + "%N")
				prefixes.forth
			end
		end

feature {NONE} -- Implementation

	prefixes_file: ODIN_CONFIG_FILE_ACCESS

end

