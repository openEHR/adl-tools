note
	component:   "openEHR Project"
	description: "[
				 General idea of a validator object that reports errors, warnings.
				 ]"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


deferred class ANY_VALIDATOR

inherit
	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

feature -- Initialisation

	reset
			-- initialise reporting variables
		do
			create errors.make
			passed := True
		ensure
			Passed: passed
		end

feature -- Access

	errors: attached ERROR_ACCUMULATOR
			-- error output of validator - things that must be corrected

feature -- Status Report

	has_error (a_code: STRING): BOOLEAN
		do
			Result := errors.has_error (a_code)
		end

feature -- Modification

	add_error (a_key: STRING; args: ARRAY [STRING])
			-- append an error with key `a_key' and `args' array to the `errors' string
		do
			add_error_with_location (a_key, args, "")
		end

	add_warning (a_key: STRING; args: ARRAY [STRING])
			-- append a warning with key `a_key' and `args' array to the `warnings' string
		do
			add_warning_with_location (a_key, args, "")
		end

	add_info (a_key: STRING; args: ARRAY [STRING])
			-- append an information message with key `a_key' and `args' array to the `information' string
		do
			add_info_with_location (a_key, args, "")
		end

	add_error_with_location (a_key: STRING; args: ARRAY [STRING]; a_location: STRING)
			-- append an error with key `a_key' and `args' array to the `errors' string
		do
			errors.extend (create {ERROR_DESCRIPTOR}.make_error (a_key, get_msg(a_key, args), a_location))
			passed := False
		end

	add_warning_with_location (a_key: STRING; args: ARRAY [STRING]; a_location: STRING)
			-- append a warning with key `a_key' and `args' array to the `warnings' string
		do
			errors.extend (create {ERROR_DESCRIPTOR}.make_warning (a_key, get_msg(a_key, args), a_location))
		end

	add_info_with_location(a_key: STRING; args: ARRAY [STRING]; a_location: STRING)
			-- append an information message with key `a_key' and `args' array to the `information' string
		do
			errors.extend (create {ERROR_DESCRIPTOR}.make_info (a_key, get_msg(a_key, args), a_location))
		end

	merge_errors (other_errors: attached ERROR_ACCUMULATOR)
		do
			errors.append (other_errors)
			passed := passed and not other_errors.has_errors
		end

feature -- Status Report

	passed: BOOLEAN
			-- True if validation succeeded

	ready_to_validate: BOOLEAN
		do
			Result := passed
		end

feature -- Validation

	validate
		require
			ready_to_validate
		deferred
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
--| The Original Code is any_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
