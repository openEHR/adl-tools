note
	component:   "openEHR Archetype Project"
	description: "interface class to assertion parser and parse tree"
	keywords:    "ADL, assertion"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ASSERTION_ENGINE

inherit
	PARSER_ENGINE
		rename
			set_source as parser_set_source
		redefine
			tree, parser, assign_parser_result
		end

	SHARED_ASSERTION_SERIALISERS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, has_assertion_serialiser_format
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create parser.make
		end

feature -- Access

	tree: detachable ARRAYED_LIST [ASSERTION]
			-- set if parse succeeded

feature -- Status Report

	is_differential: BOOLEAN
			-- True if archetype is differential

feature -- Commands

	set_source (in_text: STRING; a_source_start_line: INTEGER; differential_flag: BOOLEAN; an_rm_schema: BMM_SCHEMA)
			-- Set `in_text' as working artifact.
		do
			parser_set_source (in_text, a_source_start_line)
			rm_schema := an_rm_schema
			is_differential := differential_flag
		ensure then
			is_differential_set: is_differential = differential_flag
		end

	serialise (a_format: STRING)
			-- serialise current artifact into format
		require
			Format_valid: has_assertion_serialiser_format (a_format)
		local
			serialiser_mgr: ASSERTION_SERIALISER_MGR
		do
			if attached tree as att_tree then
				create serialiser_mgr.make (att_tree, a_format)
				serialiser_mgr.serialise
				serialised := serialiser_mgr.last_result
			end
		end

feature {NONE} -- Implementation

	assign_parser_result
			-- override in descendants to get around limitations in gobo parsers not being able
			-- to be componentised
		do
			if attached {ARRAYED_LIST [ASSERTION]} parser.output as al then
				tree := al
			elseif attached {ARRAYED_LIST [detachable ASSERTION]} parser.output as det_al then
				create tree.make (0)
				across det_al as det_al_csr loop
					if attached det_al_csr.item as inv then
						tree.extend (inv)
					end
				end
			end
		end

	parser_execute
			-- call the parser.execute with specific args
		do
			if attached source as att_source and attached rm_schema as rms then
				parser.execute (att_source, source_start_line, is_differential, rms)
			end
		end

	parser: CADL_VALIDATOR

	rm_schema: detachable BMM_SCHEMA

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
--| The Original Code is cadl_engine.e.
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
