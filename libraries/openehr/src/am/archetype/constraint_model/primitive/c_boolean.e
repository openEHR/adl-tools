indexing

	component:   "openEHR Common Archetype Model"

	description: "Constrainer type for instances of BOOLEAN"
	keywords:    "archetype, boolean, data"

	design:      "openEHR Common Archetype Model 0.2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_BOOLEAN

inherit
	C_PRIMITIVE

create
	make_true, make_false, make_true_false

feature -- Initialisation

	make_true is
		do
			true_valid := True
		end

	make_false is
		do
			false_valid := True
		end

	make_true_false is
		do
			true_valid := True
			false_valid := True
		end

feature -- Access

	prototype_value: BOOLEAN_REF is
		do
			create Result
			Result.set_item(true_valid)
		end

feature -- Status Report

	true_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "True"

	false_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "False"

	valid_value (a_value: BOOLEAN_REF): BOOLEAN is
		do
			Result := (a_value.item and true_valid) or else (not a_value.item and false_valid)
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN is
			-- True if this node is a subset of, or the same as `other'
		do
			Result := (other.true_valid implies true_valid) and (other.false_valid implies false_valid)
		end

feature -- Output

	as_string:STRING is
		do
			create Result.make(0)
			if true_valid then
				Result.append(True_valid.out)
				if false_valid then
					Result.append(", ")
				end
			end
			if false_valid then
				Result.append((not False_valid).out)
			end
			if assumed_value /= Void then
				Result.append("; " + assumed_value.out)
			end
		end

	as_canonical_string:STRING is
		do
			create Result.make(0)
			Result.append("<true_valid>" + true_valid.out + "</true_valid>")
			Result.append("<false_valid>" + false_valid.out + "</false_valid>")
			Result.append("<assumed_value>" + assumed_value.out + "</assumed_value>")
		end

invariant
	Binary_consistency: true_valid or false_valid
	Default_value_consistency: prototype_value and true_valid or else (not prototype_value and false_valid)

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
--| The Original Code is c_boolean.e.
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
