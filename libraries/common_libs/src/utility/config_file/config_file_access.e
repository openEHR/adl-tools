indexing
	component:   "openEHR Reusable Libraries"
	description: "[
				 Access to a .ini style configuration file. Comment
				 character settable; defaults to ';'. Category items
				 take the form '[xxxx]'. Name/value pair entries 
				 take the form:
				 	name = value
				 any whitespace can occur around the '='
				 ]"
	keywords:    "config, file"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CONFIG_FILE_ACCESS

inherit
	TEXT_FILE_ACCESS
		redefine
			make
		end

creation
	make

feature -- Definitions

	default_category: STRING is "default"
	
feature -- Initialisation

	make(a_file_name:STRING) is
		do
			create resources.make(0)
			create requested_resources.make(0)
			precursor {TEXT_FILE_ACCESS} (a_file_name)
		end

feature -- Access

	resources: HASH_TABLE[HASH_TABLE[STRING,STRING], STRING]

	requested_resources: HASH_TABLE[HASH_TABLE[STRING,STRING],STRING]

	resource_value(category, resource_name: STRING): STRING is
			-- get the value for resource_name, in 'category'
		require
                Valid_category: category /= Void and then not category.is_empty
                Valid_resource_name: resource_name /= Void and then not resource_name.is_empty
		local
                resource_list: HASH_TABLE[STRING,STRING]
		do
                create Result.make(0)

                -- find the category
                resource_list := resources.item(category)
                if resource_list = Void then
               		resource_list := resources.item(default_category)
               	end
                if resource_list /= Void then
	                if resource_list.has(resource_name) then
						Result.copy(resource_list.item(resource_name))
        	        end
				end
		ensure
                Result_not_void: Result /= Void
		end

	resource_value_list(category, resource_name:STRING): ARRAYED_LIST[STRING] is
			-- List of items specified in file setting
			-- of the form of a comma-separated list.
		require
			Valid_category: category /= Void and then not category.is_empty
			Valid_resource_name: resource_name /= Void and then not resource_name.is_empty
		local
            token_str: TOKEN_STRING
            str:STRING
		do
			create Result.make(0)
			str := resource_value(category,resource_name)
                
			if str /= Void and then not str.is_empty then
				create token_str.make(resource_value(category, resource_name))
				from
					token_str.token_start
				until
					token_str.token_off
				loop
					str := token_str.token_item
					Result.extend(str)
					token_str.token_forth
				end
			end    
		end

	resource_category_values(category:STRING): HASH_TABLE[STRING,STRING] is
			-- get all name/value pairs in 'category'
		require
                Valid_category: category /= Void and then not category.is_empty
		do
			Result := resources.item(category)
			if Result = Void then
				create Result.make(0)
			end
		ensure
			Result_not_void: Result /= Void
		end

feature -- Modification

	set_resource_value(category_name: STRING; resource_name: STRING; value:STRING) is
           require
                Valid_category: category_name /= Void and then not category_name.is_empty
                Valid_resource_name: resource_name /= Void and then not resource_name.is_empty
           local
				resource_list: HASH_TABLE[STRING,STRING]
           do
                if resources.has(category_name) then
					resource_list := resources.item(category_name)
					resource_list.force(value, resource_name)
                else
					create resource_list.make(0)
					resource_list.put(value, resource_name)
					resources.put(resource_list, category_name)
                end
           end

	set_resource_value_list(category_name: STRING; resource_name: STRING; values: LIST[STRING]) is
           require
                Valid_category: category_name /= Void and then not category_name.is_empty
                Valid_resource_name: resource_name /= Void and then not resource_name.is_empty
                Values_valid: values /= Void
           local
				resource_list: HASH_TABLE[STRING,STRING]
				tstr: TOKEN_STRING
           do
           		create tstr.make("")
	           	from
	           		values.start
	           	until
	           		values.off
	           	loop
	           		tstr.append_token(values.item)
	           		values.forth
	           	end
	           	
                if resources.has(category_name) then
					resource_list := resources.item(category_name)
					resource_list.force(tstr.out, resource_name)
                else
					create resource_list.make(0)
					resource_list.put(tstr.out, resource_name)
					resources.put(resource_list, category_name)
                end
           end

