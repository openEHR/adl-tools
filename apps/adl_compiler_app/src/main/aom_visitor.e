note
	description: "Summary description for {AOM_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	AOM_VISITOR
inherit
	C_VISITOR

	redefine
	start_c_complex_object, end_c_complex_object,
	start_c_attribute, end_c_attribute,
	start_archetype_slot, end_archetype_slot,
	start_archetype_internal_ref, end_archetype_internal_ref,
	start_c_archetype_root, end_c_archetype_root,
	start_c_code_phrase, end_c_code_phrase,
	start_c_ordinal, end_c_ordinal,
	start_c_quantity, end_c_quantity,
	start_c_primitive_object, end_c_primitive_object,
	start_c_leaf_object, end_c_leaf_object,
	start_c_reference_object, end_c_reference_object,
	start_constraint_ref, end_constraint_ref,
	start_c_domain_type, end_c_domain_type
	end
create
	make
feature
	make
	do
		create object_attributes.make (0)
		create temp_object_attributes.make (0)

		create object_attribute_tags.make (0)
		create temp_object_attribute_tags.make (0)

		create c_complex_object_tags.make (0)
		create temp_c_complex_object_tags.make (0)

		create c_primitive_objects_tags.make (0)
		create temp_c_primitive_objects_tags.make (0)
	end

feature
	--Access
	root_tag: STRING
	do
		if c_complex_object_tags.count > 0 then
			Result := c_complex_object_tags.item
		else
			Result := "root is empty"
		end
	end
feature
	--exceptions created using this
	exceptions: EXCEPTIONS
	once
		create Result
	end

	--internal storage management for visited nodes
	object_attributes: ARRAYED_STACK[C_ATTRIBUTE]
	temp_object_attributes: ARRAYED_STACK[C_ATTRIBUTE]

	object_attribute_tags: ARRAYED_STACK[STRING]
	temp_object_attribute_tags: ARRAYED_STACK[STRING]

	c_complex_object_tags: ARRAYED_STACK[STRING]
	temp_c_complex_object_tags: ARRAYED_STACK[STRING]

	c_primitive_objects_tags: ARRAYED_STACK[STRING]
	temp_c_primitive_objects_tags: ARRAYED_STACK[STRING]

	backup_and_clear_object_attributes
	do
		temp_object_attributes.wipe_out
		temp_object_attributes.fill (object_attributes.linear_representation)
		object_attributes.wipe_out
	end

	restore_object_attributes_from_backup
	do
		object_attributes.wipe_out
		object_attributes.fill (temp_object_attributes.linear_representation)
		temp_object_attributes.wipe_out
	end

	backup_and_clear_stack (source_stack: ARRAYED_STACK[STRING]; storage_stack: ARRAYED_STACK[STRING])
	require
			source_stack /= void
			storage_stack /= void
	do
		storage_stack.wipe_out
		storage_stack.fill (source_stack.linear_representation)
		source_stack.wipe_out
	end

	restore_stack_from_backup(storage_stack: ARRAYED_STACK[STRING]; destination_stack: ARRAYED_STACK[STRING])
		require
			storage_stack /= void
			destination_stack /= void
	do
		destination_stack.wipe_out
		destination_stack.fill (storage_stack.linear_representation)
		storage_stack.wipe_out
	end

