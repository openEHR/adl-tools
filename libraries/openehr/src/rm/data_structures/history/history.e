note
	component:   "openEHR ADL Tools"

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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


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

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

feature -- Access

	parent: LOCATABLE
			-- parent node of this node in compositional structure

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

	is_periodic: BOOLEAN	
			-- Indicates whether history is periodic.

feature -- Conversion

	as_hierarchy: CLUSTER
			-- the physical representation as a CEN 13606-compliant structure
		do
		end

invariant
	Origin_exists: origin /= Void
	Items_exists: items /= Void and then not items.is_empty	
	Period_validity: is_periodic xor period = Void
--	Period_consistency: is_periodic implies events.for_all (e: EVENT | e.offset.to_seconds.mod(period.to_seconds) = 0)

end


