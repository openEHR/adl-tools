note
	component:   "openEHR Archetype Project"
	description: "Outermost editor context for editing a whole archetype."
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCH_ED_CONTEXT

create
	make

feature -- Initialisation

	make (an_arch: FLAT_ARCHETYPE; an_rm_schema: attached BMM_SCHEMA)
		do
			target := an_arch
			rm_schema := an_rm_schema
		end

feature -- Access

	target: FLAT_ARCHETYPE
			-- archetype being edited, created as a copy of an original

	definition_context: C_COMPLEX_OBJECT_ED_CONTEXT
			-- definition editing context

feature -- Status Report

	in_reference_model_mode_changed: BOOLEAN

	in_reference_model_mode: BOOLEAN

feature {NONE} -- Implementation

	rm_schema: BMM_SCHEMA

	populate_definition
			-- populate `definition_context'
		local
			a_c_iterator: C_VISITOR_ITERATOR
			c_ed_context_builder: C_OBJECT_ED_CONTEXT_BUILDER
		do
			-- repopulate from definition; visiting nodes doesn't change them, only updates their visual presentation
			create c_ed_context_builder
			c_ed_context_builder.initialise (target, in_reference_model_mode, rm_schema)
			create a_c_iterator.make (target.definition, c_ed_context_builder)
			a_c_iterator.do_all

			definition_context := c_ed_context_builder.root_node
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
--| The Original Code is arch_ed_context.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
