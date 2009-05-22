note
	component:   "Good Electronic Health Record (GEHR) kernel"
	description: "Common shared access class"
	keywords:    "framework, shared"

	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "GEHR support <support@gehr.org>"
	copyright:   "Copyright (c) 2000 The openEHR Foundation, Australasia"
	licence:     "The openEHR Open Source Licence"

--	file:        "%M%"
--	version:     "%I%"
--	last_change: "%E% %U%"

class SHARED_ACCESS

inherit
	SHARED_EVENT_LOG
		export 
			{NONE} all
		end

	SHARED_RESOURCES
		export 
			{NONE} all
		end

	SHARED_LOCALE
		export 
			{NONE} all
		end

end

