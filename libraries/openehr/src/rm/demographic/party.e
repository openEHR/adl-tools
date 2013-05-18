note
	component:   "openEHR ADL Tools"

	description: "[
			 Ancestor of all party types, including real world entities and their roles. 
			 A party is any entity which can participate in an activity. The meaning 
			 attribute inherited from ARCHETYPED is used to indicate the actual type of party.
			 ]"
	keywords:    "demographic, party"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Demographic Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class PARTY

inherit
	LOCATABLE

feature -- Access
			
	identities: SET[PARTY_IDENTITY]
			-- Identities used by the party to identify itself, such as legal name, 
			-- stage names, aliases, nicknames and so on.

	contacts: SET[CONTACT]
			-- Contacts for this party.

	relationships: LINKED_SET[PARTY_RELATIONSHIP]
			-- Relationships in which this role takes part as source.

	reverse_relationships: SET[LOCATABLE_REF]
			-- Relationships in which this role takes part as target.

	details: ITEM_STRUCTURE	
			-- All other details for this party.

	type: DV_TEXT
			-- Type of party, such as “PERSON”, “ORGANISATION”, etc, or 
			-- Role name, e.g. “general practitioner”, “nurse”, “private citizen”.
			-- Taken from inherited name attribute.
		do
			Result := name
		end

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: PARTY
			-- parent node of this node in compositional structure
		once		
		end

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end
		
invariant
	Type_valid: type = name
	Identities_valid: identities /= Void and then not identities.is_empty
	Contacts_valid: contacts /= Void implies not contacts.is_empty
--	Relationships_validity: relationships /= Void implies (not relationships.is_empty and then relationships.for_all((e:PARTY_RELATIONSHIP):BOOLEAN is e.source = Current end))
--	Relationships_validity: relationships /= Void implies (not relationships.is_empty and then relationships.for_all(agent {PARTY_RELATIONSHIP}.source = Current))
--	Reverse_relationships_validity: reverse_relationships /= Void implies (not reverse_relationship.empty and then reverse_relationships.for_all(agent {PARTY_RELATIONSHIP}.target = Current))
	Details_valid: details /= Void
	Is_archetype_root: is_archetype_root
	No_parent: parent = Void

end


