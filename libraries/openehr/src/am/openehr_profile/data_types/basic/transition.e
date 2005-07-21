indexing
	component:   "openEHR Data Types Archetype Model"
	
	description: "Definition of a state machine transition"
	keywords:    "archetype, transition, data"
	
	design:      "openEHR Data Types Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/data_types/basic/SCCS/s.transition.e $"
	revision:    "$Revision$"
	last_change: "$Date: 04/07/15 12:09:33+10:00 $"

class TRANSITION

feature -- Access

	event: STRING	
			-- Event which fires this transition

	guard: STRING	
			-- Guard condition which must be true for this transition to fire
	action: STRING	
			-- Side-effect action to execute during the firing of this transition

	next_state: STATE	
			-- Target state of transition

feature -- Output

	as_display_string:STRING is
		do
			create Result.make(0)
		end

	as_canonical_string:STRING is
		do
			create Result.make(0)
		end

invariant
	event_valid: event /= Void and then not event.empty
	action_valid: action /= Void implies not action.empty
	guard_valid: guard /= Void implies not guard.empty	

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
--| The Original Code is transition.e.
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
