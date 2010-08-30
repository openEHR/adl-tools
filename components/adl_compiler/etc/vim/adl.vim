" Vim syntax file
" Language:	ADL (Archetype Description Language)
" Maintainer:	Thomas Beale (thomas@deepthought.com.au)
" URL:		http://www.oceanInformatics.biz/vim/syntax/adl.vim
" Last change:	2003 jun 10

" Remove any old syntax stuff hanging around
syn clear

" keyword definitions
syn keyword adlTopStruct    archetype template concept description definition ontology specialise specialize 
syn keyword adlBuiltIn  existence cardinality occurrences invariant allow_archetype use_archetype use_node
syn keyword adlBuiltIn  unordered ordered unique non-unique

" Operators
syn keyword adlOperator    matches
syn keyword adlOperator    xor or implies not exists and else

"catch errors caused by wrong parenthesis and brackets
syn cluster	adlParenGroup	contains=adlParenError
if exists("adl_no_bracket_error")
  syn region	adlParen		transparent start='(' end=')' contains=ALLBUT,@adlParenGroup
  syn match	adlParenError	")"
  syn match	adlErrInParen	contained "[{}]"
else
  syn region	adlParen		transparent start='(' end=')' contains=ALLBUT,@adlParenGroup,adlErrInBracket
  syn match	adlParenError	"[\])]"
  syn match	adlErrInParen	contained "[\]{}]"
  syn region	adlBracket	start='\[' end=']' contains=ALLBUT,@adlParenGroup,adlErrInParen
  syn match	adlErrInBracket	contained "[);{}]"
endif

" Case sensitive stuff
syn keyword adlTodo           contained TODO XXX FIXME
syn match   adlClassName      "\<[A-Z][A-Z0-9_]*\>"
syn match   adlPropertyName   "\<[a-z][a-z0-9_]*\>"

" Strings and constants
syn keyword adlBool           true false
syn keyword adlBool		 True False
syn region  adlString         start=+"+ end=+"+ contains=adlEscape,adlStringError
syn match   adlCoded          "\<a[tx]\d*\>"
syn match   adlCodedConstraint "\<ac\d*\>"
syn match   adlEscape	 contained "\[^/]"
syn match   adlEscape	 contained "\\\d\+/"

syn match	adlSpecial	contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match	adlSpecial	contained "\\\(u\x\{4}\|U\x\{8}\)"
syn region	adlString		start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=adlSpecial
syn match	adlCharacter	"L\='[^\\]'"
syn match	adlCharacter	"L'[^']*'" contains=adlSpecial
syn match	adlSpecialError	"L\='\\[^'\"?\\abfnrtv]'"
syn match	adlSpecialCharacter "L\='\\['\"?\\abfnrtv]'"
syn match	adlSpecialCharacter "L\='\\\o\{1,3}'"
syn match	adlSpecialCharacter "'\\x\x\{1,2}'"
syn match	adlSpecialCharacter "L'\\x\x\+'"

syn match   adlNumber         "-\=\<\d\+\(_\d\+\)*\>"
syn match   adlNumber         "\<[01]\+[bB]\>"
syn match   adlNumber         "-\=\<\d\+\(_\d\+\)*\.\(\d\+\(_\d\+\)*\)\=\([eE][-+]\=\d\+\(_\d\+\)*\)\="
syn match   adlNumber         "-\=\.\d\+\(_\d\+\)*\([eE][-+]\=\d\+\(_\d\+\)*\)\="
syn match   adlComment        "--.*" contains=adlTodo


if !exists("did_adl_syntax_inits")
  let did_adl_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link adlTopStruct	PreProc
  hi link adlStatement       Statement
  hi link adlClause       Statement
  hi link adlTerminology       Type
  hi link adlBool		Boolean
  hi link adlString		String
  hi link adlCharacter	Character
  hi link adlClassName	Type
  hi link adlPropertyName	Type
  hi link adlNumber		Number

  hi link adlSpecialError	adlError
  hi link adlParenError	adlError
  hi link adlErrInParen	adlError
  hi link adlErrInBracket	adlError
  hi link adlError	Error

  hi link adlCoded	String
  hi link adlCodedConstraint	String

  hi link adlBuiltin	Special
  hi link adlOperator	Special
  hi link adlBracket	String
  hi link adlComment		Statement

  hi link adlSpecialCharacter	adlSpecial
  hi link adlSpecial	SpecialChar
endif

let b:current_syntax = "adl"

" vim: ts=8
