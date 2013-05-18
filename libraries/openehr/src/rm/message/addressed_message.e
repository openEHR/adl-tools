note
	component:   "openEHR ADL Tools"

	description: "Generic Message Envelope"
	keywords:    "message"

	design:      "openEHR EHR Extract Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ADDRESSED_MESSAGE 

feature -- Access

	sender: STRING	
			-- Party sending the extract, as an internet address
			
	sender_reference: STRING	
			-- Identification of message at sender’s end.

	addressees: LIST [STRING]	
			-- parties to which the message is to be sent

	urgency: INTEGER
			-- Urgency with which receiver should deal with message

	message: MESSAGE
			-- The content of the message.

invariant
	Sender_valid: sender /= Void and then not sender.is_empty
	Addressees_valid: addressees /= Void and then not addressees.is_empty
	Sender_reference_exists: sender_reference /= Void and then not sender_reference.is_empty
	Message_exists: message /= Void

end


