note
	component:   "openEHR Archetype Project"
	description: "Persistent version of CONSTRAINT_REF."
	keywords:    "persistence, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics<support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 20011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_CONSTRAINT_REF

inherit
	P_C_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_cr: attached CONSTRAINT_REF)
		do
			precursor (a_cr)
			target := a_cr.target
			if attached a_cr.external_reference then
				external_reference := a_cr.external_reference
			end
		end

feature -- Access

	target: attached STRING

	external_reference: DV_PARSABLE

feature -- Factory

	create_constraint_ref: attached CONSTRAINT_REF
		do
			create Result.make (target)
			populate_c_instance (Result)
			if attached external_reference then
				Result.set_external_reference (external_reference)
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
--| The Original Code is cadl_object_term.e.
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
