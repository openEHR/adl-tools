indexing
	component:   "openEHR EHR Reference Model"
	description: "[
		 	 This class models thhe log of extracts sent and received from a particular EHR.
			 ]"
	keywords:    "ehr, extract, log"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
--| The Original Code is ehr_log.e.
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
