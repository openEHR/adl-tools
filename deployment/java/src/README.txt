
	Java JNI Wrapper for the openEHR Eiffel ADL Reference Parser
	------------------------------------------------------------

	Overview
	--------
	This test project compiles and runs under Eclipse 3.0, using Sun JDK 1.5
	beta (but the code does not use any Java 1.5-isms).

	Status
	------
	All the functions tested so far seem to work, although there are
	probably memory management problems waiting to bite, given the layers of
	conversion from garbage-collected Eiffel to non-GC C to GC-d java. More
	testing is required.

	I have not yet made a .jar from the source.

	Ensuring the DLL is found
	-------------------------
	The DLL has to be in the "java.library.path", which means it can either
	be in the OS's normal path (for finding executables), or you can tell
	the VM where it is. Here is how it can be done in Eclipse:

	Choose Run menu >Run...>[choose current app launch]>arguments>
	Add to VM arguments:
	-Djava.library.path=C:\somewhere\java\org\openehr\archetypes\adl_jni_wrapper

	Support
	-------
	Thomas.Beale@OceanInformatics.biz

