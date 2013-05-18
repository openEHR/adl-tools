note
	component:   "openEHR ADL Tools"
	description: "dotNet wrapper for CADL Tree cursor"
	keywords:    "test, ADL, CADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DOTNET_ARCHETYPE_ITERATOR

inherit 
	OG_ITERATOR

create
	make_dotnet

feature -- Initialisation

	make_dotnet(a_call_target: SYSTEM_OBJECT; root_node: C_COMPLEX_OBJECT)
		require
			Call_target_exists: a_call_target /= Void
			root_node /= Void
		do
			call_target := a_call_target
			make(root_node.representation)
		end

feature -- Access

	call_target: SYSTEM_OBJECT
	
	enter_action, exit_action: PROCEDURE[ANY, TUPLE[OG_ITEM, INTEGER]]

feature -- Element Change

	set_enter_action(handle: RUNTIME_METHOD_HANDLE)
			-- turn a C# function into an Eiffel agent
		local
			omap: ARRAY[INTEGER]
			args: TUPLE[SYSTEM_OBJECT, OG_ITEM, INTEGER]			
		do
			create enter_action
			create args
			args.put(call_target, 1)
			omap := <<2, 3>>
			
-- the following call has to be re-enabled to make this routine work
-- previously I did it by changing the export status of the 
-- ISE ROUTINE.set_rout_disp feature...but that's not good!
--			enter_action.set_rout_disp(handle, args, omap)
		end
		
	set_exit_action(handle: RUNTIME_METHOD_HANDLE)
			-- turn a C# function into an Eiffel agent
		local
			omap: ARRAY[INTEGER]
			args: TUPLE[SYSTEM_OBJECT, OG_ITEM, INTEGER]
		do
			create exit_action
			create args
			args.put(call_target, 1)
			omap := <<2, 3>>
-- the following call has to be re-enabled to make this routine work
-- previously I did it by changing the export status of the 
-- ISE ROUTINE.set_rout_disp feature...but that's not good!
--			exit_action.set_rout_disp(handle, args, omap)
		end
		
feature -- Iteration

	dotnet_do_all
			-- dotnet version of do_all
		do
			do_all(enter_action, exit_action)
		end
	
end


