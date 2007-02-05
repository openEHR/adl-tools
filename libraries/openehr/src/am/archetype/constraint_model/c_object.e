indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Any OBJECT node in ADL parse tree, including real OBJECTs,
				 simple OBJECTs, real OBJECT 'use' references, and OBJECTs
				 which represent constraints on other archetypes.
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class C_OBJECT

inherit
	ARCHETYPE_CONSTRAINT
		redefine
			parent, default_create, representation
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		undefine
			default_create
		end
	
	CONSTRAINT_MODEL_COMMON
		export
			{NONE} all
		undefine
			default_create
		end

feature -- Initialisation

	default_create is
		do
			occurrences := default_occurrences.deep_twin
		end
		
feature -- Access

	rm_type_name: STRING
			-- type name from reference model, of object to instantiate
			
	node_id: STRING is
			-- 
		do
			Result := representation.node_id
		end
		
	occurrences: OE_INTERVAL[INTEGER]
	
	parent: C_ATTRIBUTE
	
feature -- Source Control

	specialisation_status (specialisation_level: INTEGER): SPECIALISATION_STATUS is
			-- status of this node in the source text of this archetype with respect to the 
			-- specialisation hierarchy. Values are defined in SPECIALISATION_STATUSES
		local
			node_spec_level: INTEGER
		do
			if not is_valid_code(node_id) then
				create Result.make(ss_propagated)
			else
				node_spec_level := specialisation_depth_from_code(node_id)
				if node_spec_level < specialisation_level then
					create Result.make(ss_inherited)
				else
					Result := specialisation_status_from_code (node_id, specialisation_level)
				end
			end
		end
			
feature -- Status Report

	is_valid: BOOLEAN is
			-- report on validity
		do
			create invalid_reason.make(0)
			invalid_reason.append(rm_type_name + "{" + generating_type + "} ")
			if is_addressable then
				invalid_reason.append("[" + node_id + "]")
			end
			invalid_reason.append(": ")
			
			if occurrences = Void then
				invalid_reason.append("occurrences must be specified")
			elseif parent /= Void then
				if not parent.is_multiple and occurrences.upper > 1 then
					invalid_reason.append("occurrences max can only be 1 for single parent attribute")
				else
					Result := True
				end
			else
				Result := True
			end
		end
		
	is_occurrences_default: BOOLEAN is 
			-- True if occurrences is set at default value
		do
			Result := occurrences.is_equal(default_occurrences)
		end
		
feature -- Modification
		
	set_object_id(an_object_id:STRING) is
		require
			Object_id_valid: an_object_id /= Void and then not an_object_id.is_empty
		do
			representation.set_node_id(an_object_id)
		end

	set_occurrences(ivl: OE_INTERVAL[INTEGER]) is
			-- 
		require
			Interval_exists: ivl /= Void
		do
			occurrences := ivl
		ensure
			occurrences = ivl
		end

feature -- Representation

	representation: OG_OBJECT

invariant
	rm_type_name_valid: rm_type_name /= Void and then not rm_type_name.is_empty
	Occurrences_validity: occurrences /= Void and then 
		(parent /= Void implies (not parent.is_multiple implies occurrences.upper <= 1))
	
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
--| The Original Code is cadl_object_item.e.
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
