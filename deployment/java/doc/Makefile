INCLUDE_PATH = -I$(GOBO)\gobo32\library\kernel\include -I"$(JDK_1_5)\include" -I"$(JDK_1_5)\include\win32"
SHELL = \bin\sh
CC = cl
CPP = cl
CFLAGS = -Ox -w -YX -nologo -DNONAMELESSUNION -I. $(INCLUDE_PATH)
CPPFLAGS = -Ox -w -YX -nologo -DNONAMELESSUNION -I. $(INCLUDE_PATH)
LDFLAGS =
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
COMMAND_MAKEFILE = 
START_TEST = if not exist finished 
END_TEST =  
CREATE_TEST = echo "finished" >> finished 
.SUFFIXES: .obj 

.c.obj:
	$(CC) $(CFLAGS) -c $<

.cpp.obj:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = AdlJniWrapper.obj 

all::  adl_jni_wrapper.lib

adl_jni_wrapper.lib: $(OBJECTS) Makefile
	if exist $@ $(RM) $@
	lib -nologo -OUT:$@ $(OBJECTS)
	$(CREATE_TEST)

clean::
	$(RM) core finished *.o

