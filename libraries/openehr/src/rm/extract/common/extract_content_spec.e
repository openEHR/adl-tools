note
	component:   "openEHR ADL Tools"

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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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


