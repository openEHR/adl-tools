note
	component:   "openEHR Archetype Project"
	description: "Descriptor object for an AOM_PROFILE object."
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class AOM_PROFILE_DESCRIPTOR

inherit
	ANY_VALIDATOR

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		end

	ADL_COMPILED_MESSAGE_IDS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_path: STRING)
		do
			profile_path := a_path
		end

feature -- Identification

	profile_path: STRING

feature -- Access

	profile: detachable AOM_PROFILE

feature {AOM_PROFILES_ACCESS} -- Commands

	load
			-- load profile into in-memory form
		local
			prf_file: PLAIN_TEXT_FILE
		do
			reset
			profile := Void
			create prf_file.make (profile_path)
			if not prf_file.exists or else not prf_file.is_readable then
				add_error (ec_aom_profile_file_not_valid, <<profile_path>>)
			else
				prf_file.open_read
				prf_file.read_stream (prf_file.count)
				parser.execute (prf_file.last_string, 1)
				if not parser.syntax_error and then attached parser.output as dt_tree then
					if not attached {AOM_PROFILE} dt_tree.as_object_from_string (({AOM_PROFILE}).name, Void) as aom_prf then
						add_error (ec_aom_profile_load_failure_exception, <<profile_path>>)
					elseif dt_object_converter.errors.has_errors then
						add_error (ec_aom_profile_conv_fail_err, <<profile_path, dt_object_converter.errors.as_string>>)
					else
						aom_prf.set_file_path (profile_path)
						profile := aom_prf
						passed := True
					end
				else
					add_error (ec_aom_profile_load_failure, <<profile_path, parser.errors.as_string>>)
				end
				prf_file.close
			end
		ensure
			attached profile or else has_errors
		end

feature -- Validation

	validate
		do
			if attached profile as prf then
				if prf.ready_to_validate then
					prf.validate
				end
				merge_errors (prf.errors)
			end
		end

feature {NONE} -- Implementation

	parser: ODIN_VALIDATOR
		once
			create Result.make
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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
