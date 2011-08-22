note
	component:   "openEHR re-usable library"
	description: "Abstraction of a package as a tree structure whose nodes can contain "
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_PACKAGE_DEFINITION

inherit
	BMM_DEFINITIONS
		export
			{NONE} all
		end

	DT_CONVERTIBLE

create
	make

feature -- Initialisation

	make_dt (make_args: ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			create name.make (0)
		end

	make (a_name: attached STRING)
		do
			name := a_name
			create packages.make (0)
		end

	make_from_other (other_pkg: attached BMM_PACKAGE_DEFINITION)
			-- make this package with `packages' and `classes' references to those parts of `other_pkg'
			-- but keeping its own name
		do
			packages := other_pkg.packages
			classes := other_pkg.classes
		end

feature -- Access (attributes from schema)

	name: attached STRING
			-- name of the package FROM SCHEMA; this name may be qualified if it is a top-level
			-- package within the schema, or unqualified.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	packages: HASH_TABLE [BMM_PACKAGE_DEFINITION, STRING]
			-- child packages
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	classes: ARRAYED_SET [STRING]
			-- list of classes in this package
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	archetype_namespace: STRING
			-- archetype namespace FROM SCHEMA; this is a semantic namespace used in archetype
			-- ids, like 'EHR', 'DEMOGRAPHIC' etc, to avoid long qualified names in archetype ids.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access (attributes derived in post-schema processing)

	parent: BMM_PACKAGE_DEFINITION
			-- parent package

	all_classes: ARRAYED_SET [STRING]
			-- all classes in this package, recursively

feature -- Access

	bmm_model: BMM_SCHEMA
			-- reverse reference, set after initialisation from input schema

	qualified_name: attached STRING
			-- generate full package path of this package
		local
			csr: BMM_PACKAGE_DEFINITION
		do
			create Result.make(0)
			from csr := Current until csr = Void loop
				Result.prepend (csr.name)
				csr := csr.parent
				if attached csr then
					Result.prepend_character (Package_name_delimiter)
				end
			end
		end

feature -- Status Report

	has_classes: BOOLEAN
		do
			Result := attached classes
		end

	has_packages: BOOLEAN
		do
			Result := attached packages
		end

feature -- Modification

	merge (other: attached like Current)
		do
			-- merge the classes at this level
			if has_classes then
				classes.merge (other.classes)
			else
				classes := other.classes
			end

			-- merge the packages
			if other.has_packages then
				if not has_packages then
					create packages.make (0)
				end
				from other.packages.start until other.packages.after loop
					if packages.has (other.packages.key_for_iteration) then
						packages.item (other.packages.key_for_iteration).merge (other.packages.item_for_iteration)
					else
						packages.put (other.packages.item_for_iteration, other.packages.key_for_iteration)
					end
					other.packages.forth
				end
			end
		end

	set_parent (a_pkg: attached BMM_PACKAGE_DEFINITION)
		do
			parent := a_pkg
		end

feature {BMM_SCHEMA, BMM_PACKAGE_DEFINITION} -- Modification

	finalise_build (a_bmmm: attached BMM_SCHEMA; errors: ERROR_ACCUMULATOR)
			-- synchronise structures after creation by DT deserialiser
			-- MUST BE CALLED AFTER MERGING because parent links point up through
			-- the expanded hierarchy attached to BMM_SCHEMA.canonical_packages, not
			-- BMM_SCHEMA.packages as originally read in
		do
			bmm_model := a_bmmm
			create all_classes.make (0)
			if has_classes then
				all_classes.merge (classes)
			end
			if has_packages then
				from packages.start until packages.off loop
					packages.item_for_iteration.set_parent (Current)
					packages.item_for_iteration.finalise_build (a_bmmm, errors)
					all_classes.merge (packages.item_for_iteration.all_classes)
					packages.forth
				end
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
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
--| The Original Code is bmm_package_definition.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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
