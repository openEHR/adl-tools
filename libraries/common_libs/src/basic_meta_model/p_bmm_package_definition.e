note
	component:   "openEHR re-usable library"
	description: "Abstraction of a package as a tree structure whose nodes can contain "
	keywords:    "basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class P_BMM_PACKAGE_DEFINITION

inherit
	P_BMM_PACKAGE_CONTAINER

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

create
	make, make_from_other

feature -- Initialisation

	make (a_name: STRING)
			-- make in a safe way for DT building purposes
		do
			name := a_name
		end

	make_dt (make_args: ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			make (unknown_package_name)
		end

	make_from_other (other_pkg: P_BMM_PACKAGE_DEFINITION)
			-- make this package with `packages' and `classes' references to those parts of `other_pkg'
			-- but keeping its own name.
		do
			classes := other_pkg.classes
			packages := other_pkg.packages
		end

feature -- Access (attributes from schema)

	name: STRING
			-- name of the package FROM SCHEMA; this name may be qualified if it is a top-level
			-- package within the schema, or unqualified.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (unknown_package_name)
		end

	classes: ARRAYED_SET [STRING]
			-- list of classes in this package
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
			Result.compare_objects
		end

feature -- Access

	bmm_package_definition: detachable BMM_PACKAGE_DEFINITION
		note
			option: transient
		attribute
		end

feature -- Modification

	do_recursive_classes (action: PROCEDURE [ANY, TUPLE [P_BMM_PACKAGE_DEFINITION, STRING]])
			-- recursively execute `action' procedure, taking package and class name as arguments
		do
			across classes as classes_csr loop
				action.call ([Current, classes_csr.item])
			end
			across packages as pkgs_csr loop
				pkgs_csr.item.do_recursive_classes (action)
			end
		end

	merge (other: attached like Current)
		do
			-- merge the classes at this level
			classes.merge (other.classes)

			-- merge the packages
			across other.packages as pkgs_csr loop
				if packages.has (pkgs_csr.key) then
					packages.item (pkgs_csr.key).merge (pkgs_csr.item)
				else
					add_package (pkgs_csr.item.deep_twin)
				end
			end
		end

feature -- Factory

	create_bmm_package_definition
			-- generate a BMM_PACKAGE_DEFINITION object
		local
			new_bmm_package_definition: BMM_PACKAGE_DEFINITION
		do
			create new_bmm_package_definition.make (name)
			bmm_package_definition := new_bmm_package_definition
			across packages as pkgs_csr loop
				pkgs_csr.item.create_bmm_package_definition
				if attached pkgs_csr.item.bmm_package_definition as pkg_bmm_pkg_def then
					new_bmm_package_definition.add_package (pkg_bmm_pkg_def)
				end
			end
		end

feature {DT_OBJECT_CONVERTER} -- Finalisation

	finalise_dt
			-- finalisation routine to guarantee validity on creation from DT form
			-- rewrite `classes' list so that it has object comparison set
		local
			classes_copy: ARRAYED_SET [STRING]
		do
			if not classes.object_comparison then
				create classes_copy.make (0)
				classes_copy.compare_objects
				across classes as classes_csr loop
					classes_copy.extend (classes_csr.item)
				end
				classes := classes_copy
			end

			correct_packages_keys
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST [STRING]
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
