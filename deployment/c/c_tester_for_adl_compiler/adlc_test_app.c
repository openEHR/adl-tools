#include "eif_setup.h"  /* Macros EIF_INITIALIZE and EIF_DISPOSE_ALL */
#include "eif_eiffel.h" /* Exported functions of the Eiffel run-time */

main(int argc, char **argv, char **envp) 
{
	EIF_PROCEDURE ep;
	EIF_OBJECT obj;
	EIF_TYPE_ID tid;

	EIF_INITIALIZE(failure)

	eif_enable_visible_exception();

	tid = eif_type_id ("APP_ROOT");
	if (tid == EIF_NO_TYPE)
		eif_panic ("No type id.");
	obj = eif_create (tid);

	ep = eif_procedure("initialise", tid);
	(ep)(eif_access(obj));


	EIF_DISPOSE_ALL

	return 0;
}
