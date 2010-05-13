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

	rm_schema: SCHEMA_ACCESS
			-- currently chosen reference model
		do
			if rm_schemas.found then
				Result := rm_schemas.found_item
			end
		end

feature -- Status Report

	has_rm_schema (a_schema_name: STRING): BOOLEAN
			-- True if there is a schema for given pacakge name; side-effect: sets rm_checker to point to this item
		require
			schema_name_attached: a_schema_name /= Void
		do
			Result := rm_schemas.has_key(a_schema_name.as_lower)
		end

	found_rm_schemas: BOOLEAN
			-- True if any Reference Model schemas were found
		do
			Result := not rm_schemas.is_empty
		end

feature {NONE} -- Implementation

	rm_schemas: HASH_TABLE [SCHEMA_ACCESS, STRING]
		local
			dir: DIRECTORY
			ma: SCHEMA_ACCESS
			schema_path: STRING
		once
			create Result.make(0)
			create dir.make_open_read (default_rm_schema_directory)
			if not (dir.exists and dir.is_readable) then
				post_error (Current, "rm_schemas", "model_access_e5", <<default_rm_schema_directory>>)
			elseif dir.is_empty then
				post_error (Current, "rm_schemas", "model_access_e6", <<default_rm_schema_directory>>)
			else
				from
					dir.start
					dir.readentry
				until
					dir.lastentry = Void
				loop
					if dir.lastentry.ends_with (schema_file_extension) then
						schema_path := default_rm_schema_directory + os_directory_separator.out + dir.lastentry
						create ma.make(schema_path)
						if ma.model_loaded then
							post_info (Current, "rm_schemas", "general", <<ma.status>>)
							Result.put (ma, ma.schema.schema_name.as_lower)
						else
							post_error (Current, "rm_schemas", "general", <<ma.status>>)
						end
					end
					dir.readentry
				end
			end
			if rm_schemas.is_empty then
				post_error (Current, "rm_schemas", "model_access_e6", <<default_rm_schema_directory>>)
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