feature
	--visiting features


	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		do
			io.put_string (depth.out + ": enter ccomplex obj (" + a_node.rm_type_name + " - " + a_node.node_id  + ")%N")
			--initialize stacks
			backup_and_clear_object_attributes
			backup_and_clear_stack (object_attribute_tags, temp_object_attribute_tags)
		end

	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit an C_COMPLEX_OBJECT
		local
			--this is an iterable array list, which we'll fill using the stack
			attributes:ARRAYED_LIST[C_ATTRIBUTE]

			--the following is the string representation for attributes of this ccomplexobj
			attributes_tag_representation: STRING

			--this is an iterable array list, which we'll fill using the stack
			object_attributes_arrl: ARRAYED_LIST[STRING]

			--string representation of this ccomplexobj node
			c_complex_object_representation: STRING

			i:INTEGER
		do
			attributes_tag_representation := ""
			c_complex_object_representation := ""

			io.put_string (depth.out + ": exit ccomplex obj%N")

			--iterable object, based on the stack
			attributes := object_attributes.linear_representation
			from attributes.start
			until attributes.after
			loop
				io.put_string ("attr in stack: " + attributes.item_for_iteration.rm_attribute_name + "%N")
				attributes.forth
			end

			restore_object_attributes_from_backup

			--iterable object, based on the stack
			object_attributes_arrl := object_attribute_tags.linear_representation
			from  i := object_attributes_arrl.upper
			until i = object_attributes_arrl.lower - 1
			loop
				attributes_tag_representation := attributes_tag_representation + object_attributes_arrl.at (i)
				i := i - 1
			end

			--now that we have the attributes, let's build the ccomplexobj tag and add attributes tags
			c_complex_object_representation := "<ccomplexobj nodeId='" + a_node.node_id + "'>%N"
			c_complex_object_representation := c_complex_object_representation + attributes_tag_representation
			c_complex_object_representation := c_complex_object_representation + "</ccomplexobj>%N"

			--add this to complexobj representation stack
			c_complex_object_tags.put (c_complex_object_representation)

			--restore attributes stack
			restore_stack_from_backup (temp_object_attribute_tags, object_attribute_tags)

		end


	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		do

		end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- exit an ARCHETYPE_SLOT
		do
		end


	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE					
		do
			--attribute must backup both ccomplexobj and cprimitiveobj stacks
			backup_and_clear_stack (c_complex_object_tags, temp_c_complex_object_tags)
			backup_and_clear_stack (c_primitive_objects_tags, temp_c_primitive_objects_tags)

			io.put_string (depth.out + ": enter cattr(" + a_node.rm_attribute_name  + ") %N")
		end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		local
			--string representatin of this attribute
			c_attribute_tags: STRING

			--string representation of ccomplex or cprimitive objects
			c_object_tags: STRING

			--iterable array, to be filled by one of the cprimitive of ccomplex stacks
			c_object_tags_arrl: ARRAYED_LIST[STRING]

			i:INTEGER
		do
			c_attribute_tags := ""
			c_object_tags := ""

			io.put_string (depth.out + ": exit cattr%N")
			object_attributes.put (a_node)

			if c_complex_object_tags.count > 0 and c_primitive_objects_tags.count > 0 then
				exceptions.raise("ATTRIBUTE CAN'T HAVE BOTH PRIMITIVE AND COMPLEX CHILDREN!")
			end

			if c_complex_object_tags.count > 0 then
				c_object_tags_arrl := c_complex_object_tags.linear_representation
			else
				if c_primitive_objects_tags.count > 0 then
				c_object_tags_arrl := c_primitive_objects_tags.linear_representation
				end
			end

			--HOW ON EARTH DO I GET OUT OF THIS PROC EARLY IF THIS IS VOID????
			if c_object_tags_arrl /= void then

				from i := c_object_tags_arrl.upper
				until i = c_object_tags_arrl.lower - 1
				loop
					c_object_tags := c_object_tags + c_object_tags_arrl.at(i)
					i := i - 1
				end

			end --if c_object_tags_arrl is not void end

			--create tag for this attribute, then add object tags if they exist
			c_attribute_tags := "<cattribute rmattributename='" + a_node.rm_attribute_name +  "'>%N"
			if c_object_tags /= void then
				c_attribute_tags := c_attribute_tags + c_object_tags
			end
			c_attribute_tags := c_attribute_tags + "</cattribute>%N"

			--add this to stack of attribute tags
			object_attribute_tags.put (c_attribute_tags)

			--restore c_primitive and c_complex stacks
			restore_stack_from_backup (temp_c_complex_object_tags, c_complex_object_tags)
			restore_stack_from_backup (temp_c_primitive_objects_tags, c_primitive_objects_tags)

		end


	start_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
			io.put_string (depth.out + ": enter Cleafobj%N")
		end

	end_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- exit a C_LEAF_OBJECT
		do
			io.put_string (depth.out + ": exit Cleafobj%N")
		end


	start_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do

		end

	end_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- exit a C_REFERENCE_OBJECT
		do
		end


	start_c_archetype_root(a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do

		end

	end_c_archetype_root(a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
		end


	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		do

		end

	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- exit an ARCHETYPE_INTERNAL_REF
		do
		end


	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		do

		end

	end_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
			-- exit a CONSTRAINT_REF
		do
		end


	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		do
			io.put_string (depth.out + ": enter cprimitiveOb(" + a_node.node_id  + ") %N")
			if attached {C_STRING} a_node.item  as c_prim then
				if c_prim.regexp /= void then
					io.put_string (c_prim.regexp)
				else
					io.put_string ("c_prim.regexp is null")
				end
			end
		end

	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- exit an C_PRIMITIVE_OBJECT
		local
			c_primitive_tags: STRING

		do
			c_primitive_tags := ""
			io.put_string (depth.out + ": exit CprimitiveObj%N")
			c_primitive_tags := c_primitive_tags +  "<cprimitive type='" + a_node.item.rm_type_name  + "'>%N"
			c_primitive_tags := c_primitive_tags + a_node.item.as_string + "%N</cprimitive>%N"
			c_primitive_objects_tags.put (c_primitive_tags)
		end


	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- enter an C_DOMAIN_TYPE
		do

		end

	end_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- exit an C_DOMAIN_TYPE
		do
		end


	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER)
			-- enter an C_CODE_PHRASE
		do

		end

	end_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER)
			-- exit an C_CODE_PHRASE
		do
		end


	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- enter an C_DV_ORDINAL
		do
			io.put_string (depth.out + ": enter cOrdinal%N")
		end

	end_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- exit an C_DV_ORDINAL
		do
			io.put_string (depth.out + ": exit COrdinal%N")
		end

	start_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		do
			io.put_string (depth.out + ": enter cQuantity%N")
		end

	end_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- exit a C_DV_QUANTITY
		do
			io.put_string (depth.out + ": exit cQuantity%N")
		end

end
