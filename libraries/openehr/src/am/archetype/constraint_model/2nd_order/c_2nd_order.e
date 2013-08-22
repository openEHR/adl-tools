note
	component:   "openEHR ADL Tools"
	description: "Second order constraint"
	keywords:    "AOM, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_2ND_ORDER

feature -- Initialisation

	make
		do
			create members.make (0)
		end

feature -- Access

	members: ARRAYED_LIST [attached like member_type]

	member_type: detachable ARCHETYPE_CONSTRAINT

	i_th_member (i: INTEGER): attached like member_type
		require
			i_in_range: i > 0 and i <= members.count
		do
			Result := members.i_th (i)
		end

	count: INTEGER
		do
			Result := members.count
		end

feature -- Status report

feature -- Comparison

feature -- Modification

	put_member (a_member: attached like member_type)
		do
			members.extend (a_member)
			a_member.set_soc_parent (Current)
		end

end


