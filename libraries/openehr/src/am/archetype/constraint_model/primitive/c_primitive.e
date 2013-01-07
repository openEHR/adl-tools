note

	component:   "openEHR Common Archetype Model"

	description: "parent type of constrainer types of simple types"
	keywords:    "archetype, string, data"

	design:      "openEHR Common Archetype Model 0.2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class C_PRIMITIVE

inherit
	ANY
		redefine
			out
		end

feature -- Access

	prototype_value: ANY
			-- 	generate a prototype value from this constraint object
		deferred
		end

	assumed_value: detachable like prototype_value
			-- assumed value for this constraint object
			-- FIXME: consider consolidating with assumed_value in C_DOMAIN_TYPE

	rm_type_name: STRING
			-- generate a Reference Model type name that this type constrains. Generally this is
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			Result := generating_type
			Result.remove_head (2)
		end

feature -- Status Report

	valid_value (a_value: like prototype_value): BOOLEAN
		deferred
		end

	has_assumed_value: BOOLEAN
			-- True if there is an assumed value
		do
			Result := attached assumed_value
		end

feature -- Modification

	set_assumed_value (a_value: like assumed_value)
			-- set `assumed_value'
		require
			valid_value(a_value)
		do
			assumed_value := a_value
		ensure
			assumed_value_set: assumed_value = a_value
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		deferred
		end

feature -- Output

	as_string: STRING
		deferred
		end

	out: STRING
		do
			Result := as_string
		end

invariant
	Assumed_value_valid: attached assumed_value as av implies valid_value (av)

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
--| The Original Code is c_simple.e.
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
