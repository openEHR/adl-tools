<?php
$pageOn = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>openEHR - ADL Workbench</title>
	<link rel="bookmark" href="http://www.openehr.org/downloads/ADLworkbench/installationnotes" title="openEHR - ADL Workbench">
	<?php include 'http://www.openehr.org/panel/headpanel.php' ?>
	
</head>


<body>

<div id="MainFrame">
	
	<div id="TopPanel">
		<?php include 'http://www.openehr.org/panel/toppanel.php' ?>
	</div>
	
	<div id="TopMenu" style="text-align:left">
	
		<div class="nav">
			<?php include 'http://www.openehr.org/menu/topmenu.php' ?>
		</div>
		
	</div> 

	<div id="MainArea">
		
		<div id="SideMenu">
			<?php include 'menu/adlmenu.php' ?>
		</div>

		<div id="TextArea">
			
			<h1>Installation Notes</h1>
			
			<h2><a name="mac"></a>Mac OS X</h2>
			<p>This release of ADL Workbench requires OS X 10.9 (Mavericks).
			You can check what version of Mac OS X you have under the <em>Apple</em> menu at the top left of the screen, by selecting <em>About this Mac</em>.</p>
			<p>ADL Workbench will be installed in your <em>Applications</em> folder, under a folder called <em>openEHR</em>.</p>
			<p>When you double-click the <em>ADL Workbench</em> icon, it will start up inside <em>XQuartz</em>.
			The first time you run ADL Workbench, prerequisite software such as XQuartz will be installed if you don't have it yet.
			This may take up to 30 minutes.</p>
		  
			<h2><a name="linux"></a>Linux installation</h2>
			<p>The Linux version of ADL Workbench requires GTK+ 2.4.0 or above. You can check by typing this command: <em>pkg-config --modversion gtk+-2.0</em> The command should succeed and the version number of GTK+ should appear. If it is not 2.4.0 or above then you need to install GTK+ 2.4.0.</p>
			<p>After downloading, create a directory, extract the contents of the archive, and run <em>adl_workbench</em>.</p>
		
		</div>

	</div>

	<div id="BottomMenu">
		<?php include 'http://www.openehr.org/menu/bottommenu.php' ?>
	</div>

	<div id="BottomPanel">
		<?php include 'http://www.openehr.org/panel/bottompanel.php' ?>
	</div>

</div>

<script type="text/javascript">
var dropdown=new MENU.dropdown.init("dropdown", {id:'menu', active:'menuhover'});
</script>

</body>
</html>
