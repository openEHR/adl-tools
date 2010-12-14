#include "ArchetypeLogger.h"
#include <string>
#include <iostream>

using namespace std;
ArchetypeLogger::ArchetypeLogger(void)
{
}


ArchetypeLogger::~ArchetypeLogger(void)
{
}

void ArchetypeLogger::log(EIF_REFERENCE pText){		
	EIF_TYPE_ID tid_str;
	tid_str = eif_type_id ("STRING");
	if (tid_str == EIF_NO_TYPE)
			eif_panic ("No type id for STRING.");
	EIF_POINTER_FUNCTION charFunc = eif_pointer_function("to_c", tid_str);
	EIF_POINTER strptr = charFunc(eif_access(eif_protect(pText)), NULL);
//		cout << ((char*)strptr) << endl;
//		cout << i << endl;
	string* str = new string((char*)strptr);
	cout << *str << endl;
		
}
