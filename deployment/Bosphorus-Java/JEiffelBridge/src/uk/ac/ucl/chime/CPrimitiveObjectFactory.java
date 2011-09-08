package uk.ac.ucl.chime;

import org.openehr.am.archetype.constraintmodel.CAttribute;
import org.openehr.am.archetype.constraintmodel.CPrimitiveObject;
import org.openehr.am.archetype.constraintmodel.primitive.CPrimitive;
import org.openehr.rm.support.basic.Interval;

public class CPrimitiveObjectFactory {
	
	private String _path;
	private Interval<Integer> _occurences;
	private String _nodeId;
	private CAttribute _parent;
	private CPrimitive _item;


	public CPrimitiveObjectFactory(){}
	
	public void setPath(String pPath){
		_path = pPath;
	}
	
	public void setInterval(int pLower, int pUpper){
		_occurences = new Interval<Integer>(pLower, pUpper);		
	}
	
	public void setNodeId(String pNodeId){
		_nodeId = pNodeId;
	}
	
	public void setParent(CAttribute pParent){
		_parent = pParent;
	}
	
	public void setItem(CPrimitive pItem){
		_item = pItem;
	}
	
	public CPrimitiveObject buildCPrimitiveObject(){
		CPrimitiveObject obj = new CPrimitiveObject(_path, _occurences, _nodeId, _parent, _item);
		return obj;
	}

}
