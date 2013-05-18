note
	component:   "openEHR ADL Tools"
	description: "Shared UML model"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_UML_MODEL
		
inherit
	SHARED_SERIALISER_ENV
		export
			{NONE} all
		end

feature -- Access

	model: UML_MODEL
		once
			create Result.make
		end

	classes: HASH_TABLE [UML_CLASS, STRING]
			-- hash of UML classes keyed by name
		once
			create Result.make(0)
		end
		
	has_class(a_name: STRING): BOOLEAN
			-- has class already been created?
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
		do
			Result := classes.has(a_name)
		end
		
	class_for_name(a_name: STRING): UML_CLASS
			-- has class already been created?
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
		do
			Result := classes.item(a_name)
		end

	put_class(a_class: UML_CLASS)
			-- add class to index
		require
			a_class_exists: a_class /= Void
		do
			classes.put(a_class, a_class.name)
		end
		
feature -- Conversion

	convert_to_standard_name(a_name: STRING): STRING
			-- convert to form ClassName
		local
			i: INTEGER
		do
			create Result.make(0)
			
			-- convert all '_' with a following char to upper case of that char
			from i := 1 until i > a_name.count loop
				if a_name.item(i) /= '_' then
					Result.append_character(a_name.item(i).as_lower)
				else
					if i < a_name.count then
						i := i + 1
						Result.append_character(a_name.item(i).as_upper)
					end
				end
				i := i + 1
			end
		end

	convert_to_class_name(a_name: STRING): STRING
			-- convert to form ClassName
		do
			Result := convert_to_standard_name(a_name)
			Result.replace_substring(Result.item(1).as_upper.out, 1, 1)
		end

feature {NONE} -- Implementation

	indent: STRING
			-- debug indent string
		once
			create Result.make(0)
		end
		

end


