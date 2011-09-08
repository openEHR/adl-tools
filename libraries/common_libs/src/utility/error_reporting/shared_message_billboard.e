note
	component:   "openEHR Reusable Libraries"
	description: "Shared access to error and information messages."
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_MESSAGE_BILLBOARD

inherit
	ERROR_SEVERITY_TYPES
		export
			{NONE} all
		end

feature -- Access

	billboard: MESSAGE_BILLBOARD
			-- text of the billboard in locale current language
		once
			create Result.make
		end

feature -- Commands

	post_error(poster_object: ANY; poster_routine: STRING; id: STRING; args: ARRAY[STRING])
			-- append to the  current contents of billboard an error message corresponding to id,
			-- with positional parameters replaced by contents of optional args
		require
			Poster_valid: poster_object /= Void and poster_routine /= Void and
						  not poster_routine.is_empty
		do
			billboard.post_error(poster_object.generator, poster_routine, id, args)
		end

	post_warning(poster_object: ANY; poster_routine: STRING; id: STRING; args: ARRAY[STRING])
			-- append to the  current contents of billboard a warning message corresponding to id,
			-- with positional parameters replaced by contents of optional args
		require
			Poster_valid: poster_object /= Void and poster_routine /= Void and
						  not poster_routine.is_empty
		do
			billboard.post_warning(poster_object.generator, poster_routine, id, args)
		end

	post_info(poster_object: ANY; poster_routine: STRING; id: STRING; args: ARRAY[STRING])
			-- append to the  current contents of billboard an info message corresponding to id,
			-- with positional parameters replaced by contents of optional args
		require
			Poster_valid: poster_object /= Void and poster_routine /= Void and
						  not poster_routine.is_empty
		do
			billboard.post_info(poster_object.generator, poster_routine, id, args)
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
--| The Original Code is shared_message_billboard.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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
