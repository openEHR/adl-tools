<?php
$pageOn = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>openEHR - ADL Workbench</title>
	<link rel="bookmark" href="http://www.openehr.org/downloads/ADLworkbench/releasenotes" title="openEHR - ADL Workbench">
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
		
			<h1>Release Notes</h1>
			
			<h2>Release History</h2>

			<h3>2 Aug 2012 ADL 1.5 beta Release 8 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/1826/BRANCHES/adl1.5/">SVN rev 1826</a>) (<a href="http://www.openehr.org/issues/secure/IssueNavigator.jspa?reset=true&mode=hide&sorter/order=DESC&sorter/field=priority&resolution=-1&pid=10070&fixfor=10110">Jira</a>)</h3>
			<ul>
				<li><em>GUI changes</em>:
				<ul>
					<li>All explorers now modern Grid controls;</li>
					<li>Show archetype versions in UI;</li>
					<li>Add collapsable control panel for main GRID Tree view controls;</li>
					<li>Archetype specalisation now visualised in grey / dark grey / colour, and switchable in UI;</li>
					<li>Automatic expand to logical leaf nodes (ELEMENTs in openEHR);</li>
					<li>Add property colourisation, based on classifications defined in RM schema files;</li>
					<li>Power-expand collapsed nodes of logical leaf types that are not literally leaves in the Grid tree, e.g. ELEMENT in openEHR models;</li>
					<li>Fix the multi-column width display problem;</li>
					<li>Numerous changes to icons.</li>
				</ul>
				</li>
				<li><em>Tool behaviour changes</em>:
				<ul>
					<li>Fix bug where invalid profile on start-up caused a crash - now tool removes invalid profiles, and then opens valid profile, or else starts as for first time;</li>
					<li>Correct XML report generation dialogs and behaviour;</li>
					<li>Correct AWBPR-22 export of flat file was overwriting differential file;</li>
				</ul>
				</li>
				<li><em>Installation improvements</em>:
				<ul>
					<li>Correct problems with Windows installers, where local visual preferences (e.g. tooltips, style of visual controls etc) were being ignored.</li>
				</ul>
				</li>
				<li><em>RM Schema changes</em>:
				<ul>
					<li>Major update to CEN 13606 and TS 14796 data types schemas; the latter is distinct from the 21090 DT schema;</li>
					<li>Add property classification system to schemas: now properties can be classified as 'data' (default), 'runtime' and 'infrastructure';</li>
				</ul>
				</li>
				<li><em>Compiler changes</em>:
				<ul>
					<li>Correct errors in term-binding logic - terms can now correctly be bound to at-codes, ac-codes, paths and paths created due to use_nodes;</li>
					<li>Correct path computation where there are use_node internal references;</li>
					<li>Add support for detecting model classification in other_details part of archetype description: e.g. ["model_level"] = &lt;"reference"&gt; indicates a reference archetype a la CIMI;</li>
					<li>Remove VACMC1 error from parser (the rule which prevents member objects in a container having occurrences = 0..* when the owning attribute cardiality is limited);</li>
					<li>Fix a bug in the dADL parser that was preventing lists which have multiple members, and also a (superfluous) ellipsis are accepted silently;</li>
					<li>Add a post-parse AOM structure building stage to compiler, to allow RM-independent parsing;</li>
				</ul>
				</li>
			</ul>

			<h3>29 Jun 2012 ADL 1.5 beta Release 7 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/1757/BRANCHES/adl1.5/">SVN rev 1757</a>) (<a href="http://www.openehr.org/issues/secure/IssueNavigator.jspa?reset=true&mode=hide&sorter/order=DESC&sorter/field=priority&resolution=-1&pid=10070&fixfor=10110">Jira</a>)</h3>
			<ul>
				<li><em>GUI changes</em>:
				<ul>
					<li>Completely rewritten archetype definition visualiser, based on folding grid. Configurable colour-coded RM properties view based on RM schema attribute classifications. Context menu access to path map row for current node; ontology entry for current node. For Archetype slot nodes, the context menu includes all matching archetypes, to be displayed.</li>
					<li>Numerous changes to icons.</li>
				</ul>
				</li>
				<li><em>Integration changes</em>:
				<ul>
					<li>openEHR Terminology now imported on startup and used to correctly display DV_QUANTITY properties and other relevant constraints.</li>
				</ul>
				</li>
				<li><em>Compiler changes</em>:
				<ul>
					<li>Correct Internal Ref node validation and flattening, so that node override can be used and flattening works properly.</li>
				</ul>
				</li>
			</ul>

			<h3>29 Mar 2012 ADL 1.5 beta Release 6 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/1677/BRANCHES/adl1.5/">SVN rev 1677</a>) (<a href="http://www.openehr.org/issues/secure/IssueNavigator.jspa?reset=true&mode=hide&sorter/order=DESC&sorter/field=priority&resolution=-1&pid=10070&fixfor=10110">Jira</a>)</h3>
			<ul>
				<li><em>GUI changes</em>:
				<ul>
					<li>Improve UI for turning on and off line numbers in source and serialised views.</li>
				</ul>
				</li>
				<li><em>Output</em>:
				<ul>
					<li>Add YAML 1.1 output; validates at <a href="http://yaml-online-parser.appspot.com/">appspot online YAML parser</a>.</li>
					<ll>Correct some bugs in JSON output.</li>
					<li>Add batch generation of all output types.</li>
				</ul>
				</li>
				<li><em>Compiler changes</em>:
				<ul>
					<li>Template type template_component renamed to template_overlay.</li>
					<li>Terminologies_available part of ontology section is now ignored in 1.4 and not used in 1.5.</li>
					<li>Loosen ARCHETYPE_ID valid patterns to allow for closure names (middle part of first segment in id) to be a number like '13606'.</li>
					<li>Add support for documenting non-archetyped RM paths in the annotations section.</li>
				</ul>
				</li>
			</ul>

			<h3>29 Nov 2011 ADL 1.5 beta Release 5 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/1656/BRANCHES/adl1.5/">SVN rev 1656</a>) (<a href="http://www.openehr.org/issues/secure/IssueNavigator.jspa?reset=true&mode=hide&sorter/order=DESC&sorter/field=priority&resolution=-1&pid=10070&fixfor=10120">Jira</a>)</h3>
			<ul>
				<li><em>GUI changes</em>:
				<ul>
					<li>The Class Tool now includes a properties view, an ancestors view and a descendants view. All views contain class icons that are clickable.</li>
					<li>There is now an RM Schema meta-data viewing tool.</li>
					<li>Numerous small UI changes and improvements, including modal selection history - the Tool back and forward buttons work in a similar way to those of a web browser, no matter what the active tools is.</li>
				</ul>
				</li>
				<li><em>Reporting</em>:
					<ul>
					<li>There is now a Statistics facility at the Archetype Catalogue and Archetype Tool levels, providing detailed statistics on use of RM classes and terminology in archetypes.</li>
				</ul>
				</li>
				<li><em>Ouput formats</em>:
				<ul>
					<li>JSON is now supported as an output format for differential and flat archetypes. Note that occurrences, cardinality and existence are serialised with single Strings, e.g. "0..1", "1..*" etc.</li>
				</ul>
				</li>
			</ul>
		
			<h3>8 Sep 2011 ADL 1.5 beta Release 4 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/1603/BRANCHES/adl1.5/">SVN rev 1603</a>) (<a href="http://www.openehr.org/issues/secure/IssueNavigator.jspa?reset=true&mode=hide&sorter/order=DESC&sorter/field=priority&resolution=-1&pid=10070&fixfor=10080">Jira</a>)</h3>
			<ul>
				<li><em>GUI changes</em>:
				<ul>
					<li>The <em>GUI is now <a href="images/docking_side_by_side_definitions.png">docking-based</a></em>, allowing greater flexibility in placement of visual components.  Visually, multiple archetypes can now be loaded simultaneously, and docked side-by-side for visual comparison. This visual layout is the same model used in most modern tabbed editing and browsing tools. Underneath, the tool now properly supports multiple open archetypes and templates.
					<ul>
						<li>A new archetype tool is created either using ctrl-T (as for most web browsers) or from the new context (right click) menu available on an archetype or template in the explorer tol on the left.</li>
						<li>The language choice combo, and flat/differential view button are therefore now on each individual archetype tool, rather than being tool-wide.</li>
						<li>The status, error and statistics tools are now <a href="images/compile_1.png">docked along the bottom</a> and popup on left-click, in the manner typical of most programming IDEs.</li>
						<li>The profile chooser has moved to the top-left, in the place typically used to select 'projects' in most IDEs</li>
						<li>The 'test' tool is now shown as a <a href="images/test_tool.png">docked component</a> minimised on the right hand side, where it used to be. However, now it is a normal dockable component, so can be arranged in the same screen space as the other components, or even popped out into its own independent window, e.g. to be displayed on a separate screen.</li>
						<li>The docking tool layout is currently remembered over sessions by being saved in its own file. Because of the inherent complexity of docking and interaction with the operating system, the layout can occasionally disappear or seem non-sensical, usually due to a problem with the file. A 'reset visual layout' option is available from the View menu to correct this.</li>
					</ul>
					</li>
					<li><em>New Reference Model Browser</em>: 
					<ul>
						<li>A <a href="images/rm_schema_tool.png">new tool</a> on the left hand side of the main screen allows multiple Reference Models to be browsed and explored. Clicking on any class causes the class to be displyed in the Class Tool, in a new tab.</li>
						<li>Classes from different RMs can be <a href="images/rm_schema_tool_duplex_classes.png">viewed side-by-side</a> using different class tools and docking system to arrange the panes.</li>
					</ul>
					</li>
					<li><em>Enhanced search bar</em>: 
					<ul>
						<li>The <a href="images/address_bar.png">address bar</a> now supports searching for classes as well as archetpes, depending on which of the RM browser or Archetype Catalog is active.</li>
					</ul>
					</li>
					<li><em>Archetype definition visualisation enhanced</em>: 
					<ul>
						<li>It is now possible to include a set of RM-specific icons for <a href="images/apgar_RM_icons.png">visualising the definition tree</a>. These icons have to be located in the install area icons/&lt;rm_name&gt; directory, e.g. icons/openehr. Viewing with these icons or the generic ones is now an option available from the option dialog and also from the definition node tree.</li>
						<li>The <a href="images/apgar_RM_icons_RM_attrs.png">reference model attributes</a> can now be visualised independently of other changes to the view.</li>
					</ul>
					</li>
					<li><em>Class tool enhanceed</em>: 
					<ul>
						<li>Left-clicking on a class node in the explorer on the left populates the 'class tool' (now just another tool, tabbed with the archetype tools) with the compositional 'closure' of the chosen class. This is <a href="images/explorer_class_view.png">visualised</a> as a tree of alternating type nodes and property nodes, in a similar to the node visualisation of an archetype.</li>
						<li>Some of the class nodes are abstract, or even if concrete, have subtypes defined. Right-clicking on these nodes in the class tool, brings up a context menu containing the subtypes defined in the reference model, and selecting one causes <a href="images/explorer_class_view_subtypes.png">re-population</a> of that node in the tree downward with the chosen type.</li>
						<li>As with the archetype tool, right clicking on a class node allows a new tool to be created instead of populating the existing one. Class tools can also be delted from the docking container.</li>
					</ul>
					</li>
					<li>ADL/<a href="images/xml_serialisation.png">XML</a> serialisation version now choosable in main GUI window, rather than only in the options. This option changes the format of ADL and XML output to conform to the chosen ADL release (1.4 or 1.5)</li>
				</ul>
				</li>
				<li><em>Serialisation: dADL and rule-driven XML added</em>:
				<ul>
					<li>Empty items are no longer populated, e.g. 'contributors'.</li>
					<li>Added dADL (the openEHR object serialisation syntax, identical in aim to JSON) serialisation, where an archetype object (AOM) structure can be serialised to a pure dADL structure. A special set of P_XXX classes were added to simplify some fields, e.g. occurrences etc to Strings, since otherwise they take up many lines of dADL. The use of this feature is for post-parsed archetypes to be stored in a pure object format for fast retrieval later, bypassing the main compiler.</li>
					<li>Added proof-of-concept XML serialisation, also based on the P_XXX classes, as well as a rule file which enables control over XML what object properties are output as XML attributes, and other options. This XML is not currently synchronsed to either the published ADL 1.4 XSD, or any ADL 1.5 XSD.</li>
				</ul>
				</li>
				<li>Compiler
				<ul>
					<li>Archetype validation is now 3 phases, where the last phase operates on the flattened archetype.</li>
				</ul>
				</li>
				<li>Source code: tools upgraded to Eiffel 6.8 GPL.</li>
			</ul>
		
			<h3>14 Jan 2011 ADL 1.5 beta Release 3 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/1405/BRANCHES/adl1.5/">SVN rev 1405</a>) (<a href="http://www.openehr.org/issues/secure/IssueNavigator.jspa?reset=true&mode=hide&sorter/order=DESC&sorter/field=priority&resolution=-1&pid=10070&fixfor=10073">Jira</a>)</h3>
			<ul>
				<li>Archetype annotations implemented:
				<ul>
					<li><a href="learningabout#annotations">details</a>;</li>
					<li><a href="http://www.openehr.org/svn/knowledge2/TRUNK/archetypes/ADL_1.5_test/validity/annotations/">example archetypes</a>;</li>
					<li>specifications: <a href="http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/rm/common_im.pdf">common IM (section 7)</a>, <a href="http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/am/adl1.5.pdf">ADL 1.5 (section 9.8)</a>;</li>
				</ul>
				<li>More flexible RM schemas, now nestable and clearer syntax (<a href="toolconfiguration#rmschemaconfiguration">details</a>);</li>
				<li>Signficantly improved GUI:
				<ul>
					<li><a href="images/overview.png">main screen</a>;</li>
					<li>Easier loading and viewing of RM schema files, with <a href="images/options_rm_schema_config.png">new dedicated dialog</a>;</li>
					<li><a href="images/repository_setting.png">Improved dialog</a> for configuring repository profiles;</li>
					<li>fixed various bugs, including wrong UTF rendering in keywords and contributors, archetype and template selection problems;</li>
				</ul>
				</li>
				<li>Added initial version of OPERATIONAL_TEMPLATE class;</li>
				<li>Fixed a bug in path generation;</li>
				<li>Migrate to dADL format configuration .cfg file, providing greater readability and flexibility <a href="toolconfiguration#cfgfile">(details)</a>;</li>
				<li>Upgraded source code to Eiffel 6.7.</li>
			</ul>
		
			<h3>28 Sep 2010 ADL 1.5 beta Release 2 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/1247/BRANCHES/specialisation/">SVN rev 1247</a>):</h3>
			<ul>
				<li>Added regression testing facility so that any archetype can now include in its description section an expected compilation result,
				such as 'PASS', 'FAIL', or a validity code e.g. 'VSONIL'. This enables all the current test archetypes
				(found <a href="http://www.openehr.org/svn/knowledge2/TRUNK/archetypes/">here</a>) to be used by any compiler
				in any language in the same way. The ADL Workbench now has a button which turns on this facility on the test page.
				See <a href="testtool">Test tool page</a> for details;</li>
				<li>Fixed bugs that prevented constraint bindings being read in correctly, and also errors being correctly reported from the parsing of the archetype ontology;</li>
				<li>improve validation of languages, now minimally enforce IETF language-tag format (<a href="http://tools.ietf.org/html/rfc5646">RFC 5646</a> - this
				is the one that defines strings like "en" and "en-GB". This class contains functions for exact matching, validation and matching a language subtag e.g.
				"en" to a full tag e.g. "en" or "en-GB", "en-AU" etc);</li>
				<li>fixed a bug in the 2nd pass validator that was sometimes preventing subtrees in specialised archetypes from being correctly validated against
				their correspondents in parent archetypes</li>
				<li>Fix various launch / shut-down / minimise annoyances, especially on multiple screen systems;</li>
				<li>Fix node map rendering problem where multiple value attributes with existence = 1 not showing up in red but pink.
				Existence is now taken into account for this rendering.</li>
				<li>Added profile chooser combo box to archetype explorer on main page;</li>
				<li>Archetype id search facility added to id control on main page. This allows any id substring to be matched to available archetypes,
				generating a picklist for the user. E.g. the user could enter 'exam' and the list will show all archetypes containing this string;</li>
				<li>Improved validation for VSONIR cases; comparison of ranges for existence, occurrences and cardinality comparison in
				specialised archetype validation no longer treats equal ranges as a legal redefinition (since in terms of constraint logic,
				only strictly narrower ranges are valid redefinitions);</li>
				<li>moved error database to files under $app_install/error_db;</li>
				<li>Addition and refactoring of code base to create new applications:
				<ul>
					<li>GUI Dadl testing app;</li>
					<li>ADL compiler app simulating app, designed to show within the Eiffel environment what kind of calls an application (possibly written
					in another language) would make to use the compiler;</li>
					<li>ADL compiler C lib-generating, which generates the compiler as a pure C library in both static and dynamic link forms, with all GUI removed.
					This can be directly inked in with applications written in C, C++, Java, via JNI, or any .Net language.</li>
					<li>Example application written in C using the statically linked form of the above library, to illustrate its use.</li>
				</ul>
				</li>
				<li>Release notes now displayed in default browser at installation time;</li>
				<li>Updates to help pages, including Mac installer and regression test facility.</li>
			</ul>


			<h3>11 Aug 2010 ADL 1.5 beta Release 1 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/1105/BRANCHES/specialisation/">SVN rev 1105</a>):</h3>
			<ul>
				<li value="0">Improved validation, with code-based error messages matching ADL and AOM 1.5 <a href="http://www.openehr.org/svn/specification/TRUNK/publishing/roadmap.html">draft&nbsp;specifications</a> (see bottom of page);</li>
				<li value="0">Support for referencing from one archetype to another without slots;</li>
				<li value="0">Support for ADL 1.5 templates, including slot-filling and exclusions;</li>
				<li value="0">Separate explorers for archetypes and templates;</li>
				<li value="0">Multiple RM schemas can be loaded and managed in the options dialog;</li>
				<li value="0">Archetype files can now be arranged anywhere on the file-system; compiler uses RM and specialisation relationships to build directory in tool;</li>
				<li value="0">Repositories are now defined / selected using profiles;</li>
				<li value="0">Archetype search facility;</li>
				<li value="0">An initial 13606 schema is available, allowing validation of EN 13606 archetypes.</li>
				<li value="0">Test function changed to prevent any .adl file overwriting; instead, outputs files for viewing
				in diff tools.</li>
			</ul>

			<h3>22 Mar 2009 ADL 1.5 Preview Release 1.5.0 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/851/BRANCHES/specialisation/">SVN rev 851</a>):</h3>
			<ul>
				<li value="0">performs stricter validation than previous versions, now reporting 40 syntax errors, 47
				validity errors, and 4 validity warnings.</li>
				<li value="0">Errors are more clearly differentiated into the following categories:</li>
				<li style="LIST-STYLE-TYPE: none; DISPLAY: inline" value="0">
				<ul>
					<li value="0">syntax error: the file is not valid ADL - shown in red</li>
					<li value="0">validity error: the archetype semantics are not valid when validated against parent
					archetypes and the reference model - shown in orange</li>
					<li value="0">validity warning: the semantics are valid, but there are redundant elements or other small
					issues to correct - shown in yellow</li>
					<li value="0">passed - shown in green</li>
				</ul>
				</li>
				<li value="0">improved error reporting.</li>
				<li value="0">it now uses the reference model (RM) to validate all archetypes. The reference model is
				currently expressed in a custom meta-model format which is much simpler than UML 2 based meta-models, e.g.
				XMI (<a href=
				"http://www.openehr.org/wiki/display/dev/Machine-readable+model+representations+of+openEHR">why</a>?). The
				meta-model can be found <a href="http://www.openehr.org/svn/knowledge2/TRUNK/rm_schemas/">here</a>. Both the
				location of this file, and its design may change in the future, and its current format should not be taken as
				normative for openEHR.</li>
				<li value="0">RM attributes are now shown in the node map visualisation (<a href=
				"images/rm_differential.png">differential form</a>, <a href="images/rm_flat.png">flattened form</a>). In the
				differential view, only attributes defined on the concrete class mentioned in the archetype are shown; in the
				flat view, all inherited attributes are shown.</li>
				<li value="0">A new&nbsp;test has been added to the test page that allows original ADL fles to be overwritten
				with the result of the flattening operation on archetypes. THIS IS EXPERIMENTAL and should be used with care
				- it will really overwrite ADL files, so be sure to use it in a version-controlled context, such as SVN
				(where you can conveniently then see diffs of the files). For this reason, both the &#39;Save ADL&#39; and
				&#39;Save ADLS&#39; tests now require checkboxes to be checked before they will operate. The intention of the
				new &#39;Save ADL&#39; operation is to experiment with removal of some kinds of errors from legacy ADL
				fles.</li>
			</ul>

			<h3>02 Apr 2008 Release 1.4.1 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/TAGS/Release-1.4.1">SVN rev 599 / TAG Release-1.4.1</a>)</h3>
			<ul>
				<li value="0">The Archetype workbench now functions as a compiler over the entire archteype
				&#39;directory&#39; (the merged result of the reference and work repositories). With a single command
				(F7; build repository), all archetypes are compiled, and an error report built up which can be perused at
				any time. Slot relationships between archetypes are now shown, as are statistics for the
				repositories.</li>
				<li value="0">user history of archetypes visited;</li>
				<li value="0">The workbench now works using two kinds of files: differential &#39;source&#39; files
				(.adls extension) and flat files (.adl extension). Previously, .adl files were treated as the source of
				all archetypes. There are now two kinds of files:
				<ul>
					<li value="0"><span style="FONT-WEIGHT: bold">.adls file</span>: this will become the
					&#39;source&#39; file type for all archetypes.&nbsp;</li>
					<li value="0"><span style="FONT-WEIGHT: bold">.adl file</span>: this will become the file type
					for&nbsp;the &#39;flat&#39; &nbsp;view of an archetype. In the future, .adl files will no longer be
					stored, but will be generated on the fly.</li>
				</ul>
				</li>
				<li value="0">for existing archetype repositories consisting of .adl files, the .adl file will be treated
				as the initial source. A .adls file will be generated once only for each .adl file, and from then on, the
				.adls file will be used as the source.</li>
				<li value="0">slot and used-by maps;</li>
				<li value="0">repository statistics;</li>
				<li value="0">numerous GUI improvements;</li>
				<li value="0">repository export to HTML.</li>
			</ul>

			<h3>09 Apr 2007 Release 1.4.0 (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/203/TRUNK/">SVN rev 203</a>):</h3>
			<ul>
				<li value="0">Unicode support (see test/family_history archetype example in farsi);</li>
				<li value="0">improve speed of GUI display;</li>
				<li value="0">correct bugs with icon loading.</li>
			</ul>

			<h3>05 Mar 2007 bug fix release&nbsp;(<a href=
			"http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/169/TRUNK/">SVN rev 169</a>):</h3>
			<ul>
				<li value="0">Support non-inclusive two-sided intervals (e.g. |0..&lt;1000|)</li>
				<li value="0">correct bug in parsing text terms used in C_CODE_PHRASE with &#39;,&#39;</li>
			</ul>
			
			<h3>02 Mar&nbsp;2007 Release (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/166/TRUNK/">SVN rev 166</a>)</h3>:
			<ul>
			  <li value="0">Upgrade ADL workbench to <span style="FONT-WEIGHT: bold">process ADL 1.4 languages section</span>, including translations - and display on &#39;description&#39; tab<br /></li>
			  <li value="0">Performs various silent upgrades on strings to turn them into CODE_PHRASEs.</li>
			</ul>

			<h3>10 Jan 2007 Release (<a href="http://www.openehr.org/svn/ref_impl_eiffel/!svn/bc/152/TRUNK/">SVN rev
			152</a>):</h3>
			<ul>
			  <li value="0">Repository merging - local and reference repositories can now be merged and viewed as one logical repository</li>
			  <li value="0">Inheritance view - the node map now shows nodes as inherited, redefined or added.</li>
			</ul>

			<h3>interim release subversion 89 - 24/aug/2006 - various small fixes</h3>
			<ul>
				<li>enhancements
				<ul>
				  <li>allow date constraint pattern yyyy-mm-xx</li>
				  <li>added language to COMPOSITION</li>
				  <li>added magnitude_status to DV_QUANTITY</li>
				</ul>
				</li>
			</ul>

			<h3>interim release Subversion 81 - 29/Jun/2006 - ISO 8601 date/time enhancements &amp; fixes</h3>
			<ul>
				<li>enhancements
				<ul>
					<li>Implement openEHR ISO8601 deviation</li>
					<li>allow &#39;W&#39; to be included in durations containing &#39;Y&#39;, &#39;M&#39; etc
					designators;</li>
					<li>allow &#39;W&#39; to be mixed in with other designators in ADL duration constraints;</li>
					<li>improve error reporting in dADL and cADL parsers for intervals whose limits are not legal</li>
					<li>Some small changes to enable reading unicode files - a BOM stripper for UTF-8 files, and UTF-8
					character matching in the dADL scanner</li>
					<li>Minor enhancements to ADL cmd line app.</li>
				</ul>
				</li>
				<li>bugfixes
				<ul>
					<li>Fix bug where adding a constraint definition when multiple languages already defined caused
					crash;</li>
					<li>Renamed ONTOLOGY.remove_term to remove_term_definition and remove_constraint to
					remove_constraint_definition, to be more obvious for developers.</li>
					<li>Small correct to allow ISO Duration strings without the &#39;T&#39; character to be silently
					fixed during by the cADL scanner;</li>
					<li>Added a hardwired lower-case converter for ISO8601 Durations to avoid culture specific case
					conversion problems.</li>
					<li>Corrected some errors in ARCHETYPE.ontology_remove_unused_codes;</li>
				</ul>
				</li>
			</ul>

			<h3>interim release Subversion 63 - 14/May/2006 ADL - 1.4 compliance</h3>
			<ul>
				<li>enhancements
				<ul>
				  <li>all ISO date/time constraint patterns now include the &#39;T&#39; where appropriate, but parser
				  tolerates a space for the moment, and silently substitutes a &#39;T&#39; on output</li>
				  <li>ISO8601 duration constraint patterns now possible. See basic_types archetype in test archetypes
				  area for examples property attribute value in C_QUANTITY dADL sections now upgraded to CODE_PHRASE as
				  defined by openEHR Archetype profile spec.</li>
				  <li>Existing archetypes with old form of property = &lt;&quot;xxxxx&quot;&gt; still parse but are
				  silently converted to property = &lt;[openehr:xxxx]&gt; (note spaces converted to &#39;_&#39; as
				  well)</li>
				  <li>clear_xxx routines added to ARCHETYPE_DESCRIPTION and ARCHETYPE_DESCRIPTION_ITEM to allow all
				  list attributes (e.g. author, keywords, details, other_details etc) to be cleared in one go.</li>
				  <li>implemented &#39;adl_version&#39; and &#39;controlled&#39; markers in ADL files. Existing ADL
				  files opened and saved with the ADL workbench or other tool using this parser will have the latest
				  ADL version written into them.</li>
				  <li>added functions to ARCHETYPE_ONTOLOGY to remove terms and constraints completely.</li>
				  <li>added a function to ARCHETYPE to generate list of unused term and constraint codes, and to delete
				  them from the ontology.</li>
				</ul>
				</li>
				<li>bug fixes:
				<ul>
				  <li>string values in dADL sections that wrap to start of next line now parse properly</li>
				  <li>all ISO date/time values in dADL and cADL now parse with proper &#39;P&#39; and &#39;T&#39;
				  characters; if no &#39;T&#39; present in value, it parses fine (for now) but a &#39;T&#39; is
				  included on output.</li>
				</ul>
				</li>
			</ul>

			<h3>interim release Subversion 47 - 02/Apr/2006</h3>
			<ul>
				<li>bug fixes
				<ul>
					<li>fixed bug where Save on archetype opened from explorer tree had wrong directory removed leading
					whitespace in dADL text fields</li>
					<li>fixed incorrectly generated logical paths in ARCHETYPE</li>
				</ul>
				</li>
			</ul>

			<h3>interim release Subversion 46 - 27/Mar/2006</h3>
			<p>All archetypes parse, save and reparse as expected except SOAP Headings.</p>
			<ul>
				<li>enhancements:
				<ul>
					<li>now can have two archetypes in memory at once, due to getting rid of current_archteype from SHARED_ARCHETYPE_CONTEXT object</li>
				</ul>
				</li>
				<li>bug fixes:
				<ul>
					<li>rewrote Assertion expression rules, removed 96 reduce/reduce conflicts in the cADL parser;</li>
					<li>fixed minor bug in path testing where a path ending in attr[obj_id] would match the OG structure when it should not</li>
					<li>assertion expressions now parse properly with rewritten grammar for boolean_expressions.</li>
					<li>dADL text containing newlines no longer cause crash; newlines are preserved through parsing.</li>
				</ul>
				</li>
			</ul>

			<h3>interim subversion release 4 - 12 Oct 2005</h3>
			<ul>
				<li>enhancements
				<ul>
					<li>more efficient implementation of DT_OBJECT_CONVERTER, which now checks far fewer types when comparing generic types</li>
				</ul>
				</li>
				<li>bugfixes
				<ul>
					<li>better structure of code with respect to use of SHARED_ADL_INTERFACE, which slved .Net DLL crash problem.</li>
				</ul>
				</li>
			</ul>

			<h3>interim release Subversion revision 3 - 23 July 2005</h3>
			<ul>
				<li>changes:
				<ul>
					<li>library package structure significantly improved. Note that this will mean that .Net users will see that many classes are in a new namespace. The main change is that the am package is now populated as described in the Archetype Object Model (AOM) documentation.</li>
				</ul>
				</li>
			</ul>

			<h3>++++++++++++++ move to subversion ++++++++++++++</h3>

			<h3>interim release BitKeeper cset 1.57 23/June/2005</h3>
			<ul>
				<li>enhancements
				<ul>
					<li>implemented CR-000138 Archetype level assertions. Updated test cases, test archetypes.</li>
					<li>minor improvements in open and save button behaviour in workbench GUI</li>
					<li>in ASSERTION_FACTORY:
					<ul>
						<li>functions &quot;create_expr_unary_operator_xxx&quot; etc replaced by one function:
                    <pre>
     create_expr_unary_operator_node(an_operator: OPERATOR_KIND; an_operand: EXPR_ITEM): EXPR_UNARY_OPERATOR
          -- operators with one operand, e.g. not x, -5 etc
        require
          an_operator_exists: an_operator /= Void
          an_operand_exists: an_operand /= Void
</pre>
					</li>
					<li>functions &quot;create_expr_binary_operator_xxx&quot; etc replaced by one function:
                    <pre>
     create_expr_binary_operator_node(an_operator: OPERATOR_KIND; 
        a_left_operand, a_right_operand: EXPR_ITEM): EXPR_BINARY_OPERATOR is
          -- operators with boolean results, e.g.
          -- and, or, xor, etc
        require
          an_operator_exists: an_operator /= Void
          a_left_operand_exists: a_left_operand /= Void
          a_right_operand_exists: a_right_operand /= Void
</pre>
					</li>
					<li>java wrapper changes: &quot;create_expr_binary_operator_xxx&quot; etc replaced by one function:
                    <pre>
   create_expr_binary_operator_node (an_operator: INTEGER; h_a_left_operand, h_a_right_operand: INTEGER): INTEGER
      -- REQUIRE
      -- an_operator_exists: {OPERATOR_KIND}.is_valid_operator(an_operator)
      -- a_left_operand_exists: a_left_operand /= void
      -- a_right_operand_exists: a_right_operand /= void
</pre>
					</li>
					<li>&quot;create_expr_unary_operator_xxx&quot; etc replaced by one function
                    <pre>
   create_expr_unary_operator_node (an_operator: INTEGER; h_an_operand: INTEGER): INTEGER
</pre>
					</li>
					<li>codes for an_operator argument given in openEHR AOM specification - the new classes OPERATOR_KIND and OPERATOR_TYPES are added. To make a call to one of the above functions, an OPERATOR_KIND object needs to be created using the c# syntax which has the effect of doing OPERATOR_KIND.make(integer value) or OPERATOR_KIND.make_from_string(string value)</li>
					</ul>
					</li>
				</ul>
				</li>
				<li>bugs:
				<ul>
					<li>some bugs remain in the java wrapping; compiles ok, but runtime errors at assertion building. - More functions need to be wrapped for ARCHETYPE_DESCRIPTION, adding invariants to ARCHETYPE etc.</li>
				</ul>
				</li>
			</ul>

			<h3>release &#39;arch_desc&#39; BitKeeper cset 1.56 19/June/2005</h3>
			<ul>
				<li>enhancements
				<ul>
					<li>implemented ARCHETYPE_DESCRIPTION class, parsing, and GUI view. Upgraded all test archetypes. - added new class DT_OBJECT_CONVERTER, which performs generic DT_ &lt;-&gt; object structure conversion. This
					enables the archetype description and any other dADL content to be converted automatically into objects, rather than requiring hand-built routines.</li>
				</ul>
				</li>
			</ul>

			<h3>interim release BitKeeper cset 1.50 01/June/2005</h3>
			<ul>
				<li>enhancements
				<ul>
					<li>News facility added: a news window will pop up the first time the workbench is used with a new version.</li>
				</ul>
				</li>
			</ul>

			<h3>interim release BitKeeper cset 1.49 30/May/2005</h3>
			<ul>
			  <li>enhancements
				<ul>
				  <li>DT structures (the internal representation of dADL sections) are all generically generated from
				  objects and are used to generate objects. This means that C_QUANTITYs, the description section and so on
				  of an archetype are all handled by the one piece of code now. The ontology section is slightly more
				  complex, since its current modelling does not correspond strictly to the object types used in the class
				  ARCHETYPE_ONTOLOGY. This will change in the future.</li>
				</ul>
			  </li>
			  <li>bug fixes
				<ul>
				  <li>numerous small bugs fixed.</li>
				</ul>
			  </li>
			</ul>

			<h3>interim release BitKeeper cset 1.48 06/May/2005</h3>
			<ul>
			  <li>bug fixes

				<ul>
				  <li>implemented interval constraints of the form |100|, i.e. point intervals. Implemented for all ordered
				  basic types, i.e. integer, real, date, date_time, time, duration. - enhancements - implemented assumed
				  values for primitive types and domain types C_QUANTITY, C_CODED_TEXT, C_ORDINAL. C_PRIMITIVE and all
				  subtypes, as well as C_DOMAIN_TYPE have assumed_value, default_value, has_assumed_value and
				  set_assumed_value. Workbench GUI indicates assumed values.</li>
				</ul>
			  </li>
			</ul>

			<h3>interim release BitKeeper cset 1.46 - 05 May 2005</h3>
			<ul>
			  <li>enhancements

				<ul>
				  <li>implemented assumed_value in primitive and domain types</li>
				</ul>
			  </li>
			</ul>

			<h3>interim release BitKeeper cset 1.39 25/Feb/2005</h3>
			<ul>
			  <li>enhancements
				<ul>
				  <li>C_QUANTITY now allows magnitude to be absent in inline dADL, meaning open magnitude, with unit still
				  constrained - support dADL2 style syntax, including nested generics - change paths to include anonymous
				  nodes - bug fixes - an error whereby archetypes with include and exclude lists sent the parser into an
				  infinite loop is fixed. - empty C_DOMAIN_TYPE sections now parse, e.g. {C_QUANTITY &lt;&gt;} - embedded
				  C_DOMAIN_TYPE sections with sibling non-C_DOMAIN_TYPE sections now parse properly</li>
				</ul>
			  </li>
			</ul>

			<h3>interim release cset 1.38 - 19 Jan 2005</h3>
			<ul>
			  <li>changes
				<ul>
				  <li>complete JNI wrapping for ADL parser. Many fixes in parser. See http://www.deepthought.com.au for
				  documentation on JNI wrapping for Eiffel / C. - it is now recommended that users download the BitKeeper
				  repository for this project, since it contains the proper java directory structure. - this directory
				  still contains the correct DLL, but will be replaced in the near future by a proper distribution
				  server.</li>
				</ul>
			  </li>
			</ul>

			<h3>interim release BitKeeper cset 1.32 - 29 July 2004</h3>
			<ul>
			  <li>changes
				<ul>
				  <li>CADL_FACTORY class routine create_archetype_slot replaced by two routines
				  create_archetype_slot_anonymous and create_archetype_slot_identified</li>
				</ul>
			  </li>
			</ul>

			<h3>interim release BitKeeper cset 1.27 - 19 September 2004</h3>
			<ul>
			  <li>enhancements
				<ul>
				  <li>finished inline dADL support for C_DOMAIN_TYPE subtypes; correctly serialises now; use of parantheses
				  corrected - file names for serialisations other than ADL now replace the &#39;.adl&#39; extension at the
				  end rather than just appending &#39;.html&#39;, &#39;.xml&#39; or whatever..:wq - bug fixes - fix crash
				  if icon not available (black square now shows, plus message indicating which icon missing).</li>
				</ul>
			  </li>
			</ul>

			<h3>interim release BitKeeper cset 1.25 - 05 May 2004</h3>
			<ul>
			  <li>changes
				<ul>
				  <li>Renaming and re-arrangement of all classes and some attributes, as follows:
					<ul>
					  <li>CADL classes
						<ul>
						  <li>CADL_ITEM -&gt; ARCHETYPE_CONSTRAINT</li>
						  <li>CADL_OBJECT_ITEM -&gt; C_OBJECT</li>
						  <li>type_name -&gt; rm_type_name</li>
						  <li>CADL_NODE removed</li>
						  <li>CADL_REL_NODE -&gt; C_ATTRIBUTE</li>
						  <li>attr_name -&gt; rm_attr_name</li>
						  <li>CADL_CARDINALITY -&gt; CARDINALITY</li>
						  <li>CADL_OBJECT_NODE_REF -&gt; ARCHETYPE_INTERNAL_REF</li>
						  <li>CADL_OBJECT_NODE with is_archetype_ref = True -&gt; ARCHETYPE_SLOT</li>
						  <li>CADL_OBJECT_NODE with is_archetype_ref = False -&gt; C_COMPLEX_OBJECT</li>
						  <li>CADL_OBJECT_TERM_REF with is_reference = True -&gt; CONSTRAINT_REF</li>
						  <li>CADL_OBJECT_TERM_REF with is_reference = False -&gt; C_CODED_TERM</li>
						  <li>CADL_OBJECT_SIMPLE -&gt; C_PRIMITIVE_OBJECT</li>
						  <li>C_SIMPLE -&gt; C_PRIMITIVE</li>
						  <li>ADL_ASSERTION -&gt; ASSERTION</li>
						</ul>
					  </li>
					  <li>DADL classes
						<ul>
						  <li>DADL_ITEM -&gt; DT_ITEM</li>
						  <li>DADL_NODE removed</li>
						  <li>DADL_OBJECT_ITEM -&gt; DT_OBJECT_ITEM</li>
						  <li>type_name -&gt; rm_type_name</li>
						  <li>DADL_REL_NODE -&gt; DT_ATTRIBUTE_NODE</li>
						  <li>attr_name -&gt; rm_attr_name</li>
						  <li>DADL_OBJECT_NODE -&gt; DT_COMPLEX_OBJECT_NODE</li>
						  <li>DADL_OBJECT_LEAF -&gt; DT_OBJECT_LEAF</li>
						  <li>DADL_OBJECT_QUERY -&gt; DT_OBJECT_QUERY</li>
						  <li>DADL_OBJECT_SIMPLE -&gt; DT_PRIMITIVE_OBJECT</li>
						  <li>DADL_OBJECT_SIMPLE_LIST -&gt; DT_PRIMITIVE_OBJECT_LIST</li>
						  <li>DADL_OBJECT_SIMPLE_INTERVAL -&gt; DT_PRIMITIVE_OBJECT_INTERVAL</li>
						</ul>
					  </li>
					  <li>DotNet classes
						<ul>
						  <li>DOTNET_CADL_TREE_ITERATOR -&gt; DOTNET_ARCHETYPE_ITERATOR</li>
						</ul>
					  </li>
					</ul>
				  </li>
				</ul>

				<h3>interim release BitKeeper cset 1.27 - 19 September 2004</h3>
				<ul>
				  <li>enhancements
					<ul>
					  <li>finished inline dADL support for C_DOMAIN_TYPE subtypes; correctly serialises now; use of
					  parantheses corrected - file names for serialisations other than ADL now replace the &#39;.adl&#39;
					  extension at the end rather than just appending &#39;.html&#39;, &#39;.xml&#39; or whatever. - bug
					  fixes - fix workbench crash if icon not available (black square now shows, plus message indicating
					  which icon missing).</li>
					</ul>
				  </li>
				</ul>

				<h3>interim release BitKeeper cset 1.23 - 09 September 2004</h3>
				<ul>
				  <li>GUI fixes:
					<ul>
					  <li>added option dialog; tool now asks for editor and repository path if no .cfg file found on
					  startup, and writes settings to .cfg file in startup directory - specialisated archetypes have a
					  differnt icon in archetype explorer - specialised archetype parent archetype id now shown in GUI -
					  general GUI size &amp; widget cleanup - Bug fixes: - unused parent codes in specialised archetypes no
					  longer generate warnings - Enhancements: - ASSERTION-building factory routines exposed in interface -
					  ontology sections all now save in sorted order of keys - ADL_INTERFACE has an attribute called
					  openehr_version which contains the automatically version information from the software repository -
					  useful for reporting bugs, using in &#39;about&#39; window.</li>
					</ul>
				  </li>
				</ul>

				<h3>interim release BitKeeper cset 1.3.1.30 - 29 July 2004</h3>
				<ul>
				  <li>added archetype explorer control on left side of tool - fixed error where empty term definition text
				  caused crash - corrected validation of found use_node paths - corrected error where sibling object nodes
				  with same code caused crash.</li>
				</ul>

				<h3>interim release BitKeeper cset 1.3.1.22 - 05 May 2004</h3>
				<ul>
				  <li>re-engineered object models as described in draft ADL 1.2 manual (See openEHR website). This
				  doesn&#39;t affect standalong applications but does affect the DLLs. - added ADL keywords
				  &quot;allow_archetype&quot;, to replace &quot;use_archetype&quot;, and &quot;include&quot; and
				  &quot;exclude&quot; to define allowed and excluded sets of archetypes in an archetype slot. - slightly
				  imprved visual display in GUI tool with a new icon for 1:N attributes.</li>
				</ul>

				<h3>&quot;mar2004&quot; Release - 31 Mar 2004 (BitKeeper cset 1.3.1.13)</h3>
				<ul>
				  <li>separated out .Net DLL into its own toolkit - ADL language 1.1; ADL language manual 1.1 - VB.net
				  sources updated - implements new interval syntax using &quot;||&quot;. - implementation of clinical ADL
				  types CODED_TEXT and ORDINAL conforming to syntax defined in version 1.1 of manual. - initial
				  experimental XML output for OWL as save option in ADL workbench. THis will be rewritten next version! -
				  many small bugs and limitations of DLLs fixed, allowing more powerful interrogation of the Archetype
				  ontology in memory from any .net language, or any application natively using the Eiffel backend (i.e. any
				  C/C++ app, or Java via JNI).</li>
				</ul>

				<h3>interim Release - 06 Feb 2004</h3>
				<ul>
				  <li>ADL language 1.1; ADL language manual 0.9.9 - fixed REAL output error where &quot;.0&quot; forgotten
				  for round numbers - numerous small GUI fixes</li>
				</ul>

				<h3>interim Release - 27 Jan 2004</h3>
				<ul>
				  <li>ADL language 1.0; ADL language manual 0.9.5 - added intervals as data types in dADL - intervals now
				  require &quot;|&quot; delimiters, e.g. &quot;|100..200|&quot;, &quot;|&lt;100|&quot;.</li>

				  <li>various minor bugs fixed in date/times, durations.</li>
				</ul>

				<h3>&quot;jan2004&quot; Release - 15 Jan 2004</h3>
				<ul>
				  <li>ADL language 0.95 - Ontology model completely rewritten - now has its own functional interface
				  independent of dADL. Tested with C# and VB through dotNet DLL build. - date/time types now have
				  pattern-based constraint expressions - term references in cADL and dADL no longer need version id in
				  terminlogy part - it is now optional; e.g. [ICD9AM::F72] can be used instead of [ICD9AM(2003)::F72] -
				  introduction of clinical/scientific predefined type library, including constraint types (&quot;c_&quot;
				  types) for: * Text, Coded_text, Code_phrase * Quantity, Ordinal, Countable * Partial_date, Partial_time,
				  Partial_date_time New efficient syntax for coded term constraints: [terminology_id::code1, code2, code3,
				  ...] New efficient syntax for ordinals: 0|[local::at0003], 1|[local::at0004], 2|[local::at0005] -
				  improvements in GUI validator tree rendering of archetypes: * c_ordinals shown efficiently with codes and
				  comments * c_terms shown efficiently with codes and comments * presence of invariants indicated -
				  integration of ADL back-end with Clinician&#39;s Archetype Editor via dotNet: clinician-designed
				  archetypes now save as regular ADL.</li>
				</ul>

				<h3>Initial Release - November 2003</h3>
				<ul>
				  <li>Basic validation functionality: - basic primitive types String, Integer, Real, Boolean - simple
				  version of constraints for primitive types Date, Time, Date_time - basic implementation of ontology
				  section of archetype</li>
				</ul>
		
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