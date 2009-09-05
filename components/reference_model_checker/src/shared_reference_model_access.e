note
	component:   "openEHR Archetype Project"
	description: "Shared access to service interface to object model"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class SHARED_REFERENCE_MODEL_ACCESS

inherit
	MESSAGE_BILLBOARD
		export
			{NONE} all
		end

feature -- Definitions

	schema_file_extension: STRING is ".dadl"

feature -- Access

	has_rm_checker (a_rm_name: STRING): BOOLEAN
			-- True if there is a model for given RM name; side-effect: sets rm_checker to point to this item
		require
			rm_name_attached: a_rm_name /= Void
		do
			Result := rm_checkers.has_key(a_rm_name.as_lower)
		end

	rm_checker: SCHEMA_ACCESS
			-- currently chosen reference model
		do
			if rm_checkers.found then
				Result := rm_checkers.found_item
			else
				rm_checkers.start
				Result := rm_checkers.item_for_iteration
			end
		end

feature {NONE} -- Implementation

	rm_checkers: HASH_TABLE [SCHEMA_ACCESS, STRING]
		local
			dir, rm_dir: DIRECTORY
			a_rm_name: STRING
			ma: SCHEMA_ACCESS
		once
			create Result.make(0)
			create dir.make_open_read (default_rm_schema_directory)
			if not (dir.exists and dir.is_readable) then
				post_error (Current, "rm_checkers", "model_access_e5", <<default_rm_schema_directory>>)
			elseif dir.is_empty then
				post_error (Current, "rm_checkers", "model_access_e6", <<default_rm_schema_directory>>)
			else
				from
					dir.start
					dir.readentry
				until
					dir.lastentry = Void
				loop
					if dir.lastentry.item (1) /= '.' then
						create rm_dir.make_open_read (default_rm_schema_directory + os_directory_separator.out + dir.lastentry)
						if rm_dir.exists then
							from
								rm_dir.start
								rm_dir.readentry
							until
								rm_dir.lastentry = Void
							loop
								if rm_dir.lastentry.has_substring (schema_file_extension) then
									create ma.make(default_rm_schema_directory + os_directory_separator.out + dir.lastentry + os_directory_separator.out + rm_dir.lastentry)
									if ma.model_loaded then
										from ma.schema.model_names.start until  ma.schema.model_names.off loop
											Result.put (ma, ma.schema.model_names.item.as_lower)
											ma.schema.model_names.forth
										end
									else
										post_error (Current, "rm_checkers", "general", <<ma.status>>)
									end
								end
								rm_dir.readentry
							end
						end
					end
					dir.readentry
				end
			end
			if rm_checkers.is_empty then
				post_error (Current, "rm_checkers", "model_access_e6", <<default_rm_schema_directory>>)
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
