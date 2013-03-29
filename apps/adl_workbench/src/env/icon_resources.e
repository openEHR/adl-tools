note
	component:   "openEHR Archetype Project"
	description: "Container for icons for a project, keyed by logical path taken from original directory structure of icon files."
	keywords:    "icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

deferred class ICON_RESOURCES

inherit
	EV_STOCK_PIXMAPS
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal;
		end

feature {NONE} -- Initialisation

	make
		do
			create errors.make
		end

feature -- Access

	has_icon_pixmap (key: STRING): BOOLEAN
			-- True if pixmap corresponding to `key' exists
		do
			Result := icon_pixmaps.has (key) or else can_lazy_load (key)
		end

	get_icon_pixmap (key: STRING): EV_PIXMAP
			-- obtain pixmap corresponding to `key' or else a generic pixmap
		local
			pixmap_name: STRING
		do
			pixmap_name := key.as_lower
			if icon_pixmaps.has (pixmap_name) then
				check attached icon_pixmaps.item (pixmap_name) as pxm then
					Result := pxm
				end
			elseif can_lazy_load (pixmap_name) then
				lazy_load (pixmap_name)
				check attached icon_pixmaps.item (pixmap_name) as pxm then
					Result := pxm
				end
			else
				errors.add_error (ec_no_pixmap_found, <<key>>, Void)
				create Result.default_create
			end
		end

	errors: ERROR_ACCUMULATOR

feature {NONE} -- Implementation

	icon_pixmaps: HASH_TABLE [EV_PIXMAP, STRING]
			-- Table of pixmap file paths keyed by relative path, e.g.
			-- tool/compile.ico
			-- added/c_attribute.ico
			-- rm/openehr/entry.ico
		once
			create Result.make (0)
		end

	can_lazy_load (key: STRING): BOOLEAN
			-- True if icon resource `key' can be lazy-loaded
		do
		end

	lazy_load (key: STRING)
			-- load resource with `key' into `icon_pixmaps'
		require
			can_lazy_load (key)
		do
		ensure
			icon_pixmaps.has (key)
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
--| The Original Code is shared_ui_resources.e.
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
