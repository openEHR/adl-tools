note
	component:   "openEHR Archetype Project"
	description: "Descriptor of a class node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCH_CAT_CLASS_NODE

inherit
	ARCH_CAT_MODEL_NODE

create
	make

feature -- Initialisation

	make (an_rm_closure_name: STRING; a_class_desc: BMM_CLASS_DEFINITION)
			-- create with RM closure package name and class def
		require
			Rm_closure_valid: not an_rm_closure_name.is_empty and not an_rm_closure_name.has (Package_name_delimiter)
		do
			class_definition := a_class_desc
			bmm_schema := class_definition.bmm_schema
			qualified_name := bmm_schema.rm_publisher + section_separator.out + an_rm_closure_name + section_separator.out + class_definition.name
			name := class_definition.name
			group_name := class_definition.type_category
		ensure
			qualified_name_set: qualified_name.is_equal (bmm_schema.rm_publisher + section_separator.out + an_rm_closure_name + section_separator.out +  class_definition.name)
			display_name_set: name = class_definition.name
		end

feature -- Access

	class_definition: detachable BMM_CLASS_DEFINITION

	bmm_schema: detachable BMM_SCHEMA

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := class_definition.global_artefact_identifier
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
