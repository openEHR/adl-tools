note
	component:   "openEHR ADL Tools"
	description: "Specialised form of SELECTION_HISTORY for ARCHETYPE_CATALOGUE"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_CATALOGUE_SELECTION_HISTORY

inherit
	SELECTION_HISTORY
		redefine
			selected_item
		end

create
	make

feature -- Access

	selected_item: detachable ARCH_CAT_ITEM
			-- The archetype at `selected_item'.
		do
			if attached {ARCH_CAT_ITEM} precursor as aci then
				Result := aci
			end
		end

	selected_archetype: detachable ARCH_CAT_ARCHETYPE
			-- The archetype at `selected_item'.
		do
			if attached {ARCH_CAT_ARCHETYPE} selected_item as aca then
				Result := aca
			end
		ensure
			consistent_with_history: attached Result implies Result = selected_item
		end

	selected_class: detachable ARCH_CAT_CLASS_NODE
			-- The class node at `selected_item'.
		do
			if attached {ARCH_CAT_CLASS_NODE} selected_item as acc then
				Result := acc
			end
		ensure
			consistent_with_history: attached Result implies Result = selected_item
		end

feature -- Status Report

	has_selected_archetype: BOOLEAN
			-- Has an archetype been selected?
		do
			Result := attached selected_archetype
		end

	has_validated_selected_archetype: BOOLEAN
			-- Has a valid archetype been selected?
		do
			Result := attached selected_archetype and then selected_archetype.is_valid
		end

	has_selected_class: BOOLEAN
			-- Has a class been selected?
		do
			Result := attached selected_class
		end

end


