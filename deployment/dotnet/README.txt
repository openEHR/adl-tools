
openEHR ADL dotNet Toolkit
--------------------------

VERSION
	Last Change: $Date: 2010-08-28 17:14:01 +0100 (Sat, 28 Aug 2010) $

AUTHORS
	Thomas Beale, Sam Heard
	Ocean Informatics <www.OceanInformatics.biz>

CONTENTS
	This toolkit contains: 
		- a set of DLLs for dotNet

PURPOSE
	This package contains 2 DLLs:
		- adl_dotnet_lib.dll: the ADL reference parser, packaged as a 
		  dotNet DLL;
		- libadl_dotnet_lib.dll: helper DLL for the main DLL

USE
	These DLLs can be used with any dotNet application wanting an ADL parser
	for example, applications written in VB.net, C#.net and so on.

	You should get:
		- the ADL language specification (http://svn.openehr.org/
		  specification/TRUNK/publishing/architecture/am/adl.pdf)
		- the ADL workbench (http://svn.openEHR.org/oe_distrib/
		  windows/adl_workbench/bin)
		- the openEHR archetype repository (http://svn.openehr.org/
		  knowledge/archetypes)
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

