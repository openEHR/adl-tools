indexing
	component:   "openEHR Reusable Libraries"
	description: "Test case converting dadl to a simple object"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_CVT_C_QUANTITY

inherit
	TEST_CASE
		redefine 
			check_result
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end

creation
	make

feature -- Access

	title:STRING is "C_QUANTITY bidirectional conversion from dADL"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			a_dt_obj: DT_COMPLEX_OBJECT_NODE
		do
			dadl_engine.set_source (dadl_c_quantity, 1)
			dadl_engine.parse
			if not dadl_engine.parse_succeeded then
				io.put_string("Parse failed; reason = " + dadl_engine.parse_error_text + "%N")
			else
				dadl_engine.serialise ("adl")
				io.put_string("---------- original dADL -----------%N")
				io.put_string(dadl_c_quantity)
				io.put_string("---------- serialised to ADL -----------%N")
				io.put_string(dadl_engine.serialised)
				io.put_string("---------- paths -----------%N")
				io.put_string(print_list(dadl_engine.tree.all_paths))
				test_object ?= dadl_engine.tree.as_object(dynamic_type_from_string("C_QUANTITY"))
				if test_object /= Void then
					io.put_string("---------- object form successfully created -----------%N")
					io.put_string(test_object.out)
					
					io.put_string("---------- REGENERATE Data Tree from object -----------%N")
					create a_dt_obj.make_from_object(test_object)
					dadl_engine.set_tree(a_dt_obj)
					dadl_engine.serialise ("adl")
					
					io.put_string("---------- serialised to ADL -----------%N")
					io.put_string(dadl_engine.serialised)
					io.put_string("---------- paths -----------%N")
					io.put_string(print_list(dadl_engine.tree.all_paths))
				else
					io.put_string("---------- object form NOT created -----------%N")
				end
			end
		end

feature -- Access

	check_result is
	    do
	    end

feature -- Implementation

	dadl_c_quantity: STRING is "[
			C_QUANTITY <
				property = <[openehr::271]>
				list = <
					["1"] = <
						units = <"C">
						magnitude = <|>= 4.0|>
					>
					["2"] = <
						units = <"F">
						magnitude = <|>= 40.0|>
					>
				>
				assumed_value = <
					units = <"C">
					magnitude = <8.0>
				>
			>
		]"

	test_object: C_QUANTITY

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
--| The Original Code is tc_dadl_basic.e.
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
