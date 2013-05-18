note
	component:   "openEHR ADL Tools"

	description: "[
			 Generic details of an audit trail
			 ]"
	keywords:    "version control"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ARCHETYPE_AUDIT


create
	make

feature -- Initialization

	make(a_committer, a_committer_organisation: STRING; a_time_committed: DV_DATE_TIME; a_change_type: DV_CODED_TEXT)
		require
			a_committer_valid: a_committer /= Void
			a_committer_organisation_valid: a_committer_organisation /= Void implies not a_committer_organisation.is_empty
			a_time_committed_valid: a_time_committed /= Void
			a_change_type_valid: a_change_type /= Void
		do
			committer := a_committer
			committer_organisation := a_committer_organisation
			time_committed := a_time_committed
			change_type := a_change_type
		ensure
			Committer_set: committer = a_committer
			Committer_organisation_set: committer_organisation = a_committer_organisation
			Time_committed_set: time_committed = a_time_committed
		end

feature -- Access

	committer: STRING
			-- Identity of party who committed the item.

	committer_organisation: STRING
			-- Identification of the committer’s organisation.

	time_committed: DV_DATE_TIME
			-- Time of committal of the item.

	change_type: DV_CODED_TEXT
			-- Type of change. Coded using the openEHR Terminology “audit change type” group.

	reason: STRING
			-- description of this change

invariant
	Committer_exists: committer /= Void and then not committer.is_empty
	Committer_organisation_validity: committer_organisation /= Void implies not committer_organisation.is_empty
	Time_committed_exists: time_committed /= Void	
	Change_type_exists: change_type /= Void -- and then 
		-- terminology("openehr").codes_for_group_name("audit change type", "en").has(change_type.defining_code)
	Reason_valid: reason /= Void
	

end


