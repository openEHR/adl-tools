note
	component:   "openEHR Common Information Model"
	description: "Validator for AUTHORED_RESOURCE objects"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

deferred class AUTHORED_RESOURCE_VALIDATOR

inherit
	ANY_VALIDATOR

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

feature {NONE} -- Initialisation

	initialise (a_target: like target)
			-- set target and initialise reporting variables
		do
			target := a_target
			reset
		ensure
			target_set: target = a_target
			Passed: passed
		end

feature -- Access

	target: AUTHORED_RESOURCE
			-- target of this validator

	validate
			-- True if all structures obey their invariants
		do
			if target.original_language = Void then
				add_error (ec_VDEOL, Void)
			end

			-- check that AUTHORED_RESOURCE.translations items match their Hash keys
			if attached target.translations as tgt_trans then
				from
					tgt_trans.start
				until
					tgt_trans.off or not tgt_trans.key_for_iteration.is_equal (tgt_trans.item_for_iteration.language.code_string)
				loop
					tgt_trans.forth
				end
				if not tgt_trans.off then
					add_error (ec_VTRLA, <<tgt_trans.key_for_iteration, tgt_trans.item_for_iteration.language.code_string>>)
				end
			end

			-- check that RESOURCE_DESCRIPTION.details items match their Hash keys
			if attached target.description as tgt_desc then
				from
					tgt_desc.details.start
				until
					tgt_desc.details.off or not tgt_desc.details.key_for_iteration.is_equal (tgt_desc.details.item_for_iteration.language.code_string)
				loop
					tgt_desc.details.forth
				end
				if not tgt_desc.details.off then
					add_error (ec_VRDLA, <<tgt_desc.details.key_for_iteration, tgt_desc.details.item_for_iteration.language.code_string>>)
				end
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
--| The Original Code is authored_resource_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
