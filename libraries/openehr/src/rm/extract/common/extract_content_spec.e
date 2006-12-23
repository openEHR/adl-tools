indexing
	component:   "openEHR EHR Reference Model"

	description: "[
				  Specification of the candidate content items to be included in the Extract. 
				  The final list actually included may be modified by the version_spec part of 
				  the specification, and also by the link_depth attribute in this class. In repeat 
				  (standing order) Requests, the final inclusion may be modified by the send_changes_only
				  flag of the update_spec.
				  Items to be included can either be specified as a list of identifiers of logical items 
				  (i.e. version set or version container ids), or in the form of an query, which allows 
				  for various formalisms. The openEHR default formalism is an archetype-based query that 
				  includes archteype and/or runtime paths (both are in the same Xpath-based syntax).
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

class EXTRACT_CONTENT_SPEC

feature -- Access

	includes_multimedia: BOOLEAN	
			-- Indicates whether inline instances of DV_MULTIMEDIA in the source data are included or not.

	link_depth: INTEGER
			-- Degree of links to follow emanating from content items specified for inclusion. The kind 
			-- of links to follow is dependent on the type of Extract.
			-- All items at the target end of followed links at the given depth are also included in the 
			-- extract; EXTRACT_ITEM.is_primary is used to differentiate.
			-- * 0 = don’t follow;
			-- * 1 = follow first degree links;
			-- * 2 = follow 2nd degree links; 
			-- * ....
			-- * n = follow nth degree links

	item_list: LIST [OBJECT_REF]	
			-- List of uids of items included in the Extract; for openEHR data, these are uids 
			-- identifying the version containers.

	query: DV_PARSABLE	
			-- Query specifying the contents of this Extract. Formalisms under development.

invariant
	Items_specified: item_list /= Void xor query /= Void
	Item_list_vaid: item_list /= Void implies not item_list.is_empty
	Link_depth_valid: link_depth >= 0	

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
