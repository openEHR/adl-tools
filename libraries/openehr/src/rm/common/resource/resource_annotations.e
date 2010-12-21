note
	component:   "openEHR Common Information Model"
	description: "Model of annotations on a resource."
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class RESOURCE_ANNOTATIONS

create
	make

feature -- initialisation

	make
		do
			create items.make (0)
		end

feature -- Access

	items: HASH_TABLE [RESOURCE_ANNOTATION_ITEMS, STRING]
			-- List of form:
			-- {{tag, value}+, path}

	item_at_path (a_path: attached STRING): RESOURCE_ANNOTATION_ITEMS
			-- Return annotations at `a_path' from `items'
		do
			Result := items.item (a_path)
		end

feature -- Status Report

	has_path (a_path: attached STRING): BOOLEAN
			-- True if `a_path' found in `items'
		do
			Result := items.has (a_path)
		end

feature -- Modification

	replace_annotations (a_path: attached STRING; an_annotations: attached RESOURCE_ANNOTATION_ITEMS)
			-- add `an_annotations' at key `a_path'; replace any existing at that path
		do
			items.force(an_annotations, a_path)
		end

	merge_annotations (a_path: attached STRING; an_annotations: attached RESOURCE_ANNOTATION_ITEMS)
			-- add `an_annotations' at key `a_path' to existing annotations
		do
			if not items.has (a_path) then
				items.put (create {RESOURCE_ANNOTATION_ITEMS}.make, a_path)
			end
			from an_annotations.items.start until an_annotations.items.off loop
				items.item(a_path).items.force(an_annotations.items.item_for_iteration, an_annotations.items.key_for_iteration)
				an_annotations.items.forth
			end
		end

	add_annotation (a_path, annot_key, annot_content: attached STRING)
			-- add an annotation consisting of key `annot_key' & `annot_content' at path `a_path';
			-- replace any existing at same path
		do
			if not items.has (a_path) then
				items.put (create {RESOURCE_ANNOTATION_ITEMS}.make, a_path)
			end
			items.item(a_path).add_item(annot_key, annot_content)
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
--| The Original Code is resource_annotations.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
