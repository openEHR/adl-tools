
openEHR ADL java JNI DLL
------------------------

VERSION
	Last Change: $Date: 2010-08-28 17:14:01 +0100 (Sat, 28 Aug 2010) $

AUTHORS
	Thomas Beale - Ocean Informatics <www.OceanInformatics.biz>

ACKNOWLEDGEMENTS
	This wrapping methodology was developed with the help of Raju 
	Kalidindi and Russ Hamm at the Mayo Clinic Laboratory of Biomedical 
	Informatics, as part of the ADL/OWL knowledge engineering project 
	run by Dr Peter Elkin.

	Rahil Qamar at University of Manchester also contributed to the C
	wrapper coding.
	
CONTENTS
	This package contains: 
		- an ADL parser DLL for use in Windows Java environments
		- Java wrapper class
		- JNI .h file 
		- sample Java application class

PURPOSE
	This package provides a "JNI-ised" DLL of the openEHR ADL parser for 
	use in Java environments. The sample file TestAdlWrapper.java shows how
	it can be used. The initial version exposes basic functions only.
	Updates will progressively expose all functions, along with API
	documentation, and binary versions for Linux and the Mac.

	For background on how the wrapping was done, see:
	http://www.deepthought.com.au/it/eiffel/java_wrapping/eiffel_java-how-to.htm

USE
	Compile the Java project using your favourite IDE, or if you have none,
	we would recommend downloading Eclipse (http://www.eclipse.org). You can
	also compile and run from the command line as long as you have a JDK
	installed on the system, with a line like:

		java -Xcheck:jni -Xms64M -Xmx960M -classpath .\ %1 %2 %3 %4 %5 %6

	When you run the test system, you should see the example archetype read
	in, parsed and serialised to an HTML file. This essentially proves that
	all the internal machinery of the ADL parser is working in the Java
	environment. Future versions of this component will expose the entire
	interface, allowing the creation of Java archetype-manipulation applications.

BACKGROUND
	The ADL language specification and Archetype Object Model
	(top right links at
	http://www.openehr.org/repositories/spec-dev/latest/publishing/architecture/top.html)
	The ADL workbench (see
	http://www.openehr.org/repositories/adl_ref_parser-dev/
	latest/distribution/tools/windows/adl_tools_index.html).

	The openEHR archetype repository (see http://www.openEHR.org/
		  repositories/archetype/release_table.html)

FEEDBACK
	Software support: mail <support@OceanInformatics.biz>
	Discussion about ADL, archetypes: join the openEHR-technical mailing
	list (http://www.openEHR.org/advice/openehr-technical/maillist.html).

FUTURE
	Documentation will soon be available.

