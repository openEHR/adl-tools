note
	description: "Summary description for {BOSPHORUS_SHARED_KNOWLEDGE_REPOSITORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOSPHORUS_SHARED_KNOWLEDGE_REPOSITORY
inherit
	SHARED_KNOWLEDGE_REPOSITORY
redefine
	user_config_file_directory
end

feature
	--overriden environment attributes
	user_config_file_directory: attached STRING
	do
		Result := application_startup_directory
	end

end
