#include "eif_eiffel.h"



class test_class
{
public:
	test_class();
	~test_class();
	EIF_OBJECT obj;
	EIF_POINTER routine;
	void c_set_object (EIF_REFERENCE obj_a);
	void c_set_routine (EIF_POINTER routine_a);
	void c_do_callback ();
};
 