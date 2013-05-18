note
	component:   "openEHR ADL Tools"

	description: "[
				  A 'message' is an authored, possibly signed, piece of content intended for one or more recipients. 
				  Since the recipient may or may not be known directly, recipients are specified in the ADDRESSED_MESSAGE class.
				 ]"
	keywords:    "message"

	design:      "openEHR EHR Extract Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class MESSAGE

feature -- Access

	audit: AUDIT_DETAILS	
			-- Details of who actually created the messageand when. This is the person who entered the data or 
			-- otherwise caused the message to be created, or might be a piece of softare.

	author: PARTY_PROXY	
			-- Party responsible for the message content, who may or may not be technically responsible for 
			-- its creation (e.g. by data entry etc).

	content: ANY	
			-- Content of the message.

	signature: STRING	
			-- Optional signature by the author of message content in openPGP format. The signature is created 
			-- as a Hash and optional signing of the serialisation of this message object with this signature field Void.

invariant
	Author_valid: author /= Void
	Audit_valid: audit /= Void
	Content_valid: content /= Void	

end


