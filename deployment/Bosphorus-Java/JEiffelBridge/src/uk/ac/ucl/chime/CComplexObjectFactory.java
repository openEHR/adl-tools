package uk.ac.ucl.chime;

import java.util.ArrayList;

import org.openehr.am.archetype.constraintmodel.CAttribute;
import org.openehr.am.archetype.constraintmodel.CComplexObject;
import org.openehr.rm.support.basic.Interval;

public class CComplexObjectFactory {
	private String _path;
	private String _rmTypeName;
	private Interval<Integer> _occurences;
	private ArrayList<CAttribute> _cAttributes = new ArrayList<CAttribute>();
	private CAttribute _parent;
	private String _nodeId;
	
	public CComplexObjectFactory(){}
	
	public void setPath(String pPath){
		_path = pPath;
	}
	
	public void setRMTypeName(String pRMTypeName){
		_rmTypeName = pRMTypeName;
	}
	
	public void setOccurences(int pLower, int pUpper){
		_occurences = new Interval<Integer>(pLower, pUpper);
	}
	
	public void addCAttributes(CAttribute pAttribute){
		_cAttributes.add(pAttribute);
	}
	
	public void setParent(CAttribute pParent){
		_parent = pParent;
	}
	
	public void setNodeId(String pNodeId){
		_nodeId = pNodeId;
	}
	
	public CComplexObject buildCComplexObject(){
		return new CComplexObject(_path, _rmTypeName, _occurences, _nodeId, _cAttributes, _parent);
	}
}
