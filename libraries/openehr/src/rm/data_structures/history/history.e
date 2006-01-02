indexing
	component:   "openEHR Data Structures Reference Model"

	description: "[
	              General concept of a temporal data structure, i.e. one whose elements are other 
			  spatially complex data structures, each of which appears at a point of time in 
			  a series.  This includes the special (but common) case where there is only one 
			  element, corresponding to a single measurement or observation. In scientific or 
			  clinical medicine, it is logically correct to treat single values and series  
			  the same way, since even single values (however complex structurally) are 
			  situated in time. It is also advantageous since it allows uniformity of processing.
			  ]"
	keywords:    "content, temporal, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class HISTORY [G -> ITEM_STRUCTURE]

inherit
	DATA_STRUCTURE

feature -- Access

	origin: DV_DATE_TIME	
			-- Time origin of this event history. The first event is not necessarily at the origin point.

	period: DV_DURATION	
			-- period between samples in this segment if periodic

	items: LIST[EVENT[G]]	
			-- The items in the series.

	summary: ITEM_STRUCTURE
			-- optional data item which summarises the entire series, e.g. a
			-- text item or an image

	duration: DV_DURATION
			-- duration of the entire History; either corresponds to the
			-- duration of all the events, and/or the duration represented by
			-- the summary, if it exists

	path_of_item (a_loc: LOCATABLE): STRING is
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE is
			-- The item at a path (relative to this item).
		do
		end

feature -- Access

	parent: LOCATABLE
			-- parent node of this node in compositional structure

feature -- Status Report

	valid_path (a_path: STRING): BOOLEAN is
			-- True if the path is valid with respect to the current item.
		do
		end

	is_periodic: BOOLEAN	
			-- Indicates whether history is periodic.

feature -- Conversion

	as_hierarchy: CLUSTER is
			-- the physical representation as a CEN 13606-compliant structure
		do
		end

invariant
	origin_exists: origin /= Void
	items_exists: items /= Void and then not items.is_empty	
	period_validity: is_periodic xor period = Void	

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
--| The Original Code is history.e.
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
