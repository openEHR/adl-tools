note
	component:   "openEHR Archetype Project"
	description: "interface class to ADL parser and parse tree"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CADL_ENGINE

inherit
	SHARED_C_SERIALISERS
		export
			{NONE} all
			{ANY} has_c_serialiser_format
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
		end

feature -- Access

	source: STRING
			-- Source of current artifact.

	source_start_line: INTEGER
			-- Defaults to 0; can be set to line number of cADL text inside some other document.

	tree: C_COMPLEX_OBJECT
			-- Set if parse succeeded.

	serialised: STRING
			-- The last result of calling `serialise'.

	parse_error_text: attached STRING
			-- Result of last parse.
		do
			if parser /= Void then
				Result := parser.error_text
			else
				create Result.make_empty
			end
		end

feature -- Status Report

	in_parse_mode: BOOLEAN
			-- True if engine in mode where tree was created from source

	parse_succeeded: BOOLEAN
			-- True if parse succeeded; call after parse()
		do
			Result := tree /= Void
		end

	is_differential: BOOLEAN
			-- True if archetype is differential

	is_template: BOOLEAN
			-- True if a template is being parsed

feature -- Commands

	reset
			-- Clear current state.
		do
			source := Void
			tree := Void
			serialised := Void
		end

	set_source (in_text: STRING; a_source_start_line: INTEGER; differential_flag, template_flag: BOOLEAN)
			-- Set `in_text' as working artifact.
		require
			text_attached: in_text /= Void
			start_line_positive: a_source_start_line > 0
		do
			source := in_text
			source_start_line := a_source_start_line
			in_parse_mode := True
			is_differential := differential_flag
			is_template := template_flag
		ensure
			source_set: source = in_text
			source_start_line_set: source_start_line = a_source_start_line
			parsing: in_parse_mode
			is_differential_set: is_differential = differential_flag
			Is_template_set: is_template = template_flag
		end

	parse
			-- Parse artifact into `tree', then validate the artifact.
		require
			source_attached: source /= Void
			parsing: in_parse_mode
		do
			tree := Void
			serialised := Void
			create parser.make
			parser.execute (source, source_start_line, is_differential, is_template)

			if not parser.syntax_error then
				tree := parser.output
			end
		ensure
			parse_succeeded or else tree = Void
		end

	serialise (a_format: STRING; an_ontology: attached ARCHETYPE_ONTOLOGY)
			-- Serialise current artifact into `a_format'.
		require
			Format_valid: has_c_serialiser_format (a_format)
		local
			a_c_serialiser: C_SERIALISER
			a_c_iterator: C_VISITOR_ITERATOR
		do
			a_c_serialiser := c_serialiser_for_format (a_format)
			a_c_serialiser.initialise (an_ontology)
			create a_c_iterator.make (tree, a_c_serialiser)
			a_c_iterator.do_all
			a_c_serialiser.finalise
			serialised := a_c_serialiser.last_result
		ensure
			serialised_attached: serialised /= Void
		end

	set_tree (a_node: C_COMPLEX_OBJECT)
			-- Set root node of `tree' from e.g. GUI tool.
		require
			node_attached: a_node /= Void
		do
			tree := a_node
			in_parse_mode := False
		ensure
			tree_set: tree = a_node
			not_parsing: not in_parse_mode
		end

feature {NONE} -- Implementation

	parser: CADL_VALIDATOR

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