feature -- Element Removal

	remove_resource(category_name, resource_name:STRING) is
			-- remove the resource resource_name
		require
			Valid_category: category_name /= Void and then not category_name.is_empty
			Valid_resource_name: resource_name /= Void and then not resource_name.is_empty
        local
			resource_list: HASH_TABLE[STRING,STRING]
		do
			if resources.has(category_name) then
				resource_list := resources.item(category_name)
				resource_list.remove (resource_name)
			end
		end
		
feature -- template routines

	initialise is
		do
		end

	read_initialise is
		do
            resources.clear_all
		end

	read_finalise is
		do
		end

	read_process_file is
		local
			category_name, res_name, res_value:STRING
			pos, res_name_dup_count, no_name_dup_count:INTEGER
			cur_res_list:HASH_TABLE[STRING, STRING]
			env_var_value:STRING
			env_var_name:STRING
			candidate_string:STRING
			pos_pair:DS_PAIR[INTEGER, INTEGER]
		do
			from
				read_line
			until
				file.end_of_file
			loop

				-- try to read either [XXXXXXXXXX] or YYYYYYYYYY=ZZZZZZZZZZZ
				if linebuf.item(1) = '[' then
					-- we are in a category

					-- strip the "[" & "]" chars & any leading or trailing spaces
					category_name := linebuf.substring(2,linebuf.count-1)
					linebuf.left_adjust
					linebuf.right_adjust
					if not resources.has(category_name) then
						create cur_res_list.make(0)
						resources.put(cur_res_list, category_name)
					else
						cur_res_list := resources.item(category_name)
					end
				else
					if cur_res_list = Void then
						create cur_res_list.make(0)
						resources.put(cur_res_list, default_category)
					end

					-- read resource name
					pos := linebuf.index_of('=',1)
					res_name := linebuf.substring(1,pos-1)
					res_name.right_adjust -- remove spaces between name and '='

					-- ensure a unique name; also document errors
					if res_name.is_empty then 
						res_name := "NONAME_" 
						res_name.append_integer(no_name_dup_count)
						no_name_dup_count := no_name_dup_count + 1
					elseif cur_res_list.has(res_name) then
						res_name.append("_DUPLICATE_")
						res_name.append_integer(res_name_dup_count)
						res_name_dup_count := res_name_dup_count + 1
					end

					-- read the resource value
					if pos+1 <= linebuf.count then        -- something to read
						res_value := linebuf.substring(pos+1,linebuf.count)
						res_value.left_adjust  -- remove spaces between '=' and value
						
						-- parse any environment variables of the form $NAME which may be 
						-- followed by any non-alphanumeric character
						from
							candidate_string := res_value.twin
							pos_pair := env_var_pattern_matcher.matched_position (candidate_string)
						until
							pos_pair = Void
						loop
							env_var_name := candidate_string.substring(pos_pair.first+1, pos_pair.second)
							env_var_value := execution_environment.get(env_var_name)
							if env_var_value /= Void then
								res_value.replace_substring_all("$" + env_var_name, env_var_value)
							end
							if not candidate_string.is_empty then
								candidate_string.replace_substring("", 1, pos_pair.second)
							end
							pos_pair := env_var_pattern_matcher.matched_position (candidate_string)
						end

					else
						res_value := "***** NO VALUE *****"
					end
					cur_res_list.put(res_value, res_name)
				end
				read_line
			end
		end

	is_valid:BOOLEAN is
		do
			Result := not last_op_fail
		end

	write_file is
		local
			resource_list: HASH_TABLE[STRING,STRING]
			category_name, s: STRING
		do
			file.create_read_write
			from 
				  resources.start
			until 
				  resources.off
			loop
				  category_name := resources.key_for_iteration
				  if not category_name.is_equal(default_category) then
					  file.put_string("[" + category_name + "]")
					  file.new_line			  	
				  end
				  resource_list:= resources.item_for_iteration
				  from
					    resource_list.start
				  until
					    resource_list.off
				  loop
				  		s := resource_list.key_for_iteration + "=" + resource_list.item_for_iteration
					    file.putstring(s)
					    file.new_line
					    resource_list.forth
				  end
				  resources.forth
			end

			file.close
		end

feature {NONE} -- Implementation

	env_var_pattern_matcher: LX_DFA_REGULAR_EXPRESSION is
			-- pattern for detecting $NAME in config values
		once
			create Result.compile (env_var_pattern, True)
		end			
		
	env_var_pattern:STRING is "\$[a-zA-Z0-9_]+"
	
	execution_environment: EXECUTION_ENVIRONMENT is
		once
			create Result
		end
			
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
--| The Original Code is config_file_access.e.
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
