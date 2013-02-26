note
	component:   "openEHR Archetype Project"
	description: "Tests for ADL differential terminology class"
	keywords:    "archetype, ontology, terminology"
	author:      "Peter Gummer <petre.gummer@OceanInformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class
	TEST_DIFFERENTIAL_ARCHETYPE

inherit
	OPENEHR_TEST_SET

	ARCHETYPE_TERM_CODE_TOOLS
		undefine
			default_create
		end

feature {NONE} -- Targets

	target: detachable DIFFERENTIAL_ARCHETYPE

feature -- Test routines

	test_make_minimal
			-- A newly-created minimal archetype should be valid.
		note
			testing: "covers/{DIFFERENTIAL_ARCHETYPE}.make_minimal"
		local
			id: ARCHETYPE_ID
			term: ARCHETYPE_TERM
		do
			create id.make_from_string ("openEHR-EHR-CLUSTER.test.v1")
			create target.make_minimal (create {ARTEFACT_TYPE}, id, "en")
			assert_equal (default_concept_code, target.ontology.concept_code)

			term := target.ontology.term_definition ("en", default_concept_code)
			assert ("text", term.keys.has ("text"))
			assert ("description", term.keys.has ("description"))
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
--| The Original Code is test_differential_archetype.e.
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
