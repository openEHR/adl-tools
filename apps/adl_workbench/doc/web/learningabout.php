<?php
$pageOn = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>openEHR - ADL Workbench</title>
	<link rel="bookmark" href="http://www.openehr.org/downloads/ADLworkbench/learningabout" title="openEHR - ADL Workbench">
	<?php include '../../panel/headpanel.php' ?>
	
</head>


<body>

<div id="MainFrame">
	
	<div id="TopPanel">
		<?php include '../../panel/toppanel.php' ?>
	</div>
	
	<div id="TopMenu" style="text-align:left">
	
		<div class="nav">
			<?php include '../../menu/topmenu.php' ?>
		</div>
		
	</div> 

	<div id="MainArea">
		
		<div id="SideMenu">
			<?php include 'menu/adlmenu.php' ?>
		</div>

		<div id="TextArea">
		
			<h1>About ADL 1.5</h1>
			
			<h2>Overview</h2>
			<p>The 1.5 release of the ADL (Archetype Definition Language) formalism, and its object model counterpart, the AOM (Archetype Object Model) is a major advance on the previous 1.4 release. It fixes a number of problems with ADL/AOM 1.4, provides a unified formalism for both archetypes and templates, and adds a number of useful new features. These help pages don&#39;t attempt to provide the pedagogic basis of the formalism, which can be found in the specifications, rather it illustrates each feature of the ADL/AOM 1.5 formalism with real examples you can see for yourself. The specifications are found in the following locations.</p>
			<ul>
				<li><a href="http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/am/adl1.5.pdf">The Archetype Definition Language 1.5 (draft)</a></li>
				<li><a href="http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/am/aom1.5.pdf">The Archetype Object Model 1.5 (draft)</a></li>
				<li><a href="http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/am/dist_dev_model.pdf"><i>open</i>EHR Distributed Knowledge Development (draft)</a></li>
				<li><a href="http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/am/knowledge_id_system.pdf"><i>open</i>EHR Distributed Artefact Identification System (draft)</a></li>
			</ul>
			<p>One question you may have is: what if I am not interested in the ADL syntax? You might be using XML archetypes for example. It is important to understand the various roles of ADL, XML and the AOM. These are explained in some detail in the specifications (see below). Briefly, the ADL workbench performs most of its work using AOM structures. It also has an ADL parser and serialiser, and in the near future, will have a parser and serialiser for XML archetypes. Apart from some syntax basics, nearly all the validation carried out by the AWB is on AOM structures and has nothing to do with the ADL syntax. Additionally, ADL is a human readable syntax good for understanding the concepts and examples. However, it does not have to be used in archetype authoring or production systems - the XML form is completely equivalent.</p>

			<h3>Specifications Status</h3>
			<p>These specifications are currently in late draft (Aug 2010) and are expected to be released as Trial Specifications in the near future. Although most of the principal features have been determined and implemented, there remain a number of details which could be changed; these are indicated in the text below. Your feedback on any aspect of the specification is encouraged, and can be reported on the <a href="http://www.openehr.org/issues/browse/SPECPR">openEHR SPEC_PR Jira project</a>. Please create new issues with the &#39;ADL 1.5&#39; component specified.</p>
			<p>The remainder of this page describes the configuration of the tool for viewing the examples, and then describes in turn each of the features of ADL/AOM 1.5 grouped in the categories &#39;New features&#39; and
			&#39;Changes&#39;.</p>

			
			<h2>ADL/AOM 1.5 - New features</h2>

			<h3>Unconstrained specialisation identifiers</h3>
			<p>The identifier of a specialised archetype (and by implication template) under ADL 1.4 had to adhere to a pattern whereby the concept part of the id was a concatenation of the concept parts of all of its parents in the lineage, with the final segment being the concept of the current archetype. This restriction has been removed and the identifier of a specialised archetype or template is now the same as for any other archetype, i.e. the concept part is freely chosen. This is in line with how object-oriented source files in programming languages work, and is more sustainable and simpler for tooling. Specialisation relationships between archetypes are now solely defined by the &#39;specialisation&#39; statement in the source text, just as programming language files use an &#39;inherit&#39;, &#39;extends&#39; or similar statement. See the <a href="http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/am/knowledge_id_system.pdf">draft openEHR Knowledge Identification System document</a> for more detailed discussions about this. The practical implications are twofold: archetype and template identifiers are easier to create and manage, and there is no longer a redundancy of how specialisation is defined.</p>

			<h3>artefact_type marker</h3>
			<p>A new attribute has been added to the ARCHETYPE class to enable various instantiations of the AOM to be designated as having different design intention - &#39;archetype&#39;, &#39;template&#39;, &#39;template_component&#39;, &#39;operational_template&#39;. This allows ADL/AOM being used for archetypes, and various forms of templates.</p>
			<p>You can see this feature as follows:</p>
			<ul>
				<li>Choose the <em>openEHR_Examples</em> profile</li>
				<li>In the archetype explorer, navigate to any archetype, e.g. CLUSTER/person_additional_data_br</li>
				<li>Choose the &#39;Differential&#39; tab (top set of tabs)</li>
				<li>Choose the &#39;Source&#39; tab (second row of tabs); the keyword &#39;archetype&#39; appears at the start of the first line of the file.</li>
				<li>Now navigate to the PERSON.t_patient_simple template in the template explorer</li>
				<li>When it has compiled, you will see the &#39;template&#39; keyword in its source view</li>
				<li>Navigate to one of its children. You will see the keyword &#39;template_component&#39; in its source view.</li>
			</ul>
			<p>Via the above method, you have been viewing the archetype and template ADL source files. Of course normally you don&#39;t need to do this to understand what kind of artefact you are looking at - the explorer icons are specific to each type.</p>

			<h3>Path-based constraints for specialised archetypes and templates</h3>
			<p>All specialised archetypes and templates state their constraints in a &#39;differential form&#39; whereby new or changed elements of an archetype are defined using blocks of ADL (or XML, in the XML format) under a path. The following example is typical:</p>
        <pre>
            EVALUATION[at0000.1] matches { -- Diagnosis
                /data/items[at0002.1]/value matches
                    DV_CODED_TEXT matches {...}
                }
             }
		</pre>

			<p>This deceptively simple enhancement to ADL/AOM ensures that specialised archetypes and templates can now be properly represented and maintained by tools, compared to the previous situation where specialised archetypes contain copies of elements from the parent artefact. You can see some examples of this, as follows.</p>
			<ul>
				<li>Select the <em>CKM</em> profile</li>
				<li>Navigate in the archetype explorer to CONTENT_ITEM/CARE_ENTRY/EVALUATION/problem/diagnosis, and select the diagnosis node, which corresponds to the archetype openEHR-EHR-EVALUATION.problem-diagnosis.v1</li>
				<li>Select the &#39;Differential&#39; tab, and below it, in the &#39;Definition&#39; tab, you should see <a href="images/problem-diagnosis_diff_view.png">this</a></li>
				<li>You will see that below the top &#39;Diagnosis&#39; node, the path &#39;/data[at0001]/items&#39; appears, and below that, one redefined object node and two new object node constraints.</li>
				<li>Now select the &#39;flat&#39; tab, to see how these constraints have been correctly integrated into the structure defined by the parent archetype openEHR-EHR-EVALUATION.problem.v1, as shown <a href="images/problem-diagnosis_flat_view.png"> here</a>.</li>
			</ul>
			<p>You can also use the &#39;Source&#39; tab to see the path-based constraints in their source form. You can now navigate through the hierarchies in the archetype explorer, looking for specialised archetypes (any archetype whose parent is another archetype rather than a class), whose constraints all use the path-based definition method illustrated above. The CONTENT_ITEM/CARE_ENTRY/OBSERVATION/lab-test hierarchy for example contains numerous specialised archetypes.</p>

			<h3>&#39;before&#39; and &#39;after&#39; keywords for item ordering in containers</h3>
			<p>The &#39;before&#39; and &#39;after&#39; keywords can be used to specify the ordering of elements added to a container in a specialised archetype or template. This ensures authors can maintain ordering of all items within container attributes, including over specialisation.</p>
			<p>If you refer back to the problem-diagnosis example above in the <a href="images/problem-diagnosis_diff_view.png"> differential form</a>, you will see that the second two nodes include &#39;before&#39; and &#39;after&#39; markers respectively. The former is &#39;before [at0003]&#39; and the latter &#39;after [at0031]&#39;, indicating the nodes from the parent archetype with respect to which the new nodes should be situated. If you now choose the Flat view, with RM visibility (radio buttons on the right) set to &#39;+ class names&#39;, you will see that these two nodes are indeed situation in the correct positions with respect to the referenced nodes, as seen <a href="images/problem-diagnosis_flat+RM_view.png">here</a>.</p>

			<h3>&#39;generated&#39; marker</h3>
			<p>Used to indicate that the artefact was generated by software, rather than authored by hand. This flag will appear on any differential (.adls file extension) archetype converted from a legacy (pre-1.5) archetype (.adl extension). In addition, any generated flat form archetype (.adlf file) carries this marker. The flag primarily allows tools to detect that a source form archetype (i.e. any .adls file or its XML equivalent) was generated from a legacy file rather than an authored artefact.</p>
			<p>Most archetypes in the CKM repository when viewed in their Differential Source form (Differential and Source tabs) include the &#39;generated&#39; marked in the top line. By contrast, none of the archetypes in the ADL_1.5_test or openEHR_example repositories contain differential archetypes with the &#39;generated&#39; marker.</p>

			<h3>Exclusion of object constraints</h3>
			<p>Object constraints can be excluded, enabling templates to choose which constraints to retain for the use case of the template. Exclusion is also legal for archetypes, but is likely to be unexpected, and it is recommended that tools either prevent it or include a very clear confirmation dialog for the author. There are three ways to effect exclusion. For the examples in the following, select the <em>openEHR_examples</em> profile in the usual manner.</p>
			<ul>
				<li><em>Any attribute - complete removal</em>: if the attribute in the flat parent has existence matches {0..1}, then it is optional and can be completely removed in a specialised child. To see an example of this, follow these steps:
				<ul>
					<li>Navigate to the PERSON.t_patient_simple template in the template explorer and select it (click once).</li>
					<li>Select Differential View, Definition tab. You should see <a href="images/existence_redef_diff.png">this</a>. You will see that the final &#39;relationships&#39; attribute has been removed by setting its existence to {0}.</li>
					<li>Now select the Source view (second row of tabs), and you will see <a href="images/existence_redef_source.png">this</a>, the ADL source form of the existence exclusion constraint.</li>
				</ul>
				</li>
				<li>
				<em>Single-valued attribute - remove alternative(s)</em>: if a single-valued attribute has multiple
				alternative optional constraints defined in the flat parent archetype (occurrences matches {0..1}, {0..*}
				etc), any of these may be redefined to {0}, i.e. occurrences of zero. To see an example of this, follow
				these steps:
				<ul>
					<li><font color="#FF0000">TBD</font></li>
				</ul>
				</li>
				<li><em>Multiply-valued attribute - remove child</em>: in exactly the same way as for single-valued attributes, any optional child of a multiply-valued (container) attribute may be removed by redefining its occurrences to {0}. To see an example of this, follow these steps:
				<ul>
					<li>Navigate to the PERSON.t_patient_simple template in the template explorer and select it (click once).</li>
					<li>Still in the template explorer, open out the first sub-part of the template (the one marked /details[at0001]/items) and select the child CLUSTER.t_birth_data. You can now view the exclusions in various ways:
					<ul>
						<li>In the central archetype view area, select the &#39;Differential&#39; select Definition tab with RM visibility = &#39;Hide&#39;, you should see <a href="images/occ_redef_0_simple_view.png">this</a></li>
						<li>Now change the RM visibility to &#39;+ classes&#39;, you should see <a href="images/occ_redef_0_RM_view.png">this</a></li>
						<li>Now select the &#39;Source&#39; view you should see <a href="images/occ_redef_0_source_view.png">this</a></li>
					</ul>
					</li>
				</ul>
				</li>
			</ul>

			<h3>Negation operator for primitive type exclusions (Not yet implemented)</h3>
			<p>In specialised archetypes and templates, unneeded elements from primitive type ranges / value sets in the parent artefact can be logically removed using the !matches (&notin;) operator. This provides a convenient way to remove a small number of items from a large list.</p>

			<h3>Archetype - archetype external reference</h3>
			<p>The new C_ARCHETYPE_ROOT class in the AOM allows an archetype to refer to another archetype, without having to use a slot. To see an example, follow these steps:</p>
			<ul>
				<li>Select the ADL_1.5_test profile</li>
				<li>Navigate to and select the COMPOSITION.t_ext_ref template</li>
				<li>Select Differential View, Definition tab, and you will see <a href="images/ext_ref_diff.png">this</a>, which shows the use of the use_archetype statement to select two archetypes to be used under the attribute /content</li>
				<li>Now choose the Source view, and you will see <a href="images/ext_ref_source.png">this</a>, showing the ADL source expression. Note that the use_archetype statements mention archetype ids, but no slot identifiers (at-codes) because there was no slot defined at this point.</li>
			</ul>

			<h3>Slot redefinition semantics, including slot-filling</h3>
			<p>The semantics of redefining archetype slots in specialised archetypes and templates is defined in ADL/AOM 1.5. Slot-filling is regarded as a part of redefinition within a specialised archetype or template. A slot can be redefined by any of the following:</p>
			<ul>
				<li>specify slot-fillers;</li>
				<li>specialise the slot definition itself, for example, to reduce the set of allowable archetypes;</li>
				<li>close the slot, i.e. prevent any further slot-filling.</li>
			</ul>
			<p>Slot-filling and slot closing can be seen as follows.</p>
			<ul>
				<li>Select the <em>openEHR_examples</em> profile in the usual manner.</li>
				<li>Navigate to and select the PERSON.t_patient_simple template in the template explorer.</li>
				<li>Select Differential View, Source tabs to see <a href="images/slot_filling.png">this</a>.</li>
			</ul>

			<a name="annotations"></a><h3>Annotations section</h3>
			<p>Annotations can now be added on a per-node basis, with each annotation having one or more facets (representation = Hash&lt;T&gt;). This supports fine-grained documentation of elements of archetypes and templates. A typical annotations section looks as follows:</p>
		<pre>
