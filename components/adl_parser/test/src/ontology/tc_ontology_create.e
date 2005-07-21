indexing
	component:   "openEHR Archetype Project"
	description: "Test case for ADL ontology population"
	keywords:    "test, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ONTOLOGY_POPULATE
	
inherit
	TEST_CASE
		redefine
			prereqs
		end

	SHARED_TEST_ENV
		export
			{NONE} all
		end
		
create
	make

feature -- Initialisation

	make(arg:ANY) is
	    do
	    end

feature -- Access

	title: STRING is "Populate ontology with terms"

	prereqs: ARRAY[STRING] is 
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE">>
		end

feature -- testing

	execute is
		local
			code_1: STRING
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
		do
			archetype := adl_interface.adl_engine.archetype
			
			io_message.put_string ("------------------ create term -------------------%N")
			code_1 := ontology.new_non_specialised_term_code
			create a_term.make(code_1)
			a_term.add_item("text", "post-natal examination headings")
			a_term.add_item("description", "headings for post-natal examination note")
			ontology.add_term_definition("en", a_term)	-- FIXME - should add_term_def always be for prim lang?

			-- set id on root node
			archetype.set_definition_node_id(code_1)
			
			io_message.put_string ("------------------ create term -------------------%N")
			create a_term.make(ontology.new_non_specialised_term_code)
			a_term.add_item("text", "post-natal examination")
			a_term.add_item("description", "post-natal examination of mother and newborn children")
			ontology.add_term_definition("en", a_term)
			
			io_message.put_string ("------------------ create constraint code -------------------%N")
			create a_term.make(ontology.new_constraint_code)
			a_term.add_item("text", "xxxxx")
			a_term.add_item("description", "xxxxxx")
			ontology.add_constraint_definition("en", a_term)
			
			if archetype.is_valid then
				adl_interface.adl_engine.serialise (serialise_format)
				io_message.put_string (adl_interface.adl_engine.serialised_archetype)
			else
				io_message.put_string (archetype.errors)
			end
		end
	
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
--| The Original Code is tc_ontology_terms.e.
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
