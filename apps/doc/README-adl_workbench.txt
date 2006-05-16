
openEHR ADL workbench
---------------------

VERSION
	Last Change: $Date$

AUTHORS
	Thomas Beale, Sam Heard
	Ocean Informatics <www.OceanInformatics.biz>

CONTENTS
	GUI ADL viewer & parser application

DIRECTORIES
	$INSTALL/adl_workbench/bin: 
		adl_workbench.exe - GUI ADL viewer

	$INSTALL/adl_workbench/etc/vim: 
		(for vi fans only...) files for adding ADL to the vim/gvim editor.  
		- The adl.vim file goes in the $VIM/syntax directory; 
		- the file synload.vim.example should be used to add an entry into 
		  your existing $VIM/syntax/synload.vim directory (don't replace 
		  it!); 
		- the file filetype.vim.example should be used to update (not
		  replace) the file $VIM/filetype.vim.

	$OPENEHR/archetype:
		the directory where you should install the openEHR archetype
		library, which you can do using subversion. Repository URL
		is http://svn.openehr.org/knowledge/archetypes/dev/ .

PURPOSE
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
	Make sure you have the openEHR Archetype library installed first (see
	link above for subversion repository; see 
	http://www.openehr.org/developer/t_svn_um_top.htm for instructions on
	using subversion).

	Double-click the adl_workbench.exe file.  The GUI ADL workbench 
	tool should appear. Follow these general steps:

	* open and parse an archetype file....

		EITHER

	  Use the archetype explorer on the left hand side of the tool to 
	  navigate to the desired archetype and left-click to open and 
	  parse. The root directory of the explorer view is determined by
	  the "repository" setting in the .cfg file. Use the Options menu
	  to set the directory on your system.

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

	The application configuration file, adl_workbench.cfg can be used to set
	the preferred editor command, e.g. "notepad" or "gvim". This file need
	not exist on startup, as it will be created by setting options, if not
	found.

Reading the ADL files
	The ADL files are plain text files, rather like programming language
	source files. You can edit them in any editor you like. Try making
	some errors and seeing if the validator catches them.

	It helps A LOT if you have a syntax-senstive editor! There is a mode
	supplied for the gvim editor. Modes needed for emacs etc.

	See the ADL PDF manual for a full description of the syntax. The latest
	is currently available at 
	http://svn.openehr.org/specification/TRUNK/publishing/architecture/am/adl.pdf.

FEEDBACK
	Software support: mail <Thomas dot Beale at OceanInformatics dot biz>
	Discussion about ADL, archetypes: join the openEHR-technical mailing
	list <www.openEHR.org>
	
FUTURE
	A model-based checker will be added in the future. This will perform
	validation of the archetype against a particular information model, 
	such as the openEHR EHR information model, a CEN model and HL7 model, 
	such as the RIM, or any other model.

	Numerous small GUI improvements are in the pipeline.

