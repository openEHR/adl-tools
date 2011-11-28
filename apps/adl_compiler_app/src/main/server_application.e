note
	description: "Summary description for {SERVER_APPLICATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SERVER_APPLICATION
create
	make

feature
	--fields
	dispatcher:DISPATCHER

	repo_manager:REPOSITORY_MANAGER
	visitor: BOSPHORUS_PB_VISITOR

feature
	make
	local
		schema_name:STRING
		arc_names: ARRAYED_LIST[STRING]
		i: INTEGER
		counter: INTEGER

--		storage_str:STRING
--		source:CSTRING_WRAPPER_GEN
--		target:CSTRING_WRAPPER_GEN

--		file:RAW_FILE
--		filestr : FILE
--		file_contents:MANAGED_POINTER
--		myteststr : STRING

	do

--		create source.make
--		source.init_pb_obj
--		source.set_is_root_object (true)
--		source.set_pattern ("some test value here and now updated")
--		source.set_listopen (false)

--		create target.make
--		storage_str := source.serialize_pb_object_to_string

--		myteststr := "test value"
--		create file.make_open_write ("c:\\tmp\\pbstringserializetest")

--		file.put_string (storage_str)
--		file.close


		create repo_manager.make

		--test for memory leaks
--		from
--			i := 0
--		until
--			i = 1
--		loop
--			arc_names := repo_manager.get_archetype_names
--			counter := counter + 1
--			if counter = 1000 then
--				io.put_string ("1K CALLS%N")
--				counter := 0
--			end
--		end


		create dispatcher.make (repo_manager)
		dispatcher.zmq_wrap

		--SCHEMA RELATED TEST CODE
--		schema_name := "openehr_rm"
--		io.put_string ("listing schema info:%N")
--		list_schema_info
--		io.put_string ("listing packages and classes of schema " + schema_name + " :%N")
--		if attached {SCHEMA_ACCESS} repo_manager.app_root.rm_schemas_access.schemas.at (schema_name) as rm then
--			list_packages(rm.schema)
--			--list_classes_in_package(rm.schema.packages.at ("ehr"))
--			list_classes_in_schema(rm.schema)
----			rm.class_definition ("COMPOSITIION").make_dt
--		end
	end

	list_classes_in_schema(p_schema:BMM_SCHEMA)
	do
		from
			p_schema.class_definitions.start
		until
			p_schema.class_definitions.after
		loop
			io.put_string (p_schema.class_definitions.item_for_iteration.name + "%N")
			from
				p_schema.class_definitions.item_for_iteration.flat_properties.start
			until
				p_schema.class_definitions.item_for_iteration.flat_properties.after
			loop
				io.put_string ("%T" + p_schema.class_definitions.item_for_iteration.flat_properties.item_for_iteration.name + "%N")
				p_schema.class_definitions.item_for_iteration.flat_properties.forth
			end
			p_schema.class_definitions.forth
		end
	end

	list_classes_in_package(p_package:BMM_PACKAGE_DEFINITION)
	require
		repo_manager_ready: repo_manager.initialized = true
	do
		from
			p_package.classes.start
		until
			p_package.classes.after
		loop
			io.put_string(p_package.classes.item + "%N")
			p_package.classes.forth
		end
	end

	list_packages(p_schema:BMM_SCHEMA)
	require
		repo_manager_ready: repo_manager.initialized = true
	do
		from
			p_schema.packages.start
		until
			p_schema.packages.after
		loop
			io.put_string(p_schema.packages.item_for_iteration.name + "%N")
			p_schema.packages.forth
		end
	end

	list_schema_info
	--prints information about the rm schemas accessible via app_root
	require
		repo_manager_ready: repo_manager.initialized = true
	do
		from
--			repo_manager.app_root.rm_schemas_access.schemas.start
			repo_manager.app_root.rm_schemas_access.all_schemas.start
		until
--			repo_manager.app_root.rm_schemas_access.schemas.after
			repo_manager.app_root.rm_schemas_access.all_schemas.after
		loop
			io.put_string (repo_manager.app_root.rm_schemas_access.all_schemas.key_for_iteration + "%N")
			io.put_string(repo_manager.app_root.rm_schemas_access.all_schemas.item_for_iteration.schema.schema_name + "%N")
			repo_manager.app_root.rm_schemas_access.all_schemas.forth
		end
	end

end
