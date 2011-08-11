note
	description: "Summary description for {DISPATCHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DISPATCHER
create
	make

feature --fields

	current_request_header:	REQUESTHEADER_WRAPPER_GEN

	current_response_object: MANAGED_POINTER

	current_response_header: MANAGED_POINTER

	current_message_is_header:BOOLEAN

	repo_manager:REPOSITORY_MANAGER


feature --attributes
	current_response_header_size:INTEGER
	do
		Result := current_response_header.count

	end

	current_response_header_address:POINTER
	do
		Result := current_response_header.item
	end

	current_response_object_size:INTEGER
	do
		Result := current_response_object.count

	end

	current_response_object_address:POINTER
	do
		Result := current_response_object.item
	end

	is_current_message_header:BOOLEAN
	do
		Result := current_message_is_header
	end



feature --methods

	reset
	do
		current_request_header := void
		current_response_header := void
		current_response_object := void
	end

	callback_func(p_request_content:POINTER; p_size:INTEGER)
	local
		pbuffer_content:MANAGED_POINTER
		header:REQUESTHEADER_WRAPPER_GEN
	do
		if current_request_header = void then
			--message header
			create header.make
			--we are sharing the incoming pointer
			--the content pointed by this pointer will be deserialized into
			--object, then when this method returns, the C code will collect it
			create pbuffer_content.share_from_pointer (p_request_content, p_size)
			header.deserialize_from_byte_arr (pbuffer_content)
			current_request_header := header
			current_response_header := void
			current_message_is_header := true
		else
			current_message_is_header := false
			--message payload			
			if current_request_header.get_url.is_equal ("get_archetype") then
				create pbuffer_content.share_from_pointer (p_request_content, p_size)
				--url_handler_1(pbuffer_content)
				get_archetype_handler (pbuffer_content)

			elseif  current_request_header.get_url.is_equal ("get_archetype_list") then
				get_archetype_list_handler--incoming content does not matter

			else
				unknown_url_handler
			end

			--reset header
			current_request_header := void
		end
	end

	unknown_url_handler
	local
		response_header:RESPONSEHEADER_WRAPPER_GEN
		response_header_content:MANAGED_POINTER

		--the content of the response object does not matter, so we just send empty header objects
		response_wrapper:RESPONSEHEADER_WRAPPER_GEN
		response_wrapper_content:MANAGED_POINTER
	do
		--create response header
		response_header := create_response_header("no such url")
		response_header.set_responsestatus (response_header.responsestatus_pb_error)
		create response_header_content.own_from_pointer (response_header.serialize_to_byte_array, response_header.get_pb_object_size)
		current_response_header := response_header_content

		--create empty response object
		create response_wrapper.make
		response_wrapper.init_pb_obj
		create response_wrapper_content.own_from_pointer (response_wrapper.serialize_to_byte_array, response_wrapper.get_pb_object_size)
		current_response_object := response_wrapper_content
	end

	get_archetype_list_handler
	--incoming content does not matter here
	local
		response_header:RESPONSEHEADER_WRAPPER_GEN
		response_header_content:MANAGED_POINTER

		response_wrapper: PB_OBJECT_WRAPPER
		response_wrapper_content:MANAGED_POINTER
	do
		--create response header
		response_header := create_response_header("")
		create response_header_content.own_from_pointer (response_header.serialize_to_byte_array, response_header.get_pb_object_size)
		current_response_header := response_header_content

		--create response object		
		response_wrapper := create_archetype_list
		create response_wrapper_content.own_from_pointer (response_wrapper.serialize_to_byte_array, response_wrapper.get_pb_object_size)
		current_response_object := response_wrapper_content

	end

	get_archetype_handler(p_request_content:MANAGED_POINTER)
	local
		request_content:PARAMETERS_WRAPPER_GEN

		response_header:RESPONSEHEADER_WRAPPER_GEN
		response_header_content:MANAGED_POINTER

		response_wrapper:PB_OBJECT_WRAPPER
		response_wrapper_content:MANAGED_POINTER

		response_successful:BOOLEAN
	do
		--create incoming request content
		create request_content.make
		request_content.deserialize_from_byte_arr(p_request_content)

		--create response object first, and later the header
		response_wrapper := repo_manager.compile_and_visit_archetype (request_content.get_content_at (0))
		if response_wrapper = void then
			--just put an empty header instead of response: TODO: REPLACE WITH DUMMY RESPONSE OBJECT
			response_wrapper := create_response_header ("something went wrong")
			response_successful := false
		else
			response_successful := true
		end
		create response_wrapper_content.own_from_pointer (response_wrapper.serialize_to_byte_array, response_wrapper.get_pb_object_size)
		current_response_object := response_wrapper_content

		--create response header
		response_header := create_response_header("")
		if response_successful /= true then
			response_header.set_responsestatus (response_header.responsestatus_pb_error)
			response_header.set_content ("could not create response object")
		end
		create response_header_content.own_from_pointer (response_header.serialize_to_byte_array, response_header.get_pb_object_size)
		current_response_header := response_header_content

	end

	url_handler_1(p_request_content:MANAGED_POINTER)
	local
		request_content:REQUESTHEADER_WRAPPER_GEN

		response_header:RESPONSEHEADER_WRAPPER_GEN
		response_header_content:MANAGED_POINTER

		response_wrapper:PB_OBJECT_WRAPPER
		response_wrapper_content:MANAGED_POINTER
	do
		--create incoming request content wrapper
		--this method knows we would expect a header_wrapper_gen
		create request_content.make
		request_content.deserialize_from_byte_arr (p_request_content)
		--use request_content accordingly...

		--create response header
		create response_header.make
		response_header.init_pb_obj
		response_header.set_is_root_object (true)
		response_header.set_responsestatus (response_header.responsestatus_pb_ok)
		response_header.set_content ("response header contents")
		create response_header_content.own_from_pointer (response_header.serialize_to_byte_array, response_header.get_pb_object_size)
		current_response_header := response_header_content

		--create response object
		response_wrapper := complex_obj_wrapper_factory
		create response_wrapper_content.own_from_pointer (response_wrapper.serialize_to_byte_array, response_wrapper.get_pb_object_size)
		current_response_object := response_wrapper_content
	end

	create_archetype_list:ARCHETYPELIST_WRAPPER_GEN
	local
		arc_list:ARCHETYPELIST_WRAPPER_GEN
		loop_index:INTEGER
		names:ARRAY[STRING]
	do
		create arc_list.make
		arc_list.set_is_root_object(true)
		arc_list.init_pb_obj

		names := repo_manager.get_archetype_names

		from
			loop_index := names.lower
		until
			loop_index > names.upper
		loop
			arc_list.add_names (names.at(loop_index))
			loop_index := loop_index + 1
		end

		Result := arc_list
	end

	create_response_header(p_content:STRING):RESPONSEHEADER_WRAPPER_GEN
	local
		response_header:RESPONSEHEADER_WRAPPER_GEN
	do
		create response_header.make
		response_header.init_pb_obj
		response_header.set_is_root_object (true)
		response_header.set_responsestatus (response_header.responsestatus_pb_ok)
		response_header.set_content (p_content)
		Result := response_header
	end

	complex_obj_wrapper_factory:PB_OBJECT_WRAPPER
	local
		obj:CCOMPLEXOBJECT_WRAPPER_GEN
	do
		create obj.make
		obj.set_is_root_object (true)
		obj.init_pb_obj
		Result := obj
	end

	make(p_repository_manager:REPOSITORY_MANAGER)
	require
		repo_man_not_null: p_repository_manager /= void
		repo_man_initialized: p_repository_manager.initialized = true
	do
		repo_manager := p_repository_manager
	end

	zmq_wrap
	local
		handler_func:POINTER
		reset_func:POINTER
	do
		io.put_string ("listener starting")
		handler_func := $callback_func
		reset_func := $reset
		zqm_wrap_cpp (current, handler_func, reset_func)
	end

	--zqm_wrap_cpp(p_current_obj:ANY; p_proc_ptr:POINTER; p_resp_size_func:POINTER)
	zqm_wrap_cpp(p_obj:ANY; p_handler:POINTER; p_reset:POINTER)
		external
		"C++ inline use %"zmq-Eiffel.hpp%""
	alias
		"[
		 	eif_enable_visible_exception ();
		 	EIF_TYPE_ID tid = eif_type_id("DISPATCHER");
		 	int* status = NULL;
			
			void *zmq_context = zmq_init (1);
			void *responder = zmq_socket (zmq_context, ZMQ_REP);
			zmq_bind (responder, "tcp://127.0.0.1:5560");
			//zmq_connect (responder, "tcp://128.40.182.88:5560");

			while (1) {
			zmq_msg_t incoming_message;
			zmq_msg_init (&incoming_message);
			zmq_recv (responder, &incoming_message, 0);
			int size = zmq_msg_size (&incoming_message);

			//process msg here


			EIF_PROCEDURE callback = (EIF_PROCEDURE)$p_handler;
			//c style call
			(callback)( eif_access((EIF_OBJECT)$p_obj),zmq_msg_data (&incoming_message), size);
			//now close it
			zmq_msg_close (&incoming_message);
			//printf("closed msg");



			//check if this msg is a header
			EIF_BOOLEAN_FUNCTION boolFunc =  eif_boolean_function ("is_current_message_header", tid) ;
			EIF_BOOLEAN message_is_header = (boolFunc)(eif_access($p_obj), NULL);
			//printf("%d\n",(int32)message_is_header);

			//printf("checked for msg header\n");


			if(message_is_header){
				//printf("msg is header\n");
				//reply as if it is final

			}
			else{
				//printf("msg is NOT header");
				//msg has been handled, and response header and object is in place
				status = NULL;
				EIF_INTEGER_FUNCTION resSizeFunc =  eif_integer_function ("current_response_header_size", tid) ;
				EIF_INTEGER response_size = (resSizeFunc)(eif_access($p_obj),NULL);
				//printf("%d\n",(int32)response_size);

				status = NULL;
				EIF_POINTER_FUNCTION resAddrFunc =  eif_pointer_function ("current_response_header_address", tid) ;
				EIF_POINTER current_response_bytes = (resAddrFunc)(eif_access($p_obj), NULL);
				//printf("%d\n",(int32)current_response_bytes);


				//SEND HEADER FIRST
				zmq_msg_t reply;
				zmq_msg_init_size (&reply, response_size);
	        	memcpy (zmq_msg_data(&reply), (byte*)current_response_bytes, response_size);
				zmq_send (responder, &reply, ZMQ_SNDMORE);

				//NOW BUILD ACTUAL CONTENT
				status = NULL;
				EIF_INTEGER_FUNCTION resObjSizeFunc =  eif_integer_function ("current_response_object_size", tid) ;
				EIF_INTEGER response_object_size = (resObjSizeFunc)(eif_access($p_obj),NULL);

				status = NULL;
				EIF_POINTER_FUNCTION resObjAddrFunc =  eif_pointer_function ("current_response_object_address", tid) ;
				EIF_POINTER current_response_object_bytes = (resObjAddrFunc)(eif_access($p_obj), NULL);

				//SEND HEADER FIRST
				zmq_msg_t reply_object;
				zmq_msg_init_size (&reply_object, response_object_size);
	        	memcpy (zmq_msg_data(&reply_object), (byte*)current_response_object_bytes, response_object_size);
				zmq_send (responder, &reply_object, 0);

				//CLOSE MESSAGES AFTER SENDING
				zmq_msg_close (&reply);
				zmq_msg_close (&reply_object);


				EIF_PROCEDURE reset = (EIF_PROCEDURE)$p_reset;//to cleanup after response
				//c style call
				(reset)( eif_access((EIF_OBJECT)$p_obj),NULL);
			}

		}
		]"
	end

end
