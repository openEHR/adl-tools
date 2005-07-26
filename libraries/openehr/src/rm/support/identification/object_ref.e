indexing
	component:   "openEHR Common Reference Model"
	
	description: "[
			 Class describing a reference to an object maintained outside (usually) the current 
			 namespace, e.g. in another service. Services are usually external, e.g. available in 
			 a LAN (including on the same host) or the internet via Corba, SOAP, or some other 
			 distributed protocol. However, in small systems they may be part of the same 
			 executable as the data containing the Id.
			 ]"
	keywords:    "object identifiers"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OBJECT_REF

feature -- Initialization

	make(a_namespace, a_type:STRING; an_object_id: OBJECT_ID) is
			-- build an external ID
		require
			Namespace_exists: a_namespace /= Void and then not a_namespace.is_empty
			Type_exists: a_type /= Void and then not a_type.is_empty
			Id_exists: an_object_id /= Void
		do
			namespace := a_namespace
			type := a_type
			id := an_object_id
		ensure
			Namespace_set: namespace = a_namespace
			Type_set: type = a_type
			Id_set: id = an_object_id
		end
		
feature -- Access

	id: OBJECT_ID 
			-- Globally unique id of an object, regardless of where it is stored.

	namespace: STRING
			-- Namespace to which this identifier belongs in the local system context (and possibly 
			-- in any other openEHR compliant environment) e.g. “terminology”, “demographic”. These 
			-- names are not yet standardised. Legal values for the namespace are 
			-- “local” | “unknown” | “[a-zA-Z][a-zA-Z0-9_-]*”

	type: STRING
			-- Name of the class of object to which this identifier type refers, e.g. “PARTY”, 
			-- “PERSON”, “GUIDELINE” etc. These class names are from the relevant reference model. 
			-- The type name “ANY” can be used to indicate that any type is accepted (e.g. if the 
			-- type is unknown).

	as_string: STRING is
			-- 	
		do
			
		end
		
invariant
	Id_exists: id /= Void
	namespace_exists: namespace /= Void and then not namespace.is_empty
	type_exists: type /= Void and then not type.is_empty

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
--| The Original Code is object_ref.e.
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
