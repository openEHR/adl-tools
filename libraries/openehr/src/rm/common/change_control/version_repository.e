indexing
	component:   "openEHR Common Reference Model"

	description: "[
			 An abstraction for a versioned repository of any content, such as a source
			 file, an openEHR Composition, Party or other copmplex object. 
			 ]"
	keywords:    "version control"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class VERSIONED_OBJECT [G]

inherit
	VERSION_NAMES

feature -- Access

	uid: OBJECT_ID	
			-- Unique identifier of this version repository.

	owner_id: OBJECT_REF
			-- id of owning object

	time_created: DV_DATE_TIME
			-- Date/time at which this versioned repository was created 

	all_version_ids: LIST [STRING] is
		do
		end

	all_versions: LIST [VERSION[G]] is
		do
		end

	version_count: INTEGER is
		do
		end

	first_version: VERSION[G] is
			-- extract first version
		do
		end
		
	latest_version: VERSION[G] is
			-- extract most recent version
		do
		end

	latest_version_id: STRING is
			-- id of most recent version; if no transactions, "none"
		do
		end

	version_with_id(a_ver_id:STRING): VERSION[G] is
			-- extract version known by 'a_ver_id'
		require
			Ver_id_valid: a_ver_id /= Void and then has_version_id(a_ver_id)
		do
		end

	version_at_time(a_dt: DV_DATE_TIME): VERSION [G] is
			-- extract version for time 'a_dt'?
		require
			Ver_time_valid: a_dt /= Void and then has_version_at_time(a_dt)
		do
		end

feature -- Status Report

	has_version_id(a_ver_id:STRING):BOOLEAN is
			-- does this VERSIONED<T> include a version known as 'a_ver_id'? 
		require
			Ver_id_exists: a_ver_id /= Void and then not a_ver_id.is_empty
		do
		end

	has_version_at_time(a_dt: DV_DATE_TIME):BOOLEAN is
			-- does this VERSIONED<T> include a version for time 'a_dt'? 
		require
			Ver_time_valid: a_dt /= Void
		do
		end

feature -- Modify

	commit(a_parent_version_id: STRING; an_audit: AUDIT_DETAILS; a_data: G)
		is
			-- commit new version. No locking (i.e. checking out) is needed to commit. 
			-- 'parent_version_id' is the id of latest version in this VERSIONED<T>, at the time of
			-- taking the copy for modification. If the commit is to create the first version, the 
			-- 'parent_version_id' must be "none".
		require
			Parent_version_id_valid: all_version_ids.has(a_parent_version_id) or else a_parent_version_id.is_equal(First_version_parent_pseudo_id)
			Audit_exists: an_audit /= Void
			Version_exists: a_data /= Void
		do
		end

invariant
	uid_exists: uid /= Void
	Time_created_exists: time_created /= Void
	Versions_exist: version_count > 0
	Owner_id_exists: owner_id /= Void

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
--| The Original Code is versioned.e.
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
