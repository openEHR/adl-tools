#include "application.h"

test_class::test_class()
{
 
}
 
void test_class::c_set_object (EIF_REFERENCE obj_a)
{
	if (obj != NULL)
	{
		eif_wean (obj);
	}
	obj = eif_protect (obj_a);
}
 
void test_class::c_set_routine (EIF_POINTER routine_a)
{
	routine = routine_a;
}
 
void test_class::c_do_callback ()
{
	((void (*) (EIF_REFERENCE)) routine) (eif_access (obj));
}