indexing
	component:   "openEHR Archetype Project"
	description: "ADL archetype path"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OG_PATH

inherit
	HASHABLE
		redefine
			is_equal, out
		end
		
create
	make_absolute, make_relative, make_movable, make_from_string, make_from_other

feature -- Definitions

	movable_leader: STRING is "//"

	segment_separator: CHARACTER is '/'

	feature_call_separator: CHARACTER is '/'

	feature_call_arg_delimiters: STRING is "()"
	
feature -- Initialisation

	make_absolute(a_path_segment: OG_PATH_ITEM) is
			-- make a path of the form /attr_name[xxx]/attr_name/attr_name[xxx]...
		require
			Path_segment_valid: a_path_segment /= Void
		do
			create items.make(0)
			items.extend(a_path_segment)
			is_absolute := True
		ensure
			is_absolute
		end
		
	make_relative(a_path_segment: OG_PATH_ITEM) is
			-- make a path of the form attr_name[xxx]/attr_name[xxx]...
		require
			Path_segment_valid: a_path_segment /= Void
		do
			create items.make(0)
			items.extend(a_path_segment)
		ensure
			not is_absolute and not is_movable
		end
		
	make_movable(a_path_segment: OG_PATH_ITEM) is
			-- make a path of the form //attr_name[xxx]/attr_name[xxx]...
			-- point, equivalen to Xpath "//" path
		require
			Path_segment_valid: a_path_segment /= Void
		do
			create items.make(0)
			items.extend(a_path_segment)
			is_movable := True
		ensure
			is_movable
		end
		
	make_from_string(s: STRING) is
			-- 
		require
			s /= Void and then valid_path_string(s)
		do
			create parser.make
			parser.execute(s)
			is_absolute := parser.output.is_absolute
			is_terminal := parser.output.is_terminal
			items := parser.output.items
		end
		
	make_from_other(other: OG_PATH) is
			-- FIXME: created because clone does not work in dotnet
		do
			is_absolute := other.is_absolute
			is_terminal := other.is_terminal
			create items.make(0)
			from
				other.items.start
			until
				other.items.off
			loop
				items.extend(create {OG_PATH_ITEM}.make_from_other(other.items.item))
				other.items.forth
			end
		end	

feature -- Access

	items: ARRAYED_LIST[OG_PATH_ITEM]
	
	item: OG_PATH_ITEM is
		require
			not is_empty
		do
			Result := items.item
		ensure
			Result_exists: Result /= Void
		end

	first: OG_PATH_ITEM is
		require
			not is_empty
		do
			Result := items.first
		ensure
			Result_exists: Result /= Void
		end

	last: OG_PATH_ITEM is
		require
			not is_empty
		do
			Result := items.last
		ensure
			Result_exists: Result /= Void
		end

	count: INTEGER is
		do
			Result := items.count
		end

	hash_code: INTEGER is
			-- hashing code based on hash code of string form
		do
			Result := as_string.hash_code
		end
		
	sub_path: OG_PATH is
			-- the current path minus the first segment
		require
			not is_final
		do
			from 
				start
				forth	-- miss first item
				create Result.make_relative(item)
				if is_terminal then
					Result.set_terminal
				end
				forth
			until
				off
			loop
				Result.items.extend(create {OG_PATH_ITEM}.make_from_other(item))
				forth
			end
		ensure
			Result_relative: not Result.is_absolute
		end
		
	sub_path_from_item: OG_PATH is
			-- the section of the current path from current `item' position to the end
		require
			not is_final
		do
			create Result.make_relative(item)
			if is_terminal then
				Result.set_terminal
			end
			forth
			
			from 
			until
				off
			loop
				Result.items.extend(create {OG_PATH_ITEM}.make_from_other(item))
				forth
			end
		ensure
			Result_relative: not Result.is_absolute
		end
		
feature -- Cursor Movement

	start is
		do
			items.start
		end

	forth is
		do
			items.forth
		end

	back is
		do
			items.back
		end

feature -- Status Report

	is_equal(other: OG_PATH): BOOLEAN is
			-- True if `other' and this path are identical
		do
			debug("ADL_tree")
				io.putstring("%TComparing path " + as_string + " ?= " + other.as_string + "%N")
			end
			Result := as_string.is_equal(other.as_string)
		end
		
	is_absolute: BOOLEAN
			-- True if this path is relative to the root of hierarchical structure
			
	is_movable: BOOLEAN
			-- True if this path is a pattern which may apply anywhere from the
			-- reference point down. Corresponds to Xpath '//' paths

	is_terminal: BOOLEAN
			-- True if this path refers to a node which is the last addressable node in a chain
			-- (not necessarily a leaf node in the structure, however, since leaf nodes often 
			-- have no addressing)

	is_empty: BOOLEAN is
		do
			Result := items.is_empty
		end

	is_last: BOOLEAN is
		do
			Result := items.islast
		end

	off: BOOLEAN is
		do
			Result := items.off
		end
		
	is_final: BOOLEAN is
			-- true if path has only one segment
		do
			Result := items.count = 1
		end
		
