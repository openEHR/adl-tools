indexing
	component:   "openEHR Archetype Project"
	description: "[
				ADL archetype path segment, consisting of an attribute name and an object id, which is 
				either empty, as in the case of single attributes, or some identifier, needed to discriminate
				among objects in a container referenced by the attribute.
				 ]"
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
	make, make_with_object_id, make_feature_call, make_from_other

feature -- Initialisation

	make(an_attr_name: STRING) is
			-- make a path segment with an attribute and an object id - 
			-- corresponds to single cardinality attribute or it could be
			-- a path segment for a multiple cardinality attribute but defaulting
			-- to the first object in the collection
		require
			an_attr_name_valid: an_attr_name /= Void and then not an_attr_name.is_empty
		do
			attr_name := an_attr_name
			create object_id.make(0)
		ensure
			Attr_name_set: attr_name.is_equal(an_attr_name)
			Object_id_empty: object_id.is_empty
		end

	make_with_object_id(an_attr_name, an_object_id: STRING) is
			-- make a path segment with an attribute name and an object id - 
			-- corresponds to multiple caridnality attribute case
		require
			an_attr_name_valid: an_attr_name /= Void and then not an_attr_name.is_empty
			an_object_id_valid: an_object_id /= Void
		do
			attr_name := an_attr_name
			if an_object_id.has_substring(Anonymous_node_id) then
				create object_id.make(0)
			else
				object_id := an_object_id
			end
		ensure
			Attr_name_set: attr_name.is_equal(an_attr_name)
			Object_id_set: object_id.is_equal(an_object_id) or else object_id.is_empty
		end

	make_feature_call(a_feat_name: STRING) is
		require
			a_feat_name_valid: a_feat_name /= Void and then not a_feat_name.is_empty
		do
			attr_name := a_feat_name
			is_feature_call := True
			create object_id.make(0)
		ensure
			Attr_name_set: attr_name.is_equal(a_feat_name)
			Is_feature_call: is_feature_call
		end
		
	make_from_other(other: OG_PATH_ITEM) is
			-- FIXME: created because clone does not work in dotnet
		do
			is_feature_call := other.is_feature_call
			attr_name := other.attr_name.twin
			object_id := other.object_id.twin
		end

feature -- Definitions

	Anonymous_node_id: STRING is "unknown"

feature -- Access
	
	attr_name: STRING
			-- name of attribute of this path segment
	
	object_id: STRING
			-- id of object of this path segment, for attributes with cardinality > 1
		
feature -- Status Report

	is_feature_call: BOOLEAN
	
	is_addressable: BOOLEAN is
			-- True if the object in this segment is identified
		do
			Result := not object_id.is_empty
		end

	is_equal(other: OG_PATH_ITEM): BOOLEAN is
			-- True if `other' and this path item are identical
		do
			if other /= Void then
				Result := attr_name.is_equal(other.attr_name) and object_id.is_equal(other.object_id) and
						is_feature_call = other.is_feature_call
			end
		end

feature -- Modification

	set_object_id(an_object_id: STRING) is
			-- make a path segment with an attribute name and an object id - 
			-- corresponds to multiple caridnality attribute case
		require
			an_object_id_valid: an_object_id /= Void
		do
			if an_object_id.has_substring(Anonymous_node_id) then
				create object_id.make(0)
			else
				object_id := an_object_id
			end
		ensure
			Object_id_set: object_id.is_equal(an_object_id) or else object_id.is_empty
		end

invariant
	Validity: not (is_addressable and is_feature_call)
	Attr_name_valid: attr_name /= Void and then not attr_name.is_empty
	Object_id_valid: object_id /= Void
	
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
