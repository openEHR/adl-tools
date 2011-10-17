note
	component:   "openEHR re-usable library"
	description: "Core properties of BMM_SCHEMA"
	keywords:    "Basic meta-model"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_SCHEMA_CORE

inherit
	BMM_DEFINITIONS
		export
			{NONE} all
		end

feature -- Initialisation

	make (a_rm_publisher, a_schema_name, a_rm_release: attached STRING)
		require
			valid_rm_publisher: not a_rm_publisher.is_empty
			valid_schema_name: not a_schema_name.is_empty
			valid_rm_release: not a_rm_release.is_empty
		do
			rm_publisher := a_rm_publisher
			schema_name := a_schema_name
			rm_release := a_rm_release
			create archetype_rm_closure_packages.make (0)
			archetype_rm_closure_packages.compare_objects
		end

feature -- Identification

	rm_publisher: STRING
			-- publisher of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	schema_name: STRING
			-- name of model expressed in schema; a 'schema' usually contains all of the packages of one 'model' of a publisher.
			-- A publisher with more than one model can have multiple schemas.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	rm_release: STRING
			-- release of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	schema_id: STRING
			-- derived name of schema, based on model publisher, model name, model release
		do
			Result := create_schema_id (rm_publisher, schema_name, rm_release)
		end

	schema_description: STRING
			-- description of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access

	archetype_parent_class: STRING
			-- name of a parent class used within the schema to provide archetype capability,
			-- enabling filtering of classes in RM visualisation. If empty, 'Any' is assumed
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	archetype_data_value_parent_class: STRING
			-- name of a parent class of logical 'data types' used within the schema to provide archetype capability,
			-- enabling filtering of classes in RM visualisation. If empty, 'Any' is assumed
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	archetype_rm_closure_packages: attached ARRAYED_SET [STRING]
			-- list of top-level package paths that provide the RM 'model' part in achetype identifiers,
			-- e.g. the path "org.openehr.ehr" gives "EHR" in "openEHR-EHR". Within this namespace,
			-- archetypes can be based on any class reachable from classes defined directly in these packages
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Status Report

	has_rm_closure_package (a_package_path: attached STRING): BOOLEAN
			-- `a_package_path' is a qualified package name, like 'org.openehr.ehr', 'org.openehr.demographic'
		require
			valid_package_path: not a_package_path.is_empty
		do
			Result := archetype_rm_closure_packages.has (a_package_path)
		end

feature -- Modification

	set_archetype_rm_closure_packages (a_package_list: like archetype_rm_closure_packages)
		do
			archetype_rm_closure_packages := a_package_list
		end

	set_schema_description (a_description: attached STRING)
		require
			valid_description: not a_description.is_empty
		do
			schema_description := a_description
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
