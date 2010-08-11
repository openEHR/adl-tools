
openEHR ADL Workbench
---------------------

VERSION
	Last Change: $Date$

AUTHORS
	thomas.beale@oceaninformatics.com,
	peter.gummer@oceaninformatics.com

CONTENTS
	ADL viewer, parser & tester application

DIRECTORIES AND FILES
	adl_workbench executable:
		GUI ADL viewer.

	icons:
		icons used by the the adl_workbench executable.

	rm_schemas:
		Reference Model schema definitions.

	vim:
		(for vi fans only...) files for adding ADL to the vim/gvim editor.

		- The adl.vim file goes in the $VIM/syntax directory;

		- The file synload.vim.example should be used to add an entry into
		  your existing $VIM/syntax/synload.vim directory (don't replace
		  it!);

		- The file filetype.vim.example should be used to update (not
		  replace) the file $VIM/filetype.vim.

PURPOSE
	At the moment, you can hand-write new ADL files, or use one of the
	open source editors available (Ocean .NET Archetype Editor, Linköping
	Java Editor; the same Eiffel parser is used in the first of these as
	is used in the ADL Workbench).

	The parser provides syntax checking and semantic validation on 
	ADL archetypes according to the draft ADL 1.5 specification. All errors
	are coded, and can be looked up in the specification. See 
	http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/am/adl1.5.pdf.

	The workbench can serialise into ADL and HTML.

	The parser tool is *not* designed as a clinical or other domain
	specialist's tool - other GUI tools are being developed for this
	purpose. Accordingly, the user interface is designed for technical
	users.

SETUP
	Make sure you have an archetype repository installed.

	Double-click the adl_workbench executable file.  The GUI ADL workbench
	tool should appear.

	For instructions on using the tool, see
	http://www.openehr.org/svn/ref_impl_eiffel/BRANCHES/specialisation/apps/doc/web/index.html 

FEEDBACK
	Software support: In the Help menu, click "Report a Bug".
