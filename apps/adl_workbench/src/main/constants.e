indexing
	description: "Objects that provide access to constants loaded from files."
	date: "$Date$"
	revision: "$Revision$"

class
	CONSTANTS

inherit
	CONSTANTS_IMP
		redefine
			icons
		end

-- Perform any constant redefinitions in this class.

feature -- Access
	
	icons: STRING is
			-- `Result' is DIRECTORY constant named `icons'.
		once
			Result := "icons"
		end

end -- class CONSTANTS
