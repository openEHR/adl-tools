note
	component:   "openEHR Archetype Project"
	description: "Abstract interface to any parser"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class PARSER_ENGINE

feature {NONE} -- Initialisation

	make
		deferred
		end

feature -- Access

	source: detachable STRING
			-- Source of current artifact.

	source_start_line: INTEGER
			-- Defaults to 0; can be set to line number of text inside some other document.

	tree: detachable ANY
			-- Parser output.

	serialised: STRING
			-- The last result of calling `serialise'.
		attribute
			create Result.make_empty
		end

	errors: ERROR_ACCUMULATOR
			-- Result of last parse.
		do
			Result := parser.errors
		end

feature -- Status Report

	in_parse_mode: BOOLEAN
			-- True if engine in mode where archetype was created from source

	parse_succeeded: BOOLEAN
			-- True if parse succeeded; call after parse()
		do
			Result := attached tree
		end

	has_source: BOOLEAN
		do
			Result := attached source
		end

feature -- Commands

	reset
			-- Clear current state.
		do
			source := Void
			tree := Void
			serialised.wipe_out
		end

	set_source (in_text: STRING; a_source_start_line: INTEGER)
			-- Set `in_text' as working artifact.
		require
			start_line_positive: a_source_start_line > 0
		do
			source := in_text
			source_start_line := a_source_start_line
			in_parse_mode := True
		ensure
			source_set: source = in_text
			source_start_line_set: source_start_line = a_source_start_line
			parsing: in_parse_mode
		end

	parse
			-- Parse artifact into `tree', then validate the artifact.
		require
			source_attached: has_source
			parsing: in_parse_mode
		do
			tree := Void
			serialised.wipe_out
			parser_execute
			if not parser.syntax_error then
				assign_parser_result
			end
		ensure
			parse_succeeded implies attached tree
		end

	set_tree (a_node: like tree)
			-- Set root node of `tree' from e.g. GUI tool.
		do
			tree := a_node
			in_parse_mode := False
		ensure
			tree_set: tree = a_node
			not_parsing: not in_parse_mode
		end

feature {NONE} -- Implementation

	assign_parser_result
			-- override in descendants to get around limitations in gobo parsers not being able
			-- to be componentised
		do
			tree := parser.output
		end

	parser_execute
			-- call the parser.execute with specific args
		deferred
		end

	parser: PARSER_VALIDATOR
			-- parser

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
--| The Original Code is dadl_engine.e.
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
