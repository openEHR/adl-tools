<?php
$pageOn = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>openEHR - ADL Workbench</title>
	<link rel="bookmark" href="http://www.openehr.org/downloads/ADLworkbench/toolconfiguration" title="openEHR - ADL Workbench">
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
		
			<h1>Tool Configuration</h1>
			
			<h2>Set-up</h2>
			<p>In order to work with the examples described below, the following configuration is advised. Experienced users may skip this step.</p>
			
			<a name="rmschemaconfiguration"></a><h3>RM Schema configuration</h3>
			<p>Reference Model (RM) Schemas are used by the ADL Workbench to validate archetypes and templates. Schemas are currently expressed as dADL documents, whose structure follows a simple yet powerful meta-model	(for those familiar with model infrastructures, neither UML/XMI nor Eclipse/EMF are currently used, because they lack proper semantics for generic types and some forms of type referencing common in object models). The schema files have a '.bmm' (basic meta-model) extension. The currently available RM schemas can be seen <a href="http://www.openehr.org/svn/knowledge2/TRUNK/rm_schemas/">here</a>. These schemas are defined in a nested way, with most files visible here being used as component schemas for a small number of top-level schemas representing the openEHR Reference Model, EN13606 model and so on.</p>
			<p>You will need to have all the relevant RM schemas selected for the repository profiles described above to work. Assuming you have followed the above instructions, you do this as follows:</p>
			<ul>
				<li>Select the RM Schemas menu &gt; Configure Schemas...</li>
				<li>Ensure that the openehr, adltest, and en13606 (if relevant) schemas are checked, as shown <a href="images/options_rm_schema_config.png">here</a>.</li>
				<li>Save the configuration.</li>
			</ul>
			<p>You can now use <a href="images/profile_combo.png">the profile combo selector above the archetype explorer</a> to switch between the profiles. The remaining sections below describe how to see the ADL/AOM 1.5 changes using the archetypes you have configured above.</p>
			
			<a name="archedconfig"></a><h3>Using the Archetype Editor with the AWB</h3>
			<p>The <a href="http://www.openehr.org/new-ws/site/downloads/archetypeeditor/home">Archetype Editor</a> can be configured as the standard editor for individual archetypes, when the 'Edit' button is selected. All that is required is that the Archetype Editor is installed, and it is associated with files of the '.adl' extension. Then the following configuration variable can be set to use the standard launch command for a file of the given extension:</p>
<pre>
commands = &lt;
	editor_app_command = &lt;"cmd /q /d /c start \"\" /b"&gt;
&gt;
</pre><br/>
			<p>With this set, if the user clicks on the 'Edit' button for any archetype for which there is a legacy (.adl, i.e. pre-ADL 1.5) expression, then this command will be run for that file. If another tool were to be associated with the .adl extension, it would be run instead.</p>
		
		
			<a name="cfgfile"></a><h2>The .cfg file</h2>
			<p>The result of the above configuration creates entries in the application configuration file, which will be in one of the following places, depending on your operating system:</p>
			<ul>
				<li>Windows XP/Vista: C:\Documents and Settings\&lt;username&gt;\AppData\Local\openEHR\adl_workbench\adl_workbench.cfg</li>
				<li>Windows 7: C:\Users\&lt;username&gt;\AppData\Local\openEHR\adl_workbench\adl_workbench.cfg</li>
				<li>Mac OSX: $HOME/openEHR/adl_workbench/adl_workbench.cfg</li>
				<li>Linux: $HOME/openEHR/adl_workbench/adl_workbench.cfg</li>
			</ul>
			<p>This file is in dADL format, and will typically include lines such as the following, corresponding to the above configuration.</p>
<pre>
file_system = &lt;
	html_export_directory = &lt;"C:\\Users\\Thomas\\AppData\\Local\\openEHR\\adl_workbench\\html"&gt;
	test_diff_directory = &lt;"C:\\Users\\Thomas\\AppData\\Local\\openEHR\\adl_workbench\\diff_test"&gt;
	rm_schema_directory = &lt;"C:\\project\\openehr\\knowledge2\\TRUNK\\rm_schemas"&gt;
&gt;
commands = &lt;
	text_editor_command = &lt;"C:\\Program Files\\Vim\\vim72\\gvim.exe"&gt;
	editor_app_command = &lt;"cmd /q /d /c start \"\" /b"&gt;
	difftool_command = &lt;"\"C:\\Program Files\\winmerge\\winmerge.exe\" /e /u"&gt;
&gt;
profile = &lt;
	current_profile_name = &lt;"adl_test"&gt;
	profiles = &lt;
		["CKM"] = &lt;
			reference_repository = &lt;"C:\\project\\openehr\\knowledge\\archetypes\\CKM"&gt;
		&gt;
		["Singapore"] = &lt;
			reference_repository = &lt;"C:\\project\\SG_MOHH\\controlled\\50.Deliverables\\07.Knowledge\\Repository\\Reference"&gt;
			work_repository = &lt;"C:\\project\\SG_MOHH\\controlled\\50.Deliverables\\07.Knowledge\\Repository\\Working"&gt;
		&gt;
		["adl_test"] = &lt;
			reference_repository = &lt;"C:\\project\\openehr\\knowledge2\\TRUNK\\archetypes\\ADL_1.5_test"&gt;
			work_repository = &lt;""&gt;
		&gt;
		["EN13606"] = &lt;
			reference_repository = &lt;"C:\\project\\openehr\\knowledge2\\TRUNK\\archetypes\\en13606_examples"&gt;
		&gt;
		["openEHR_examples"] = &lt;
			reference_repository = &lt;"C:\\project\\openehr\\knowledge2\\TRUNK\\archetypes\\openEHR_examples"&gt;
		&gt;
	&gt;
&gt;
general = &lt;
	current_language = &lt;"en"&gt;
	error_reporting_level = &lt;9002&gt;
&gt;
gui = &lt;
	total_split_position = &lt;551&gt;
	test_split_position = &lt;617&gt;
	explorer_split_position = &lt;298&gt;
	archetype_template_split_position = &lt;599&gt;
	app_width = &lt;1456&gt;
	app_height = &lt;916&gt;
	app_x_position = &lt;-8&gt;
	app_y_position = &lt;-8&gt;
	app_maximised = &lt;True&gt;
	main_notebook_tab_pos = &lt;1&gt;
	path_filter_combo_selection = &lt;"All"&gt;
	path_view_check_list_settings = &lt;"Machine", "Nat lang", "RM Type"&gt;
	expand_node_tree = &lt;True&gt;
	show_line_numbers = &lt;False&gt;
	display_archetype_source = &lt;True&gt;
	show_entire_ontology = &lt;False&gt;
	show_technical_view = &lt;True&gt;
	show_reference_model_view = &lt;False&gt;
&gt;
compiler = &lt;
	adl_version_for_flat_output = &lt;"1.5"&gt;
	validation_strict = &lt;False&gt;
	rm_flattening = &lt;False&gt;
&gt;
rm_schemas = &lt;
	load_list = &lt;"openehr_adltest_1.0.0", "openehr_ehr_extract_2.0.0"&gt;
&gt;
</pre>
		
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