
 The design details of java wrapping eiffel are described in the files in the
 ../../Documentation directory. 

 Build instructions (to be done by make one day!).

 If changes are made in the Eiffel interface, first do the following:

	- make changes to Eiffel interface class C_ADL_INTERFACE and parents.

	- mirror changes in
	  $(OPENEHR)/adl_ref_parser-dev/src/java/org/openehr/archetypes/adl_jni_wrapper/
	  AdlJniWrapper.java class.

	- make sure the Java system is recompiled and the appropriate .class
	  files have been generated.

	- do an automatic regeneration of the .h file: in the directory
	  $(OPENEHR)/adl_ref_parser-dev/src/java, do:
	  javah org.openehr.archetypes.adl_jni_wrapper.AdlJniWrapper
	  This will generate a new C header file called 
	  org_openehr_archetypes_adl_jni_wrapper_AdlJniWrapper.h in the
	  current directory. Move this file down one directory into the jni_c
	  directory.

	- in jni_c, reflect the changes to the regenerated.h in the .c file 
	  (be careful - the function names are tricky!)

	- in a shell window, run nmake to regenerate the .lib file, and a .def
	  file containing the Jni-mangled function names.  The .lib file is the 
	  library containing the JNI wrappers of the functions exported by 
	  C_ADL_INTERFACE in the eiffel build area. If you don't have any grep,
	  sed etc, you will need to make the .def by hand. It is easy to see
	  what to do from the existing version of this file.
	  
For any change, including to the internals of the Eiffel back-end.

	- In $(OPENEHR)/adl_ref_parser-dev/src/eiffel/adl_workbench/shared_lib/java_lib
	  do a normal do a normal Eiffel finalize either from EiffelStudio or
	  using "nmake finalized". This will rebuild the Eiffel code, and
	  also cause the linking of the JNI wrapper .lib file from the java area
	  into the build dynamic library in EIFGEN/F_code.

	- go to the EIFGEN/F_code directory and modify the ADL_JAVA_LIB.def
	  file by appending the contents of the file
	  $(OPENEHR)/adl_ref_parser-dev/src/java/adl_jni_wrapper_exports.def. If there are 
	  already JNI-mangled function names at the bottom of these file, remove 
	  them and then append). 

	  You have to do this because the Eiffel build process only knows about
	  the C_ADL_INTERFACE functions, not about the JNI wrapping, which is in
	  the .lib file. So it generates a microsoft .def, defining the exported
	  functions, file corresponding to the Eiffel functions; to make it know
	  about the JNI wrapped functions, you have to do this manual step.

	- rerun the final stage of the make in the F_code directory by getting a
	  cmd window and typing 'finish_freezing'.

	- the resulting dll in the F_code directory can be used with Java; it
	  can be tested with the simple Java project in the java directory. This
	  DLL needs to be moved to 
	  $(OPENEHR)/adl_ref_parser-dev/src/java/org/openehr/archetypes/adl_jni_wrapper/

