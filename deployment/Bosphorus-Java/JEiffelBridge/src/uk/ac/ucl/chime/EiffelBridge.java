package uk.ac.ucl.chime;

import java.io.PrintStream;

import org.openehr.am.archetype.constraintmodel.CComplexObject;

public class EiffelBridge {
	
	public static Boolean libLoaded = false;
	
	private PrintStream _printStream;
	
	private native String getStringValue();
	
	private native String[] getArchetypeNames();
	
	public native void setErrorDBDirectoryPath(String pPath);
	
	public native void setRMSchemaDirectoryPath(String pPath);
	
	public native void compileArcheytpe(String pArchetypeName);
	
	public native CComplexObject parseArchetype(String pArchetypeName);
	
	public void printLog(String pLog){
		if(_printStream == null)
			return;
		_printStream.print(pLog + "\n");
	}
	
	public void setPrintStream(PrintStream pPrintStream){
		_printStream = pPrintStream;
	}
	
	public String[] getArchetypeNamesUsingEiffel() {
		if(!libLoaded){
			System.loadLibrary("Bosphorus");
			libLoaded = true;
		}		
		setErrorDBDirectoryPath("c:\\tmp\\error_db");
		setRMSchemaDirectoryPath("c:\\tmp\\rm_schemas");
		String[] arr = getArchetypeNames();
		return arr;
	}
	
	public CComplexObject getCComplexObjectUsingEiffel(){
		if(!libLoaded){
			System.loadLibrary("Bosphorus");
			libLoaded = true;
		}		
		setErrorDBDirectoryPath("c:\\tmp\\error_db");
		setRMSchemaDirectoryPath("c:\\tmp\\rm_schemas");
		CComplexObject  d = parseArchetype("as");
		return d;
	}
	
	public void compileArchetypeUsingEiffel(String pArchetypeName){
		if(!libLoaded){
			System.loadLibrary("Bosphorus");
			libLoaded = true;
		}		
		setErrorDBDirectoryPath("c:\\tmp\\error_db");
		setRMSchemaDirectoryPath("c:\\tmp\\rm_schemas");
		compileArcheytpe(pArchetypeName);
	}
		
}
