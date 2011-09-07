note
	component:   "openEHR Archetype Project"
	description: "interface class to assertion parser and parse tree"
	keywords:    "ADL, assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ASSERTION_ENGINE

inherit
	SHARED_ASSERTION_SERIALISERS
		export
			{NONE} all
			{ANY} has_assertion_serialiser_format
		end

create
	make

feature -- Initialisation

	make
		do
		end

	reset
			-- clear current state
		do
			source := Void
			tree := Void
			serialised := Void
		end

feature -- Access

	source: STRING
			-- source of current artifact

	source_start_line: INTEGER
			-- defaults to 0; can be set to line number of input text inside some other document

	tree: detachable ARRAYED_LIST [ASSERTION]
			-- set if parse succeeded

	serialised: STRING

	errors: attached ERROR_ACCUMULATOR
			-- Result of last parse.
		do
			Result := parser.errors
		end

feature -- Status Report

	in_parse_mode: BOOLEAN
			-- True if engine in mode where tree was created from source

	parse_succeeded: BOOLEAN
			-- True if parse succeeded; call after parse()
		do
			Result := attached tree
		end

	is_differential: BOOLEAN
			-- True if archetype is differential

feature -- Commands

	set_source(in_text: attached STRING; a_source_start_line: INTEGER; differential_flag: BOOLEAN; an_rm_schema: attached BMM_SCHEMA)
			-- set `in_text' as working artifact
		require
			Text_valid: not in_text.is_empty
			Start_line_valid: a_source_start_line > 0
		do
			rm_schema := an_rm_schema
			source := in_text
			source_start_line := a_source_start_line
			in_parse_mode := True
			is_differential := differential_flag
		ensure
			in_parse_mode: in_parse_mode
			is_differential_set: is_differential = differential_flag
		end

	parse
			-- parse artifact. If successful, `tree' contains the parse
			-- structure. Then validate the artifact
		require
			Source_exists: attached source
			in_parse_mode
		do
			tree := Void
			serialised := Void
			create parser.make
			parser.execute(source, source_start_line, is_differential, rm_schema)
			if not parser.syntax_error then
				tree := parser.assertion_list
			end
		ensure
			parse_succeeded or else attached tree
		end

	serialise(a_format: STRING)
			-- serialise current artifact into format
		require
			Format_valid: has_assertion_serialiser_format(a_format)
		do
			create serialiser_mgr.make(tree, a_format)
			serialiser_mgr.serialise
			serialised := serialiser_mgr.last_result
		end

	set_tree(a_node: like tree)
			-- set root node from e.g. GUI tool
		require
			a_node /= Void
		do
			tree := a_node
			in_parse_mode := False
		ensure
			not in_parse_mode
		end

feature {NONE} -- Implementation

	parser: CADL_VALIDATOR

	serialiser_mgr: ASSERTION_SERIALISER_MGR

	rm_schema: BMM_SCHEMA

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
