<?php
$pageOn = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>openEHR - ADL Workbench</title>
	<link rel="bookmark" href="http://www.openehr.org/downloads/ADLworkbench/obtainingarchetypes" title="openEHR - ADL Workbench">
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
		
			<h1>Obtaining Archetypes</h1>
			
			<h2>Places to find archetypes</h2>
			<p>For first-time use, you will be asked to provide paths to archetypes. It helps to have already downloaded some archetypes! Useful places you can get archetypes:</p>
			<ul>
				<li><a href="http://www.openehr.org/knowledge">openEHR Knowledge Repository</a></li>
				<li><a href="http://dcm.nehta.org.au/ckm">Australian National (Nehta) Knowledge Repository</a></li>
				<li><a href="https://ckm.nca.stuba.sk/">Slovak National (STUBA) Knowledge Repository</a></li>
				<li><a href="http://www.openehr.org/svn/knowledge2/TRUNK/archetypes/">openEHR test and sample archetypes</a></li>
			</ul>
			 
			<h3>Downloading from a Clinical Knowledge Manager (CKM) site</h3>
			<p>All CKM sites work the same way, and the steps for download are as follows:</p>
			<ul>
			  <li>Login to the repository at <a href="http://www.openehr.org/knowledge">http://www.openehr.org/knowledge</a>.</li>
			  <li>Go to Archetypes &gt; Bulk Export and select all archetypes for download; save in any convenient location. For the purposes of this documentation, we will refer to the location as $CKM for each of these CKM downloads (i.e. you will probably have directores like .../openEHR_CKM, .../Nehta_CKM, etc).</li>
			</ul>

			<h3>Downloading the openEHR knowledge2 test and sample archetypes</h3>
			<p>The <i>open</i>EHR test archetype repository is a Subversion repository located <a href="http://www.openehr.org/svn/knowledge2/TRUNK/archetypes">here</a>. If you have a Subversion client such as TortoiseSVN installed on your machine, use it to check out this repository. Check this repository out to a convenient location on your computer.</p>
			<p>Now, there is actually more than one logical group of archetypes in the repository, found in the following sub-directories:</p>
			<ul>
				<li><em>ADL_1.5_test</em>: ADL 1.5 validity testing archetypes; </li>
				<li><em>CIMI</em>: Clinical Information Model Initiative proof-of-concept archetypes based on a CIMI reference model;</li>
				<li><em>en13606_examples</em>: example archetypes based on EN13606 reference model;</li>
				<li><em>openEHR_examples</em>: example archetypes based on the openEHR 1.0.2 reference model.</li>
			</ul>
			<p>Other directories will appear from time to time. Each of these directories should be treated as a separate 'repository' for the configuration steps below.</p>

			
			<h2>Setting and changing repository profiles</h2>
			<p>The Configure Repositories dialog can be used to add further profiles, remove profiles, and edit the details of a profile. The latter includes being able to rename a profile and/or change its paths. The first time you start the tool if you are a new user, you will be asked for a repository. The screen will look like this:<br/></p>
			<p><a href="images/startup_repository.png"><img border="0" alt="Repository dialog at startup" src="images/tn_startup_repository.jpg" width="200" height="151"/> </a></p>
			<p>The repository dialog is used to define the location of a repository of archetypes/templates. The 'profile' is a logical name for a 'reference' repository, and optionally, a 'work' repository.	You can create as many profiles as you like. The 'reference' repository is a directory usually containing archetypes from an external online repository, downloaded as above. These archetypes will be shown with blue icons. The optional 'work' repository is to indicate a directory under which you have archetypes/templates you are working on, which you want to keep separate. The latter can include specialisations of the archetypes found in the reference location. These archetypes will be shown with green icons.</p>
			<p>The files in each repository area can be arranged in any manner and have any filenames. When the files are read by the AWB, they are classified under the class structure of the reference model on which each archetype is based, and identified based on the identifiers found within the file content.</p>
			<p>Follow these steps to configure any of the above repisitory locations on your computer as a 'profile' in the AWB. We refer to any of these locations on your system as '$repo_dir' in the below steps.</p>
			<ul>
				<li>In the AWB, select Repository &gt; Set Repository</li>
				<li>On the dialog, use the large &#39;+&#39; button to add a new profile called &#39;xxx&#39;.</li>
				<li>Set the Reference repository to $repo_dir, as described above.</li>
				<li>Save the new profile.</li>
			</ul>
			<p>Repeat this for as many repositores as you want to load. This configuration can be revisited and modified at any time, including profile renaming.</p>
			<p>Configuring a 'work repository' as is done as follows, using the example of the openEHR example archetypes mentioned above.</p>
			<ul>
				<li>In the AWB, select Repository &gt; Configure Repositories.</li>
				<li>On the dialog, use the Add button to add a new profile called &#39;ADL 1.5 test&#39; or similar. A sub-dialog will appear on which the paths can be edited</li>
				<li>Set the Reference repository path to $knowledge2/archetypes/ADL_1.5_test.</li>
				<li>Hit OK to save the new profile.</li>
				<li>Repeat the above steps and create another new profile called &#39;openEHR examples&#39; or similar, with the following paths:
				<ul>
					<li>Set the Reference Repository to $knowledge2/archetypes/openEHR_examples/demographic_template/Reference.</li>
					<li>Set the Work Repository to $knowledge2/archetypes/openEHR_examples/demographic_template/Working.</li>
				</ul>
				</li>
				<li>Save the new profile.</li>
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