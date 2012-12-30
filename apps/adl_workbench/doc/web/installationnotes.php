<?php
$pageOn = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>openEHR - ADL Workbench</title>
	<link rel="bookmark" href="http://www.openehr.org/downloads/ADLworkbench/installationnotes" title="openEHR - ADL Workbench">
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
			
			<h1>Installation Notes</h1>
			
			<h2><a name="mac"></a>Mac OS X</h2>
            <p>The following prerequisite software is needed for the Mac version of ADL Workbench:</p>
            <ul>
				<li>Confirm what version of Mac OS X you have. You can check this under the <em>Apple</em> menu at the top left of the screen, by selecting <em>About this Mac</em>.</li>
				<li>Install the latest version of <a href="http://developer.apple.com/technologies/xcode.html">Xcode Tools</a> for your Mac.</li>
				<li>Install the latest version of <a href="http://www.macports.org/install.php" rel="nofollow">MacPorts</a>.</li>
				<li>When MacPorts is installed, install <em>gtk2</em>:
				<ul>
					<li>Open a window in the Finder and go to the <em>Applications/Utilities</em> folder.</li>
					<li>Double-click <em>Terminal</em>. You now have a Terminal window open.</li>
					<li>Type the following command: <em>sudo port install gtk2 xorg-libXtst</em>.</li>
					<li>Press <em>Return</em>.</li>
					<li>When it asks you for a password, type in your administrator password.</li>
					<li>MacPorts will then install the <em>gtk2</em> library. (This will take some time, depending on the speed of your Mac.)</li>
				</ul>
				<li>Download and install the appropriate version of ADL Workbench for your Mac.</li>
			</ul>
			<p>ADL Workbench will be installed in your <em>Applications</em> folder, under a folder called <em>openEHR</em>.</p>
			<p>When you double-click the <em>ADL Workbench</em> icon, it will start up inside <em>X11</em> or <em>XQuartz</em>.</p>
		  
		  
			<h2><a name="linux"></a>Linux installation</h2>
			<p>The Linux version of ADL Workbench requires GTK+ 2.4.0 or above. You can check by typing this command: <em>pkg-config --modversion gtk+-2.0</em> The command should succeed and the version number of GTK+ should appear. If it is not 2.4.0 or above then you need to install GTK+ 2.4.0.</p>
			<p>After downloading, create a directory, extract the contents of the archive, and run <em>adl_workbench</em>.</p>
		
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