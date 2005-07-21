
openEHR ADL dotNet Toolkit
--------------------------

VERSION
	Last Change: $Date$

AUTHORS
	Thomas Beale, Sam Heard
	Ocean Informatics <www.OceanInformatics.biz>

CONTENTS
	This toolkit contains: 
		- a set of DLLs for dotNet

PURPOSE
	This package contains 3 DLLs:
		- adl_dotnet_lib.dll: the ADL reference parser, packaged as a 
		  dotNet DLL;
		- libadl_dotnet_lib.dll: helper DLL for the main DLL
		- ISE.runtime.dll: a helper DLL from ISE (www.eiffel.com) for 
		  all dotNet libraries created using the ISE tools.

USE
	These DLLs can be used with any dotNet application wanting an ADL parser
	for example, applications written in VB.net, C#.net and so on.

	You should get:
		- the ADL language specification (http://www.openEHR.org/
		  /repositories/spec/latest/publishing/architecture/archetypes/
		  language/ADL/REV_HIST.html);
		- the ADL workbench (see http://www.openEHR.org/repositories/
		  implem/latest/publishing/tools/windows/adl_workbench/
		  index.html) 
		- the openEHR archetype repository (see http://www.openEHR.org/
		  repositories/archetype/release_table.html)
	in order to familiarise yourself with ADL. See the ADL workbench README
	for details of getting the archetype repository.

	When building a .Net application, you simply import the DLLs in this
	package to have access to the ADL parser.

FEEDBACK
	Software support: mail <support@OceanInformatics.biz>
	Discussion about ADL, archetypes: join the openEHR-technical mailing
	list (http://www.openEHR.org/advice/openehr-technical/maillist.html).

FUTURE
	Documentation will soon be available.

