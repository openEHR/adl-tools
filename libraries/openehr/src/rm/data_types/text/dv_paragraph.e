indexing
	component:   "openEHR Data Types"

	description: "[
				 A logical composite text value consisting of a series of DV_TEXTs, 
				 i.e. terms and plain text potentially with simple formatting, to form 
				 a larger tract of prose, which may be interpreted for display purposes as 
				 a paragraph.
				 ]"
	keywords:    "text, data"

	requirements:"ISO 18308 TS V1.0 STR 2.6"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_PARAGRAPH

inherit
	DATA_VALUE
		redefine
			default_create
		end
		
create 
	make,
	make_from_string,
	make_from_canonical_string

feature -- Initialization

	default_create is
		do
			create items.make
		end

	make (an_item_list: LINKED_LIST [DV_TEXT]) is
		require
			items_exists: an_item_list /= void and then not an_item_list.is_empty
		do
			items := an_item_list
		ensure
			items_set: items = an_item_list
		end

	make_from_string(str:STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
		do
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
		end

feature -- Element Change

	add_paragraph_item (new_item: DV_TEXT) is
		require
			item_valid: new_item /= void
		do
			if items = void then
				create items.make
			end
			items.extend (new_item)
		end
	
feature -- Access

	items: LINKED_LIST [DV_TEXT]
			-- Items making up the paragraph, each of which is a text list 
			-- (which has its own formatting).

feature -- Output

	as_string: STRING is
		do
			create Result.make (0)
			from
				items.start
			until
				items.off
			loop
				if not items.isfirst then
					Result.append (" ")
				end
				Result.append (items.item.as_string)
				items.forth
			end
		end

	as_canonical_string: STRING is
		do
			create Result.make (0)
			Result.append ("<items>")
			from
				items.start
			until
				items.off
			loop
				Result.append ("<item>" + items.item.as_canonical_string + "</item>")
				items.forth
			end
			Result.append ("</items>")
		end

invariant
	items_exists: items /= void and then not items.is_empty
	
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
--| The Original Code is dv_paragraph.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
