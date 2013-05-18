note
	component:   "openEHR ADL Tools"

	description: "Models an openEHR-compliant EHR node, i.e. a respository"
	keywords:    "ehr, record"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class EHR_NODE

feature -- Identification

	name: STRING
			-- Name of this node
		deferred
		end

--	owning_hcf: HCF
			-- Defines which Healthcare Facility (HCF) owns this EHR node.
			-- All EHR_SOURCEs  are  part  of an HCF. Provides a unique
			-- identity of the HCF in which the  EHR  was  originally created .
--		deferred
--		end

	identifier:STRING
			-- registered GEHR unique identifier for this EHR node
		deferred
		end

feature -- Content

	ehrs: LIST[STRING]
			-- The IDs of EHRs at this EHR_SOURCE.
		deferred
		end

invariant
	 Name_exists: name /= Void
	 Owning_hcf_exists: owning_hcf /= Void

end