annotations
  items = &lt;
    ["en"] = &lt;
      items = &lt;
        ["/data[at0001]/items[at0.8]"] = &lt;
          items = &lt;
            ["design note"] = &lt;"this is a design note on allergic reaction"&gt;
            ["requirements note"] = &lt;"this is a requirements note on allergic reaction"&gt;
            ["medline ref"] = &lt;"this is a medline ref on allergic reaction"&gt;
          &gt;
        &gt;
        ["/data[at0001]/items[at0.10]"] = &lt;
          items = &lt;
            ["design note"] = &lt;"this is a design note on intelerance"&gt;
            ["requirements note"] = &lt;"this is a requirements note on intolerance"&gt;
            ["national data dictionary"] = &lt;"NDD ref for intoleranance"&gt;
          &gt;
        &gt;
      &gt;
    &gt;
  &gt;
	</pre>
			<p>Annotations can also be added to an archetype for non-archetyped RM paths, e.g. to indicate the use or meaning of the corresponding data items within the context of that archetype.</p>
    <pre>
annotations
  items = &lt;
    ["en"] = &lt;
      items = &lt;
        ["/context/location"] = &lt;
          items = &lt;
            ["design note"] = &lt;"Note on use of the non-archteyped context/location RM element in this data"&gt;
          &gt;
        &gt;
        ["/context/health_care_facility/name"] = &lt;
          items = &lt;
            ["design note"] = &lt;"Note on use of non-archteyped context/health_care_facility/name RM element in this data"&gt;
          &gt;
        &gt;
      &gt;
    &gt;
  &gt;
	</pre>
			<p>Currently, the annotations feature implements a simple Hash of Strings, with plain String keys. Other more complex alternatives are available, e.g. where the keys are coded using at-codes, and then bound to globally standard codes within SNOMED CT or some other terminology. A discussion of these possibilities can be found <a href="http://www.openehr.org/mailarchives/openehr-technical/msg05523.html" target="_blank">here</a>.</p>
			<p>Annotations can be viewed in the Annotations tab in either differential or flat form. The example archetypes <a href="http://www.openehr.org/svn/knowledge2/TRUNK/archetypes/ADL_1.5_test/validity/annotations/">here</a>, are displayed in a grid, as in <a href="images/annotations_tab.png">this screenshot.</a></p>

			<h3>Default values (Not yet implemented)</h3>
			<p>The AOM now allows default values to be included on any node. This feature supports default value setting in templates.</p>

			<h3>Passthrough node flag (Not yet implemented)</h3>
			<p>The AOM now includes a &#39;passthrough&#39; flag on C_COMPLEX_OBJECT indicating that this node is not significant in terms of display. This allows nodes required for structuring data but otherwise redundant for screen display and reporting to be detected by rendering software.</p>

			<h3>Reference model subtype matching semantics</h3>
			<p>Specialised archetypes and templates can now redefine the reference model type of a node, e.g. DV_TEXT into DV_CODED_TEXT. This allows free text constraints to be changed to coded-only constraints.</p>

			<h3>Node congruence &amp; conformance semantics</h3>
			<p>Rules have now been defined for determining if a node in a specialised artefact is conformant (consistent) or congruent (the same as) a corresponding node in the parent. This allows proper validation of specialised archetypes and templates to be implemented.</p>

			<h3>Operational template object model</h3>
			<p>The object model of an operational template is now defined. A formal specification is now available for tooling to use, and for use in software environments.</p>

			<h3>Flattening semantics for operational templates</h3>
			<p>The rules for generating an operational template from source template &amp; archetypes are now defined. This means that tools can implement a reliable transform from source artefacts to the operational artefact.</p>

			<h3>Group construct (Not yet implemented)</h3>
			<p>This feature supports groups within container attributes. Original proposal on <a href="http://www.openehr.org/wiki/display/spec/Ordering+and+choice+in+archetypes+and+templates">this page</a>.</p>

			
			<h2>Changes</h2>

			<h3>Existence and cardinality are now optional</h3>
			<p>Due to reference model checking, the ADL 1.4 semantics of mandatory defaults for existence and cardinality have been removed; now the reference model is always used to determine the underlying existence and cardinality of an attribute. Archetypes and templates now only carry existence and cardinality if it is different from the reference model.</p>

			<h3>Rules for at-codes</h3>
			<p>Rules have been stated for when at-codes need to be specialised, according to the changes stated in the specialised artefact. Editing tools can determine correct node ids in specialised artefacts.</p>

			<h3>Invariants and declarations merged into rules</h3>
			<p>A single &#39;rules&#39; section is now used to contain invariant and declaration statements, which define constraints over multiple nodes in the artefact. The formalism and model of rules has been substantially improved. Simplifies overall artefact structure; allows constraints to refer to external entities, such as patient data, time etc.</p>

			<h3>Terminology_extract section added to Ontology (Not yet implemented)</h3>
			<p>A terminology_extract sub-section is now included in the ontology section of an archetype, enabling codes &amp; rubrics from terminology to be included. Mostly used for templates. Templates can directly include small extracts of external terminologies, making them standalone for such value-sets.</p>

			<h3>Representation for ref set reference (Not yet implemented)</h3>
			<p>A final addition is needed to either the AOM or the openEHR Profile model, of a class that defines how to represent a resolved reference to an external terminology; this class would replace a CONSTRAINT_REF node from a source template in an operational template. The benefit is that external ref-set references will be resolved in an operational template.</p>

			<h3>Semantic slot type (Not yet implemented)</h3>
			<p>See this sub-page for a discussion on the advanced semantics of slots, and how it simplifies templates.</p>

			<h3>node ids for C_DV_QUANTITY in ADL (Not yet implemented)</h3>
			<p>Currently we cannot put a node-id on a dADL node like a C_DV_QUANTITY, or a special syntax node, like C_DV_ORDINAL or C_CODE_PHRASE. This does not affect the AOM or XML serialised form.</p>

			<h3>Rules syntax (Xpath-based) (TODO)</h3>
			<p>TBD</p>

			<h3>Node_id optionality</h3>
			<p>Currently node_id is specified as mandatory on all nodes. However, this is not semantically needed, andcreates unnecessarily long paths which don&#39;t map cleanly to the equivalent XML Xpaths. ADL 1.5 defines precise rules for when node_ids are mandatory.</p>
		
		</div>

	</div>

	<div id="BottomMenu">
		<?php include '../../menu/bottommenu.php' ?>
	</div>

	<div id="BottomPanel">
		<?php include '../../panel/bottompanel.php' ?>
	</div>

</div>

<script type="text/javascript">
var dropdown=new MENU.dropdown.init("dropdown", {id:'menu', active:'menuhover'});
</script>

</body>
</html>