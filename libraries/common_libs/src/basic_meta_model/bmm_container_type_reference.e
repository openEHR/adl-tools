note
	component:   "openEHR re-usable library"
	description: "Subtype of BMM_GENERIC_TYPE_SPECIFIER that specifies containers with one generic parameter."
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_CONTAINER_TYPE_REFERENCE

inherit
	BMM_TYPE_REFERENCE

feature -- Initialisation

feature -- Access

	cardinality: INTERVAL [INTEGER]
			-- needs to be this basic type because this attribute is scanned in from schema, else would
			-- have used MULTIPLICITY_INTERVAL

	container_type: BMM_CLASS_DEFINITION
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE_SPECIFIER

	type: BMM_CLASS_DEFINITION
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE_SPECIFIER

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we throw away the container_type because we are tring to match
			-- the type of an object as being a valid member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			create Result.make(0)
			Result.compare_objects
			Result.append (type.flattened_type_list)
		end

feature -- Status Report

feature -- Conversion

	as_generic_type_specifier: BMM_GENERIC_TYPE_REFERENCE
		do
			-- create Result.make(container_type, <<type>>)
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		do
			create Result.make (0)
			Result.append (container_type.name + Generic_left_delim.out + type.name + Generic_right_delim.out)
		end

	as_flattened_type_string: STRING
			-- name of the type
		do
			create Result.make (0)
			Result.append (type.as_type_string)
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
--| The Original Code is bmm_model.e.
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
