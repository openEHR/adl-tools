package uk.ac.ucl.chime;

import java.util.ArrayList;
import java.util.List;

import org.openehr.am.archetype.constraintmodel.primitive.CBoolean;
import org.openehr.am.archetype.constraintmodel.primitive.CDate;
import org.openehr.am.archetype.constraintmodel.primitive.CDateTime;
import org.openehr.am.archetype.constraintmodel.primitive.CDuration;
import org.openehr.am.archetype.constraintmodel.primitive.CInteger;
import org.openehr.am.archetype.constraintmodel.primitive.CPrimitive;
import org.openehr.am.archetype.constraintmodel.primitive.CReal;
import org.openehr.am.archetype.constraintmodel.primitive.CString;
import org.openehr.am.archetype.constraintmodel.primitive.CTime;
import org.openehr.rm.datatypes.quantity.datetime.DvDuration;
import org.openehr.rm.support.basic.Interval;

public class CPrimitiveFactory {

	private boolean _falseValid;
	private boolean _trueValid;
	private String _cDatePattern;
	private String _cDateTimePattern;
	private Interval<DvDuration> _durationInterval;
	private DvDuration _durationValue;
	private List<Integer> _integerList = new ArrayList<Integer>();
	private Interval<Integer> _integerInterval;
	private List<Double> _cRealList = new ArrayList<Double>();
	private Interval<Double> _cRealInterval;
	private List<String> _cStringList = new ArrayList<String>();
	private String _cstringPattern;
	private String _cTimePattern;

	public CPrimitiveFactory(){
	}
	
	public void setCBoolFalseValid(boolean pFalseValid){
		_falseValid = pFalseValid;
	}
	
	public void setCBoolTrueValid(boolean pTrueValid){
		_trueValid = pTrueValid;
	}
	
	public void setDatePattern(String pDatePat){
		_cDatePattern = pDatePat;
	}
	
	public void setDateTimePattern(String pDateTimePattern){
		_cDateTimePattern  = pDateTimePattern;
	}
	
	public void setDurationInterval(String pLowerPattern, String pUpperPattern){
		_durationInterval = new Interval<DvDuration>(new DvDuration(pUpperPattern), new DvDuration(pUpperPattern));
	}
	
	public void setDurationValue(String pDurationPattern){
		_durationValue = new DvDuration(pDurationPattern);
	}
	
	public void addIntegerToList(int pInt){
		_integerList.add(pInt);
	}
	
	public void addDoubleToCRealList(double pDouble){
		_cRealList.add(pDouble);
	}
	
	public void setCRealInterval(double pLower, double pUpper){
		_cRealInterval = new Interval<Double>(pLower, pUpper);
	}
	
	public void setIntegerInterval(int pLower, int pUpper){
		_integerInterval = new Interval<Integer>(pLower, pUpper);
	}
	
	public void addStringToCStringList(String pString){
		_cStringList.add(pString);
	}
	
	public void setCStringPattern(String pPat){
		_cstringPattern = pPat;
	}
	
	public void setCTimePattern(String pPat){
		_cTimePattern = pPat;
	}
	
	public CPrimitive buildCBoolean(){		
		CBoolean cbool = new CBoolean(_trueValid, _falseValid);
		return cbool;
	}
	
	public CPrimitive buildCDate(){
		CDate cd = new CDate(_cDatePattern);
		return cd;
	}
	
	public CPrimitive buildCDateTime(){
		CDateTime cdtime = new CDateTime(_cDateTimePattern);
		return cdtime;
	}
	
	public CPrimitive buildCDuration(){
		CDuration cduration = new CDuration(_durationValue, _durationInterval);
		return cduration;
	}
	
	public CPrimitive buildCInteger(){
		CInteger cint = new CInteger(_integerInterval, _integerList);
		return cint;
	}
	
	public CPrimitive buildCReal(){
		CReal creal = new CReal(_cRealInterval, _cRealList);
		return creal;
	}
	
	public CPrimitive buildCString(){
		CString cstr = new CString(_cstringPattern, _cStringList);
		return cstr;
	}
	
	public CPrimitive buildCTime(){
		CTime ct = new CTime(_cTimePattern);
		return ct;
	}
}
