note
	component:   "openEHR Common Information Model"
	description: "Validator for AUTHOR_RESOURCE objects"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class AUTHORED_RESOURCE_VALIDATOR

inherit
	ANY_VALIDATOR

feature {NONE} -- Initialisation

	make (a_target: like target)
			-- set target and initialise reporting variables
		require
			target_valid: a_target /= Void
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
				add_error("VDEOL", Void)
			end

			-- check that AUTHORED_RESOURCE.translations items match their Hash keys
			if target.has_translations then
				from
					target.translations.start
				until
					target.translations.off or not target.translations.key_for_iteration.is_equal (target.translations.item_for_iteration.language.code_string)
				loop
					target.translations.forth
				end
				if not target.translations.off then
					add_error("VTRLA", <<target.translations.key_for_iteration, target.translations.item_for_iteration.language.code_string>>)
				end
			end

			-- check that RESOURCE_DESCRIPTION.details items match their Hash keys
			from
				target.description.details.start
			until
				target.description.details.off or not target.description.details.key_for_iteration.is_equal (target.description.details.item_for_iteration.language.code_string)
			loop
				target.description.details.forth
			end
			if not target.description.details.off then
				add_error("VRDLA", <<target.description.details.key_for_iteration, target.description.details.item_for_iteration.language.code_string>>)
			end
		end

invariant
	target_attached: target /= Void

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
