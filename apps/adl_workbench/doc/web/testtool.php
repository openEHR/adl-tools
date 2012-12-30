<?php
$pageOn = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>openEHR - ADL Workbench</title>
	<link rel="bookmark" href="http://www.openehr.org/downloads/ADLworkbench/testtool" title="openEHR - ADL Workbench">
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
		
			<h1>The Test Tool</h1>
			
			<h2>Overview</h2>
			<p>The test page in the Workbench is accessible via the &#39;Test&#39; tab on the right hand side of the tool. It enables batch execution of test or other routines built into the tool archetypes, and is mainly a facility for debugging archetypes, as well as parser logic.</p>

			
			<h2>Configuration</h2>
			<p>The only thing to configure for the test page is the location of the output files. These are various copies and serialisations of archetypes arranged to allow convenient diffing, so as to see the effect of round-trip compile-serialise cycle. To configure the location, select Tools &gt; Options, and set the diff files directory to your desired location. As shown <a href="images/test_diff_config.png">here</a>, the default location is under the platform standard user &#39;home&#39; location for the application, e.g. on Windows 7, /Users/$user/Local/$app_vendor/$app. If we denote the location you choose as $diff_test, the structure under this will be as follows:</p>
			<ul>
				<li>$profile, i.e. names of your repository profiles, e.g. &#39;CKM&#39;, &#39;ADL_1.5_test&#39;, etc</li>
				<li style="LIST-STYLE-TYPE: none; DISPLAY: inline" value="0">
				<ul>
					<li value="0">source</li>
					<li style="LIST-STYLE-TYPE: none; DISPLAY: inline" value="0">
					<ul>
						<li value="0">orig</li>
						<li value="0">new</li>
					</ul>
					</li>
					<li value="0">flat</li>
					<li style="LIST-STYLE-TYPE: none; DISPLAY: inline" value="0">
					<ul>
						<li value="0">orig</li>
						<li value="0">new</li>
					</ul>
					</li>
				</ul>
				</li>
			</ul>

			<h2>Selecting archetypes</h2>
			<p>The test page allows you to batch process as many or as few archetypes as you like. You choose them via the check-box column, with higher levels of the hierarchy being choosable in blocks via the associated check box. You can experiment with this. <a href="images/test_page_arch_select.png">Here</a> is an example showing how the EHR EVALUATION group of archetypes was chosen with two mouse clicks, first the top checkbox, to uncheck all archetypes, then the EVALUATION check-box, to check all EVALUATION archetypes. You can continue checking / unchecking to get exactly the set you want. Once you are satisfied, you can hit the Go button to start the tests running. Each test that succeeds is indicated with a green tick, failed tests with a red cross, and non-applicability with &#39;n/a&#39;.</p>

			
			<h2>What the tests do</h2>
			<p>The tests are as follows (names are in the columns).</p>
			<ul>
				<li><em>Parse</em>: perform a normal compile on the archetype; if there is only a legacy (.adl) file available, an initial .adl to .adls conversion will be done;</li>
				<li><em>Regression</em>: perform a regression comparison of the compilation results with expected results, which are encoded in the archetype details/other_deals section using the &quot;regression&quot; tag. See <a href="http://www.openehr.org/svn/knowledge2/TRUNK/archetypes/ADL_1.5_test/validity/basics/openEHR-TEST_PKG-ENTRY.VACCD_illegal_concept_code.v1.adls"> this archetype</a> for example. Regression testing is only performed if the Regression button on the user interface is selected by the user, as it involves some extra computing cost, and is only useful for test archetypes found in the test repository, or archetypes similarly including the &quot;regression&quot; item within the details/other_deals.</li>
				<li><em>Save legacy</em>: if there is a .adl (ADL 1.4) file, save it to the directory, to the directory $diff_test/$profile/flat/orig, with a &#39;.adlf&#39; extension;</li>
				<li><em>Save flat</em>: serialise the in-memory flat archetype out to the directory, to the directory $diff_test/$profile/source/new;</li>
				<li><em>Compare src</em>: perform a simple compare between the original source (.adls) file contents and the serialised source form. An exact match indicates identical file length, and usually 100% faithful round-tripping.</li>
			</ul>
			<p>The file saving operations above enable the user to make comparisons between the original and serialised (i.e. &#39;saved&#39; in the sense of a normal editor tool) forms of a source archetype, and also between the original .adl and tool-generated flattened form of an archetype (remembering that all .adl files are essentially flat-form archetypes).</p>
			
			
			<h2>Regression Testing</h2>
			<p>The regression testing facility is intended to be used with the test archetypes found in the <a href ="http://www.openehr.org/svn/knowledge2/">knowledge2 SVN repository</a>, in the TRUNK\archetypes\ADL_1.5_test directory. This directory contains 150+ archetypes designed specifically to exercise the ADL compiler. Each such archetype is hand-built to either pass or fail, exercising a specific part of the ADL 1.5 specification.</p>
			<p>Regression testing is turned via a button on the Test page, and the results show up in the second column, as shown <a href="images/test_regression.png">here</a>. A green 'tick' indicates that the regression test passed, which means that the compilation result was as indicated in the archetype. The possible results indicated within an archetype are:</p>
			<ul>
				<li>"PASS" - the archetype should pass compilation with no errors or warnings;</li>
				<li>"FAIL" - the archetype should fail compilation, typically for extremely basic syntax reasons that do not have a specific validity code;</li>
				<li>a validity code, e.g. "VACDF", taken from the AOM 1.5 specification, indicating the validity condition that this archetype violates;</li>
				<li>a warning code, e.g. "WOUC", indicating the expected warning, even though the archetype will pass compilation.</li>
			</ul>
			<p>The main purpose of regression tests is to test the compiler software, and particularly changes in the software. After any change is made, the regression tests should be executed to find any failures. The validity code being tested is indicated in the results column.</p>
			<p>The regression testing facility has been designed to be independent of any particular tool technology, and the logic implemented in the Eiffel ADL Workbench can easily be replicated in Java, .Net and other tools.</p>

			<h2>Viewing results</h2>
			<p>The files described above are saved in a way to make it convenient to look at diffs using a typical &#39;diff&#39; tool capable of diffing same-named files in sibling directories. This is useful to assess round-tripping correctness and to find bugs. For the examples here, we have used the <a href="http://winmerge.org/">open source Winmerge tool</a>, but you can use any tool you like.</p>
			<p>Based on the selection of EVALUATION archetypes in the CKM repository, here is the resulting directory structure. Below are some example diff views.</p>
	
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