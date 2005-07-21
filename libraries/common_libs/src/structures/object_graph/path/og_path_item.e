indexing
	component:   "openEHR Archetype Project"
	description: "ADL archetype path item"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OG_PATH_ITEM

inherit
	ANY
		redefine
			is_equal
		end

create
	make_object, make_object_unknown, make_attribute, make_feature_call, make_from_other

feature -- Initialisation

	make_object_unknown is
		do
			create value.make(0)
			value.append(Not_addressable_value)
			is_object := True
		end

	make_object(s: STRING) is
		require
			s_valid: s /= Void and then not s.is_empty
		do
			value := s
			is_object := True
		end

	make_attribute(s: STRING) is
		require
			s_valid: s /= Void
		do
			value := s
			is_attribute := True
		end

	make_feature_call(s: STRING) is
		require
			s_valid: s /= Void and then not s.is_empty
		do
			value := s
			is_feature_call := True
		end
		
	make_from_other(other: OG_PATH_ITEM) is
			-- FIXME: created because clone does not work in dotnet
		do
			is_feature_call := other.is_feature_call
			is_object := other.is_object
			is_attribute := other.is_attribute
			create value.make(0)
			value.append(other.value)
		end

feature -- Definitions

	Not_addressable_value: STRING is "unknown"

feature -- Access

	is_object: BOOLEAN
	
	is_attribute: BOOLEAN
	
	is_feature_call: BOOLEAN

	value: STRING

	is_addressable: BOOLEAN is
			-- True if this node has a unique id
			-- FIXME: possible problem with using ids like 'unknown_xx' - 
			-- do unknown nodes need to be addressable by an archetype tool?
		do
			Result := not value.has_substring(Not_addressable_value)
		end
		
feature -- Status Report

	is_equal(other: OG_PATH_ITEM): BOOLEAN is
			-- True if `other' and this path item are identical
		do
			if other /= Void then 
				if is_object then
					Result := is_addressable = other.is_addressable and value.is_equal(other.value)
				elseif is_attribute then
					Result := value.is_equal(other.value)
				else -- feature_call
					Result := value.is_equal(other.value)
				end
			end
		end
		
feature -- Modification

	set_value(s: STRING) is
		require
			s_valid: s /= Void and then not s.is_empty
		do
			value := s
		end

invariant
	Value_valid: value /= Void -- and then not value.is_empty
	Type_valid: is_object xor is_attribute xor is_feature_call

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
--| The Original Code is adl_path_item.e.
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
