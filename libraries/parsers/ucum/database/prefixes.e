note
	component:   "openEHR Reusable Libraries"
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
	license:     "See notice at bottom of class"

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
--| The Original Code is prefixes.e.
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
