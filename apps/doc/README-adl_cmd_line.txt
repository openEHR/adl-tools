
openEHR ADL Command line tool
-----------------------------

VERSION
	Last Change: $Date$

AUTHORS
	Thomas Beale
	Ocean Informatics <www.OceanInformatics.biz>

CONTENTS
	Command-line archetype test engine

DIRECTORIES
	$INSTALL/adl_workbench/bin: 
		adl_cmd_line.exe - command-line ADL validator

	$OPENEHR/archetype:
		the directory where you should install the openEHR archetype
		library, which you can do using subversion. Repository URL
		is http://svn.openehr.org/knowledge/archetypes/dev/ .

PURPOSE
	The command line tool can be used to check and correct an entire 
	directory tree of arhetypes. This tool does the following for each 
	archetype:
		- parse & report errors
		- if correctly parsed,
			+ serialise to ADL in a file ending with .adlx
			+ reparse this file to illustrate the correctness of the
			  serialisation
			+ serialise to HTML-ised ADL

SETUP
	Make sure you have the openEHR Archetype library installed first (see
	link above for subversion repository; see 
	http://www.openehr.org/developer/t_svn_um_top.htm for instructions on
	using subversion).

	You need to create a adl_cmd_line.cfg file containing the path of the 
	archetypes, in .ini file format, e.g.:

		[any]
		repository = $OPENEHR\knowledge\archetypes\dev\adl

OPTIONS
	There are two options, available when running the tool:
		- overwrite: overwrite archetypes with serialised form. This is useful
		  because the parser will attempt to correct minor errors in syntax
		  rather than report them; for a large number of archetypes, this 
		  means some previous syntax expressions now technically treated as 
		  errors according to the ADL specification will be fixed silently.
		- remove unused codes from ontology. Due to the way archetypes are 
		  often developed, there may be codes defined in the local ontology
		  of an archetype which are no longer used in the archetype. This 
		  option causes removal of these items from the ontology. Coupled 
		  with the first option, a whole directory tree of archetypes can 
		  be modified in this way, in one go.

RUNNING THE TOOL
	The tool can be started by double-clicking in the Windows explorer.
	A console window with a menu will appear. The first menu displays the 
	options (described above); when you quit from this, you are in the main
	menu of archetypes found in the directory tree.
	
FEEDBACK
	Software support: mail <Thomas dot Beale at OceanInformatics dot biz>
	Discussion about ADL, archetypes: join the openEHR-technical mailing
	list <www.openEHR.org>
	
FUTURE
	This tool may be changed into a proper GUI tool at some stage.
