
openEHR ADL Workbench
---------------------

VERSION
	Last Change: $Date$

AUTHORS
	Thomas Beale, Peter Gummer

	Ocean Informatics <www.OceanInformatics.com>

CONTENTS
	ADL viewer, parser & tester application

DIRECTORIES
	$INSTALL/adl_workbench/bin:
		adl_workbench.exe - GUI ADL viewer

	$INSTALL/adl_workbench/etc/vim:
		(for vi fans only...) files for adding ADL to the vim/gvim editor.

		- The adl.vim file goes in the $VIM/syntax directory;

		- The file synload.vim.example should be used to add an entry into
		  your existing $VIM/syntax/synload.vim directory (don't replace
		  it!);

		- The file filetype.vim.example should be used to update (not
		  replace) the file $VIM/filetype.vim.

	$OPENEHR/archetype:
		The directory where you should install the openEHR archetype
		library, which you can do using Subversion. Repository URL
		is http://www.openehr.org/knowledge . Log in and then go to
		archetypes > Export.

PURPOSE
	At the moment, you can hand-write new ADL files, or use one of the
	open source editors available (Ocean .Net Archetype Editor, Linköping
	Java Editor; the same Eiffel parser is used in the first of these as
	is used in the Archetype Workbench).

	The parser provides a syntax checking and semantic validation on 
	ADL archetypes according to the draft ADL 1.5 specification. All errors
	are coded, and can be looked up in the specification. See 
	http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/am/adl.pdf.

	The workbench can serialise into ADL and HTML.

	The parser tool is *not* designed as a clinical or other domain
	specialist's tool - other GUI tools are being developed for this
	purpose. Accordingly, the user interface is designed for technical
	users.

SETUP
	Make sure you have the openEHR Archetype library installed first (see
	link above for Knowledge repository)

	Double-click the adl_workbench.exe file.  The GUI ADL workbench
	tool should appear. See
	http://www.openehr.org/svn/ref_impl_eiffel/BRANCHES/specialisation/apps/doc/adl_workbench_help.htm 
	for instructions on using the tool

FEEDBACK
	Software support: currently via the openEHR-technical list, until we
	transfer the Ocean AWB Jira project to Jira on openEHR.org.
