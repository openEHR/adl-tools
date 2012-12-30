<?php
$pageOn = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>openEHR - ADL Workbench</title>
	<link rel="bookmark" href="http://www.openehr.org/downloads/ADLworkbench/workingwithtemplates" title="openEHR - ADL Workbench">
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
		
			<h1>Working with Templates</h1>
			
			<h2>Overview</h2>
			<p>Templates are a key new feature in ADL/AOM 1.5. Contrary to what one might expect, they are technically achieved by small extensions to the 1.4 vintage of ADL and the AOM - in other words, they are implemented as a kind of archetype.</p> 
			<p>Here is a short primer on archetypes and templates...</p>
			
			<h3>Archetypes</h3>
			<p>Archetypes are used to express re-usable structured data-item definitions in the form of constraints on a reference model. Archetypes are defined based on topic, independent of use context. The 'blood gases measurement' archetype for example includes all the data points that might be used in any form of blood gas observation. There are many archetypes that contain data points that relate to the same topic, but would never be used in the same situation together, e.g. in the BP measurement archetype, the systolic, diastolic and pulse pressure values are defined, but the latter is always used on its own, never with the former two. Composition of archetypes is supported via 'slots' where other archetypes can be attached. This allows decomposition and reuse. This enables the creation of larger structures consisting of a composition of smaller archetypes. Archetypes can also be specialised i.e. in the object-oriented inheritance sense, for example the heart-rate archetype can be specialised to include extra elements for fetal heart rate.</p>
			<p>Archetypes support the binding of data nodes, names and values to concepts from external terminologies. They are also multi-lingual, and support all languages that can be expressed in Unicode.</p>
			<p>Most of the examples you have seen on other pages of this help are archetypes.</p>
			
			<h3>Templates</h3> 
			<p>Templates are used to create definitions of content such as a particular document or message, required for specific use cases, such as specific screen forms, message types or reports. Typical examples include 'acute care discharge summary', 'GP referral' and radiology report'. They use archetypes by:</p>
			<ul>
				<li>Choosing a root archetype;</li>
				<li>specifying 'slot-fillers', that reference an archetype, to create the overall structure;</li>
				<li>removing unneeded archetype data items by further constraining various existence and occurrences constraints to 0..0;</li>
				<li>further constraining remaining data items in various ways, e.g. making optional data items mandatory, adjusting cardinality, refining terminology value sets;</li>
				<li>defining terminology bindings.</li>
			</ul>
			<p>Once a template is defined, it is then compiled, to produce a flattened form, i.e. the result of all the reference archetypes and templates compressed through the specialisation relationship. This is known as an operational template ('OPT'), is usually expressed in XML, and is the definitive machine-usable form of a template.</p>
			<p>Below, you will find information about example templates.</p>

			<h3>Operational Templates</h3> 
			<p>The OPT is further processed into concretely usable artefacts such as:</p>
			<ul>
				<li>XSDs for message definitions; this approach completely replaces hand-built XML message and document definitions;</li>
				<li>Code skeletons / APIs, e.g. for Java, C#, any other language ; these code skeletons provide an easy way for programmers to 'set' and 'get' the data of the specific message or document;</li>
				<li>GUI screen forms for data capture, data display;</li>
				<li>Other kinds of visualisation;</li>
				<li>Converters to published standard messages, documents etc.</li>
			</ul>
			<p>These downstream generated artefacts allow message implementers, software developers, and data managers to build software and systems without any significant training or understanding of archetypes, templates, openEHR, Snomed, or any other complex health informatics concept. Note that any of the above artefacts can be generated in any of the languages for which translations exist, allowing for example, german- and chinese-language XML schemas and programming APIs to be used in relevant environments. The data created by all of the above artefacts can always be converted back into standard openEHR data, meaning that semantic integrity has been retained, without requiring that the architectural complexity be visible in the developer space.</p>
			<p>In summary, it enables the outputs of a knowledge engineering activity, such as run by a national e-health programme or corporation, to be converted into 'everyday' developer artefacts which can be used to make software, systems and data that obey the knowledge models.</p>
		
		
			<h2>Template example</h2>
			<p>The easiest way to understand a template is undoubtedly to look at one. Follow these steps:</p>
			<ul>
				<li>Select the openEHR_examples profile (<a href="obtainingarchetypes">obtaining archetypes</a>). You should see <a href="images/template_initial.png">this</a>. The template openEHR-DEMOGRAPHIC-PERSON.t_patient_simple.v1 is shown in the template explorer, on the lower left side of the tool. Note that the identifier is just a normal archetype identifier prefixed with 't_'. This is currently an informal convention, but likely to be adopted if no problems are found with it.</li>
				<li>Select the template to compile it, you should see <a href="images/template_compiled.png">this</a>. Notice how once it is compiled, the template is also shown in the archetype explorer at the top, as a specialisation of the openEHR-DEMOGRAPHIC-PERSON.person.v1 archetype. You will also notice that sub-parts of the template are shown with a different icon, indicating that they are <em>template components</em>. See below for more on this.</li>
				<li>Select the Differential View, Node map, you will see the inclusion of various archetypes in slots defined in the parent archetype, as shown <a href="images/template_differential.png">here</a>.</li>
				<li>Now have a look at the Node map in Flat View, you will see the effect of the slot filling as shown <a href="images/template_flat.png">here</a>.</li>
				<li>To really convince yourself that the template is just a specialisation, try looking at the <a href="images/template_source.png">Source view</a> while in Differential mode.</li>
			</ul>
			<p>In the template explorer, the sub-parts of the template are visible. These are template_components, which are nothing more than archetypes designated for use only inside their parent template. What is really happening here? Consider the two things you typically want to do with a template: a) fill archetype slots with other archetypes (in other words, compose larger structures from re-usable archetype pieces) and b) further constrain the archetypes you chose to fill the slots. Now, remember that when we say 'further constrain', we mean 'further constrain for this template only', i.e. private or template-local constraints. To achieve this further constraining, you do the same thing as you always do: create a specialised archetype. However, in this case, you don't want it in the main archetype library, instead you want it associated with the parent template only. This is achieved by doing three things:</p>
			<ul>
				<li>Designating it as a template_component artefact, as can be seen in the <a href="images/template_component_source.png">Source view</a>.</li>
				<li>Locating the source file with the parent template, typically in a subdirectory dedicated to components of the template, e.g. as shown <a href="images/template_component_files.png">here</a>. At the moment there is no standard scheme for doing this, although one should emerge due to increased experience with templates.</li>
				<li>Setting the identifier to something unique to both the template and the component. At the moment, there is no agreed scheme for doing this, so the standard approach of just choosing a name has been used. One scheme for better identifiers is shown in the following example, where the template component identifier is prefixed by 't_' (since it is a kind of template) and then constructed from the concatenation of the parent template identifier, the component identifier (which is just the id of the parent archetype of the template component) and a number (since the same filler archetype might be used more than once in a given template):
				<ul>
					<li><em>Root template</em>: uk.nhs.clinical::openEHR-EHR-COMPOSITION.t_encounter_report.v1</li>
					<li><em>Template component</em>: uk.nhs.clinical::openEHR-EHR-EVALUATION.t_encounter_report-problem_description-0001.v1</li>
				</ul>
				</li>
				<li>This kind of scheme would enable tools to easily generate template component identifiers, since they are not of direct interest to human users.</li>
			</ul>
			<p>The above template is pretty simple, having only one level of slot-filling, and including only minimal constraint refinement (in the template components). The key thing to understand is that all of the features of templates are actually just features of the archetype formalism. Many are explained in the <a href="learningabout">Learning ADL 1.5 page</a>. Remember however, as described in the primer above, the use of templates is different from archetypes. Tools for authoring archetypes and templates are likely to impose restrictions on what features are available in each kind of artefact, for example to only allow slot-filling and removals in templates.</p>
 
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