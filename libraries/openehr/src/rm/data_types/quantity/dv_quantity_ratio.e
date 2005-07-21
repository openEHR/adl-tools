indexing
	component:   "openEHR Data Types"

	description: "[
				 Used for recording specified administration dosages (e.g. 5 mg / 100 ml),
				 drug amounts based on body weight (e.g. 1 tablet / 10 kg), and 
				 titers (e.g. 1:128). Note that the units representation in single QUANTITYs 
				 caters for any ratio in which the units are expressible in unitary 
				 (i.e. denominator = 1) form. Thus, a QUANTITY_RATIO of '2 g / 250ml' could
				 be expressed as a QUANTITY of '8 g/l'.
				 ]"
	keywords:    "quantity, ratio, data"

	requirements:"ISO 18308 TS V1.0 STR 3.6"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/quantity/SCCS/s.dv_quantity_ratio.e $"
	revision:    "$Revision$"
	last_change: "$Date: 04/07/15 12:09:37+10:00 $"

class DV_QUANTITY_RATIO


inherit
	DATA_VALUE
		redefine
			default_create
		end

create 
	default_create,
	make,
	make_from_string,
	make_from_canonical_string

feature -- Initialization
	
	make_from_string(str:STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
		do
		end

	default_create is
		local
			q1, q2: DV_QUANTITY
		do
			create q1.default_create
			create q2.default_create
			numerator := q1
			denominator := q2
		ensure then
			value_default: numerator.magnitude = 0 and denominator.magnitude = 0
		end

	make (num, denom: DV_QUANTIFIED) is
		require
			numerator_exists: num /= void
			denominator_exists: denom /= void
		do
			numerator := num
			denominator := denom
		ensure
			numerator_set: numerator = num
			denominator_set: denominator = denom
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
		end

feature -- Access

	numerator: DV_QUANTIFIED
			-- numerator of ratio

	denominator: DV_QUANTIFIED
			-- denominator of ratio
	
feature -- Output

	as_string: STRING is
			-- string form displayable for humans
		do
			Result := numerator.as_string + ":" + denominator.as_string
		end
	
	as_canonical_string: STRING is
			-- Output in form of string of form "<numerator>" + numerator.as_canonical_string + "</numerator>" +
			--	"<denominator>" + denominator.as_canonical_string + "</denominator>" 
		do
			Result := "<numerator>" + numerator.as_canonical_string + "</numerator>" +
				"<denominator>" + denominator.as_canonical_string + "</denominator>" 
		end
	
invariant
	Numerator_exists: numerator /= Void
	Denominator_exists: denominator /= Void

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
--| The Original Code is dv_quantity_ratio.e.
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
