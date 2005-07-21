indexing
	description:  "Method dispatcher testing environment"
	keywords:     "test application"
	revision:     "%%A%%"
	source:       "%%P%%"
	requirements: ""

class METHOD_DISPATCH_ENV

inherit
	SHARED_METHOD_DISPATCHER
		export
			{NONE} all
		end

feature -- Initialisation
	init_env is
		do 
		end

feature -- shared access
	part:PART is
		once
			!!Result
		end

	string_list:LINKED_LIST[STRING] is
		once
			!!Result.make
			Result.extend("1 - this")
			Result.extend("2 - is")
			Result.extend("3 - a")
			Result.extend("4 - list")

			Result.compare_objects
		end
	
	print_list(a_list:LINKED_LIST[STRING]):STRING is
		do
			!!Result.make(0)
			from a_list.start until a_list.off loop
				Result.append(a_list.item)
				Result.append("%N")
				a_list.forth
			end
		end

end
