package uk.ac.ucl.chime;

import java.io.PrintStream;

import org.openehr.am.archetype.constraintmodel.CAttribute;
import org.openehr.am.archetype.constraintmodel.CComplexObject;

public class MainOne {
	
		
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {			
		EiffelBridge brd = new EiffelBridge();
		CComplexObject obj = brd.getCComplexObjectUsingEiffel();
		System.out.println(obj.getNodeID());
		
	}
	
	private static void testEiffelBridge() {
		EiffelBridge brd = new EiffelBridge();		
		String[] archetypeNames = brd.getArchetypeNamesUsingEiffel();
		System.out.println(archetypeNames[2]);
		brd.compileArcheytpe(archetypeNames[2]);
		System.out.println("all is fine");
		
	}

	public MainOne(){				
	}
	
	
	
	

}
