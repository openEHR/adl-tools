indexing
	component:   "openEHR EHR Extract Reference Model"

	description: "Generic Message Envelope"
	keywords:    "message"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Extract Reference Model 1.3.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/message/SCCS/s.message.e $"
	revision:    "$Revision$"
	last_change: "$Date: 04/07/15 12:09:40+10:00 $"

class MESSAGE 

feature -- Access

	time_sent: DV_DATE_TIME	
			-- Date/time the message was sent.
			
	sender: PARTY_REF	
			-- Party sending the extract.
			
	receiver: PARTY_REF	
			-- Party the extract is sent to.
			
	sender_node: PARTY_REF	
			-- EHR node from which the message is sent.

	receiver_node: PARTY_REF	
			-- EHR node receiving the message.

	senders_reference: STRING	
			-- Identification of message at sender’s end.

	initiator: STRING	
			-- Indicates which party - sender or receiver caused the message to 
			-- be created and sent. If the receiver (initiator = “R”), there was 
			-- an EHR_REQUEST. If the sender (initiator = “S”), there is no request, 
			-- and the extract is being sent unsolicited.

	urgency: DV_ORDINAL	
			-- Urgency with which receiver should deal with message

	signature: ATTESTATION	
			-- Signature of message content.

	parties: SET[PARTY]	
			-- Parties referred to by all PARTY_REF and ATTESTATION instances in this message instance.

	content: MESSAGE_CONTENT	
			-- The content of the message.

invariant
	Time_sent_exists: time_sent /= Void
	Sender_exists: sender /= Void
	Receiver_exists: receiver /= Void
	Sender_node_exists: sender_node /= Void
	Senders_reference_exists: senders_reference /= Void
	Receiver_node_exists: receiver_node /= Void
	Urgency_exists: urgency /= Void
	Initiator_valid: initiator /= Void and then (initiator = "S" or else initiator = "R")
	Parties_valid: Parties /= Void implies parties.is_empty
	Content_exists: content /= Void	

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
--| The Original Code is message.e.
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
