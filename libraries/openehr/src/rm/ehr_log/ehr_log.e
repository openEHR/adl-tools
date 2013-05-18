note
	component:   "openEHR ADL Tools"
	description: "[
		 	 This class models thhe log of extracts sent and received from a particular EHR.
			 ]"
	keywords:    "ehr, extract, log"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class EHR_LOG

feature -- Access

--	extracts_merged:LIST[LOCAL_REF[EHR_EXTRACT]] is
			-- reference list of all extracts merged from another HCF into this record
			-- REQ=legal:merged-extracts
--		deferred
--		end

--	extracts_sent:LIST[LOCAL_REF[EHR_EXTRACT]] is
			-- reference list of all extracts sent from this record to another HCF. An entry
			-- should only go in this list when the system has ascertained that it has actually
			-- been sent (nothing can be reliably said about what is done at the other end)
			-- REQ=legal:sent-extracts
--		deferred
--		end

feature -- Validity

--	frozen extracts_valid:BOOLEAN is
			-- test if every transaction in extracts_merged list is in local transactions list,
			-- i.e. test if all received extracts have been merged properly
--		do
--			Result := True
--		end
--
invariant
--	Extracts_validity: extracts_valid

end


