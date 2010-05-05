note
	component:   "openEHR Archetype Project"
	description: "Descriptor of a model node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/components/archetype_repository/src/directory/arch_rep_folder.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-03-12 00:23:45 +0000 (Wed, 12 Mar 2008) $"


class ARCH_REP_MODEL_NODE

inherit
	ARCH_REP_ITEM

create
	make_class, make_package

feature -- Initialisation

	make_class (a_package: STRING; a_class_desc: BMM_CLASS_DEFINITION)
			-- create with ontological name
		require
			a_package_valid: a_package /= Void and then not a_package.is_empty
			a_name_valid: a_class_desc /= Void
		do
			ontological_name := a_package + {ARCHETYPE_ID}.section_separator.out +  a_class_desc.name
			display_name := a_class_desc.name
			if a_class_desc.is_abstract then
				group_name := "class_abstract"
				is_abstract := True
			else
				group_name := "class_concrete"
			end
		ensure
			ontological_name_set: ontological_name.is_equal (a_package + {ARCHETYPE_ID}.section_separator.out +  a_class_desc.name)
			display_name_set: display_name = a_class_desc.name
		end

	make_package (a_name: STRING)
			-- create with ontological name
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
		do
			ontological_name := a_name
			display_name := a_name
			group_name := "file_folder_2"
			is_package := True
		ensure
			ontological_name_set: ontological_name.is_equal (a_name)
			display_name_set: display_name = ontological_name
		end

feature -- Access

	child_model_node_count: INTEGER
			-- number of child model nodes

	child_archetype_count: INTEGER
			-- number of archetypes attached to this node

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.

feature -- Status Report

	is_abstract: BOOLEAN

	is_package: BOOLEAN

feature -- Modification

	set_child_model_node_count (n: INTEGER)
			-- update child_model_node_count
		require
			n > 0
		do
			child_model_node_count := n
		ensure
			child_model_node_count = n
		end

	set_child_archetype_count (n: INTEGER)
			-- update child_archetype_count
		require
			n > 0
		do
			child_archetype_count := n
		ensure
			child_archetype_count = n
		end

	increment_child_archetype_count
			-- update child_model_node_count
		do
			child_archetype_count := child_archetype_count + 1
		ensure
			child_archetype_count = old child_archetype_count + 1
		end

invariant
	not is_package and is_abstract

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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