feature -- Validation

	valid_path_string(a_path: STRING): BOOLEAN is
			-- True if a_path parses properly;
			-- if False, error in invalid_path_string_reason
		require
			a_path /= Void and then not a_path.is_empty
		do
			create invalid_path_string_reason.make(0)
			if parser = Void then
				create parser.make
			end
			parser.execute(a_path)
			
			if parser.syntax_error then
				invalid_path_string_reason.append(parser.error_text)
			else
				Result := True
			end
		end
		
	invalid_path_string_reason: STRING
	
feature -- Modification

	set_movable is 
			-- set is_movable true
		do
			is_movable := True
		end
		
	remove_first is
			-- remove the first path item
		do
			items.start
			items.remove
		end

	remove_last is
			-- remove the first path item
		do
			items.finish
			items.remove
		end

	append_segment(an_item: OG_PATH_ITEM) is
			-- add segment to the end
		require
			item_valid: an_item /= Void and not items.last.is_feature_call
		do
			items.extend(an_item)
		end

	prepend_segment(an_item: OG_PATH_ITEM) is
			-- add segment to the front
		require
			item_valid: an_item /= Void 
		do
			items.put_front(an_item)
		end
		
	set_absolute is
		do
			is_absolute := True
		end

	set_terminal is
		do
			is_terminal := True
		end
		
feature -- Comparison

	matches(a_path: STRING):BOOLEAN is
			-- 
		require
			a_path /= Void and then valid_path_string(a_path)
		do
			if a_path.count <= count then				
				if parser = Void then
					create parser.make
				end
				parser.execute(a_path)
			
				from 
					parser.output.start
					start
					Result := True
				until
					not Result and parser.output.off
				loop
					Result := Result and item.is_equal(parser.output.item)
					parser.output.forth
				end
			end
		end

feature -- Output

	out: STRING is
			-- use as_string
		do
			Result := as_string
		end
		
	as_string: STRING is
			-- 
		local
			csr: ARRAYED_LIST_CURSOR
		do
			csr := items.cursor

			create Result.make(0)
			start
			if is_absolute then
				Result.append_character(segment_separator)
			elseif is_movable then
				Result.append(movable_leader)				
			end

			from
			until
				off or item.is_feature_call
			loop
				Result.append(item.attr_name)
				if item.is_addressable then
					Result.append("[" + item.object_id + "]")
				elseif item.is_feature_call then
					Result.append(feature_call_arg_delimiters)
				end
				if not items.islast then
					Result.append_character(segment_separator)					
				end
				forth
			end
			items.go_to(csr)
		end
		
feature {NONE} -- Implementation

	parser: OG_PATH_VALIDATOR
	
invariant
	Items_valid: items /= Void
	Movable_validity: not (is_movable and is_absolute)

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
--| The Original Code is adl_path.e.
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
