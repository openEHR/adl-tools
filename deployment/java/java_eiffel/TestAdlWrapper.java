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
 * file:        "$Source: java/test/org/openehr/archetypes/adl_jni_wrapper/SCCS/s.TestAdlWrapper.java $"
 * revision:    "$Revision$"
 * last_change: "$Date: 05/01/28 19:39:50+00:00 $"
 */

package test.org.openehr.archetypes.adl_jni_wrapper;
import org.openehr.archetypes.adl_jni_wrapper.AdlJniWrapper;

public class TestAdlWrapper
{	
	public static void main(String[] args)
	{	
		// Get Current Working Directory
		cwd = System.getProperty("user.dir");
		System.out.println("Working directory = " + cwd);
		
		// attach to the wrapper
		jAdlInterface = new AdlJniWrapper();
		
		try {
			System.out.println("openEHR version: " + jAdlInterface.jopenehr_version());
			System.out.println("ADL parser status: " + jAdlInterface.jstatus());
			System.out.println("exception_encountered: " + jAdlInterface.jexception_encountered());
			
			tc_create_archetype();

			tc_ontology_populate();
			tc_test_string_array();
			
			tc_add_languages();
	
			tc_add_nodes();

			tc_save_archetype();

			tc_parse_archetype();
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	} //main

	private static AdlJniWrapper jAdlInterface;
	
	private static String cwd;

	// --------------- parse existing archetype ------------
	private static void tc_parse_archetype() {
		String infile="openEHR-EHR-OBSERVATION.blood_pressure.v1.adl";
		String outfile="openEHR-EHR-OBSERVATION.blood_pressure.v1.owl";

		System.out.println("---------- parse existing archetype --------\n");
		System.out.println("jopen_adl_file(" + infile + ")");
		jAdlInterface.jopen_adl_file(infile);

		if(jAdlInterface.jarchetype_source_loaded() ) {
			System.out.println("\n Loaded "+ infile);
			System.out.println( "status: " + jAdlInterface.jstatus());
		}
		else
		{
			System.out.println("\n Unable to Load "+ infile);
			System.out.println("Because of "+ jAdlInterface.jstatus() );
		}

		jAdlInterface.jparse_archetype();

		if (jAdlInterface.jparse_succeeded()) {
			jAdlInterface.jsave_archetype(outfile, "html");

			if (jAdlInterface.jsave_succeeded()) {
				System.out.println("Done; result in " + outfile + "\n");
			}
			else {
				System.out.println("failed to serialise; status = " + jAdlInterface.jstatus() + "\n");
			}
		}
		else {
			System.out.println("failed to parse; status = " + jAdlInterface.jstatus() + "\n");
		}
	}

	private static void tc_save_archetype() {
		String outfile="openEHR-EHR-SECTION.post_natal_exam.v1.adl";

		System.out.println("---------- save archetype --------\n");

		if (jAdlInterface.jarchetype_is_valid()) {
			jAdlInterface.jsave_archetype(outfile, "adl");
			if (jAdlInterface.jsave_succeeded()) {
				System.out.println("Done; result in " + outfile);
			}
			else {
				System.out.println("failed to serialise; status = " + jAdlInterface.jstatus());
			}
		}
		else {
			System.out.println("Archetype not valid; status = " + jAdlInterface.jstatus());
		}
	}

	// --------------- archetype create new -----------------
	private static void tc_create_archetype() {
		jAdlInterface.jcreate_new_archetype("openehr", "ehr", "SECTION", "en");

		System.out.println("---------- created archetype --------\n");
		printArchetype();
	}
	
	// --------------- add terms to the archetype ontology ---------------
	private static void tc_ontology_populate() {
		String aCode;
		String aTerm;
		
		// add top section term
		aCode = jAdlInterface.jontology_new_non_specialised_term_code();	
		aTerm = "code = <\"" + aCode + "\">\nitems = <\n\t[\"text\"] = <\"post-natal examination headings\">\n\t[\"description\"] = <\"headings for post-natal examination note\">\n>";
		jAdlInterface.jontology_add_term_definition("en", aTerm);

		System.out.println("new term: " + jAdlInterface.jontology_term_definition("en", aCode) + "\n");

		// set id on root node
		jAdlInterface.jarchetype_set_definition_node_id(aCode);

		// add post-natal examination term
		aCode = jAdlInterface.jontology_new_non_specialised_term_code();	
		aTerm = "code = <\"" + aCode + "\">\nitems = <\n\t[\"text\"] = <\"post-natal examination\">\n\t[\"description\"] = <\"post-natal examination of mother and newborn children\">\n>";
		jAdlInterface.jontology_add_term_definition("en", aTerm);
						
		// add constraint code
		aCode = jAdlInterface.jontology_new_non_specialised_term_code();	
		aTerm = "code = <\"" + aCode + "\">\nitems = <\n\t[\"text\"] = <\"xxxx\">\n\t[\"description\"] = <\"xxxxx\">\n>";
		jAdlInterface.jontology_add_constraint_definition("en", aTerm);

		// output archetype
		System.out.println("---------- added some terms --------\n");
		printArchetype();
	}

	// --------------- test String[] returning function -------
	// output term_codes to test string array returning functions
	private static void tc_test_string_array() {
		String[] aStrArray;
		int i;

		aStrArray = jAdlInterface.jontology_term_codes();
		System.out.println("Term codes added:\n");
		for (i=0; i<aStrArray.length; i++) {
			System.out.println(aStrArray[i]);
		}
	}
	// --------------- add languages ----------	
	private static void tc_add_languages() {
		jAdlInterface.jontology_add_language_available("fr");
		
		// output archetype
		System.out.println("---------- added language 'fr' --------\n");
		printArchetype();
	}
	
	// --------------- add nodes ---------------
	private static void tc_add_nodes() {
		String aCode;
		String aTerm;
		int hAnAttrNode;
		int hAnObjNode;
		int hATermNode;
		int hTopItemsNode;
		int hNeonateSectionNode, hObjNode2, hAnArchSlot, hSlotArchPattern, hIdPatternExprLeaf;
		int hMotherSectionNode;
		int hIdExprLeaf, hMatchOp, hAnAssertion;
		
		// add name node
		hAnAttrNode = jAdlInterface.jcreate_c_attribute_single (jAdlInterface.jarchetype_definition(), "name");
		hAnObjNode = jAdlInterface.jcreate_c_complex_object_anonymous (hAnAttrNode, "CODED_TEXT");
		hAnAttrNode = jAdlInterface.jcreate_c_attribute_single (hAnObjNode, "code");
		hATermNode = jAdlInterface.jcreate_c_coded_term_from_pattern (hAnAttrNode, "local::at0000");

		// add items node
		hTopItemsNode = jAdlInterface.jcreate_c_attribute_multiple (jAdlInterface.jarchetype_definition(), "items", 
			jAdlInterface.jcreate_cardinality_make_upper_unbounded (0));

		// add neonate term
		aCode = jAdlInterface.jontology_new_non_specialised_term_code();	
		aTerm = "code = <\"" + aCode + "\">\nitems = <\n\t[\"text\"] = <\"neonate\">\n\t[\"description\"] = <\"newborn child\">\n>";
		jAdlInterface.jontology_add_term_definition("en", aTerm);
						
		// add neonate subsection
		hNeonateSectionNode = jAdlInterface.jcreate_c_complex_object_identified (hTopItemsNode, "SECTION", aCode);
		hAnAttrNode = jAdlInterface.jcreate_c_attribute_single (hNeonateSectionNode, "name");
		hObjNode2 = jAdlInterface.jcreate_c_complex_object_anonymous (hAnAttrNode, "CODED_TEXT");
		hAnAttrNode = jAdlInterface.jcreate_c_attribute_single (hObjNode2, "code");
		hATermNode = jAdlInterface.jcreate_c_coded_term_from_pattern (hAnAttrNode, "local::" + aCode);
		
		hAnAttrNode = jAdlInterface.jcreate_c_attribute_multiple (hNeonateSectionNode, "items", jAdlInterface.jcreate_cardinality_make_upper_unbounded (0));
		hAnArchSlot = jAdlInterface.jcreate_archetype_slot_anonymous (hAnAttrNode, "OBSERVATION");
		// unsolved bug with this call
		// jAdlInterface.jset_occurrences_c_object(hAnArchSlot, 
		//		jAdlInterface.jcreate_integer_interval_make_upper_unbounded (0, true));
				
		// make assertions for slot
		hIdExprLeaf = jAdlInterface.jcreate_expr_leaf_feature_call ("id");
		hSlotArchPattern = jAdlInterface.jcreate_c_string_make_from_regexp ("openehr-ehr-observation.*.*");
		hIdPatternExprLeaf = jAdlInterface.jcreate_expr_leaf_constraint (hSlotArchPattern);
		hMatchOp = jAdlInterface.jcreate_expr_binary_operator_boolean ("matches", hIdExprLeaf, hIdPatternExprLeaf);
		hAnAssertion = jAdlInterface.jcreate_assertion (hMatchOp);
		jAdlInterface.jarchetype_slot_add_include(hAnArchSlot, hAnAssertion);

		// add mother term
		aCode = jAdlInterface.jontology_new_non_specialised_term_code();	
		aTerm = "code = <\"" + aCode + "\">\nitems = <\n\t[\"text\"] = <\"mother\">\n\t[\"description\"] = <\"mother of newborn child\">\n>";
		jAdlInterface.jontology_add_term_definition("en", aTerm);
		
		// add mother subsection
		hMotherSectionNode = jAdlInterface.jcreate_c_complex_object_identified (hTopItemsNode, "SECTION", aCode);
		hAnAttrNode = jAdlInterface.jcreate_c_attribute_single (hMotherSectionNode, "name");
		hObjNode2 = jAdlInterface.jcreate_c_complex_object_anonymous (hAnAttrNode, "CODED_TEXT");
		hAnAttrNode = jAdlInterface.jcreate_c_attribute_single (hObjNode2, "code");
		hATermNode = jAdlInterface.jcreate_c_coded_term_from_pattern (hAnAttrNode, "local::" + aCode);

		hAnAttrNode = jAdlInterface.jcreate_c_attribute_multiple (hMotherSectionNode, "items", jAdlInterface.jcreate_cardinality_make_upper_unbounded (0));
		hAnArchSlot = jAdlInterface.jcreate_archetype_slot_anonymous (hAnAttrNode, "OBSERVATION");

		// unsolved bug with this call
		// jAdlInterface.jset_occurrences_c_object(hAnArchSlot, 
		//		jAdlInterface.jcreate_integer_interval_make_upper_unbounded (0, true));
		
		// add assertions for slot
		hIdExprLeaf = jAdlInterface.jcreate_expr_leaf_feature_call ("id");
		hSlotArchPattern = jAdlInterface.jcreate_c_string_make_from_regexp ("openehr-ehr-observation.*.*");
		hIdPatternExprLeaf = jAdlInterface.jcreate_expr_leaf_constraint (hSlotArchPattern);
		hMatchOp = jAdlInterface.jcreate_expr_binary_operator_boolean ("matches", hIdExprLeaf, hIdPatternExprLeaf);
		hAnAssertion = jAdlInterface.jcreate_assertion (hMatchOp);
		jAdlInterface.jarchetype_slot_add_include(hAnArchSlot, hAnAssertion);

		printArchetype();

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
 *  The Original Code is TestAdlWrapper.java
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
