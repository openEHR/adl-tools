note
	component:   "openEHR Archetype Project"
	description: "interface class to ADL parser and parse tree"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DADL_ENGINE

inherit
	SHARED_DT_SERIALISERS
		export
			{NONE} all
			{ANY} has_dt_serialiser_format
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create parser.make
		end

feature -- Access

	source: STRING
			-- Source of current artifact.

	source_start_line: INTEGER
			-- Defaults to 0; can be set to line number of dADL text inside some other document.

	tree: DT_COMPLEX_OBJECT_NODE
			-- Set if parse succeeded.

	serialised: STRING
			-- The last result of calling `serialise'.

	errors: attached ERROR_ACCUMULATOR
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
			Result := tree /= Void
		end

feature -- Commands

	reset
			-- Clear current state.
		do
			source := Void
			tree := Void
			serialised := Void
		end

	set_source (in_text: attached STRING; a_source_start_line: INTEGER)
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
			source_attached: attached source
			parsing: in_parse_mode
		do
			tree := Void
			serialised := Void
			parser.execute (source, source_start_line)

			if not parser.syntax_error then
				tree := parser.output
			end
		ensure
			parse_succeeded implies attached tree
		end

	serialise (a_format: attached STRING; full_type_marking_on, output_typed_encapsulated: BOOLEAN)
			-- Serialise current artifact into `a_format'.
			-- `full_type_marking_on' = True if type marking even for inferrable primitive types should be added to serialised output
			-- `output_typed_encapsulated' = True: output with typed object wrapper, rather than just the series of attributes innside the object

		require
			Format_valid: has_dt_serialiser_format (a_format)
			Archetype_valid: attached tree implies tree.is_valid
		local
			a_dt_serialiser: DT_SERIALISER
			a_dt_iterator: DT_VISITOR_ITERATOR
		do
			if attached tree then
				a_dt_serialiser := dt_serialiser_for_format (a_format)
				a_dt_serialiser.reset
				if full_type_marking_on then
					a_dt_serialiser.set_full_type_marking_on
				end
				if output_typed_encapsulated then
					a_dt_serialiser.set_output_typed_encapsulated
				end
				create a_dt_iterator.make (tree, a_dt_serialiser)
				a_dt_iterator.do_all
				serialised := a_dt_serialiser.last_result
			else
				create serialised.make_empty
			end
		ensure
			serialised_attached: attached serialised
		end

	set_tree (a_node: attached DT_COMPLEX_OBJECT_NODE)
			-- Set root node of `tree' from e.g. GUI tool.
		do
			tree := a_node
			in_parse_mode := False
		ensure
			tree_set: tree = a_node
			not_parsing: not in_parse_mode
		end

feature {NONE} -- Implementation

	parser: attached DADL_VALIDATOR
			-- dADL parser.

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
