note
	component:   "openEHR Archetype Project"
	description: "Enumeration of archetype-based artefact types"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARTEFACT_TYPE

create
	default_create, make, make_from_type_name

feature -- Defnition

	archetype: INTEGER is 0
			-- Constant to indicate that the artefact is designed as an archetype.

	template: INTEGER is 1
			-- Constant to indicate that the artefact is designed as a template.

	template_component: INTEGER is 2
			-- Constant to indicate that the artefact is designed as a template_component.

	operational_template: INTEGER is 3
			-- Constant to indicate that the artefact is an operational template.

feature -- Initialisation

	make (i: INTEGER)
		require
			valid_type(i)
		do
			value := i
		end

	make_from_type_name (s: STRING)
		require
			s /= Void and then valid_type_name (s)
		do
			value := types.item (s)
		end

feature -- Access

	types: HASH_TABLE [INTEGER, STRING]
		once
			create Result.make(0)
			Result.extend(archetype, "archetype")
			Result.extend(template, "template")
			Result.extend(template_component, "template_component")
			Result.extend(operational_template, "operational_template")
		end

	type_name_to_type (a_name: STRING): INTEGER
		require
			a_name /= Void and then valid_type_name(a_name)
		do
			Result := types.item (a_name)
		end

feature -- Validation

	valid_type (n: INTEGER): BOOLEAN
			-- Function to test value validity.
		require
			n >= 0
		do
			Result := types.has_item (n)
		end

	valid_type_name (s: STRING): BOOLEAN
			-- Function to test validity of string name of value
		require
			s /= Void and then not s.is_empty
		do
			Result := types.has_key(s)
		end

feature {NONE} -- Implementation

	value: INTEGER

invariant
	Valid_value: valid_type(value)

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
--| The Original Code is adl_archetype.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
