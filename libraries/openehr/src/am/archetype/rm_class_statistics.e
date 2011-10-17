note
	component:   "openEHR Archetype Project"
	description: "Statistical data accumulator for a single class used within an archetype"
	keywords:    "path"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class RM_CLASS_STATISTICS

create
	make

feature -- Initialisation

	make (a_class_name: STRING)
		do
			rm_class_name := a_class_name
			create rm_attributes.make (0)
			rm_class_count := 1
		end

feature -- Access

	rm_class_name: STRING

	rm_attributes: HASH_TABLE [INTEGER, STRING]
			-- table of number of occurrences of this attribute of this class

	rm_class_count: INTEGER
			-- occurrences of class `rm_class_name' covered by this statistical object

feature -- Status Report

feature -- Modification

	add_rm_class_occurrence
			-- increment `rm_class_count' to indicate a new class is being counted
		do
			rm_class_count := rm_class_count + 1
		end

	add_rm_attribute_occurrence (an_attr_name: STRING)
		do
			if rm_attributes.has (an_attr_name) then
				rm_attributes.force (rm_attributes.item (an_attr_name) + 1, an_attr_name)
			else
				rm_attributes.put (1, an_attr_name)
			end
		end

	add_rm_attribute_occurrences (attr_names: ARRAYED_SET [STRING])
		do
			from attr_names.start until attr_names.off loop
				add_rm_attribute_occurrence (attr_names.item)
				attr_names.forth
			end
		end

	merge (other: RM_CLASS_STATISTICS)
		require
			other.rm_class_name.same_string (rm_class_name)
		do
			rm_class_count := rm_class_count + other.rm_class_count
			from other.rm_attributes.start until other.rm_attributes.off loop
				if rm_attributes.has (other.rm_attributes.key_for_iteration) then
					rm_attributes.force (rm_attributes.item (other.rm_attributes.key_for_iteration) + other.rm_attributes.item_for_iteration, other.rm_attributes.key_for_iteration)
				else
					rm_attributes.put (other.rm_attributes.item_for_iteration, other.rm_attributes.key_for_iteration)
				end
				other.rm_attributes.forth
			end

		end

feature {NONE} -- Implementation

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
--| The Original Code is rm_class_statistics.e.
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
