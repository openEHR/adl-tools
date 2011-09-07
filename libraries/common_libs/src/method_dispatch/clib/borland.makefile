INCLUDE_PATH = -I$(ISE_EIFFEL)\library\wel\spec\windows\include -I$(ISE_EIFFEL)\studio\spec\$(ISE_PLATFORM)\include 
COMPILER=bcb
SHELL = \bin\sh
CC = bcc32
CFLAGS = -O2 -c -WC -g0 -w- -DWIN32  -DWORKBENCH -DEIF_BORLAND -I$(ISE_EIFFEL)\studio\spec\$(ISE_PLATFORM)\include
LDFLAGS = -m -s -c -Tpe -aa -S:2048 

LIBS = 
MAKE = make
MKDEP =   --
MV = copy
RANLIB = echo
RM = del
AR = tlib

.c.obj:
	$(CC) $(CFLAGS) -c $<

method_dispatcher = method_dispatcher.obj

all:  method_dispatcher.lib

method_dispatcher.lib: $(method_dispatcher) Makefile
	$(RM) $@
	$(AR) $@ /C + method_dispatcher.obj
	if not exist ..\..\..\lib\$(ISE_C_COMPILER) mkdir ..\..\..\lib\$(ISE_C_COMPILER)
	$(MV) $@ ..\..\..\lib\$(ISE_C_COMPILER)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core *.obj

local_clobber:: local_clean
	$(RM) Makefile
