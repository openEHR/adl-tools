INCLUDE_PATH = 
SHELL = \bin\sh
CC = cl
CPP = cl
CFLAGS = -Ox -MT -w -nologo -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_CRT_SECURE_NO_DEPRECATE -D_UNICODE -DUNICODE   -DEIF_IEEE_BEHAVIOR -I"C:\Program Files\Eiffel Software\EiffelStudio 6.6 GPL\studio\spec\windows\include" -I. $(INCLUDE_PATH)
CPPFLAGS = -Ox -MT -w -nologo -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_CRT_SECURE_NO_DEPRECATE -D_UNICODE -DUNICODE   -I"C:\Program Files\Eiffel Software\EiffelStudio 6.6 GPL\studio\spec\windows\include" -I. $(INCLUDE_PATH)
LDFLAGS = -STACK:5000000 -NODEFAULTLIB:libc
CCLDFLAGS = -STACK:5000000 -NODEFAULTLIB:libc  -SUBSYSTEM:CONSOLE
LDSHAREDFLAGS =  -dll -incremental:no -NODEFAULTLIB:libc
LIBS = 
MAKE = nmake -s -nologo
AR = 
LD = 
MKDEP =   --
MV = copy
CP = copy
RANLIB = echo
RM = del
FILE_EXIST = if exist
RMDIR = rd
SHAREDLINK = link
SHARED_SUFFIX = .dll
COMMAND_MAKEFILE = 
START_TEST = if not exist finished 
END_TEST =  
.SUFFIXES: .x .xpp .cpp .obj 

.c.obj:
	$(CC) $(CFLAGS) -c $<

.cpp.obj:
	$(CPP) $(CPPFLAGS) -c $<

.x.obj:
	$(X2C) $< $*.c
	$(CC) $(CFLAGS) -c $*.c
	$(RM) $*.c

.xpp.obj:
	$(X2C) $< $*.cpp
	$(CPP) $(CPPFLAGS) -c $*.cpp
	$(RM) $*.cpp

.x.c:
	$(X2C) $< $*.c

.xpp.cpp:
	$(X2C) $< $*.cpp

EXTERNALS = 

all:: adlc_test_app.exe
	echo done > completed.eif

OBJECTS = adlc_test_app.obj libadl_compiler.lib

adlc_test_app.exe: adlc_test_app.lnk
	$(COMMAND_MAKEFILE)
	link @adlc_test_app.lnk

adlc_test_app.lnk: $(OBJECTS) Makefile
	if exist $@ $(RM) $@
	@echo $(LDFLAGS) $(CCLDFLAGS) -OUT:adlc_test_app.exe > $@
	@echo $(OBJECTS) >> $@
	@echo ws2_32.lib >> $@

clean::
	$(RM) *.obj *.a

clobber:: clean
	$(RM) Makefile

