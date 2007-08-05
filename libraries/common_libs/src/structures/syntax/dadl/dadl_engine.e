indexing
	component:   "openEHR Archetype Project"
	description: "interface class to ADL parser and parse tree"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
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

creation
	make

feature -- Initialisation

	make is
		do
			create parser.make
		end

	reset is
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
			-- defaults to 0; can be set to line number of dADL text inside some other document

	tree: DT_COMPLEX_OBJECT_NODE
			-- set if parse succeeded

	serialised: STRING

	parse_error_text: STRING is
			-- result of last parse
		do
			Result := parser.error_text
		end

feature -- Status Report

	in_parse_mode: BOOLEAN
			-- True if engine in mode where archetype was created from source

	parse_succeeded: BOOLEAN is
			-- True if parse succeeded; call after parse()
		do
			Result := tree /= Void
		end

feature -- Commands

	set_source(in_text: STRING; a_source_start_line: INTEGER) is
			-- set `in_text' as working artifact with id `a_node_id'
		require
			Text_valid: in_text /= Void and then not in_text.is_empty
		do
			source := in_text
			source_start_line := a_source_start_line
			in_parse_mode := True
		ensure
			in_parse_mode
		end

	parse is
			-- parse artifact. If successful, `parsed' contains the parse
			-- structure. Then validate the artifact
		require
			Source_exists: source /= Void
			in_parse_mode
		do
			tree := Void
			serialised := Void
			parser.execute(source, source_start_line)
			if not parser.syntax_error then
				tree := parser.output
			end
		ensure
			parse_succeeded or else tree = Void
		end

	serialise(a_format: STRING) is
			-- serialise current artifact into format
		require
			Format_valid: has_dt_serialiser_format(a_format)
			Archetype_valid: tree /= Void implies tree.is_valid
		local
			a_dt_serialiser: DT_SERIALISER
		do
			if tree /= Void then
				a_dt_serialiser := dt_serialiser_for_format(a_format)
				a_dt_serialiser.initialise
				create tree_iterator.make(tree, a_dt_serialiser)
				tree_iterator.do_all
				a_dt_serialiser.finalise
				serialised := a_dt_serialiser.last_result
			else
				create serialised.make(0)
			end
		end

	set_tree(a_node: DT_COMPLEX_OBJECT_NODE) is
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

	parser: DADL2_VALIDATOR
			-- dADL parser

	tree_iterator: DT_SERIALISER_MGR

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
