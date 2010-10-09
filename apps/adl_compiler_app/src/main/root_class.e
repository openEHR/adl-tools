note
	legal: "See notice at end of class."
	status: "See notice at end of class."
class
	ROOT_CLASS
create
	make
feature -- Initialization
	make
	do
     Io.put_string ("Test for CECIL%N");
     foo
     Io.read_line
		end

feature -- Cecil generation

	dymmy_my_array: MY_ARRAY [INTEGER];
	dymmy_my_array2: ARRAY [STRING];
	dymmy_my_var: ANY;


	 foo
   external
     "C inline"
   alias
     "[
       EIF_INTEGER *c_array;
       int i, j;

       EIF_PROCEDURE p_make;    /* `make ' from MY_ARRAY [INTEGER] */
       EIF_PROCEDURE p_put;      /* `put' from MY_ARRAY [INTEGER] */
       EIF_PROCEDURE p_display;    /* `display' from MY_ARRAY [INTEGER] */
       EIF_TYPE_ID my_array_tid;  /* MY_ARRAY [INTEGER] type id */
       EIF_OBJECT o_array;    /* Protected indirection to an array of integers */

         /* Enable visible exception: raised whenever `eif_procedure'
          * returns a NULL pointer.
          * Note: not necessary, since it is set by default */
       eif_enable_visible_exception ();
       
       //THIS IS THE PART WHERE WE HAVE THE PROBLEM//
			EIF_PROCEDURE ep;
			EIF_TYPE_ID tid_any;
			tid_any = eif_type_id ("ARRAY[STRING]");
			if (tid_any == EIF_NO_TYPE)
					eif_panic ("No type id.");
			ep = eif_procedure ("put", tid_any);

         /* Set Type id. */
         /* `eif_type_id has been extended to generic type since v4.3 */
       my_array_tid = eif_type_id ("MY_ARRAY[INTEGER]");
       if (my_array_tid == EIF_NO_TYPE)
           /* MY_ARRAY's type id not found. */

         eif_panic ("No type id.");

         /* Set procedures. */
       p_make = eif_procedure ("make", my_array_tid);
       p_display = eif_procedure ("display", my_array_tid);
       p_put = eif_procedure ("put", my_array_tid);

         /* o_array is a protected indirection
          * it has to be accessed with `eif_access'
          * and freed with `eif_wean' */
       o_array = eif_create (my_array_tid);

         /* Call `make (1, 10)' on new array */
       (p_make) (eif_access (o_array), 1, 10);

       printf ("Enter 10 integers:\n");
       c_array = (EIF_INTEGER *) malloc (10*sizeof (EIF_INTEGER));
         /* Set C array */
       for (i = 0; i < 10; i++) {
         printf ("Enter element %d: ", i + 1);
         scanf ("%d", &j);
         c_array [i] = (EIF_INTEGER) j;
       }
       printf ("\n");

         /* Set Eiffel array from C array */
       for (i = 0; i < 10; i++) {
             /* Call `put (value, i)' on array */
         (p_put) (eif_access (o_array), (EIF_INTEGER) c_array [i], i+1);
       }


       (p_display) (eif_access (o_array));  /* Call `display on array */

       eif_wean (o_array);  /* Reclaim protected indirection so that the GC can
                  * collect it */
     ]"
   end


note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"


end -- class ROOT_CLASS

