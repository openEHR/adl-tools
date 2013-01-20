note
	component:   "openEHR re-usable library"
	description: "Abstraction of a model component that contains packages"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class P_BMM_PACKAGE_CONTAINER

inherit
	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Access

	packages: HASH_TABLE [P_BMM_PACKAGE_DEFINITION, STRING]
			-- child packages
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
		end

feature -- Status Report

	there_exists_recursive_packages (test: FUNCTION [ANY, TUPLE [P_BMM_PACKAGE_DEFINITION], BOOLEAN]): BOOLEAN
			-- recursively execute `test' function, taking package as argument
		do
			from packages.start until packages.off or Result loop
				Result := test.item ([packages.item_for_iteration])
				if not Result then
					Result := packages.item_for_iteration.there_exists_recursive_packages (test)
					packages.forth
				end
			end
		end

	has_package_path (a_path: STRING): BOOLEAN
			-- True if there is a package at the path `a_path' under this package
		local
			pkg_names: LIST [STRING]
			pkg_csr: detachable P_BMM_PACKAGE_CONTAINER
		do
			pkg_names := a_path.as_upper.split (Package_name_delimiter)
			pkg_csr := Current
			from pkg_names.start until pkg_names.off or not pkg_csr.packages.has (pkg_names.item) loop
				pkg_csr := pkg_csr.packages.item (pkg_names.item)
				pkg_names.forth
			end
			Result := pkg_names.off
		end

feature -- Modification

	do_recursive_packages (action: PROCEDURE [ANY, TUPLE [P_BMM_PACKAGE_DEFINITION]])
			-- recursively execute `action' procedure, taking package as argument
		do
			across packages as pkgs_csr loop
				action.call ([pkgs_csr.item])
				pkgs_csr.item.do_recursive_packages (action)
			end
		end

	add_package (a_pkg: P_BMM_PACKAGE_DEFINITION)
		do
			packages.put (a_pkg, a_pkg.name.as_upper)
		end

	correct_packages_keys
			-- convert all keys, to upper case to ensure case-insensitive matching
		local
			keys: ARRAY [STRING]
			i: INTEGER
		do
			keys := packages.current_keys
			from i := 1 until i > keys.count loop
				packages.replace_key (keys.item(i).as_upper, keys.item(i))
				i := i + 1
			end
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
--| The Original Code is bmm_package_container.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
