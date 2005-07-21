indexing
	component:   "openEHR Data Types"

	description: "Test DV_QUANTITY"
	keywords:    "test, quantity"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/test/rm/data_types/quantity/SCCS/s.tc_dv_quantity.e $"
	revision:    "$Revision$"
	last_change: "$Date: 04/07/15 12:09:44+10:00 $"

class TC_DV_QUANTITY

inherit
	TEST_CASE

	XML_TOOLS
		export
			{NONE} all
		end

creation
	make

feature -- Access

	title: STRING is "DV_QUANTITY"

feature -- Initialisation

	make(arg:ANY) is
		do
			
		end

	execute is
		local
			a_datum: DV_QUANTITY
		do
			-- make a quantity
			create a_datum.make(85.0, "kg")
			io_output.put_string("INITIAL creation: " + a_datum.as_string + "%N")
			
			a_datum.set_accuracy(1.5, False)
			io_output.put_string("Set accuracy: " + a_datum.as_string + "%N")
			
			io_output.put_string(xml_tag_indent(a_datum.as_canonical_string))
			
			create a_datum.make_from_canonical_string("				%
			%		<magnitude>201</magnitude>						%
			%		<units>ppm</units>								%
			%		<accuracy>5</accuracy>							%
			%		<accuracy_is_percent>True</accuracy_is_percent>	%
			%")
			io_output.put_string(xml_tag_indent(a_datum.as_canonical_string))

		end

feature -- Access

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
--| The Original Code is tc_dv_quantity.e.
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
