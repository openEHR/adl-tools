note
	component:   "openEHR Project"
	description: "Parent class for generated ICON_XXX classs based on icon files"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

deferred class ICON_SOURCE

inherit
	EV_PIXEL_BUFFER

feature {NONE} -- Initialization

	make
			-- Initialization
		deferred
		end

feature -- Access

	key: STRING
			-- key under which to store this icon image

feature {NONE} -- Image Data

	build_colors (a_ptr: POINTER)
				-- Build `colors'
		deferred
		end

feature {NONE} -- Image data filling.

	fill_memory
			-- Fill image data into memory.
		local
			l_pointer: POINTER
		do
			if attached {EV_PIXEL_BUFFER_IMP} implementation as l_imp then
				l_pointer := l_imp.data_ptr
				if not l_pointer.is_default_pointer then
					build_colors (l_pointer)
					l_imp.unlock
				end
			end
		end

end
