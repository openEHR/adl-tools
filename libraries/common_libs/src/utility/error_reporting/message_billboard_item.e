indexing
	component:   "openEHR Reusable Libraries"
	description: "[
			     Error status billboard item: contains id of message template
				 and a set of args to be substituted. This approach allows
				 messages to be reported in multiple languages, since they are
				 built from the template & args on the fly when requested,
				 not when created.
				 ]"
	keywords:    "error status reporting"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class MESSAGE_BILLBOARD_ITEM

inherit
	BILLBOARD_MESSAGE_TYPES
		
create
	make
	
feature -- Initialisation
		
	make(a_type_name, a_routine_name: STRING; a_message_id: STRING; an_args:
			ARRAY[STRING]; a_message_type:INTEGER) is
		require
			Type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
			Routine_name_valid: a_routine_name /= Void and then not a_routine_name.is_empty
			Error_id_valid: a_message_id /= Void and then not a_message_id.is_empty
			Message_type_valid: is_valid_message_type(a_message_type)
		do
			type_name := a_type_name
			routine_name := a_routine_name
			message_id := a_message_id
			args := an_args
			message_type := a_message_type
		end

feature -- Access

	type_name: STRING
			-- type name of the object posting the message

	routine_name: STRING
			-- name of routine posting the message

	message_id: STRING
			-- id of message message template

	args: ARRAY[STRING]
			-- string arguments to be substituted into message message

	message_type: INTEGER

invariant
	is_valid_message_type(message_type)

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
--| The Original Code is message_billboard_item.e.
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

 
