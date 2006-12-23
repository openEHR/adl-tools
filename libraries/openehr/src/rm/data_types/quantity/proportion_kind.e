indexing
	component:   "openEHR Data Types"
	
	description: "[
				 Class of enumeration constants defining types of proportion for the DV_PROPORTION class.
				 ]"
	keywords:    "Reference range for ordered data items"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class PROPORTION_KIND

feature -- Definitions

	pk_ratio: INTEGER is 0	
			-- Ratio type. Numerator and denominator may be any value

	pk_unitary: INTEGER is 1	
			-- Denominator must be 1

	pk_percent: INTEGER is 2	
			-- Denominator is 100, numerator is understood as a percentage value.

	pk_fraction: INTEGER is 3	
			-- Numerator and denominator are integral, and the presentation method uses a slash, e.g. ¿1/2¿.

	pk_integer_fraction: INTEGER is 4	
			-- Numerator and denominator are integral, and the presentation method uses a slash, e.g. ¿1/2¿; 
			-- if the numerator is greated than the denominator, e.g. n=3, d=2, the presentation is ¿1 1/2¿.

feature -- Validity

	valid_proportion_kind (n: INTEGER): BOOLEAN is
			-- True if n is one of the defined types.
		do
			Result := n >= pk_ratio and n <= pk_integer_fraction
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
--| The Original Code is proportion_kind.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
