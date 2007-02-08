indexing
	component:   "openEHR Archetype Project"
	description: "Test case for adding a term constraint to an archetype definition"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003,2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ARCHETYPE_ADD_C_QUANTITY
	
inherit
	TEST_CASE
		export
			{NONE} all
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

	title: STRING is "Test Archetype Add C_DV_QUANTITY node"

	prereqs: ARRAY[STRING] is 
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE", "TC_ONTOLOGY_OPOULATE">>
		end

feature -- testing

	execute is
		local
			archetype: ARCHETYPE
			cf: CONSTRAINT_MODEL_FACTORY
			an_attr_node: C_ATTRIBUTE
			a_c_qty: C_DV_QUANTITY
		do
			archetype := adl_interface.archetype
			cf := adl_interface.constraint_model_factory

			an_attr_node := archetype.definition.c_attribute_at_path ("/items[at0003]/items")

			a_c_qty := cf.create_c_dv_quantity (an_attr_node)
			a_c_qty.set_property (create {CODE_PHRASE}.make_from_string("openehr::271"))
			a_c_qty.add_unit_constraint ("F", cf.create_real_interval_make_bounded (0.0, 40.0, True, True), Void)
			a_c_qty.add_unit_constraint ("C", cf.create_real_interval_make_bounded (0.0, 24.0, True, True), Void)
			
			if archetype.is_valid then
				adl_interface.adl_engine.serialise (serialise_format)	
				io.put_string(adl_interface.adl_engine.serialised_archetype)	
			else
				io.put_string(archetype.errors)	
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
--| The Original Code is tc_archetype_add_object_term.e.
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
