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
	BMM_PACKAGE_CONTAINER
		rename
			make as make_package_container
		end

create
	make

feature -- Initialisation

	make (a_name: attached STRING)
		do
			name := a_name
			make_package_container
			create classes.make(0)
		end

feature -- Access

	bmm_schema: BMM_SCHEMA
			-- reverse reference to parent schema

	name: attached STRING
			-- name of the package FROM SCHEMA; this name may be qualified if it is a top-level
			-- package within the schema, or unqualified.

	classes: ARRAYED_SET [BMM_CLASS_DEFINITION]

	globally_qualified_path: attached STRING
			-- fully qualified package name prepended with schema name, of form: 'schema_name::package.package.CLASS'
			-- to enable identification in situation when a given package has been imported into more than
			-- one schema.
		do
			Result := bmm_schema.schema_id + schema_name_delimiter + path
		end

	path: attached STRING
			-- full path of this package from root
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

	parent: BMM_PACKAGE_DEFINITION
			-- parent package

feature {BMM_PACKAGE_CONTAINER} -- Modification

	add_class (a_class: BMM_CLASS_DEFINITION)
			-- add `a_class' to this package
		require
			New_class: not classes.has (a_class)
		do
			classes.extend (a_class)
			a_class.set_package (Current)
		ensure
			Class_added: classes.has (a_class)
			Parent_set: a_class.package = Current
		end

	set_parent (a_pkg: attached BMM_PACKAGE_DEFINITION)
		do
			parent := a_pkg
		ensure
			parent_set: parent = a_pkg
		end

	set_bmm_schema (a_bmm_schema: BMM_SCHEMA)
		do
			bmm_schema := a_bmm_schema
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
