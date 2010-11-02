note
	description: "Summary description for {LOGGER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LOGGER
create
		make

feature
	--initialization
	make
	do

	end

feature

	cpp_logger: POINTER

	log (p_text: STRING)
	do
		if attached cpp_logger  then
			log_using_cpp_object($p_text, cpp_logger)
		end

	end

	log_using_cpp_object(p_text: POINTER; p_cpp_obj_to_use: POINTER)
	external
		"C++ inline use %"ILogger.h%""
	alias
		"[
			ILogger *implementation = (ILogger*)$p_cpp_obj_to_use;
			implementation->log((EIF_REFERENCE)$p_text);
		]"
	end

	test
	do
		log("testing logger");
	end

feature
	--setters
	set_cpp_logger (p_cpp_logger: POINTER)
	do
		cpp_logger := p_cpp_logger
	end

end
