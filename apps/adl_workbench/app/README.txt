
openEHR ADL Reference Parser Toolkit
------------------------------------

VERSION
	Last Change: $Date$

AUTHORS
	Thomas Beale, Sam Heard
	Ocean Informatics <www.OceanInformatics.biz>

CONTENTS
	This toolkit contains: 
		- a set of ADL archetype files
		- a GUI validating parser
		- a command-line archetype test engine

DIRECTORIES
	$INSTALL/adl_workbench: 
		root directory, containing the applications, application 
		configuration files and other directories.

	$INSTALL/adl_workbench/gvim: 
		(for vi fans only...) files for adding ADL to the vim/gvim editor.  
		- The adl.vim file goes in the $VIM/syntax directory; 
		- the file synload.vim.example should be used to add an entry into 
		  your existing $VIM/syntax/synload.vim directory (don't replace 
		  it!); 
		- the file filetype.vim.example should be used to update (not
		  replace) the file $VIM/filetype.vim.

	$INSTALL/adl_workbench/parse_specification: 
		yacc and lex production rule files describing the ADL syntax.

	$OPENEHR/archetype-dev:
		the directory where you should install the openEHR archetype
		library, which you can do using BitKeeper. See the help page on
		the openEHR website at
		http://www.openehr.org/developer/t_bk_um_top.htm.

PURPOSE
	GUI validator/viewer:
		At the moment, you can hand-write new ADL files, or experiment 
		with the example files. In the future, this validator will 
		mainly be used to do standalone checks on ADL files. The 
		validator is modular, and has already been built as a dotNet 
		DLL and used with VB and C# GUI tools (see ADL DLL toolkit).  
		Other reusable library forms are being built for Linux and Windows.

		The parser provides a reasonable amount of syntax error reporting 
		on ADL files. It also does a certain amount of semantic checking. 
		It is capable of serialising into ADL, HTML, and a form of XML
		being developed for use with the Web Ontology Language (OWL).

		The parser tool is *not* designed as a clinical or other domain
		specialist's tool - other GUI tools are being developed for this 
		purpose. Accordingly, the user interface is designed for technical
		users.

SETUP
	Make sure you have the openEHR Archetype library installed first. You
	can do this by simply downloading the latest .tgz archive of the openEHR
	archetype repository, which is always available at:
	http://www.openehr.org/repositories/archetype/archetype-latest.tgz

	*** Note that this archive currently unpacks with a path starting with
	"latest"; when unpacked, it is convenient to rename the "latest"
	directory to "archetype-dev" (this will be fixed in the future).

	(For developer users only)
	If you are involved in archetype development, you can also access the
	archetype repository as a BitKeeper repository, using the following 
	commands from a unix prompt (or cygwin prompt on Windows). (If you 
	don't know about cygwin / Bitkeeper, see 
	http://www.openehr.org/developer/t_bk_um_install.htm.

	$ cd $OPENEHR
	$ bk clone http://openehr.bkbits.net/archetype-dev
	
	This will create a clone of the openEHR BitKeeper archetype repository
	in $OPENEHR/archetype-dev. The executables will look for archetypes in
	whichever directory is indicated as the value of the "repository"
	variable in the .cfg file in the install directory of the executable. By
	default, it is set to point to $OPENEHR/archetype, but of course you can
	change this. On first time startup, if this file is not present, the
	user is asked to set the options, and the resulting settings are written
	to the file.

GUI validator/viewer:
	Double-click the adl_validator.exe file.  The GUI ADL workbench tool 
	should appear. Follow these general steps:

	* open and parse an archetype file....

		EITHER

	  Use the archetype explorer on the left hand side of the tool to 
	  navigate to the desired archetype and left-click to open and 
	  parse. The root directory of the explorer view is determined by
	  the "repository" setting in the .cfg file.

		OR

	  open a file - use the  "Open" button to choose an archetype anywhere
	  in the file system. Useful for looking at archetypes outside the 
	  repository.

	* for files that parse successfully, you can now use the other controls
	  to explore the archetype, including the node map and the ontology
	  display in the lower half of the tool. You can change the language
	  and terminology for archetypes that have bindings and translations;
	  this will cause all controls to be updated visually.

	* edit the archetype - use the "Edit" button to bring up a text editor.
	  Saving from the text editor will cause the archetype to be reloaded.

	* Serialise (save) the archetype - choose a format, using the "Format"
	  drop-down, then use the "Save" button. This will cause the parse tree
	  to be written out to the selected format, currently HTML or ADL.

	The application configuration file, adl_validator.cfg can be used to set
	the preferred editor command, e.g. "notepad" or "gvim". This file need
	not exist on startup, as it will be created by setting options, if not
	found.

Running the command-line validator
	This tool gives a slightly more efficient way of parsing one or all
	archetypes in the repository directory, and is used to verify a software
	change against all the archetypes.

Reading the ADL files
	The ADL files are plain text files, rather like programming language
	source files. You can edit them in any editor you like. Try making
	some errors and seeing if the validator catches them.

	It helps A LOT if you have a syntax-senstive editor! There is a mode
	supplied for the gvim editor. Modes needed for emacs etc.

	See the ADL PDF manual for a full description of the syntax. The latest
	is currently available at http://www.openehr.org/tmp/adl-1_2_draft_d.pdf.


FEEDBACK
	Software support: mail <support@OceanInformatics.biz>
	Discussion about ADL, archetypes: join the openEHR-technical mailing
	list <www.openEHR.org>
	
FUTURE
	A model-based checker will be added in the future. This will perform
	validation of the archetype against a particular information model, 
	such as the openEHR EHR information model, a CEN model and HL7 model, 
	such as the RIM, or any other model.

	Numerous small GUI improvements are in the pipeline.

