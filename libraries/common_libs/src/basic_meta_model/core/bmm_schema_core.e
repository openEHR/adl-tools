note
	component:   "openEHR re-usable library"
	description: "Core properties of BMM_SCHEMA"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class BMM_SCHEMA_CORE

inherit
	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Definitions

	Default_schema_option_class_name: STRING = "Any"
	Default_schema_lifecycle_state: STRING = "Initial"
	Default_schema_name: STRING = "Unknown"
	Default_schema_release: STRING = "Unknown"
	Default_schema_revision: STRING = "Unknown"
	Default_schema_author: STRING = "Unknown"
	Default_schema_description: STRING = "(none)"

feature -- Initialisation

	make (a_rm_publisher, a_schema_name, a_rm_release: STRING)
		require
			valid_rm_publisher: not a_rm_publisher.is_empty
			valid_schema_name: not a_schema_name.is_empty
			valid_rm_release: not a_rm_release.is_empty
		do
			rm_publisher := a_rm_publisher
			schema_name := a_schema_name
			rm_release := a_rm_release
		end

feature -- Identification

	rm_publisher: STRING
			-- publisher of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_revision)
		end

	schema_name: STRING
			-- name of model expressed in schema; a 'schema' usually contains all of the packages of one 'model' of a publisher.
			-- A publisher with more than one model can have multiple schemas.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (default_schema_name)
		end

	rm_release: STRING
			-- release of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_release)
		end

	schema_id: STRING
			-- derived name of schema, based on model publisher, model name, model release
		do
			Result := create_schema_id (rm_publisher, schema_name, rm_release)
		end

	schema_revision: STRING
			-- revision of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_revision)
		end

	schema_lifecycle_state: STRING
			-- lifecycle state of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_lifecycle_state)
		end

	schema_author: STRING
			-- primary author of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_author)
		end

	schema_contributors: ARRAYED_LIST [STRING]
			-- contributing authors of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
        attribute
            create Result.make (0)
        end

	schema_description: STRING
			-- description of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_description)
		end

feature -- Access

	archetype_parent_class: detachable STRING
			-- name of a parent class used within the schema to provide archetype capability,
			-- enabling filtering of classes in RM visualisation. If empty, 'Any' is assumed
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	archetype_data_value_parent_class: detachable STRING
			-- name of a parent class of logical 'data types' used within the schema to provide archetype capability,
			-- enabling filtering of classes in RM visualisation. If empty, 'Any' is assumed
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	archetype_rm_closure_packages: ARRAYED_SET [STRING]
			-- list of top-level package paths that provide the RM 'model' part in achetype identifiers,
			-- e.g. the path "org.openehr.ehr" gives "EHR" in "openEHR-EHR". Within this namespace,
			-- archetypes can be based on any class reachable from classes defined directly in these packages
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	archetype_visualise_descendants_of: detachable STRING
			-- If archetype_parent_class is not set, designate a class whose descendants should be
			-- made visible in tree and grid renderings of the archetype definition. For openEHR
			-- and CEN this class is normally the same as the archetype_parent_class, i.e. LOCATABLE
			-- and RECORD_COMPONENT respectively. It is typically set for CEN, because archetype_
			-- parent_class may not be stated, due to demographic types not inheriting from it.
			--
			-- The effect of this attribute in visualisation is to generate the most natural tree or
			-- grid-based view of an archetype definition, from the semantic viewpoint.

feature -- Status Report

	has_archetype_parent_class: BOOLEAN
			-- True if this schema has an archetype_parent_class
		do
			Result := attached archetype_parent_class
		end

	has_archetype_data_value_parent_class: BOOLEAN
			-- True if this schema has an archetype_parent_class
		do
			Result := attached archetype_data_value_parent_class
		end

	has_rm_closure_package (a_package_path: attached STRING): BOOLEAN
			-- `a_package_path' is a qualified package name, like 'org.openehr.ehr', 'org.openehr.demographic'
		require
			valid_package_path: not a_package_path.is_empty
		do
			Result := archetype_rm_closure_packages.has (a_package_path)
		end

	has_schema_contributor (a_contributor: attached STRING): BOOLEAN
		require
			valid_contributor: not a_contributor.is_empty
		do
			Result := schema_contributors.has (a_contributor)
		end

feature -- Modification

	set_schema_revision (a_revision: STRING)
		require
			valid_revision: not a_revision.is_empty
		do
			schema_revision := a_revision
		end

	set_schema_lifecycle_state (a_lifecycle_state: STRING)
		require
			valid_lifecycle_state: not a_lifecycle_state.is_empty
		do
			schema_lifecycle_state := a_lifecycle_state
		end

	set_schema_author (an_author: STRING)
		require
			valid_author: not an_author.is_empty
		do
			schema_author := an_author
		end

	add_schema_contributor (a_contributor: STRING)
		require
			valid_contributor: not a_contributor.is_empty and not has_schema_contributor (a_contributor)
		do
			schema_contributors.extend (a_contributor)
		end

	set_schema_contributors (a_contributors: ARRAYED_LIST [STRING])
		require
			valid_contributor: not a_contributors.is_empty
		do
			schema_contributors := a_contributors
		end

	set_archetype_rm_closure_packages (a_package_list: like archetype_rm_closure_packages)
		do
			archetype_rm_closure_packages := a_package_list
		end

	set_schema_description (a_description: STRING)
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
