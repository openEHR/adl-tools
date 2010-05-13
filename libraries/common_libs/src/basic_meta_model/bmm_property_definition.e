note
	component:   "openEHR re-usable library"
	description: "Abstract idea of a property definition within a class definition"
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class BMM_PROPERTY_DEFINITION

feature -- Access

	name: STRING
			-- name of this attribute

	type: BMM_TYPE_SPECIFIER
			-- type of this attribute

	existence: MULTIPLICITY_INTERVAL
			-- interval form of 0..1, 1..1 etc, generated from is_mandatory
		do
			if is_mandatory then
				create Result.make_point (1)
			else
				create Result.make_bounded (0, 1)
			end
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- this property is abstract, i.e. whether it is computed or stored is not yet defined

	is_mandatory: BOOLEAN
			-- True if this propert is mandatory in its class

	is_computed: BOOLEAN
			-- True if this property is computed rather than stored in objects of this class

	is_container: BOOLEAN
			-- True if type is a container type
		do
			if attached {BMM_CONTAINER_TYPE_REFERENCE} type as a_cont then
				Result := True
			end
		end

invariant
	Name_exists: name /= Void

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
