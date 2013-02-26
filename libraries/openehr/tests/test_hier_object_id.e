note
	component:   "openEHR Archetype Project"
	description: "Tests for HIER_OBJECT_ID"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"
	testing:     "type/manual"

class
	TEST_HIER_OBJECT_ID

inherit
	OPENEHR_TEST_SET

	INTERNAL
		undefine
			default_create
		end

feature -- Test routines

	test_make_from_string
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{HIER_OBJECT_ID}.make_from_string"
		local
			hid: HIER_OBJECT_ID
		do
			-- Guid based id
			create hid.make_from_string ("228F3EC6-43BF-4723-9715-46814985BD2D")
			assert_equal (True, field_conforms_to (dynamic_type (hid.root), dynamic_type ((create {UUID}.default_create))))

			-- Oid based id
			create hid.make_from_string ("1.2.3.4")
			assert_equal (True, field_conforms_to (dynamic_type (hid.root), dynamic_type ((create {ISO_OID}.default_create))))
		end

	test_root_extension
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{HIER_OBJECT_ID}.root"
		local
			hid: HIER_OBJECT_ID
		do
			-- Guid based id
			create hid.make_from_string ("228F3EC6-43BF-4723-9715-46814985BD2D")
			assert_equal ("228F3EC6-43BF-4723-9715-46814985BD2D", hid.root.value)
			assert_equal ("", hid.extension)
			assert_equal ("228F3EC6-43BF-4723-9715-46814985BD2D", hid.as_string)

			-- Guid based id + Guid extension
			create hid.make_from_string ("228F3EC6-43BF-4723-9715-46814985BD2D::3CA963D7-0B99-4994-98B6-AD55903931FB")
			assert_equal ("228F3EC6-43BF-4723-9715-46814985BD2D", hid.root.value)
			assert_equal ("3CA963D7-0B99-4994-98B6-AD55903931FB", hid.extension)
			assert_equal ("228F3EC6-43BF-4723-9715-46814985BD2D::3CA963D7-0B99-4994-98B6-AD55903931FB", hid.as_string)

			-- Oid based id
			create hid.make_from_string ("1.2.3.4")
			assert_equal ("1.2.3.4", hid.root.value)
			assert_equal ("", hid.extension)
			assert_equal ("1.2.3.4", hid.as_string)

			-- Oid based id + extension
			create hid.make_from_string ("1.2.3.4::aa")
			assert_equal ("1.2.3.4", hid.root.value)
			assert_equal ("aa", hid.extension)
			assert_equal ("1.2.3.4::aa", hid.as_string)
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
--| The Original Code is test_archetype_term_code_tools.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2009
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
