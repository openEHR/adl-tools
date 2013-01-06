note
	component:   "openEHR Archetype Project"
	description: "interface class to ADL parser and parse tree"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class DADL_ENGINE

inherit
	PARSER_ENGINE
		redefine
			tree, parser
		end

	SHARED_DT_SERIALISERS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, has_dt_serialiser_format
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create parser.make
		end

feature -- Access

	tree: detachable DT_COMPLEX_OBJECT_NODE
			-- Set if parse succeeded.

feature -- Commands

	serialise (a_format: STRING; full_type_marking_on, output_typed_encapsulated: BOOLEAN)
			-- Serialise current artifact into `a_format'.
			-- `full_type_marking_on' = True if type marking even for inferrable primitive types should be added to serialised output
			-- `output_typed_encapsulated' = True: output with typed object wrapper, rather than just the series of attributes innside the object

		require
			Format_valid: has_dt_serialiser_format (a_format)
		local
			a_dt_iterator: DT_VISITOR_ITERATOR
		do
			if attached tree as att_tree and attached dt_serialiser_for_format (a_format) as a_dt_serialiser then
				a_dt_serialiser.reset
				if full_type_marking_on then
					a_dt_serialiser.set_full_type_marking_on
				end
				if output_typed_encapsulated then
					a_dt_serialiser.set_output_typed_encapsulated
				end
				create a_dt_iterator.make (att_tree, a_dt_serialiser)
				a_dt_iterator.do_all
				serialised := a_dt_serialiser.last_result
			else
				create serialised.make_empty
			end
		ensure
			serialised_attached: attached serialised
		end

feature {NONE} -- Implementation

	parser_execute
			-- call the parser.execute with specific args
		do
			if attached source as att_source then
				parser.execute (att_source, source_start_line)
			end
		end

	parser: DADL_VALIDATOR
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
