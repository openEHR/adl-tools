<?php
$pageOn = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>openEHR - ADL Workbench</title>
	<link rel="bookmark" href="http://www.openehr.org/downloads/ADLworkbench/browsingandcompiling" title="openEHR - ADL Workbench">
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
		
			<h1>Browsing and Compiling</h1>
			
			<h2>The Archetype and Template Catalogues</h2>
			<p>As soon as you have specified a profile (Repository &gt; Set repository), the left-hand side explorer controls will populate and you will initially see the explorer with the reference model (RM) class hierarchy. If you have selected 'Show entire ontology in explorer?' in the Options dialog, you will see all classes from all loaded RM schemas. This can be useful for understanding the reference models. Normally you will probably not use this option. At any time, you can select a class node in the explorer, and its Reference Model definition will be displayed in flat form, i.e. compressed through inheritance.</p>
			<br/>

            <table style="BACKGROUND-COLOR: #ffffff" border="0" cellspacing="2" cellpadding="2" width="70%">
            <tbody>
			<tr valign="top">
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
                <a href="images/explorer_initial_view.png">
					<img border="0" alt="Initial view in explorer" src="images/tn_explorer_initial_view.jpg" width="110" height="200"/> </a>
                <p><em>Initial view</em></p>
				</td>
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
                <a href="images/explorer_spec.png">
					<img border="0" alt="Explorer showing specialisation" src="images/tn_explorer_spec.jpg" width="107" height="200"/> </a>
                <p><em>Specialisation view</em></p>
				</td>
			</tr>
            </tbody>
            </table>
         
		 
			<h2>Compiling archetypes</h2>
			<p>When you start the ADL Workbench, archetypes are not compiled. The easiest way to compile them is to hit F7, which will compile all of the archetypes in the currently selected repository in one go. This can be interrupted with Shift-ESC.'Compiling' means parsing, validating and flattening. Archetypes can also be compiled individually by selecting them in the explorer. Other options under the repository menu allow you to compile archetypes in selected subtrees. If you select a specialised archetype, its specialisation parents will automatically compile.</p>
			<p>If your repository has templates in it, you can compile a template in the same way. If you select a template in the Template explorer tab, you will see that all its dependencies compile, i.e. all archetypes implicated in its slot-filling and specialisation statements.</p>
			<p>If your repository contains legacy '.adl' archetypes, they will initially generate differential (.adls) source form archetypes, containing the 'generated' marker at the top. In this case, when you hit F7 or compile by another means, you will see the '(lf)' marker in the archetype explorer, indicating those archetypes whose primary form is a 'legacy flat' file. If you subsequently change either the .adl file or the .adls file with an editor, the AWB will recompile from whichever one was changed. The archetype icons in the explorer change according to their current compilation status, as shown below.</p>
			<p><a href="images/compiler_statuses.png"><img border="0" alt="Compiler statuses" src="images/tn_compiler_statuses.jpg" width="157" height="200"/> </a></p>
			<p>The compilation process performs validation on every archetype and reports errors. Errors fall into two categories: syntactic, denoted with codes starting with 'S', and validity errors, denoted with 'V' codes. The errors are shown both in the status tab and the errors tab at the bottom. The status window is shown below.</p>
			
			<table style="BACKGROUND-COLOR: #ffffff" border="0" cellspacing="2" cellpadding="2" width="70%">
			<tbody>
			<tr valign="top">
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/compile_1.png">
					<img border="0" alt="Status window" src="images/tn_compile_1.jpg" width="200" height="60"/> </a>
				<p><em>Compilation feedback</em></p>
				</td>
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/compile_2.png">
					<img border="0" alt="Status window" src="images/tn_compile_2.jpg" width="200" height="61"/> </a>
				<p><em>Compilation errors</em></p>
				</td>
			</tr>
			</tbody>
			</table>
			
			<p>The compilation errors can also be seen in the Errors tab at the bottom, classified according to type, as shown below.</p>
			<a href="images/errors_2.png">
			<p><img border="0" alt="Error tree" src="images/tn_errors_2.jpg" width="200" height="43"/> </a></p>
		  
			<h3>Metrics Report</h3>
			<p>The 'Metrics' tab provides a report of counts of archetypes, compiled archetypes, specialised archetypes and so on, for the current repository.</p>
			<p><a href="images/catalogue_metrics.png"> <img border="0" alt="Repository metrics" src="images/tn_catalogue_metrics.jpg"/> </a></p>
			<p>The 'Statistics' tab provides a statistical report of the use of RM types and prperties in archetypes, as well as terminology definitions and bindings.</p>
			<p><a href="images/catalogue_statistics.png"> <img border="0" alt="Repository statistics" src="images/tn_catalogue_statistics.jpg"/> </a></p><br/>
			
			
			<h2>Viewing an archetype</h2>
			<p>This section describes the various ways of viewing a successfully compiled archetype.</p>
			
			<h3>Descriptive meta-data</h3>
			<p>All archetypes have a number of header sections containing descriptive meta-data about the archetype. The Description tab shows all of these sections, including author details, translation information, keywords, purpose, use, misuse and so on.</p>
			<table style="BACKGROUND-COLOR: #ffffff" border="0" cellspacing="2" cellpadding="0" width="70%">
			<tbody>
			<tr valign="top">
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/description_1.png">
					<img border="0" alt="Archetype description" src="images/tn_description_1.jpg" width="200" height="157"/> </a>
				<p><em>Description sections</em></p>
				</td>
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/description_unicode.png">
					<img border="0" alt="Description unicode" src="images/tn_description_unicode.jpg" width="200" height="158"/> </a>
				<p><em>Description (unicode example)</em></p>
				</td>
			</tr>
			</tbody>
			</table>
		  
			<h3>Source (differential) and flat forms</h3>
			<p>A key point to understand is that in most views, the archetype is visible in either source (differential) or flat form.
			For non-specialised archetypes, the two forms are structurally the same. For specialised archetypes and templates,
			the source form is the same idea as for object-oriented class files (e.g. in Java, .NET, etc), i.e. it contains only
			differences with respect to the immediate specialisation parent. For both, the source form is the 'authored' form.
			The flat form is the result of 'compressing' an archetype through its specialisation lineage, i.e. the 'operational'
			form of the archetype at runtime. This 'flattening' is the same thing that happens in all object-oriented programming technologies.
			Due to flattening, we often speak of the 'flat parent' with respect to a differential archetype, which denotes all constraints so far in the lineage.</p>
			<p>From the point of view of the AWB, you can see both the differential and flat forms of an archetype visualised.
			Most of the views below can be seen in differential and flat form. Use the Differential and Flat View tabs at the top to switch.</p>

			<h3>Node map</h3>
			<p>The node map is a way of viewing the definition part of the archetype structurally.
			The definition section contains the main definitional statements of the archetype,
			and can be thought of as a visualisation of an AOM structure, that is to say, each node corresponds to an AOM node type.
			In the differential form, the node map shows only those constraints introduced by the archetype on its own.
			If it is a non-specialised archetype, these constraints are in addition to constraints implied by the reference model (cardinality,
			types etc). For a specialised archetype, the constraints are in addition to the 'flat parent',
			i.e. the notional sum of constraints so far in the specialisation lineage.
			You will notice in particular that specialised archetypes have constraints whose parent attributes are not 
			just a single attribute name like 'items', but are a path, like '/protocol', '/data/events[at0010]/items[at0023]' and so on.</p>
			
			<table style="BACKGROUND-COLOR: #ffffff" border="0" cellspacing="2" cellpadding="0" width="70%">
			<tbody>
			<tr valign="top">
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/node_map_diff_spec_no_RM.png">
					<img border="0" alt="Differential, specialised, no RM classes" src="images/tn_node_map_diff_spec_no_RM.jpg" width="200" height="123"/> </a>
				<p><em>Differential, specialised, domain view</em></p>
				</td>
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; padding-left:4em;">
				<a href="images/node_map_diff_spec_RM_classes.png">
					<img border="0" alt="Node map, differential, specialised, RM classes" src="images/tn_node_map_diff_spec_RM_classes.jpg" width="200" height="121"/> </a>
				<p><em>Node map, differential, specialised, technical view (includes RM classes)</em></p>
				</td>
			</tr>
			<tr valign="top">
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/node_map_flat_spec_no_RM.png">
					<img border="0" alt="Flat, specialised, no RM" src="images/tn_node_map_flat_spec_no_RM.jpg" width="186" height="200"/> </a>
				<p><em>Flat, specialised, technical view</em></p>
				</td>
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; padding-left:4em;">
				<a href="images/node_map_unicode.png">
					<img border="0" alt="Node map, unicode" src="images/tn_node_map_unicode.jpg" width="180" height="200"/> </a>
				<p><em>Node map, unicode</em></p>
				</td>
			</tr>
			</tbody>
			</table>
		  
			<p>Each node map node is shown in three possible forms. If the node is coloured, it is defined new within the current archetype. If it is coloured, with a yellow border, it redefines an existing node from the flat parent. If it is solid yellow/grey, it is purely inherited.</p>
			<p>You can use the radio button controls on the right to show each node in more or less detail. The 'RM visibility' radio button controls enable three categories of reference model attribute that have not been archetyped to be seen. These are as follows:</p>
			<ul>
				<li><em>Data Properties</em>: properties from the reference model that are part of the clinical data, and could be archetyped;</li>
				<li><em>Runtime Properties</em>: properties from the reference model whose values are set at runtime, and for which no useful constraint could be set in an archetype (includes all dates and times);</li>
				<li><em>Infrastructure Properties</em>: properties from the reference model that do not represent clinical data, but are used to manage data representation, identification, versioning etc.</li>
			</ul>
		  
			<p>The classifications of RM properties are defined in the reference model schemas and can be modified independently of the tool or any particular archetype.</p>
			<table style="BACKGROUND-COLOR: #ffffff" border="0" cellspacing="2" cellpadding="0" width="70%">
			<tbody>
			<tr valign="top">
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/rm_differential.png">
					<img border="0" alt="RM properties, differential form" src="images/tn_rm_differential.jpg"/> </a>
				<p><em>RM properties (differential form)</em></p>
				</td>
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; padding-left:4em;">
				<a href="images/rm_flat.png">
					<img border="0" alt="RM properties, flat form" src="images/tn_rm_flat.jpg"/> </a>
				<p><em>RM properties (flat form)</em></p>
				</td>
			</tr>
			</tbody>
			</table>
		  
			<h3>Path map</h3>
			<p>Archetype definitions are inherently hierarchical structures, and as a consequence a set of paths can be extracted from any archetype. This 'path map' is the basis for all queries written in AQL or a-path. Every node in an archetype is guaranteed to have a unique path. If you select the path map in the differential and flat forms, you will see the larger number of paths being extracted from the latter.</p>
			<table style="BACKGROUND-COLOR: #ffffff" border="0" cellspacing="2" cellpadding="0" width="70%">
			<tbody>
			<tr valign="top">
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/paths_body_temp_diff_nat_lang.png">
					<img border="0" alt="Paths, natural language" src="images/tn_paths_body_temp_diff_nat_lang.jpg" width="200" height="106"/> </a>
				<p><em>Path map, natural language paths</em></p>
				</td>
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/paths_body_temp_diff_machine.png">
					<img border="0" alt="Path map, machine codes" src="images/tn_paths_body_temp_diff_machine.jpg" width="200" height="111"/> </a>
				<p><em>Path map, machine paths</em></p>
				</td>
			</tr>
			<tr valign="top">
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/paths_diff_heart_rate_machine.png">
					<img border="0" alt="Path map diff parent" src="images/tn_paths_diff_heart_rate_machine.jpg" width="200" height="137"/> </a>
				<p><em>Path map, parent archetype</em></p>
				</td>
				<td style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px">
				<a href="images/paths_heart_rate-pulse_flat_machine.png">
					<img border="0" alt="Path map, flat child" src="images/tn_paths_heart_rate-pulse_flat_machine.jpg" width="200" height="134"/> </a>
				<p><em>Path map, flat child archetype</em></p>
				</td>
			</tr>
			</tbody>
			</table>
			
			<p>Paths are crucial to manipulating archetypes at runtime, and also to building queries. The path syntax is a slightly reduced form of XPath syntax, and can be converted to standard XPath for XML-based processing.</p>
			<p>For specialised archetypes, the Path Map under the differential view shows only paths in structures introduced in the specialised archetype, while the path map in the flat view shows paths due to all inherited nodes as well.</p>
			<p>The columns of the display can be controlled using the check boxes on the right, and are as follows:</p>
			<ul>
				<li>physical paths: paths containing [atnnnn] codes, used by the software </li>
				<li>logical paths: paths with [atnnnn] codes replaced by the human-readable values from the ontology </li>
				<li>RM Type: the Reference Model type constrained by the node corresponding to the displayed path </li>
				<li>AOM Type: Archetype Object Model type - this is the type of the archetype node, usually only of interest to implementers </li>
			</ul>
			<p>Paths can be selected and saved to the clipboard for use in other tools, by selecting rows (including multiple rows, by using the Ctrl key) and then using Ctrl+C (copy) to copy to the clipboard. The clipboard contents can be viewed from the Edit menu.</p>
          
			<h3>Slot map</h3>
			<p>Some archetypes contain slots, which are joining points to other archetypes. A slot is defined as a constraint that specifies the possible archetypes that may be used at this point. We can think of the archetypes that could fill the slot as 'suppliers', i.e. archetypes that this archetype uses, and archetypes having slots which the current archetype matches as 'clients'. The ADL Workbench evaluates the slots and displays both of these lists, as shown below.</p>
			<p><a href="images/slots_1.png"><img border="0" src="images/tn_slots_1.jpg" width="180" height="200"/> </a></p>
			
			<h3>Terminology</h3>
			<p>All archetypes contain an internal terminology, consisting of one or more 'at-codes'. They may also include constraint codes ('ac-codes'), and bindings between both of these and external terminologies and other ontology resources. These elements are found in the 'ontology' section of the archetype, such as shown here.</p>
			<p><a href="images/ontology.png"><img border="0" src="images/tn_ontology.jpg" width="200" height="116"/> </a></p>
			
			<h3>Source view</h3>
			<p>The source of an archetype can be viewed in the 'Source' tab, regardless of whether it has compiled successfully or not. This is mainly useful for debugging.</p>
			<p><a href="images/archetype_source_view.png"><img border="0" src="images/tn_archetype_source_view.jpg"/></a></p>
			
			<h3>Serialised views: ADL, dADL, XML, JSON</h3>
			<p>Compiled archetypes can be viewed in various serialised formats, which can be used for testing ADL, XML, JSON and other software components. In both differential and flat forms, any compiled archetype can be viewed as ADL, dADL, XML and JSON. The dADL form is equivalent to a DOM tree in XML, but more regular.</p>
			<p><a href="images/source_1.png"><img border="0" src="images/tn_source_1.jpg" width="200" height="173"/></a></p>
			<p>The output in the XML view can be controlled by a set of rules accessible from the XML menu.</p>
			
			<h3>Validity report</h3>
			<p>The 'Validity' tab displays any compiler messages for the archetype.</p>
			
			<h3>Statistics report</h3>
			<p>The 'Statistics' tab displays a statistics report for RM class and terminology usage in the archetype.</p>
			<p><a href="images/archetype_statistics.png"><img border="0" src="images/tn_archetype_statistics.jpg"/></a></p>
		
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