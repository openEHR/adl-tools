note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Access object for remote archetype repository, i.e. Git, SVN, or other web-service etc
				 from which files can be obtained.
				 ]"
	keywords:    "repository, remote access"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPOSITORY_REMOTE_PROXY

create
	make, make_key

feature -- Initialisation

	make (a_remote_url, a_remote_type: STRING)
		do
			remote_url := a_remote_url
			remote_type := a_remote_type
			create remote_key.make_empty
		end

	make_key (a_remote_key, a_remote_url, a_remote_type: STRING)
		do
			make (a_remote_url, a_remote_type)
			remote_key.append (a_remote_key)
		end

feature -- Access

	remote_type: STRING
			-- remote repository, i.e. "git", etc

	remote_key: STRING
			-- repository definition key

	remote_url: STRING
			-- URI of remote repository

end

