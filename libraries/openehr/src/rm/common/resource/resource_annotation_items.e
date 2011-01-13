note
	component:   "openEHR Common Information Model"
	description: "Model of annotations for a single path in a resource."
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class RESOURCE_ANNOTATION_ITEMS

create
	make

feature -- initialisation

	make
		do
			create items.make (0)
		end

feature -- Access

	items: HASH_TABLE [STRING, STRING]
			-- List of tagged values

feature -- Modification

	add_item (a_tag, an_item: attached STRING)
			-- add `an_item' at key `a_tag'; replace any existing at the same tag
		do
			items.force(an_item, a_tag)
		end

feature -- Output

	as_string: attached STRING
			-- generate a multi-line string of the form
			-- 	tag1: val1
			-- 	tag2: val2
			-- etc
		do
			create Result.make_empty
			from items.start until items.off loop
				Result.append (items.key_for_iteration)
				Result.append (": ")
				Result.append (items.item_for_iteration)
				Result.append_character ('%N')
				items.forth
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
