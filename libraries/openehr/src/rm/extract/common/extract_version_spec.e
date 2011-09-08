note
	component:   "openEHR EHR Reference Model"

	description: "[
				  Specification of what versions should be included in an Extract. By default, only 
				  latest versions are included in the Extract, in which case this part of the Extract 
				  specification is not needed at all. The attributes includes_all_versions and 
				  commit_time_interval are used to modify this; the former forces all versions to be 
				  included; the latter limits the versions to be those latest versions committed in the 
				  time interval, or if includes_all_versions is True, all versions committed in the 
				  time interval.	
				  ]"
	keywords:    "ehr, extract"

	design:      "openEHR EHR Extract Reference Model rev 2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class EXTRACT_VERSION_SPEC

feature -- Access

	includes_all_versions: BOOLEAN	
			-- True if all versions of each item in the Extract are included.

	commit_time_interval: DV_INTERVAL [DV_DATE_TIME]	
			-- Specifies commit time interval of items to source repository to include in Extract. 
			-- By default, only latest versions whose commit times fall in the range are included. 
			-- If includes_all_versions is True, then the range includes all versions committed 
			-- within the interval.

	includes_revision_history: BOOLEAN	
			-- True if revision histories of the items in the Extract are included. If included, 
			-- it is always the full revision history.

	includes_data: BOOLEAN	
			-- True if the data of items matched by the content spec should be included. This is the default.
			-- If False, only revision history is included in serialised versions. 
			-- Turning this option on in openEHR systems causes X_VERSIONED_OBJECTs to have revision_history set, 
			-- but versions Void. Useful for interrogating a server without having to look at any content data. 
			-- In other systems it may or may not have a sensible meaing.

invariant
	Includes_revision_history_valid: not includes_data implies includes_revision_history

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
--| The Original Code is extract_request.e.
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
