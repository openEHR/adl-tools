note
	component:   "openEHR Reusable Libraries"
	description: "[
			     Message billboard for posting and reading information and errors.
				 Designed to be inherited into other classes wanting to post
				 messages.
				 ]"
	keywords:    "error status reporting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class MESSAGE_BILLBOARD

inherit
	ERROR_SEVERITY_TYPES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, is_valid_error_type
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	GLOBAL_ERROR_REPORTING_LEVEL

create
	make

feature -- Initialisation

	make
		do
			create billboard.make (0)
		end

feature -- Access

	content: STRING
			-- text of the billboard in locale current language
		do
			Result := filtered_content (global_error_reporting_level)
		end

	most_recent: STRING
			-- text of most recent addition
		do
			Result := item_formatted (billboard.first, global_error_reporting_level)
		end

feature -- Status Report

	has_errors: BOOLEAN
			-- True if billboard has any error messages (note: it may be non-empty
			-- and still have no error messages, just info messages)
		do
			Result := across billboard as billboard_csr some billboard_csr.item.error_type = Error_type_error end
		end

feature -- Modify

	clear
			-- wipe out error billboard and set is_error_posted False
		do
			billboard.wipe_out
		end

	post_error (poster_object_classname: STRING; poster_routine: STRING; id: STRING; args: detachable ARRAY[STRING])
			-- append to the  current contents of billboard an error message
			-- corresponding to id, with positional parameters replaced
			-- by contents of optional args
		require
			Poster_valid: not poster_routine.is_empty
		do
			billboard.put_front(
				create {MESSAGE_BILLBOARD_ITEM}.make (poster_object_classname, poster_routine, id, args, Error_type_error))
		end

	post_warning (poster_object_classname: STRING; poster_routine: STRING; id: STRING; args: detachable ARRAY[STRING])
			-- append to the  current contents of billboard a warning message
			-- corresponding to id, with positional parameters replaced
			-- by contents of optional args
		require
			Poster_valid: not poster_routine.is_empty
		do
			billboard.put_front(
				create {MESSAGE_BILLBOARD_ITEM}.make (poster_object_classname, poster_routine, id, args, Error_type_warning))
		end

	post_info (poster_object_classname: STRING; poster_routine: STRING; id: STRING; args: detachable ARRAY[STRING])
			-- append to the  current contents of billboard an info message
			-- corresponding to id, with positional parameters replaced
			-- by contents of optional args
		require
			Poster_valid: not poster_routine.is_empty
		do
			billboard.put_front(
				create {MESSAGE_BILLBOARD_ITEM}.make (poster_object_classname, poster_routine, id, args, Error_type_info))
		end

feature {NONE} -- Implementation

	billboard: ARRAYED_LIST [MESSAGE_BILLBOARD_ITEM]

	filtered_content (at_level: INTEGER): STRING
			-- text of the billboard in locale current language, filtered according to include_types
		require
			at_level_valid: is_valid_error_type (at_level)
		do
			create Result.make(0)
			across billboard as bb_csr loop
				if bb_csr.item.error_type >= at_level then
					Result.append (item_formatted (bb_csr.item, at_level))
				end
			end
		end

	item_formatted (bb_item: MESSAGE_BILLBOARD_ITEM; at_level: INTEGER): STRING
			-- format one item
		local
			err_str, leader, trailer: STRING
		do
			create Result.make(0)
			leader := error_type_name_table.item (bb_item.error_type) + " - "
			if at_level = Error_type_debug then
				trailer := "      (" + bb_item.type_name + "." + bb_item.routine_name + ")"
			else
				trailer := ""
			end
			if message_db.has_message (bb_item.message_id) then
				err_str := message_db.create_message_content (bb_item.message_id, bb_item.args)
			else
				err_str := message_db.create_message_content ("message_code_error", <<bb_item.message_id, bb_item.type_name, bb_item.routine_name>>)
			end
			Result.append (leader)
			Result.append (err_str)
			Result.append (trailer)
			Result.append ("%N")
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
--| The Original Code is billboard.e.
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


