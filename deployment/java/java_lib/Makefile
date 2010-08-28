all: finalized

wkbench: clean
	ec -batch -ace ace.ace -freeze -c_compile
	cd EIFGEN/W_code
	finish_freezing -silent
	cd ../..

finalized:
	ec -batch -ace ace.ace -finalize -c_compile
	cd EIFGEN/F_code
	finish_freezing -silent

	echo adding JNI function names to export...
	cat $(OPENEHR)/adl_ref_parser-dev/src/java/jni_c/adl_jni_wrapper_exports.def >> ADL_JAVA_LIB.def

	echo rebuilding...
	finish_freezing -silent
	cd ../..

clean:
	rm -f *.epr
	rm -rf EIFGEN


