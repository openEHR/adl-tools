note
	component:   "openEHR ADL Tools"
	description: "test object for method dispatcher tests"
	keywords:    "test, method dispatcher"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class PART

feature -- Access

	sub_parts:LINKED_LIST[SUB_PART]
		local
			item:SUB_PART
		once
			create Result.make
			create item.make("tom") Result.extend(item)
			create item.make("dick") Result.extend(item)
			create item.make("harry") Result.extend(item)
		end

	proc_no_args
		do
			io.put_string(">> Called proc_no_args")
			io.new_line
		end

	proc_with_exp_arg(proc_arg:INTEGER)
		do
			io.put_string(">> Called proc_with_exp_arg(")
			io.put_integer(proc_arg)
			io.put_string(":INTEGER)")
			io.new_line
		end

	proc_with_ref_arg(proc_arg:STRING)
		do
			io.put_string(">> Called proc_with_ref_arg(")
			io.put_string(proc_arg)
			io.put_string(":STRING)")
			io.new_line
		end

	ref_func_with_ref_arg(func_arg:STRING):STRING
		do
			io.put_string(">> Called ref_func_with_ref_arg(") io.put_string(func_arg) io.put_string(":STRING):STRING")
			Result := func_arg.twin
			Result.mirror
			io.put_string("returning: ") io.put_string(Result)
			io.new_line
		end

	real_func_with_ref_arg(func_arg:STRING):REAL
		do
			io.put_string(">> Called real_func_with_ref_arg(") io.put_string(func_arg) io.put_string(":STRING):STRING")
			if func_arg.is_real then
			    Result := func_arg.to_real
			end
			io.put_string("returning: ") io.put_real(Result)
			io.new_line
		end

	boolean_func_with_ref_arg(func_arg:STRING):BOOLEAN
		do
			io.put_string(">> Called boolean_func_with_ref_arg(") io.put_string(func_arg) io.put_string(":STRING):STRING")
			if func_arg.is_boolean then
			    Result := func_arg.to_boolean
			end
			io.put_string("returning: ") io.put_boolean(Result)
			io.new_line
		end

end
