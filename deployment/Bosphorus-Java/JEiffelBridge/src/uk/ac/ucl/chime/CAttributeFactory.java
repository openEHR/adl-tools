package uk.ac.ucl.chime;

import java.util.ArrayList;

import org.openehr.am.archetype.constraintmodel.CAttribute;
import org.openehr.am.archetype.constraintmodel.CAttribute.Existence;
import org.openehr.am.archetype.constraintmodel.CMultipleAttribute;
import org.openehr.am.archetype.constraintmodel.CObject;
import org.openehr.am.archetype.constraintmodel.CPrimitiveObject;
import org.openehr.am.archetype.constraintmodel.CSingleAttribute;
import org.openehr.am.archetype.constraintmodel.Cardinality;
import org.openehr.rm.support.basic.Interval;

public class CAttributeFactory {
	
	private String _path;
	private String _rmAttributeName;
	private Existence _existence;
	private ArrayList<CObject> _children = new ArrayList<CObject>();
	private Cardinality _cardinality;
	
	public CAttributeFactory(){}

	public void setPath(String pPath){
		_path = pPath;
	}
	
	public void setRMAttributeName(String pName){
		_rmAttributeName = pName;
	}
	
	public void setExistence(String pExistence){
		if(pExistence.toUpperCase().equals("REQUIRED"))
			_existence = Existence.REQUIRED;
		else if(pExistence.toUpperCase().equals("NOT_ALLOWED"))
			_existence = Existence.NOT_ALLOWED;
		else if(pExistence.toUpperCase().equals("OPTIONAL"))
			_existence = Existence.OPTIONAL;
	}
	
	public void addChild(CObject pChild){		
		_children.add(pChild);
	}
	
	public CAttribute buildSingleCAttribute(){
		return new CSingleAttribute(_path, _rmAttributeName, _existence, _children);		
	}
	
	public void setCardinality(boolean pOrdered, boolean pUnique, int pLower, int pUpper){
		_cardinality = new Cardinality(pOrdered, pUnique, new Interval<Integer>(pLower, pUpper));
	}
	
	public CAttribute buildMultipleCAttribute(){
		return new CMultipleAttribute(_path, _rmAttributeName, _existence, _cardinality, _children);
	}
}
