indexing
	component:   "openEHR re-usable library"
	description: "[
				 Definition of a class in an object model. A class is type that may be open 
				 or closed in terms of other types mentioned within.
				 "
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_CLASS_DEFINITION

feature -- Access

	generic_parameters: ARRAYED_SET [BMM_GENERIC_PARAMETER_DEFINITION]
			-- list of generic parameter definitions

	ancestors: ARRAYED_LIST [BMM_TYPE_SPECIFIER]
			-- list of inheritance parents

	attributes: HASH_TABLE [BMM_ATTRIBUTE_DEFINITION, STRING]
			-- list of attributes

	flat_attributes: HASH_TABLE [BMM_ATTRIBUTE_DEFINITION, STRING] is
			-- list of all attributes due to current and ancestor classes
		do
			if flat_attributes_cache = Void then
				create flat_attributes_cache.make(0)
				flat_attributes_cache.merge (attributes)
				from
					ancestors.start
				until
					ancestors.off
				loop
					flat_attributes_cache.merge (ancestors.item.flat_attributes_cache)
					ancestors.forth
				end
			end
			Result := flat_attributes_cache
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- True if this is an abstract type

	is_generic: BOOLEAN
			-- True if this class is a generic class

	has_attribute (an_attr_name: STRING): BOOLEAN is
			-- True if an_attr_name valid in this type, due to this type definition, or any ancestor
		require
			Attr_name_valid: an_attr_name /= Void and then not an_attr_name.is_empty
		do
			Result := flat_attributes.has (an_attr_name)
		end

feature {BMM_TYPE} -- Implementation

	flat_attributes_cache: HASH_TABLE [BMM_ATTRIBUTE_DEFINITION, STRING]
			-- reference list of all attributes due to inheritance flattening of this type

invariant
	Generic_validity :is_generic implies generic_parameters /= Void and then not generic_parameters.is_empty

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
