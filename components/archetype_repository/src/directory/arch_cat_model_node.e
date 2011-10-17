note
	component:   "openEHR Archetype Project"
	description: "Descriptor of a model node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCH_CAT_MODEL_NODE

inherit
	ARCH_CAT_ITEM
		redefine
			parent
		end

create
	make_class, make_rm_closure, make_category

feature -- Initialisation

	make_category (a_name: attached STRING)
			-- create with ontological name of artefact category, e.g. 'archetype', 'template' etc
		require
			a_name_valid: not a_name.is_empty
		do
			make
			qualified_name := a_name
			name := a_name
			group_name := "archetype_category"
			is_rm_closure := True
		ensure
			ontological_name_set: qualified_name.is_equal (a_name)
			display_name_set: name = qualified_name
		end

	make_rm_closure (an_rm_closure_name: attached STRING; a_bmm_schema: attached BMM_SCHEMA)
			-- create to represent a RM closure package, e.g. 'EHR', 'DEMOGRAPHIC' etc - these are
			-- packages whose reachability closure provide the classes for archetyping in that closure
		require
			Rm_closure_name_valid: not an_rm_closure_name.is_empty
		do
			make
			bmm_schema := a_bmm_schema
			qualified_name := publisher_qualified_rm_closure_name (bmm_schema.rm_publisher, an_rm_closure_name)
			qualified_key := qualified_name.as_upper
			name := an_rm_closure_name
			group_name := "model_group"
			is_rm_closure := True
		ensure
			ontological_name_set: qualified_name.is_equal (publisher_qualified_rm_closure_name (bmm_schema.rm_publisher, an_rm_closure_name))
			display_name_set: name = an_rm_closure_name
			Schema_set: bmm_schema = a_bmm_schema
		end

	make_class (a_model_name: attached STRING; a_class_desc: attached BMM_CLASS_DEFINITION)
			-- create with package name and class def
		require
			a_model_valid: not a_model_name.is_empty and not a_model_name.has (Package_name_delimiter)
		do
			make
			class_definition := a_class_desc
			bmm_schema := class_definition.bmm_schema
			qualified_name := bmm_schema.rm_publisher + section_separator.out + a_model_name + section_separator.out + class_definition.name
			qualified_key := qualified_name.as_upper
			name := class_definition.name
			group_name := class_definition.type_category
		ensure
			qualified_name_set: qualified_name.is_equal (bmm_schema.rm_publisher + section_separator.out + a_model_name + section_separator.out +  class_definition.name)
			display_name_set: name = class_definition.name
		end

feature -- Access

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.

	class_definition: BMM_CLASS_DEFINITION

	bmm_schema: BMM_SCHEMA

	qualified_name: STRING
			-- model_name '-' class_name

	qualified_key: STRING
			-- uppercase form of `qualified_name' for safe matching

	name: STRING
			-- class_name

feature -- Status Report

	is_abstract_class: BOOLEAN
		do
			Result := class_definition /= Void and then class_definition.is_abstract
		end

	is_rm_closure: BOOLEAN
			-- RM closure name, which is a package name from the RM whose class closure can be archetyped within
			-- that closure space. E.g. the class closure of the 'EHR' package in openEHR have archetypes with ids
			-- like 'openEHR-EHR-XXXX' where XXXX is a class name

	is_class: BOOLEAN
		do
			Result := class_definition /= Void
		end

	has_artefacts: BOOLEAN
			-- True if there are any archetypes at or below this point
		do
			from subtree_artefact_counts.start until subtree_artefact_counts.off or subtree_artefact_counts.item_for_iteration > 0 loop
				subtree_artefact_counts.forth
			end
			Result := not subtree_artefact_counts.off
		end

feature {ARCH_CAT_ITEM} -- Implementation

	parent: ARCH_CAT_MODEL_NODE
			-- parent node

invariant
	Class_definition_validity: not (is_rm_closure and is_class)

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
