/*
 * component:   "openEHR ADL Reference Parser"
 * description: "Wrapper class for JNI-ised Eiffel reference parser"
 * keywords:    "ADL, archetype, JNI, wrapper"
 *
 * author:      "Thomas Beale <Thomas.Beale@OceanInformatics.biz>"
 * contributors:"Raju Kalidindi <Kalidindi.Raju@mayo.edu>"
 * support:     "Thomas Beale <Thomas.Beale@OceanInformatics.biz>"
 * copyright:   "Copyright (c) 2004,2005 Ocean Informatics Australia, Mayo Clinic"
 * license:     "See notice at bottom of class"
 *
 * file:        "$Source: java/org/openehr/archetypes/adl_jni_wrapper/SCCS/s.AdlJniWrapper.java $"
 * revision:    "$Revision$"
 * last_change: "$Date: 05/01/28 19:39:49+00:00 $"
 *
 * THIS VERSION ABRIDGED FROM ORIGINAL FOR DOCUMENTATION PURPOSES
 *
 */

package org.openehr.archetypes.adl_jni_wrapper;

public class AdlJniWrapper
{
	// ================= ADL_INTERFACE ============

	// -------------- general ---------------
	// constructor
	public native void 
	jmake();

	// String status of last command
	public native String 
	jstatus();

	// -------------- archetype load, parse, save ------------
	// Archetype has been parsed successfully into object structure
	public native boolean 
	jarchetype_available();

	// Create a new archetype
	// REQUIRE
	//  info_model_originator_valid: a_im_originator /= void and then not a_im_originator.is_empty
	//  info_model_name_valid: a_im_name /= void and then not a_im_name.is_empty
	//  info_model_entity_valid: a_im_entity /= void and then not a_im_entity.is_empty
	//  primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
	public native void 
	jcreate_new_archetype(String a_im_originator, String a_im_name, String a_im_entity, String a_primary_language);

	// Parse the archetype which has been loaded
	// REQUIRE
	//  jarchetype_source_loaded
	public native void 
	jparse_archetype();


	// ================== OBJECT FACTORY ====================

	// ------------- Primitive Object Creation --------------------

	// create Result from a list of strings
	// REQUIRE
	// lst /= void
	public native int 
	jcreate_c_string_make_from_string_list (String[] a_str_lst);

	// logical path set, i.e. with term definitions substituted
	public native String[]
	jarchetype_logical_paths (String a_lang);

	// -------------------------------------------------------------------
	static {	
		System.loadLibrary("adl_java_lib");
	}
}

/*
 *  ***** BEGIN LICENSE BLOCK *****
 *  Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 *  The contents of this file are subject to the Mozilla Public License Version
 *  1.1 (the 'License'); you may not use this file except in compliance with
 *  the License. You may obtain a copy of the License at
 *  http://www.mozilla.org/MPL/
 *
 *  Software distributed under the License is distributed on an 'AS IS' basis,
 *  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 *  for the specific language governing rights and limitations under the
 *  License.
 *
 *  The Original Code is AdlJniWrapper.java
 *
 *  The Initial Developer of the Original Code is Rong Chen.
 *  Portions created by the Initial Developer are Copyright (C) 2003-2004
 *  the Initial Developer. All Rights Reserved.
 *
 *  Contributor(s):
 *
 * Software distributed under the License is distributed on an 'AS IS' basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 *  ***** END LICENSE BLOCK *****
 */
