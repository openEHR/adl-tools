note
	component:   "openEHR Archetype Project"
	description: "[
				 Obsolete class retained so that the old-style 'profiles configuration' can be read from 
				 existing ADL tool .cfg files. This class encodes the outer-most object in the following
				 old .cfg structure:

				 profile = <
					 current_repository_profile = <"CKM">
					 profiles = <
						 ["CKM"] = <
						 	reference_repository = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
							work_repository = <"">
						 >
						 ["abc"] = <
						 	reference_repository = <"C:\\some\\other\\ref\\dir">
							work_repository = <"C:\\some\\other\\work\\dir">
						 >
					 >
				 >
				 ]"
	keywords:    "test, dADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class REPOSITORY_PROFILE_CONFIG

inherit
	DT_CONVERTIBLE
		redefine
			default_create
		end

create
	make_dt, default_create

feature -- Definitions

	root_attribute_name: STRING = "profile"
			-- name of the attribute within a parent object at which this object can be found

feature -- Initialisation

	default_create
			-- Basic make routine to guarantee validity on creation.
		do
			create profiles.make (0)
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- Basic make routine to guarantee validity on creation.
		do
			default_create
		end

feature -- Access

	current_profile_name: detachable STRING
			-- name of profile that is currently in use

	profiles: HASH_TABLE [REPOSITORY_PROFILE, STRING]
			-- Hash table of profiles, keyed by their names.

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
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
--| The Original Code is shared_ui_resources.e.
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
