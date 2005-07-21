indexing
	component:   "openEHR Resuable Library Project"
	description: "[
			 UML TypedElement abstraction, as defined in OMG UML 2.0 Infrastructure 
			 Specification 2003-09-15.
			 ]"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class UML_CLASSIFIER

inherit 
	UML_TYPE

	UML_NAMESPACE

	UML_REDEFINABLE_ELEMENT

feature -- Initialisation

	make is
			-- 
		do
			create generalization.make
		end
		
feature -- Access

	is_abstract: BOOLEAN

	redefined_classifier: LINKED_SET [UML_CLASSIFIER]

	generalization: LINKED_SET [UML_GENERALIZATION]

feature -- Modification

	set_is_abstract is
			-- 
		do
			is_abstract := True
		end
		
	add_generalization(a_gen: UML_GENERALIZATION) is
			-- add a generalization parent
		require
			a_gen_exists: a_gen /= Void
		do
			generalization.extend(a_gen)
		end	
		
invariant
	Generalization_valid: generalization.for_all(agent owned_element.has({UML_GENERALIZATION}))
	Redefined_classifier_valid: redefined_classifier.for_all(agent redefined_element.has({UML_CLASSIFIER}))
	
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
--| The Original Code is uml_class.e.
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
