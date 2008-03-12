indexing
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

create
	make

feature {NONE} -- Initialisation

	make (a_target_desc: like target_descriptor) is
			-- set target_descriptor
			-- initialise reporting variables
		require
			target_desc_attached: a_target_desc /= Void
			target_desc_valid: a_target_desc.archetype_differential /= Void
		do
			target_descriptor := a_target_desc
			target := target_descriptor.archetype_differential
			create errors.make (0)
			create warnings.make (0)
			passed := False
		ensure
			target_descriptor_set: target_descriptor = a_target_desc
			target_set: target = a_target_desc.archetype_differential
			Not_passed: not passed
		end

feature -- Access

	target_descriptor: ARCH_REP_ARCHETYPE
			-- descriptor object for a resource to be validated

	target: AUTHORED_RESOURCE
			-- target of this validator

	validate is
			-- True if all structures obey their invariants
		do
			passed := True
			if target.original_language = Void then
				errors.append("No original language%N")
				passed := False
			end
			validate_description
			validate_translations
		end

feature -- Status Report

	strict: BOOLEAN
			-- True if strict validation is to be applied. When strict is on, the following things cause errors:
			-- - paths at the wrong specialisation level

feature -- Status Setting

	set_strict is
			-- set `strict' to True
		do
			strict := True
		end

	unset_strict is
			-- set `strict' to False
		do
			strict := False
		end

feature {NONE} -- Implementation

	validate_description is
			-- TODO
		do
		end

	validate_translations is
			-- TODO
		do
		end

invariant
	target_descriptor_attached: target_descriptor /= Void
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
