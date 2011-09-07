INCLUDE_PATH = -I$(ISE_EIFFEL)\library\wel\spec\$(ISE_PLATFORM)\include -I$(ISE_EIFFEL)\studio\spec\$(ISE_PLATFORM)\include 
COMPILER=msc
SHELL = \bin\sh
CC = cl
CFLAGS = -Ox -c -nologo -DWIN32 -DWORKBENCH $(INCLUDE_PATH)
LDFLAGS = -MAP -STACK:1024 -subsystem:WINDOWS
LIBS = 
MAKE = nmake
MKDEP =   --
MV = copy
RANLIB = echo
RM = del

.c.obj:
	$(CC) $(CFLAGS) -c $<

method_dispatcher = method_dispatcher.obj

all:  method_dispatcher.lib

method_dispatcher.lib: $(method_dispatcher) Makefile
	$(RM) $@
	lib /OUT:$@ $(method_dispatcher)
	$(MV) $@ ..\..\..\lib\$(ISE_C_COMPILER)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core *.obj

local_clobber:: local_clean
	$(RM) Makefile
