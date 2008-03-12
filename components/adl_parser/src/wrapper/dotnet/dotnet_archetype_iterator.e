indexing
	component:   "openEHR Archetype Project"
	description: "dotNet wrapper for CADL Tree cursor"
	keywords:    "test, ADL, CADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DOTNET_ARCHETYPE_ITERATOR

inherit 
	OG_ITERATOR

create
	make_dotnet

feature -- Initialisation

	make_dotnet(a_call_target: SYSTEM_OBJECT; root_node: C_COMPLEX_OBJECT) is
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

	set_enter_action(handle: RUNTIME_METHOD_HANDLE) is
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
		
	set_exit_action(handle: RUNTIME_METHOD_HANDLE) is
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

	dotnet_do_all is
			-- dotnet version of do_all
		do
			do_all(enter_action, exit_action)
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
--| The Original Code is dotnet_cadl_tree_iterator.e.
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
